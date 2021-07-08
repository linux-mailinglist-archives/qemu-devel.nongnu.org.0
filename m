Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0033C1AC9
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 23:01:40 +0200 (CEST)
Received: from localhost ([::1]:45000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1b9P-0000h7-L8
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 17:01:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m1b5m-0006IA-2d
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 16:57:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m1b5i-0004X3-SJ
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 16:57:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625777870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=58v4sjkNIIg41hLu0ps5H89wvndEqGrVyBm14vp0Oqc=;
 b=LrSsKWIYfJLka27ufCD13YE7A0qFkTMmQuDbZ2Wgyf2FoyAMBeoPvsLCOf+DIqDvtURIMu
 5mN2LzxWOR9RN5gAiGGA8JI/DQ3Bwlh9ZJbmSzADf1xvDFF1PliBWad7351SV3gwFeT8v0
 TCAhtaqQ1/3IW8xrIbDMLDkK8C/+IsA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-4hL_ESPJOOWWW74Ck8LH-w-1; Thu, 08 Jul 2021 16:57:48 -0400
X-MC-Unique: 4hL_ESPJOOWWW74Ck8LH-w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01403362FC
 for <qemu-devel@nongnu.org>; Thu,  8 Jul 2021 20:57:48 +0000 (UTC)
Received: from localhost (unknown [10.22.8.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE7955D6D1;
 Thu,  8 Jul 2021 20:57:47 +0000 (UTC)
Date: Thu, 8 Jul 2021 16:57:47 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH v7 1/9] i386: avoid hardcoding '12' as 'hyperv_vendor_id'
 length
Message-ID: <20210708205747.a7pfnbmbjngfzs6k@habkost.net>
References: <20210603114835.847451-1-vkuznets@redhat.com>
 <20210603114835.847451-2-vkuznets@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210603114835.847451-2-vkuznets@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 03, 2021 at 01:48:27PM +0200, Vitaly Kuznetsov wrote:
> While this is very unlikely to change, let's avoid hardcoding '12' as
> 'hyperv_vendor_id' length.
> 
> No functional change intended.
> 
> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>

This one breaks some build due to the printf format string.  See:
https://gitlab.com/ehabkost/qemu/-/jobs/1404084433

../target/i386/cpu.c: In function 'x86_cpu_hyperv_realize':
../target/i386/cpu.c:6049:50: error: format '%ld' expects argument of type 'long int', but argument 2 has type 'unsigned int' [-Werror=format=]
         warn_report("hv-vendor-id truncated to %ld characters",
                                                ~~^
                                                %d
                     sizeof(cpu->hyperv_vendor_id));


I'm removing it from the queue by now.

> ---
>  target/i386/cpu.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index fa282a07013f..b2d8e5713911 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -6057,11 +6057,12 @@ static void x86_cpu_hyperv_realize(X86CPU *cpu)
>                                  &error_abort);
>      }
>      len = strlen(cpu->hyperv_vendor);
> -    if (len > 12) {
> -        warn_report("hv-vendor-id truncated to 12 characters");
> -        len = 12;
> +    if (len > sizeof(cpu->hyperv_vendor_id)) {
> +        warn_report("hv-vendor-id truncated to %ld characters",
> +                    sizeof(cpu->hyperv_vendor_id));
> +        len = sizeof(cpu->hyperv_vendor_id);
>      }
> -    memset(cpu->hyperv_vendor_id, 0, 12);
> +    memset(cpu->hyperv_vendor_id, 0, sizeof(cpu->hyperv_vendor_id));
>      memcpy(cpu->hyperv_vendor_id, cpu->hyperv_vendor, len);
>  
>      /* 'Hv#1' interface identification*/
> -- 
> 2.31.1
> 

-- 
Eduardo


