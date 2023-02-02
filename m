Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A84A687B7B
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 12:06:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNXPq-0007Ue-Nj; Thu, 02 Feb 2023 06:06:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pNXPP-000718-Sl
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 06:05:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pNXPN-0000M2-Tk
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 06:05:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675335936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WSJLlntzHAf5l/EwtE5jrU3k01QMxDZ8rbwqcVUkPfM=;
 b=LE8A48cgJkd3bhLwlopemBb4tYEuPvSIko4g/R00astR9DDU9pZG1+eZp6SLBfU5yMAjpA
 Elqkmuxs5/ygChuqzcwW6RAkEHLRlu4JCICKEoTRoRcFVKdQHdLV0CklYdqHPQTDScKCcf
 e54X0WFzRx5rZXk466pi9wXrvJ/QGN8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-137-sATlGQB0NeaSa99K1Q17fA-1; Thu, 02 Feb 2023 06:05:35 -0500
X-MC-Unique: sATlGQB0NeaSa99K1Q17fA-1
Received: by mail-ej1-f70.google.com with SMTP id
 21-20020a170906225500b0088b953a6df6so1306601ejr.20
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 03:05:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WSJLlntzHAf5l/EwtE5jrU3k01QMxDZ8rbwqcVUkPfM=;
 b=QwwjKd+oN9yksDkDXL2XLH76nWZT4Psi4R920spvx9n3t+HdIw7xX2CEOQ+6Vw+FoT
 LJ4TlYYO6ajEf4SyDPp0Z5NFf+w19JymU9eV1YKU0R+LlZif+ERQyGb8aFF6afJT0j6/
 OodZQdsMNd41NNa2wHCrvlRo7fapoTI3cFwejnb1/jnvZIsb8bg+MBCh07Y5ljyR6oZq
 VxnJeyYlen3boFCsElek24pQy2hIm7uK/Ky4W867+XXHtZK+78PN7780WOCmZHE+soxY
 uDFnjoHN6nxKk7LDPRxoacw+viK+H/t4UHtTNF815iAAldBJ4yozAMe7rwI2hpne63zL
 uB/w==
X-Gm-Message-State: AO0yUKUQH1eo1ZAG6EtLuyaHbk4aFh1AZ8xU82q/eyhkzDAZfB7iDbfJ
 bTSo7NjlPSC6eo86nGPYgEUi2yYEgFly8Qw+0GB7n9DbY6FyMottbClmWdt+NjPlBD3HnEwrWS6
 2sB51+uIoaK0nsRg=
X-Received: by 2002:aa7:cf13:0:b0:4a2:44d3:6d84 with SMTP id
 a19-20020aa7cf13000000b004a244d36d84mr5834830edy.5.1675335934680; 
 Thu, 02 Feb 2023 03:05:34 -0800 (PST)
X-Google-Smtp-Source: AK7set+n5yQ0e0I73jeoJza4oaosjEacFmVOYLzbkQLdpfB0vHl6H3SSwBybBCFTJOXXLsqNd4mRXA==
X-Received: by 2002:aa7:cf13:0:b0:4a2:44d3:6d84 with SMTP id
 a19-20020aa7cf13000000b004a244d36d84mr5834821edy.5.1675335934489; 
 Thu, 02 Feb 2023 03:05:34 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 l3-20020aa7c3c3000000b004a22ed9030csm7562513edr.56.2023.02.02.03.05.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 03:05:33 -0800 (PST)
Date: Thu, 2 Feb 2023 12:05:33 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Lei Wang <lei4.wang@intel.com>
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, dgilbert@redhat.com,
 berrange@redhat.com, xiaoyao.li@intel.com, yang.zhong@linux.intel.com
Subject: Re: [PATCH v3 0/6] Support for new CPU model SapphireRapids
Message-ID: <20230202120533.37972585@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230106083826.5384-1-lei4.wang@intel.com>
References: <20230106083826.5384-1-lei4.wang@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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

On Fri,  6 Jan 2023 00:38:20 -0800
Lei Wang <lei4.wang@intel.com> wrote:

> This series aims to add a new CPU model SapphireRapids, and tries to
> address the problem stated in
> https://lore.kernel.org/all/20220812055751.14553-1-lei4.wang@intel.com/T/#mcf67dbd1ad37c65d7988c36a2b267be9afd2fb30,
> so that named CPU model can define its own AMX values, and QEMU won't
> pass the wrong AMX values to KVM in future platforms if they have
> different values supported.
> 
> The original patch is
> https://lore.kernel.org/all/20220812055751.14553-1-lei4.wang@intel.com/T/#u.

MultiBitFeatureInfo looks like an interesting
idea but among fixing whatever issues this has atm,
you'd probably need to introduce a new  qdev_bitfield property
infrastructure so that such features could be treated like any
other qdev properties.
Also when MultiBitFeatureInfo is added, one should convert all
other usecases where it's applicable (not only for new code)
so that we would end up with consolidated approach instead of
zoo mess.

I'm not sure all MultiBitFeatureInfo complexity is necessary
just for adding a new CPU model, I'd rather use ad hoc approach
that we were using before for non boolean features.

And then try to develop MultiBitFeatureInfo & co as a separate
series to demonstrate how much it will improve current
cpu models definitions.

PS:
 'make check-acceptance' are broken with this

> ---
> 
> Changelog:
> 
> v3:
>  - Rebase on the latest QEMU (d1852caab131ea898134fdcea8c14bc2ee75fbe9).
>  - v2: https://lore.kernel.org/qemu-devel/20221102085256.81139-1-lei4.wang@intel.com/
> 
> v2:
>  - Fix when passing all zeros of AMX-related CPUID, QEMU will warn
>    unsupported.
>  - Remove unnecessary function definition and make code cleaner.
>  - Fix some typos.
>  - v1: https://lore.kernel.org/qemu-devel/20221027020036.373140-1-lei4.wang@intel.com/T/#t
> 
> 
> Lei Wang (6):
>   i386: Introduce FeatureWordInfo for AMX CPUID leaf 0x1D and 0x1E
>   i386: Remove unused parameter "uint32_t bit" in
>     feature_word_description()
>   i386: Introduce new struct "MultiBitFeatureInfo" for multi-bit
>     features
>   i386: Mask and report unavailable multi-bit feature values
>   i386: Initialize AMX CPUID leaves with corresponding env->features[]
>     leaves
>   i386: Add new CPU model SapphireRapids
> 
>  target/i386/cpu-internal.h |  11 ++
>  target/i386/cpu.c          | 311 +++++++++++++++++++++++++++++++++++--
>  target/i386/cpu.h          |  16 ++
>  3 files changed, 322 insertions(+), 16 deletions(-)
> 
> 
> base-commit: d1852caab131ea898134fdcea8c14bc2ee75fbe9


