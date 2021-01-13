Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F4D2F4834
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 11:08:13 +0100 (CET)
Received: from localhost ([::1]:52910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzd4W-00083y-My
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 05:08:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kzd2i-0007L8-CQ
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 05:06:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kzd2g-0002Mn-A8
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 05:06:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610532373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xg3B86akco8jDOFj8IsG2ZP0eid8MzFoyVYd7NaNJh8=;
 b=e2aTumhLWuccpkEsishlMuIUJnUeKSaFH41k/CmCA7/gzG49rgeY6kx5xWM2bVmSoxCTm9
 d1wm9JD8RSDls0tEmY00O69bKeI+3a7CsqOd2h6Yd0yfPtMXcCB8uE3xwnZIIyA8iGb8Gm
 wdOMiYisxn1YkcN6GIBMEQNtgAVneuc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-vMkphjeHP8qQcKt4m1IMRg-1; Wed, 13 Jan 2021 05:06:12 -0500
X-MC-Unique: vMkphjeHP8qQcKt4m1IMRg-1
Received: by mail-ed1-f72.google.com with SMTP id p17so624971edx.22
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 02:06:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Xg3B86akco8jDOFj8IsG2ZP0eid8MzFoyVYd7NaNJh8=;
 b=uS8ZzBA4uiHtutwgP8WDztCn0Ts9Zu3hIB1pCjRsq0RMuCXaP2T6UjXZGRuhYq5hub
 7bl/hpak1td2/6/Be2fa3bJPIn4TQtrqjRnmOktCIY1TVcdwyr3WYjPGww4QEFoJVRlV
 1dXKAqc2DZ8htgljXR2vP7P3kl/qRTJaKBHIcTCWZY5JUftzQFLCiKuIn6ZBugyNtE2+
 4ZI13N9hhsdAda7Jdk1UwoqFnSvC4GGjS47dWNDL7h3DhafDFpH8y5ZZLmYF3trAOVdk
 Ay/te51iEtIMnhWilnWdAFRlefE5dQoMF8fQ5XIK4j98z5Vny5BX0hOAkuzFtKGP/N58
 /QRg==
X-Gm-Message-State: AOAM531PBArGVFY+W5wclijEXiMaOfNvV/h9c9Ny5zug5Fll4e7wkuss
 0i2tu/9oqTC4s13yRA87wWddo+mY2KhFW3MrFDHsEGqBp2RLc3Mx1CfrBpw57kj3RPomUP4Bv5E
 MZxlAObnrFgSkGqPhy3dW/TJvNTcOvZSlXmFZnFwZIR99+DWJC5Tp0fHVCZZYR4pwtck=
X-Received: by 2002:a17:906:b08f:: with SMTP id
 x15mr1064674ejy.36.1610532370787; 
 Wed, 13 Jan 2021 02:06:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy+qxy67SpO8gx84l+6kISQU0zosazMf4gcpE26PYIRdsnKnsjqOuSE+KtVUfXs0HMUL6e3Dw==
X-Received: by 2002:a17:906:b08f:: with SMTP id
 x15mr1064659ejy.36.1610532370527; 
 Wed, 13 Jan 2021 02:06:10 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id f13sm509042ejf.42.2021.01.13.02.06.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jan 2021 02:06:09 -0800 (PST)
Subject: Re: [Qemu-devel][PATCH] x86/cpu: Use max host physical address if
 -cpu max option is applied
To: Yang Weijiang <weijiang.yang@intel.com>, seanjc@google.com,
 qemu-devel@nongnu.org
References: <20210113090430.26394-1-weijiang.yang@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5dd8016f-dc18-ee4d-c150-5deabe60e559@redhat.com>
Date: Wed, 13 Jan 2021 11:06:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210113090430.26394-1-weijiang.yang@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/01/21 10:04, Yang Weijiang wrote:
> QEMU option -cpu max(max_features) means "Enables all features supported by
> the accelerator in the current host", this looks true for all the features
> except guest max physical address width, so add this patch to enable it.
> 
> Signed-off-by: Yang Weijiang <weijiang.yang@intel.com>
> ---
>   target/i386/cpu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 35459a38bb..b5943406f7 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -6673,7 +6673,7 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
>                   warned = true;
>               }
>   
> -            if (cpu->host_phys_bits) {
> +            if (cpu->host_phys_bits || cpu->max_features) {
>                   /* The user asked for us to use the host physical bits */
>                   cpu->phys_bits = host_phys_bits;
>                   if (cpu->host_phys_bits_limit &&
> 

Can you check if this works?

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 35459a38bb..72a79e6019 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -4319,6 +4319,7 @@ static void max_x86_cpu_initfn(Object *obj)
          if (lmce_supported()) {
              object_property_set_bool(OBJECT(cpu), "lmce", true, 
&error_abort);
          }
+        object_property_set_bool(OBJECT(cpu), "host-phys-bits", true, 
&error_abort);
      } else {
          object_property_set_str(OBJECT(cpu), "vendor", CPUID_VENDOR_AMD,
                                  &error_abort);


It should allow people to use -cpu max,host-phys-bits=false.

Thanks,

Paolo


