Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CF4B1AB0
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Sep 2019 11:22:14 +0200 (CEST)
Received: from localhost ([::1]:41686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8hmP-0003NO-Uo
	for lists+qemu-devel@lfdr.de; Fri, 13 Sep 2019 05:22:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53564)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1i8hlQ-0002st-PM
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 05:21:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1i8hlP-0005JB-Ts
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 05:21:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43664)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>)
 id 1i8hlN-0005IE-VS; Fri, 13 Sep 2019 05:21:10 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 805BE8980FB;
 Fri, 13 Sep 2019 09:21:08 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AB22B60600;
 Fri, 13 Sep 2019 09:20:57 +0000 (UTC)
Date: Fri, 13 Sep 2019 11:20:55 +0200
From: Andrew Jones <drjones@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190913092055.kxvwzzmwp5mra3gh@kamzik.brq.redhat.com>
References: <20190913083615.14719-1-eric.auger@redhat.com>
 <20190913083615.14719-4-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190913083615.14719-4-eric.auger@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Fri, 13 Sep 2019 09:21:08 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v1 3/6] exec: assert on
 memory_region_register_iommu_notifier() failure
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, mst@redhat.com, qemu-devel@nongnu.org,
 peterx@redhat.com, alex.williamson@redhat.com, qemu-arm@nongnu.org,
 pbonzini@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 13, 2019 at 10:36:12AM +0200, Eric Auger wrote:
> memory_region_register_iommu_notifier now returns an error
> in case of failure. Assert in such a case.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  exec.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/exec.c b/exec.c
> index 235d6bc883..da30251a2b 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -692,7 +692,8 @@ static void tcg_register_iommu_notifier(CPUState *cpu,
>                              0,
>                              HWADDR_MAX,
>                              iommu_idx);
> -        memory_region_register_iommu_notifier(notifier->mr, &notifier->n);
> +        assert(!memory_region_register_iommu_notifier(notifier->mr,
> +                                                      &notifier->n));

 ret = memory_region_register_iommu_notifier(notifier->mr, &notifier->n);
 assert(!ret);

to avoid functions with side effects being called inside assert()'s, as
assert()'s could be compiled as no-ops.

Same comment for next patch.

Thanks,
drew

>      }
>  
>      if (!notifier->active) {
> -- 
> 2.20.1
> 
> 

