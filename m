Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DFAD9809
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Oct 2019 18:59:59 +0200 (CEST)
Received: from localhost ([::1]:45794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKmeU-0001DA-5T
	for lists+qemu-devel@lfdr.de; Wed, 16 Oct 2019 12:59:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39544)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1iKmZ9-0006Bb-Q5
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 12:54:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1iKmZ7-0004se-DH
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 12:54:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:61699)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1iKmZ6-0004qQ-Ax; Wed, 16 Oct 2019 12:54:24 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E1EC369EE0;
 Wed, 16 Oct 2019 16:54:21 +0000 (UTC)
Received: from [10.36.116.53] (ovpn-116-53.ams2.redhat.com [10.36.116.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B47661001925;
 Wed, 16 Oct 2019 16:54:20 +0000 (UTC)
Subject: Re: [PATCH] s390x/cpumodel: Add missing visit_free
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
References: <20191016145434.7007-1-drjones@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <87efd813-8aa9-fb36-9c0c-6334ca000bfe@redhat.com>
Date: Wed, 16 Oct 2019 18:54:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191016145434.7007-1-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Wed, 16 Oct 2019 16:54:21 +0000 (UTC)
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
Cc: pasic@linux.ibm.com, borntraeger@de.ibm.com, cohuck@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16.10.19 16:54, Andrew Jones wrote:
> Beata Michalska noticed this missing visit_free() while reviewing
> arm's implementation of qmp_query_cpu_model_expansion(), which is
> modeled off this s390x implementation.

Nice to see ARM support getting added.

> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>   target/s390x/cpu_models.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
> index 009afc38b92d..7e92fb2e156d 100644
> --- a/target/s390x/cpu_models.c
> +++ b/target/s390x/cpu_models.c
> @@ -515,6 +515,7 @@ static void cpu_model_from_info(S390CPUModel *model, const CpuModelInfo *info,
>           visitor = qobject_input_visitor_new(info->props);
>           visit_start_struct(visitor, NULL, NULL, 0, errp);
>           if (*errp) {
> +            visit_free(visitor);
>               object_unref(obj);
>               return;
>           }
> 

Right, thanks

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 

Thanks,

David / dhildenb

