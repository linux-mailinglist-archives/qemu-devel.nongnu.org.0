Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B13CCDAB69
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Oct 2019 13:45:57 +0200 (CEST)
Received: from localhost ([::1]:44604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iL4E8-0001sa-NW
	for lists+qemu-devel@lfdr.de; Thu, 17 Oct 2019 07:45:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48854)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1iL4Cr-0001MO-Rw
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 07:44:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1iL4Cp-0003XN-GB
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 07:44:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46060)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1iL4Cp-0003Wk-AV; Thu, 17 Oct 2019 07:44:35 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 885DE10CC1FF;
 Thu, 17 Oct 2019 11:44:33 +0000 (UTC)
Received: from gondolin (dhcp-192-202.str.redhat.com [10.33.192.202])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1339E60852;
 Thu, 17 Oct 2019 11:44:29 +0000 (UTC)
Date: Thu, 17 Oct 2019 13:44:28 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Subject: Re: [PATCH] s390x/cpumodel: Add missing visit_free
Message-ID: <20191017134428.441745e6.cohuck@redhat.com>
In-Reply-To: <20191016145434.7007-1-drjones@redhat.com>
References: <20191016145434.7007-1-drjones@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.65]); Thu, 17 Oct 2019 11:44:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: pasic@linux.ibm.com, borntraeger@de.ibm.com, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 16 Oct 2019 16:54:34 +0200
Andrew Jones <drjones@redhat.com> wrote:

> Beata Michalska noticed this missing visit_free() while reviewing
> arm's implementation of qmp_query_cpu_model_expansion(), which is
> modeled off this s390x implementation.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  target/s390x/cpu_models.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
> index 009afc38b92d..7e92fb2e156d 100644
> --- a/target/s390x/cpu_models.c
> +++ b/target/s390x/cpu_models.c
> @@ -515,6 +515,7 @@ static void cpu_model_from_info(S390CPUModel *model, const CpuModelInfo *info,
>          visitor = qobject_input_visitor_new(info->props);
>          visit_start_struct(visitor, NULL, NULL, 0, errp);
>          if (*errp) {
> +            visit_free(visitor);
>              object_unref(obj);
>              return;
>          }

Thanks, applied.

