Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 933B036D57D
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 12:13:27 +0200 (CEST)
Received: from localhost ([::1]:47178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbhC8-0004f6-K3
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 06:13:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lbh7y-0002xk-KA
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 06:09:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lbh7s-0006yn-Vn
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 06:09:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619604540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XpZncIaEdux2pVZi81TBnEooP2wss2h0rUFGEABpHdY=;
 b=hwGyq8xM2ZfBzSg0c5Ap1gri78lAGnkPmwyvXod2p63h/pecczmg9X78wnygZBnhQMy1ce
 a3nTJy4sHz5dQA88lkUGPqe5+75TBM0/k8wFveT6LC8mad9poLpw6QOBybrmrcmOCG+s3M
 0T1n3WWWWEh5Xs+rabP4V6zKf93nxPU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-Uay1exaeP06HhBS7fSbaSw-1; Wed, 28 Apr 2021 06:08:58 -0400
X-MC-Unique: Uay1exaeP06HhBS7fSbaSw-1
Received: by mail-wm1-f72.google.com with SMTP id
 o18-20020a1ca5120000b02901333a56d46eso4932073wme.8
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 03:08:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=XpZncIaEdux2pVZi81TBnEooP2wss2h0rUFGEABpHdY=;
 b=EDGllfqjqsut8NDO+3JjPv/tgVkrAzBtaxpZoI7yaz1abVZYb5gCzg3mWSE0OjG2B6
 LcscYNnT0Uv4+us/XVh8TS5fwGtm7h0QQThPdOlPADTRPvYjOg2W7G6L/mKZjIAYe3rD
 6Nk94L29MfOTvDA8Db4f0dIZuhRNZlRgCSZ5pbwJwK/jbFsFEkVDoTtT4GGM7wTVHn6q
 SOp8CuONjfnGMj3ZGMQDHWcEIp91rYFdxi/eRtvc1/WxbLztmjSevTcqDd/jgHg0T6i2
 NqTIkn7RIrPfW24LX4lO50CXobUXeNRRxKspmvQjO9ty3bdfEciqSNvtYe/Fc0brloxU
 VxSw==
X-Gm-Message-State: AOAM533e0G4Pc+V3ZWKenlluWDpRftJiNbjNDoKI/gRME/4b40b9tSC0
 Eef2TG6Bu/lcggwZ1G/AyidS+GtZTMJi8c5To35ZJlIx3NNFsIuh3k/m1LA4ZHNgZbPV4Ln91PC
 8iRXDaENvkfFej5k=
X-Received: by 2002:adf:efce:: with SMTP id i14mr8107291wrp.317.1619604536963; 
 Wed, 28 Apr 2021 03:08:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgUzoDFARh3Nwmy/gA6pC+M20ZBIP9h/HKPAUk/jymt3E1i+EFYGzgHjGF1ypz2h5p3JT4XQ==
X-Received: by 2002:adf:efce:: with SMTP id i14mr8107253wrp.317.1619604536605; 
 Wed, 28 Apr 2021 03:08:56 -0700 (PDT)
Received: from ?IPv6:2003:d8:2f38:2400:62f4:c5fa:ba13:ac32?
 (p200300d82f38240062f4c5faba13ac32.dip0.t-ipconnect.de.
 [2003:d8:2f38:2400:62f4:c5fa:ba13:ac32])
 by smtp.gmail.com with ESMTPSA id n124sm6018758wmn.40.2021.04.28.03.08.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 03:08:56 -0700 (PDT)
Subject: Re: [RFC v3 05/13] target/s390x: start moving TCG-only code to tcg/
To: Claudio Fontana <cfontana@suse.de>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20210422115430.15078-1-cfontana@suse.de>
 <20210422115430.15078-6-cfontana@suse.de>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <40bbae6a-c47b-977f-1552-799d7af1a162@redhat.com>
Date: Wed, 28 Apr 2021 12:08:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210422115430.15078-6-cfontana@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.04.21 13:54, Claudio Fontana wrote:
> move everything related to translate, as well as HELPER code in tcg/
> 
> mmu_helper.c stays put for now, as it contains both TCG and KVM code.
> 
> The internal.h file is renamed to s390x-internal.h, because of the
> risk of collision with other files with the same name.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>   include/hw/s390x/tod.h                        |  2 +-
>   target/s390x/{internal.h => s390x-internal.h} |  0
>   target/s390x/{ => tcg}/s390-tod.h             |  0
>   target/s390x/{ => tcg}/tcg_s390x.h            |  0
>   target/s390x/{ => tcg}/vec.h                  |  0
>   hw/s390x/tod-tcg.c                            |  2 +-
>   target/s390x/arch_dump.c                      |  2 +-
>   target/s390x/cpu.c                            |  2 +-
>   target/s390x/cpu_models.c                     |  2 +-
>   target/s390x/diag.c                           |  2 +-
>   target/s390x/gdbstub.c                        |  2 +-
>   target/s390x/helper.c                         |  2 +-
>   target/s390x/interrupt.c                      |  4 ++--
>   target/s390x/ioinst.c                         |  2 +-
>   target/s390x/kvm.c                            |  2 +-
>   target/s390x/machine.c                        |  4 ++--
>   target/s390x/mmu_helper.c                     |  2 +-
>   target/s390x/sigp.c                           |  2 +-
>   target/s390x/{ => tcg}/cc_helper.c            |  2 +-
>   target/s390x/{ => tcg}/crypto_helper.c        |  2 +-
>   target/s390x/{ => tcg}/excp_helper.c          |  2 +-
>   target/s390x/{ => tcg}/fpu_helper.c           |  2 +-
>   target/s390x/{ => tcg}/int_helper.c           |  2 +-
>   target/s390x/{ => tcg}/mem_helper.c           |  2 +-
>   target/s390x/{ => tcg}/misc_helper.c          |  2 +-
>   target/s390x/{ => tcg}/translate.c            |  2 +-
>   target/s390x/{ => tcg}/vec_fpu_helper.c       |  2 +-
>   target/s390x/{ => tcg}/vec_helper.c           |  2 +-
>   target/s390x/{ => tcg}/vec_int_helper.c       |  0
>   target/s390x/{ => tcg}/vec_string_helper.c    |  2 +-
>   target/s390x/{ => tcg}/translate_vx.c.inc     |  0
>   target/s390x/meson.build                      | 17 ++---------------
>   target/s390x/{ => tcg}/insn-data.def          |  0
>   target/s390x/{ => tcg}/insn-format.def        |  0
>   target/s390x/tcg/meson.build                  | 14 ++++++++++++++
>   35 files changed, 43 insertions(+), 42 deletions(-)
>   rename target/s390x/{internal.h => s390x-internal.h} (100%)
>   rename target/s390x/{ => tcg}/s390-tod.h (100%)
>   rename target/s390x/{ => tcg}/tcg_s390x.h (100%)
>   rename target/s390x/{ => tcg}/vec.h (100%)
>   rename target/s390x/{ => tcg}/cc_helper.c (99%)
>   rename target/s390x/{ => tcg}/crypto_helper.c (98%)
>   rename target/s390x/{ => tcg}/excp_helper.c (99%)
>   rename target/s390x/{ => tcg}/fpu_helper.c (99%)
>   rename target/s390x/{ => tcg}/int_helper.c (99%)
>   rename target/s390x/{ => tcg}/mem_helper.c (99%)
>   rename target/s390x/{ => tcg}/misc_helper.c (99%)
>   rename target/s390x/{ => tcg}/translate.c (99%)
>   rename target/s390x/{ => tcg}/vec_fpu_helper.c (99%)
>   rename target/s390x/{ => tcg}/vec_helper.c (99%)
>   rename target/s390x/{ => tcg}/vec_int_helper.c (100%)
>   rename target/s390x/{ => tcg}/vec_string_helper.c (99%)
>   rename target/s390x/{ => tcg}/translate_vx.c.inc (100%)
>   rename target/s390x/{ => tcg}/insn-data.def (100%)
>   rename target/s390x/{ => tcg}/insn-format.def (100%)
>   create mode 100644 target/s390x/tcg/meson.build
> 
> diff --git a/include/hw/s390x/tod.h b/include/hw/s390x/tod.h
> index ff3195a4bf..0935e85089 100644
> --- a/include/hw/s390x/tod.h
> +++ b/include/hw/s390x/tod.h
> @@ -12,7 +12,7 @@
>   #define HW_S390_TOD_H
>   
>   #include "hw/qdev-core.h"
> -#include "target/s390x/s390-tod.h"
> +#include "tcg/s390-tod.h"
>   #include "qom/object.h"
>   
>   typedef struct S390TOD {
> diff --git a/target/s390x/internal.h b/target/s390x/s390x-internal.h
> similarity index 100%
> rename from target/s390x/internal.h
> rename to target/s390x/s390x-internal.h
> diff --git a/target/s390x/s390-tod.h b/target/s390x/tcg/s390-tod.h
> similarity index 100%
> rename from target/s390x/s390-tod.h
> rename to target/s390x/tcg/s390-tod.h
> diff --git a/target/s390x/tcg_s390x.h b/target/s390x/tcg/tcg_s390x.h
> similarity index 100%
> rename from target/s390x/tcg_s390x.h
> rename to target/s390x/tcg/tcg_s390x.h
> diff --git a/target/s390x/vec.h b/target/s390x/tcg/vec.h
> similarity index 100%
> rename from target/s390x/vec.h
> rename to target/s390x/tcg/vec.h
> diff --git a/hw/s390x/tod-tcg.c b/hw/s390x/tod-tcg.c
> index e91b9590f5..4b3e65050a 100644
> --- a/hw/s390x/tod-tcg.c
> +++ b/hw/s390x/tod-tcg.c
> @@ -16,7 +16,7 @@
>   #include "qemu/cutils.h"
>   #include "qemu/module.h"
>   #include "cpu.h"
> -#include "tcg_s390x.h"
> +#include "tcg/tcg_s390x.h"
>   
>   static void qemu_s390_tod_get(const S390TODState *td, S390TOD *tod,
>                                 Error **errp)
> diff --git a/target/s390x/arch_dump.c b/target/s390x/arch_dump.c
> index cc1330876b..08daf93ae1 100644
> --- a/target/s390x/arch_dump.c
> +++ b/target/s390x/arch_dump.c
> @@ -13,7 +13,7 @@
>   
>   #include "qemu/osdep.h"
>   #include "cpu.h"
> -#include "internal.h"
> +#include "s390x-internal.h"
>   #include "elf.h"
>   #include "sysemu/dump.h"
>   
> diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
> index d35eb39a1b..ae054d264b 100644
> --- a/target/s390x/cpu.c
> +++ b/target/s390x/cpu.c
> @@ -23,7 +23,7 @@
>   #include "qemu/osdep.h"
>   #include "qapi/error.h"
>   #include "cpu.h"
> -#include "internal.h"
> +#include "s390x-internal.h"
>   #include "kvm_s390x.h"
>   #include "sysemu/kvm.h"
>   #include "sysemu/reset.h"
> diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
> index 050dcf2d42..4ff8cba7e5 100644
> --- a/target/s390x/cpu_models.c
> +++ b/target/s390x/cpu_models.c
> @@ -12,7 +12,7 @@
>   
>   #include "qemu/osdep.h"
>   #include "cpu.h"
> -#include "internal.h"
> +#include "s390x-internal.h"
>   #include "kvm_s390x.h"
>   #include "sysemu/kvm.h"
>   #include "sysemu/tcg.h"
> diff --git a/target/s390x/diag.c b/target/s390x/diag.c
> index 1a48429564..86b7032b5b 100644
> --- a/target/s390x/diag.c
> +++ b/target/s390x/diag.c
> @@ -14,7 +14,7 @@
>   
>   #include "qemu/osdep.h"
>   #include "cpu.h"
> -#include "internal.h"
> +#include "s390x-internal.h"
>   #include "exec/address-spaces.h"
>   #include "hw/watchdog/wdt_diag288.h"
>   #include "sysemu/cpus.h"
> diff --git a/target/s390x/gdbstub.c b/target/s390x/gdbstub.c
> index d6fce5ff1e..1dbe2973f4 100644
> --- a/target/s390x/gdbstub.c
> +++ b/target/s390x/gdbstub.c
> @@ -20,7 +20,7 @@
>   
>   #include "qemu/osdep.h"
>   #include "cpu.h"
> -#include "internal.h"
> +#include "s390x-internal.h"
>   #include "exec/exec-all.h"
>   #include "exec/gdbstub.h"
>   #include "qemu/bitops.h"
> diff --git a/target/s390x/helper.c b/target/s390x/helper.c
> index 7678994feb..2254873cef 100644
> --- a/target/s390x/helper.c
> +++ b/target/s390x/helper.c
> @@ -20,7 +20,7 @@
>   
>   #include "qemu/osdep.h"
>   #include "cpu.h"
> -#include "internal.h"
> +#include "s390x-internal.h"
>   #include "exec/gdbstub.h"
>   #include "qemu/timer.h"
>   #include "qemu/qemu-print.h"
> diff --git a/target/s390x/interrupt.c b/target/s390x/interrupt.c
> index 4cdbbc8849..d0e58d6e8d 100644
> --- a/target/s390x/interrupt.c
> +++ b/target/s390x/interrupt.c
> @@ -11,12 +11,12 @@
>   #include "qemu/log.h"
>   #include "cpu.h"
>   #include "kvm_s390x.h"
> -#include "internal.h"
> +#include "s390x-internal.h"
>   #include "exec/exec-all.h"
>   #include "sysemu/kvm.h"
>   #include "sysemu/tcg.h"
>   #include "hw/s390x/ioinst.h"
> -#include "tcg_s390x.h"
> +#include "tcg/tcg_s390x.h"
>   #if !defined(CONFIG_USER_ONLY)
>   #include "hw/s390x/s390_flic.h"
>   #endif
> diff --git a/target/s390x/ioinst.c b/target/s390x/ioinst.c
> index 1ee11522e1..4eb0a7a9f8 100644
> --- a/target/s390x/ioinst.c
> +++ b/target/s390x/ioinst.c
> @@ -12,7 +12,7 @@
>   #include "qemu/osdep.h"
>   
>   #include "cpu.h"
> -#include "internal.h"
> +#include "s390x-internal.h"
>   #include "hw/s390x/ioinst.h"
>   #include "trace.h"
>   #include "hw/s390x/s390-pci-bus.h"
> diff --git a/target/s390x/kvm.c b/target/s390x/kvm.c
> index 4fb3bbfef5..2a22cc69f6 100644
> --- a/target/s390x/kvm.c
> +++ b/target/s390x/kvm.c
> @@ -26,7 +26,7 @@
>   
>   #include "qemu-common.h"
>   #include "cpu.h"
> -#include "internal.h"
> +#include "s390x-internal.h"
>   #include "kvm_s390x.h"
>   #include "sysemu/kvm_int.h"
>   #include "qemu/cutils.h"
> diff --git a/target/s390x/machine.c b/target/s390x/machine.c
> index 5b4e82f1ab..81a8a7ff99 100644
> --- a/target/s390x/machine.c
> +++ b/target/s390x/machine.c
> @@ -16,10 +16,10 @@
>   
>   #include "qemu/osdep.h"
>   #include "cpu.h"
> -#include "internal.h"
> +#include "s390x-internal.h"
>   #include "kvm_s390x.h"
>   #include "migration/vmstate.h"
> -#include "tcg_s390x.h"
> +#include "tcg/tcg_s390x.h"
>   #include "sysemu/kvm.h"
>   #include "sysemu/tcg.h"
>   
> diff --git a/target/s390x/mmu_helper.c b/target/s390x/mmu_helper.c
> index d492b23a17..52fdd86c63 100644
> --- a/target/s390x/mmu_helper.c
> +++ b/target/s390x/mmu_helper.c
> @@ -19,7 +19,7 @@
>   #include "qemu/error-report.h"
>   #include "exec/address-spaces.h"
>   #include "cpu.h"
> -#include "internal.h"
> +#include "s390x-internal.h"
>   #include "kvm_s390x.h"
>   #include "sysemu/kvm.h"
>   #include "sysemu/tcg.h"
> diff --git a/target/s390x/sigp.c b/target/s390x/sigp.c
> index c604f17710..320dddbae2 100644
> --- a/target/s390x/sigp.c
> +++ b/target/s390x/sigp.c
> @@ -10,7 +10,7 @@
>   
>   #include "qemu/osdep.h"
>   #include "cpu.h"
> -#include "internal.h"
> +#include "s390x-internal.h"
>   #include "sysemu/hw_accel.h"
>   #include "sysemu/runstate.h"
>   #include "exec/address-spaces.h"
> diff --git a/target/s390x/cc_helper.c b/target/s390x/tcg/cc_helper.c
> similarity index 99%
> rename from target/s390x/cc_helper.c
> rename to target/s390x/tcg/cc_helper.c
> index e7039d0d18..f0663f7a3e 100644
> --- a/target/s390x/cc_helper.c
> +++ b/target/s390x/tcg/cc_helper.c
> @@ -20,7 +20,7 @@
>   
>   #include "qemu/osdep.h"
>   #include "cpu.h"
> -#include "internal.h"
> +#include "s390x-internal.h"
>   #include "tcg_s390x.h"
>   #include "exec/exec-all.h"
>   #include "exec/helper-proto.h"
> diff --git a/target/s390x/crypto_helper.c b/target/s390x/tcg/crypto_helper.c
> similarity index 98%
> rename from target/s390x/crypto_helper.c
> rename to target/s390x/tcg/crypto_helper.c
> index ff3fbc3950..138d9e7ad9 100644
> --- a/target/s390x/crypto_helper.c
> +++ b/target/s390x/tcg/crypto_helper.c
> @@ -12,7 +12,7 @@
>   
>   #include "qemu/osdep.h"
>   #include "qemu/main-loop.h"
> -#include "internal.h"
> +#include "s390x-internal.h"
>   #include "tcg_s390x.h"
>   #include "exec/helper-proto.h"
>   #include "exec/exec-all.h"
> diff --git a/target/s390x/excp_helper.c b/target/s390x/tcg/excp_helper.c
> similarity index 99%
> rename from target/s390x/excp_helper.c
> rename to target/s390x/tcg/excp_helper.c
> index c48cd6b46f..ecc830cea0 100644
> --- a/target/s390x/excp_helper.c
> +++ b/target/s390x/tcg/excp_helper.c
> @@ -20,7 +20,7 @@
>   
>   #include "qemu/osdep.h"
>   #include "cpu.h"
> -#include "internal.h"
> +#include "s390x-internal.h"
>   #include "exec/helper-proto.h"
>   #include "qemu/timer.h"
>   #include "exec/exec-all.h"
> diff --git a/target/s390x/fpu_helper.c b/target/s390x/tcg/fpu_helper.c
> similarity index 99%
> rename from target/s390x/fpu_helper.c
> rename to target/s390x/tcg/fpu_helper.c
> index f155bc048c..bc89ef7cc8 100644
> --- a/target/s390x/fpu_helper.c
> +++ b/target/s390x/tcg/fpu_helper.c
> @@ -20,7 +20,7 @@
>   
>   #include "qemu/osdep.h"
>   #include "cpu.h"
> -#include "internal.h"
> +#include "s390x-internal.h"
>   #include "tcg_s390x.h"
>   #include "exec/exec-all.h"
>   #include "exec/cpu_ldst.h"
> diff --git a/target/s390x/int_helper.c b/target/s390x/tcg/int_helper.c
> similarity index 99%
> rename from target/s390x/int_helper.c
> rename to target/s390x/tcg/int_helper.c
> index 658507dd6d..954542388a 100644
> --- a/target/s390x/int_helper.c
> +++ b/target/s390x/tcg/int_helper.c
> @@ -20,7 +20,7 @@
>   
>   #include "qemu/osdep.h"
>   #include "cpu.h"
> -#include "internal.h"
> +#include "s390x-internal.h"
>   #include "tcg_s390x.h"
>   #include "exec/exec-all.h"
>   #include "qemu/host-utils.h"
> diff --git a/target/s390x/mem_helper.c b/target/s390x/tcg/mem_helper.c
> similarity index 99%
> rename from target/s390x/mem_helper.c
> rename to target/s390x/tcg/mem_helper.c
> index 12e84a4285..a91791a1b7 100644
> --- a/target/s390x/mem_helper.c
> +++ b/target/s390x/tcg/mem_helper.c
> @@ -20,7 +20,7 @@
>   
>   #include "qemu/osdep.h"
>   #include "cpu.h"
> -#include "internal.h"
> +#include "s390x-internal.h"
>   #include "tcg_s390x.h"
>   #include "exec/helper-proto.h"
>   #include "exec/exec-all.h"
> diff --git a/target/s390x/misc_helper.c b/target/s390x/tcg/misc_helper.c
> similarity index 99%
> rename from target/s390x/misc_helper.c
> rename to target/s390x/tcg/misc_helper.c
> index 7ea90d414a..33e6999e15 100644
> --- a/target/s390x/misc_helper.c
> +++ b/target/s390x/tcg/misc_helper.c
> @@ -22,7 +22,7 @@
>   #include "qemu/cutils.h"
>   #include "qemu/main-loop.h"
>   #include "cpu.h"
> -#include "internal.h"
> +#include "s390x-internal.h"
>   #include "exec/memory.h"
>   #include "qemu/host-utils.h"
>   #include "exec/helper-proto.h"
> diff --git a/target/s390x/translate.c b/target/s390x/tcg/translate.c
> similarity index 99%
> rename from target/s390x/translate.c
> rename to target/s390x/tcg/translate.c
> index 4f953ddfba..ac236888a0 100644
> --- a/target/s390x/translate.c
> +++ b/target/s390x/tcg/translate.c
> @@ -30,7 +30,7 @@
>   
>   #include "qemu/osdep.h"
>   #include "cpu.h"
> -#include "internal.h"
> +#include "s390x-internal.h"
>   #include "disas/disas.h"
>   #include "exec/exec-all.h"
>   #include "tcg/tcg-op.h"
> diff --git a/target/s390x/vec_fpu_helper.c b/target/s390x/tcg/vec_fpu_helper.c
> similarity index 99%
> rename from target/s390x/vec_fpu_helper.c
> rename to target/s390x/tcg/vec_fpu_helper.c
> index c1564e819b..850fac721e 100644
> --- a/target/s390x/vec_fpu_helper.c
> +++ b/target/s390x/tcg/vec_fpu_helper.c
> @@ -12,7 +12,7 @@
>   #include "qemu/osdep.h"
>   #include "qemu-common.h"
>   #include "cpu.h"
> -#include "internal.h"
> +#include "s390x-internal.h"
>   #include "vec.h"
>   #include "tcg_s390x.h"
>   #include "tcg/tcg-gvec-desc.h"
> diff --git a/target/s390x/vec_helper.c b/target/s390x/tcg/vec_helper.c
> similarity index 99%
> rename from target/s390x/vec_helper.c
> rename to target/s390x/tcg/vec_helper.c
> index 986e7cc825..ddd0a8be5b 100644
> --- a/target/s390x/vec_helper.c
> +++ b/target/s390x/tcg/vec_helper.c
> @@ -11,7 +11,7 @@
>    */
>   #include "qemu/osdep.h"
>   #include "cpu.h"
> -#include "internal.h"
> +#include "s390x-internal.h"
>   #include "vec.h"
>   #include "tcg/tcg.h"
>   #include "tcg/tcg-gvec-desc.h"
> diff --git a/target/s390x/vec_int_helper.c b/target/s390x/tcg/vec_int_helper.c
> similarity index 100%
> rename from target/s390x/vec_int_helper.c
> rename to target/s390x/tcg/vec_int_helper.c
> diff --git a/target/s390x/vec_string_helper.c b/target/s390x/tcg/vec_string_helper.c
> similarity index 99%
> rename from target/s390x/vec_string_helper.c
> rename to target/s390x/tcg/vec_string_helper.c
> index c516c0ceeb..ac315eb095 100644
> --- a/target/s390x/vec_string_helper.c
> +++ b/target/s390x/tcg/vec_string_helper.c
> @@ -12,7 +12,7 @@
>   #include "qemu/osdep.h"
>   #include "qemu-common.h"
>   #include "cpu.h"
> -#include "internal.h"
> +#include "s390x-internal.h"
>   #include "vec.h"
>   #include "tcg/tcg.h"
>   #include "tcg/tcg-gvec-desc.h"
> diff --git a/target/s390x/translate_vx.c.inc b/target/s390x/tcg/translate_vx.c.inc
> similarity index 100%
> rename from target/s390x/translate_vx.c.inc
> rename to target/s390x/tcg/translate_vx.c.inc
> diff --git a/target/s390x/meson.build b/target/s390x/meson.build
> index a5e1ded93f..60d7f1b908 100644
> --- a/target/s390x/meson.build
> +++ b/target/s390x/meson.build
> @@ -8,21 +8,6 @@ s390x_ss.add(files(
>     'interrupt.c',
>   ))
>   
> -s390x_ss.add(when: 'CONFIG_TCG', if_true: files(
> -  'cc_helper.c',
> -  'crypto_helper.c',
> -  'excp_helper.c',
> -  'fpu_helper.c',
> -  'int_helper.c',
> -  'mem_helper.c',
> -  'misc_helper.c',
> -  'translate.c',
> -  'vec_fpu_helper.c',
> -  'vec_helper.c',
> -  'vec_int_helper.c',
> -  'vec_string_helper.c',
> -))
> -
>   s390x_ss.add(when: 'CONFIG_KVM', if_true: files('kvm.c'), if_false: files('kvm-stub.c'))
>   
>   gen_features = executable('gen-features', 'gen-features.c', native: true,
> @@ -60,6 +45,8 @@ endif
>   
>   s390x_user_ss = ss.source_set()
>   
> +subdir('tcg')
> +
>   target_arch += {'s390x': s390x_ss}
>   target_softmmu_arch += {'s390x': s390x_softmmu_ss}
>   target_user_arch += {'s390x': s390x_user_ss}
> diff --git a/target/s390x/insn-data.def b/target/s390x/tcg/insn-data.def
> similarity index 100%
> rename from target/s390x/insn-data.def
> rename to target/s390x/tcg/insn-data.def
> diff --git a/target/s390x/insn-format.def b/target/s390x/tcg/insn-format.def
> similarity index 100%
> rename from target/s390x/insn-format.def
> rename to target/s390x/tcg/insn-format.def
> diff --git a/target/s390x/tcg/meson.build b/target/s390x/tcg/meson.build
> new file mode 100644
> index 0000000000..ee4e8fec77
> --- /dev/null
> +++ b/target/s390x/tcg/meson.build
> @@ -0,0 +1,14 @@
> +s390x_ss.add(when: 'CONFIG_TCG', if_true: files(
> +  'cc_helper.c',
> +  'crypto_helper.c',
> +  'excp_helper.c',
> +  'fpu_helper.c',
> +  'int_helper.c',
> +  'mem_helper.c',
> +  'misc_helper.c',
> +  'translate.c',
> +  'vec_fpu_helper.c',
> +  'vec_helper.c',
> +  'vec_int_helper.c',
> +  'vec_string_helper.c',
> +))
> 

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


