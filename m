Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FC56A17F9
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 09:30:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVTSb-0002uN-Du; Fri, 24 Feb 2023 03:29:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pVTSV-0002tM-Ia
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 03:29:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pVTST-0006hJ-PD
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 03:29:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677227376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GNiQdeXMBEYDa9tfcobl1aT4IunAoU96cvwoIILkAUA=;
 b=Er2R6guVqjVk0Oi8DpYAlKAGyfnWbTr+ZdGbQwHUZ8jixR4r37Yr6X/eMXUruCykpG+ZK7
 UxASU6/rWmVcuXlXulVtqG+ccb5Uvdk9yleti56iko5PW+gPVkC4W/QA7pmWP/dTB/e+Jp
 bJGXaBcqt5LeG/sNLhcfpkFnXtExF58=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-489-9K5_KsxiN2uVG_BlA8IgDg-1; Fri, 24 Feb 2023 03:29:35 -0500
X-MC-Unique: 9K5_KsxiN2uVG_BlA8IgDg-1
Received: by mail-ed1-f71.google.com with SMTP id
 co14-20020a0564020c0e00b004aab4319cedso17871555edb.2
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 00:29:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GNiQdeXMBEYDa9tfcobl1aT4IunAoU96cvwoIILkAUA=;
 b=UOigv7n4Od4yTYuTEbwEsk1oGue64c4Csx7O2vBxZTfmUjcJlPnK1QR7em+Jx82702
 TonPyrIGFladnBVXmdELe3u43T7WqbGWRnkiviAlTkYwHfOwn8DWCGpZj/V9RHoB1+2B
 COZjBf6Vk9ODaDeRqzk5CKeo5PLjTsGAhNavgh3aEREuxZDpeNnwCrkx2l18TLTajBid
 aifiLO+TIoF089N3Icyb3LpyTQyGmzq4R0dqs4escp/CcOI1MldesB2WJqNmy7LjcJ0q
 cDp5YskL9cRTqug+N+mdKiG35xE3pU63Q4bZ+p61gGj82LOigNUlld+9Q7GXM5kBjX9E
 IHmQ==
X-Gm-Message-State: AO0yUKWhvPH4twUfNzXauD4n0HNjlmfhbuqDKFALNKg4pEtjewQkGFNm
 Sc03F2u4V7cgMmJNa/J1WDYHfcOBSMLdYjKCuBLP5ClY1v5wsMyILIgoUx53xq7pUGQvj1fc1RS
 MVKvfYatvhpfvUas=
X-Received: by 2002:a17:906:11ce:b0:88a:a27c:c282 with SMTP id
 o14-20020a17090611ce00b0088aa27cc282mr22722002eja.47.1677227374043; 
 Fri, 24 Feb 2023 00:29:34 -0800 (PST)
X-Google-Smtp-Source: AK7set+C+Nd2cSeitDLI5uE//FNNHHHmJ1Sx/KzPKHG/DGN9S6awyCxahrODfoszebYuZ6c/+Xe46w==
X-Received: by 2002:a17:906:11ce:b0:88a:a27c:c282 with SMTP id
 o14-20020a17090611ce00b0088aa27cc282mr22721994eja.47.1677227373696; 
 Fri, 24 Feb 2023 00:29:33 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.googlemail.com with ESMTPSA id
 f29-20020a50a6dd000000b004ad6e3e4a26sm6614445edc.84.2023.02.24.00.29.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 00:29:33 -0800 (PST)
Message-ID: <005ace5a-a767-c850-4667-423deea2435b@redhat.com>
Date: Fri, 24 Feb 2023 09:29:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] cpu/i386: update xsave components after CPUID filtering
Content-Language: en-US
To: Huanyu ZHAI <huanyu.zhai@outlook.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
References: <AS4P190MB202188766937CF16EC4F1DAFF60C9@AS4P190MB2021.EURP190.PROD.OUTLOOK.COM>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <AS4P190MB202188766937CF16EC4F1DAFF60C9@AS4P190MB2021.EURP190.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/23/22 19:17, Huanyu ZHAI wrote:
> Subject: [PATCH] cpu/i386: update xsave components after CPUID filtering
> 
> On i386 platform, CPUID data are setup through three consecutive steps: 
> CPU model definition, expansion and filtering.
> 
> XSAVE components are enabled during the expansion stage, by checking if 
> they are enabled in CPUID. However, it is still
> 
> probable that some XSAVE features will be enabled/disabled during the 
> filtering stage and the XSAVE components left unchanged.
> 
> Inconsistency between XSAVE features and enabled XSAVE components can 
> lead to problems on some Linux guests in the absence of

The patch is correct, but I think you can also remove the existing call 
to x86_cpu_enable_xsave_components().  Can you test that?

Thanks,

Paolo

> the following patch in the kernel:
> 
> https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1452368.html <https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1452368.html>
> 
> A simple case to reproduce this problem is to start a SUSE 12 SP3 guest 
> with cpu model set to Skylake-Server:
> 
> $ qemu-system-x86_64 -cpu Skylake-Server ...
> 
> In the SUSE 12 SP3 guest, one can observe that PKRU will be enabled 
> without Intel PKU's presence.
> 
> That's because on platform with Skylake-Server cpus, Intel PKU is 
> disabled during x86_cpu_filter_features(),
> 
> but the XSAVE PKRU bit was enabled by x86_cpu_expand_features().
> 
> Signed-off-by: Huanyu ZHAI zhaihuanyu@huawei.com 
> <mailto:zhaihuanyu@huawei.com>
> 
> Signed-off-by: Xin Wang wangxinxin.wang@huawei.com 
> <mailto:wangxinxin.wang@huawei.com>
> 
> ---
> 
> target/i386/cpu.c | 3 +++
> 
> 1 file changed, 3 insertions(+)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> 
> index 22b681ca37..2ee574cf05 100644
> 
> --- a/target/i386/cpu.c
> 
> +++ b/target/i386/cpu.c
> 
> @@ -6362,6 +6362,9 @@ static void x86_cpu_filter_features(X86CPU *cpu, 
> bool verbose)
> 
>               mark_unavailable_features(cpu, FEAT_7_0_EBX, 
> CPUID_7_0_EBX_INTEL_PT, prefix);
> 
>           }
> 
>       }
> 
> +
> 
> +    /* Update XSAVE components again based on the filtered CPU feature 
> flags */
> 
> +    x86_cpu_enable_xsave_components(cpu);
> 
> }
> 
> static void x86_cpu_hyperv_realize(X86CPU *cpu)
> 
> -- 
> 
> 2.27.0
> 


