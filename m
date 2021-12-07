Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 075ED46BBB9
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 13:48:56 +0100 (CET)
Received: from localhost ([::1]:52188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muZtu-0000hG-IC
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 07:48:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1muZqn-0007Ot-MH
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 07:45:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1muZqj-0007rJ-Uc
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 07:45:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638881135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iA125WgdL0feVx1Cwf+ohVWm2XoCg4Yb4ydVSGT/Qg8=;
 b=jELZ3CWTODhOkLcQn7Z1QqLjY+lHBIrDAGCXkKp6U9cX0kSCXomFDKjngDkibZrY54yMTq
 WNrPi43kpZMkm9/FMFAIFXkrMFzMyhHq7VY4qFkRdEqlOi73Zaq7VANrIUoLPDOGzfmBAP
 EG93NMhCaegjqZd4RYUO9EHNkN9OLlU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-268-22hJVw3JOYyq-BXYg5t6rA-1; Tue, 07 Dec 2021 07:45:33 -0500
X-MC-Unique: 22hJVw3JOYyq-BXYg5t6rA-1
Received: by mail-wm1-f72.google.com with SMTP id
 145-20020a1c0197000000b0032efc3eb9bcso1189618wmb.0
 for <qemu-devel@nongnu.org>; Tue, 07 Dec 2021 04:45:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iA125WgdL0feVx1Cwf+ohVWm2XoCg4Yb4ydVSGT/Qg8=;
 b=zG9uad/9Jz9yyDIltMsCKKhURZdpgPDsOeMNCfACn8L3wFgBr5TZUe0Cno3kYsoEpQ
 ZzZY/auaUxsyhc4xL6hCyPqe+ZmZ+0R4Nd5AQK76xJFRqXh3k+5IQeK4KA+pKHRNj9Ff
 ql+ih/VOWZrWTa3ogQUQQfsAcZoWWVgd+icERWA3j49eo4GFL8+F3bz6psmRWrjHTQZO
 H4OVTrtPlKbUbW8licxx3a7T5ZpLtiVo6lSP2IWhs5lOXAmsIZqJ58hc3/ISA80xQYjm
 OJ3LGayX0qNBzx6/YuXwfgN4lUffawn7XlXV9Dz67n/uL08b+VQw17dcVZhiEmTwFIUm
 Fv4Q==
X-Gm-Message-State: AOAM533DSjt6FJgieqN+ZTy/lemxWrnVlhE/U/0O6dbRK0h18Ud4jF2E
 /70osrM6z0sDUVmS7rDIppFUIhvGvzQ3wrc5UtopUlzbKJvFEwiHC7Ad1Ezxr1ZrDQ2pIzd1AmU
 0reIjJh29B7pB17g=
X-Received: by 2002:adf:f5ce:: with SMTP id k14mr50618528wrp.100.1638881132281; 
 Tue, 07 Dec 2021 04:45:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw/GuaXCgeuEpdkj9zlaChh8eMpJRE8CtGYdJkQuWFuRI/gxZMTsrlFqmgIkXCvWsDeKteqWQ==
X-Received: by 2002:adf:f5ce:: with SMTP id k14mr50618506wrp.100.1638881132065; 
 Tue, 07 Dec 2021 04:45:32 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id s63sm2744799wme.22.2021.12.07.04.45.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Dec 2021 04:45:31 -0800 (PST)
Message-ID: <e0419fd9-ce18-a4f6-7c8a-36e36dce2ae4@redhat.com>
Date: Tue, 7 Dec 2021 13:45:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 for 6.2?] gicv3: fix ICH_MISR's LRENP computation
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org
References: <20211207094427.3473-1-damien.hedde@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211207094427.3473-1-damien.hedde@greensocs.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.44, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, shashi.mallela@linaro.org,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/7/21 10:44, Damien Hedde wrote:
> According to the "Arm Generic Interrupt Controller Architecture
> Specification GIC architecture version 3 and 4" (version G: page 345
> for aarch64 or 509 for aarch32):
> LRENP bit of ICH_MISR is set when ICH_HCR.LRENPIE==1 and
> ICH_HCR.EOIcount is non-zero.
> 
> When only LRENPIE was set (and EOI count was zero), the LRENP bit was
> wrongly set and MISR value was wrong.
> 
> As an additional consequence, if an hypervisor set ICH_HCR.LRENPIE,
> the maintenance interrupt was constantly fired. It happens since patch
> 9cee1efe92 ("hw/intc: Set GIC maintenance interrupt level to only 0 or 1")
> which fixed another bug about maintenance interrupt (most significant
> bits of misr, including this one, were ignored in the interrupt trigger).
> 
> Fixes: 83f036fe3d ("hw/intc/arm_gicv3: Add accessors for ICH_ system registers")

This commit predates 6.1 release, so technically this is not
a regression for 6.2.

> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
> The gic doc is available here:
> https://developer.arm.com/documentation/ihi0069/g
> 
> v2: identical resend because subject screw-up (sorry)
> 
> Thanks,
> Damien
> ---
>  hw/intc/arm_gicv3_cpuif.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
> index 7fba931450..85fc369e55 100644
> --- a/hw/intc/arm_gicv3_cpuif.c
> +++ b/hw/intc/arm_gicv3_cpuif.c
> @@ -351,7 +351,8 @@ static uint32_t maintenance_interrupt_state(GICv3CPUState *cs)
>      /* Scan list registers and fill in the U, NP and EOI bits */
>      eoi_maintenance_interrupt_state(cs, &value);
>  
> -    if (cs->ich_hcr_el2 & (ICH_HCR_EL2_LRENPIE | ICH_HCR_EL2_EOICOUNT_MASK)) {
> +    if ((cs->ich_hcr_el2 & ICH_HCR_EL2_LRENPIE) &&
> +        (cs->ich_hcr_el2 & ICH_HCR_EL2_EOICOUNT_MASK)) {
>          value |= ICH_MISR_EL2_LRENP;
>      }
>  
> 


