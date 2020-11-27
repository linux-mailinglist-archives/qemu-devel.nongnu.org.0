Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6E22C5F63
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 06:01:40 +0100 (CET)
Received: from localhost ([::1]:34494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiVt4-0002n7-DM
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 00:01:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kiVr3-00024y-Ha
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 23:59:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kiVr1-0007ZP-QE
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 23:59:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606453170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u5DNNUxYeOYLRMc1uslSjLOudofVnOvS0Rh60db7kHc=;
 b=cdwzEZkDLw4vVtUFSUmiLq/N1cZRJsn12tPsZmz+NAprP0jm8ABQKVZtKvR+/h1AjyCOXM
 FT39F5a/1THy/hOvK5YKZsH2JNLbFdHWBVPs40pT92zDtCBKjOGBWY/WzDTX5Q+DRypT+c
 k4hVUwQ8RcWVkuvJDiLtzHVM1u+D9a4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-Hx3biniAP8qa56b5wZ-ZWg-1; Thu, 26 Nov 2020 23:59:26 -0500
X-MC-Unique: Hx3biniAP8qa56b5wZ-ZWg-1
Received: by mail-ed1-f70.google.com with SMTP id g8so1981554edm.7
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 20:59:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=u5DNNUxYeOYLRMc1uslSjLOudofVnOvS0Rh60db7kHc=;
 b=a5tnbnyemU4EB4ZBreMeDnXrstLXdbM5aOIMCx+ZxVP9yVpTESCw55QM7dzehzSm3z
 S20JnMsgsSaz7YNM1P0igRR0Ung88PpSyQ6I2ETY4cPLQ6OUtGLgqOrv5S2c0dnpjFH2
 CPwa6vaQXMJn5/ZV9sGoLm8hm44FA4G9M+YYRYhHLPA68NLJvBtkGDuH05ssEB7qnz1m
 8o/rk6seGy//a+uyshijQ9SZYlvE8IwEVHHE0vqpcC+X4k27OD9JBG7yi6HEJOYe9e8x
 ZSAQBKvNdvMMuwHm7MThpIpVcQB2S7oIWEOBKf/ZXHZydAsxeWdgF6GWYYRQHCuT+obO
 hWsQ==
X-Gm-Message-State: AOAM531+ZrMqbjrDUP2WxHULL1H0sOwEqK6p1S64bn+4cYfHGF7waIvg
 ZVSqK82UxnnaHH43/BmV69SXSqGPEAfXOccaq3mukT3qY/UwxdU2G3+BUPGjgNn3ynnhOzAuyOl
 Na+7YTK5vyBMS6fs=
X-Received: by 2002:a17:906:a946:: with SMTP id
 hh6mr5092766ejb.456.1606453165452; 
 Thu, 26 Nov 2020 20:59:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxkvhgQaWhg4wh2I9idMpXCgzn5HSq3YdKBVIUhIcfI3YXBMOrDAZsESOm6XEGOXNFMwJi4EA==
X-Received: by 2002:a17:906:a946:: with SMTP id
 hh6mr5092748ejb.456.1606453165167; 
 Thu, 26 Nov 2020 20:59:25 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id s6sm4270905ejb.122.2020.11.26.20.59.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Nov 2020 20:59:24 -0800 (PST)
Subject: Re: [PATCH 7/8] arm: Add Hypervisor.framework build target
To: Alexander Graf <agraf@csgraf.de>, qemu-devel@nongnu.org
References: <20201126215017.41156-1-agraf@csgraf.de>
 <20201126215017.41156-8-agraf@csgraf.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <48aa3247-9d1b-301f-adb5-7779cdbbf37b@redhat.com>
Date: Fri, 27 Nov 2020 05:59:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201126215017.41156-8-agraf@csgraf.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/11/20 22:50, Alexander Graf wrote:
> Now that we have all logic in place that we need to handle Hypervisor.framework
> on Apple Silicon systems, let's add CONFIG_HVF for aarch64 as well so that we
> can build it.
> 
> Signed-off-by: Alexander Graf <agraf@csgraf.de>

Between patch 1 and this one, this series is a nice showcase for the 
good, the bad and the ugly of Meson... :)

> diff --git a/meson.build b/meson.build
> index 2a7ff5560c..21565f5787 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -74,16 +74,23 @@ else
>   endif
>   
>   accelerator_targets = { 'CONFIG_KVM': kvm_targets }
> +
> +if cpu in ['x86', 'x86_64']
> +  hvf_targets = ['i386-softmmu', 'x86_64-softmmu']
> +elif cpu in ['aarch64']
> +  hvf_targets = ['aarch64-softmmu']
> +endif
> +
>   if cpu in ['x86', 'x86_64', 'arm', 'aarch64']

This would fail to compile on 32-bit ARM.  Simpler to add an 
"hvf_targets = []" else branch above, and add "'CONFIG_HVF': 
hvf_targets" unconditionally.  That is, copy even more of what it is 
doing for KVM.

Paolo

>     # i368 emulator provides xenpv machine type for multiple architectures
>     accelerator_targets += {
>       'CONFIG_XEN': ['i386-softmmu', 'x86_64-softmmu'],
> +    'CONFIG_HVF': hvf_targets,
>     }
>   endif
>   if cpu in ['x86', 'x86_64']
>     accelerator_targets += {
>       'CONFIG_HAX': ['i386-softmmu', 'x86_64-softmmu'],
> -    'CONFIG_HVF': ['x86_64-softmmu'],
>       'CONFIG_WHPX': ['i386-softmmu', 'x86_64-softmmu'],
>     }
>   endif
> diff --git a/target/arm/hvf/meson.build b/target/arm/hvf/meson.build
> new file mode 100644
> index 0000000000..855e6cce5a
> --- /dev/null
> +++ b/target/arm/hvf/meson.build
> @@ -0,0 +1,3 @@
> +arm_softmmu_ss.add(when: [hvf, 'CONFIG_HVF'], if_true: files(
> +  'hvf.c',
> +))
> diff --git a/target/arm/meson.build b/target/arm/meson.build
> index f5de2a77b8..95bebae216 100644
> --- a/target/arm/meson.build
> +++ b/target/arm/meson.build
> @@ -56,5 +56,7 @@ arm_softmmu_ss.add(files(
>     'psci.c',
>   ))
>   
> +subdir('hvf')
> +
>   target_arch += {'arm': arm_ss}
>   target_softmmu_arch += {'arm': arm_softmmu_ss}
> 


