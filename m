Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E308E6A0E39
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 17:51:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVEoA-0004JU-Rw; Thu, 23 Feb 2023 11:51:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pVEo2-00046t-9q
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 11:50:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pVEnn-0005jk-NV
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 11:50:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677171036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/2gWH/S72gDdN2u5PaLZkKIqmYndnLVCKBPjVK/9h2U=;
 b=HLX0FkTqKyEvDeLDEmk/U7rueXNZ/tFrDXkatuSYcqF+kKtNTSMBVfn20Gbj5iILtNR6sO
 hLIAsdU9/RPT8t/Er+DARtcPWWapms5fLhLh7Eyv5PNiWKoB9c5V3atcKv59lvGpeAwx6K
 TfZpiXbA/tvmoayP2bmsfB+jJ2tkK2I=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-318-zQBuuLLqPD2_wrxCBJXngg-1; Thu, 23 Feb 2023 11:50:34 -0500
X-MC-Unique: zQBuuLLqPD2_wrxCBJXngg-1
Received: by mail-wr1-f72.google.com with SMTP id
 r3-20020a5d6c63000000b002bff57fc7fcso2710904wrz.19
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 08:50:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/2gWH/S72gDdN2u5PaLZkKIqmYndnLVCKBPjVK/9h2U=;
 b=hNYXxZ2n25PwSCNzuMAEeS7XfMNbRV+qJBUHeNsaYVo7WL3Y6QAa1mLkWAp/sKMSvQ
 T3BKkNHL5r8KHTyNJJ8hOCngSurd/LepbWcY3qqUt7hN5waYu6pH05bb5+CDLBPr6peF
 B0zM/qeAaVsaYA5k+X0VZkYSpJ5pbV6vDwaJs7Z4lYFqCTh3CjtLBKLG5ZUmXsVxvP5i
 EgOUt1OLEyS1pPTZKt1ze3k6Xs4cfLI9OQdZgiVCkl1ZoVeWhtKmfE11i9rax/g9KR6m
 Oue974WYDaMrq5R9C6unKRgZdhywdddFNiExlS5YcTrH6CO2LxDgUto5GmNXFPVaVEjT
 ZRDA==
X-Gm-Message-State: AO0yUKXMiR1jFjOLgGftn2DJTqA2PdeQK3GNnxVcVF3EwDOmmSiQgkiz
 pc7r7+BCxTbRQOeHxZF9tQ2DcYQUR0kx4vBJpG7JRdMc5std+BFMk3tdvuOsaIZEm/5xT2GnJ9d
 nHuXKW3/2jkFWjmU=
X-Received: by 2002:adf:f34f:0:b0:2c7:fcc:2501 with SMTP id
 e15-20020adff34f000000b002c70fcc2501mr2714005wrp.28.1677171033120; 
 Thu, 23 Feb 2023 08:50:33 -0800 (PST)
X-Google-Smtp-Source: AK7set/2LXqumxbhzHznFAVZe6/GQJsc2TZtuNDmnndggqRzy29OKkcbNqlezMUfsP64iZfvezG8Jg==
X-Received: by 2002:adf:f34f:0:b0:2c7:fcc:2501 with SMTP id
 e15-20020adff34f000000b002c70fcc2501mr2713995wrp.28.1677171032871; 
 Thu, 23 Feb 2023 08:50:32 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 t23-20020a05600c2f9700b003dc521f336esm11563735wmn.14.2023.02.23.08.50.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 08:50:32 -0800 (PST)
Date: Thu, 23 Feb 2023 16:50:30 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Huanyu ZHAI <huanyu.zhai@outlook.com>, pbonzini@redhat.com,
 mtosatti@redhat.com
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Subject: Re: [PATCH] cpu/i386: update xsave components after CPUID filtering
Message-ID: <Y/eZVh9Xvmolx4Wh@work-vm>
References: <AS4P190MB202188766937CF16EC4F1DAFF60C9@AS4P190MB2021.EURP190.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS4P190MB202188766937CF16EC4F1DAFF60C9@AS4P190MB2021.EURP190.PROD.OUTLOOK.COM>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


* Huanyu ZHAI (huanyu.zhai@outlook.com) wrote:
> Subject: [PATCH] cpu/i386: update xsave components after CPUID filtering
> 
> On i386 platform, CPUID data are setup through three consecutive steps: CPU model definition, expansion and filtering.
> XSAVE components are enabled during the expansion stage, by checking if they are enabled in CPUID. However, it is still
> probable that some XSAVE features will be enabled/disabled during the filtering stage and the XSAVE components left unchanged.
> Inconsistency between XSAVE features and enabled XSAVE components can lead to problems on some Linux guests in the absence of
> the following patch in the kernel:
> 
> https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1452368.html
> 
> A simple case to reproduce this problem is to start a SUSE 12 SP3 guest with cpu model set to Skylake-Server:
> $ qemu-system-x86_64 -cpu Skylake-Server ...
> 
> In the SUSE 12 SP3 guest, one can observe that PKRU will be enabled without Intel PKU's presence.
> That's because on platform with Skylake-Server cpus, Intel PKU is disabled during x86_cpu_filter_features(),
> but the XSAVE PKRU bit was enabled by x86_cpu_expand_features().

I just spotted this when trying to clear out my mail folder;
this isn't a 'trivial'!

I'm not sure if it's right or not, but I've cc'd in Paolo and Marcelo as
x86 maintainers.

Dave

> Signed-off-by: Huanyu ZHAI zhaihuanyu@huawei.com<mailto:zhaihuanyu@huawei.com>
> Signed-off-by: Xin Wang wangxinxin.wang@huawei.com<mailto:wangxinxin.wang@huawei.com>
> ---
> target/i386/cpu.c | 3 +++
> 1 file changed, 3 insertions(+)
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 22b681ca37..2ee574cf05 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -6362,6 +6362,9 @@ static void x86_cpu_filter_features(X86CPU *cpu, bool verbose)
>              mark_unavailable_features(cpu, FEAT_7_0_EBX, CPUID_7_0_EBX_INTEL_PT, prefix);
>          }
>      }
> +
> +    /* Update XSAVE components again based on the filtered CPU feature flags */
> +    x86_cpu_enable_xsave_components(cpu);
> }
> 
> static void x86_cpu_hyperv_realize(X86CPU *cpu)
> --
> 2.27.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


