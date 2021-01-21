Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8380F2FE3F0
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 08:29:22 +0100 (CET)
Received: from localhost ([::1]:52216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2UPB-00005Q-Kv
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 02:29:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2UMk-0007WF-1z
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 02:26:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2UMf-0005lg-SQ
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 02:26:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611214004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JnQzzTKo0kmTbWYCcIrvXcPLE01L2HX1dsv9tBCP4uk=;
 b=AaVdGf3Im1lxyCvePz6m9cyIHnWEWN1+VzGNWohEsQE+j8+Z8CQ2yXGBxDtGpVCiStPrGV
 uoJEodHEu+616OdOztbSqlaMJMtFfcW0E8I/O6czFSl2DXTeRIoTXY/evqTnv9e2rzZu75
 ldWDw3//X7B4JnCiqMh2ryKtWX9FwEs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-huITzzgkPA-4-R_0gBewnQ-1; Thu, 21 Jan 2021 02:26:41 -0500
X-MC-Unique: huITzzgkPA-4-R_0gBewnQ-1
Received: by mail-ed1-f72.google.com with SMTP id u17so645523edi.18
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 23:26:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JnQzzTKo0kmTbWYCcIrvXcPLE01L2HX1dsv9tBCP4uk=;
 b=McQz+vvgBVbv2Iq78V04pRWvL/bQmhLMklQMFxAZPzoLPUXoNymRWNtnMIS9E4dgCm
 oWpHe2byB0ZEKWoLHyFxJ+4VBuva/fTGHATU83JvjYD9bYbjzVYp34NXKp1Ca6SiFcij
 jxBhstvS4clxj9333QYS5GaBl23jvBsEeUquG334QVojEQlQrIMy3+KFn8OD6UVp4Y9O
 sGd7ki0lGyhWQMhg/rDD7Hl3Bf8lqc/kEIuKC7+eOmV/uTlOiQpJ4a5uA/kyrk2vkMsJ
 1zM5ctONR7KzE6cwzOtvqILNz5gqPvQiai6FE7BSJHKLpjikfYvgjhPMeK+fVR/XPl7n
 Flmg==
X-Gm-Message-State: AOAM5307qOtwGwr3O6YKegHDIZIJA+CYyqRVTYiuPFO35HXrzftc/RFe
 fEYFPl93r9szSvxhGhOBo2ZX/8uUh5XXRGaNsuAxbfid50FOw55VZmlW9FxaobNHsVgeYb+ApfQ
 y8ufCQs+0gPBihEI=
X-Received: by 2002:a50:cf02:: with SMTP id c2mr9929120edk.333.1611213998177; 
 Wed, 20 Jan 2021 23:26:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwPRl1SXPsnUtJkRVipnX4TULbHYT2RENZQ8mRpbBG+q0uotWxRYKAMbR8py5+Efs/6Ap1bSA==
X-Received: by 2002:a50:cf02:: with SMTP id c2mr9929100edk.333.1611213997991; 
 Wed, 20 Jan 2021 23:26:37 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id m26sm1840826ejr.54.2021.01.20.23.26.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jan 2021 23:26:37 -0800 (PST)
Subject: Re: [PATCH v6 03/11] hvf: Move common code out
To: Alexander Graf <agraf@csgraf.de>, qemu-devel@nongnu.org
References: <20210120224444.71840-1-agraf@csgraf.de>
 <20210120224444.71840-4-agraf@csgraf.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e1054d19-f047-bbaf-0d4d-20b8df97db44@redhat.com>
Date: Thu, 21 Jan 2021 08:26:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210120224444.71840-4-agraf@csgraf.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alexander,

On 1/20/21 11:44 PM, Alexander Graf wrote:
> Until now, Hypervisor.framework has only been available on x86_64 systems.
> With Apple Silicon shipping now, it extends its reach to aarch64. To
> prepare for support for multiple architectures, let's move common code out
> into its own accel directory.
> 
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
> Tested-by: Roman Bolshakov <r.bolshakov@yadro.com>
> 
> ---
> 
> v3 -> v4:
> 
>   - Use hv.h instead of Hypervisor.h for 10.15 compat
>   - Remove manual inclusion of Hypervisor.h in common .c files
> ---
>  MAINTAINERS                 |   8 +
>  accel/hvf/hvf-all.c         |  54 +++++
>  accel/hvf/hvf-cpus.c        | 462 ++++++++++++++++++++++++++++++++++++
>  accel/hvf/meson.build       |   7 +
>  accel/meson.build           |   1 +
>  include/sysemu/hvf_int.h    |  54 +++++
>  target/i386/hvf/hvf-cpus.c  | 131 ----------
>  target/i386/hvf/hvf-cpus.h  |  25 --
>  target/i386/hvf/hvf-i386.h  |  33 +--
>  target/i386/hvf/hvf.c       | 360 +---------------------------
>  target/i386/hvf/meson.build |   1 -
>  target/i386/hvf/x86hvf.c    |  11 +-
>  target/i386/hvf/x86hvf.h    |   2 -
>  13 files changed, 596 insertions(+), 553 deletions(-)
>  create mode 100644 accel/hvf/hvf-all.c
>  create mode 100644 accel/hvf/hvf-cpus.c
>  create mode 100644 accel/hvf/meson.build
>  create mode 100644 include/sysemu/hvf_int.h
>  delete mode 100644 target/i386/hvf/hvf-cpus.c
>  delete mode 100644 target/i386/hvf/hvf-cpus.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3216387521..e589ec02e0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -448,7 +448,15 @@ M: Roman Bolshakov <r.bolshakov@yadro.com>
>  W: https://wiki.qemu.org/Features/HVF
>  S: Maintained
>  F: target/i386/hvf/
> +
> +HVF
> +M: Cameron Esfahani <dirty@apple.com>
> +M: Roman Bolshakov <r.bolshakov@yadro.com>
> +W: https://wiki.qemu.org/Features/HVF
> +S: Maintained
> +F: accel/hvf/
>  F: include/sysemu/hvf.h
> +F: include/sysemu/hvf_int.h
>  
>  WHPX CPUs
>  M: Sunil Muthuswamy <sunilmut@microsoft.com>
> diff --git a/accel/hvf/hvf-all.c b/accel/hvf/hvf-all.c
> new file mode 100644
> index 0000000000..5b415eb0ed
> --- /dev/null
> +++ b/accel/hvf/hvf-all.c
> @@ -0,0 +1,54 @@
> +/*
> + * QEMU Hypervisor.framework support
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2.  See
> + * the COPYING file in the top-level directory.
> + *
> + * Contributions after 2012-01-13 are licensed under the terms of the
> + * GNU GPL, version 2 or (at your option) any later version.

Maybe start with GPLv2+ directly?

> diff --git a/include/sysemu/hvf_int.h b/include/sysemu/hvf_int.h
> new file mode 100644
> index 0000000000..69de46db7d
> --- /dev/null
> +++ b/include/sysemu/hvf_int.h
> @@ -0,0 +1,54 @@
> +/*
> + * QEMU Hypervisor.framework (HVF) support
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + *
> + */
> +
> +/* header to be included in HVF-specific code */

Can we have this header local to accel/hvf/ ?

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> +
> +#ifndef HVF_INT_H
> +#define HVF_INT_H
> +
> +#include <Hypervisor/hv.h>
> +
> +/* hvf_slot flags */
> +#define HVF_SLOT_LOG (1 << 0)
> +
> +typedef struct hvf_slot {
> +    uint64_t start;
> +    uint64_t size;
> +    uint8_t *mem;
> +    int slot_id;
> +    uint32_t flags;
> +    MemoryRegion *region;
> +} hvf_slot;
> +
> +typedef struct hvf_vcpu_caps {
> +    uint64_t vmx_cap_pinbased;
> +    uint64_t vmx_cap_procbased;
> +    uint64_t vmx_cap_procbased2;
> +    uint64_t vmx_cap_entry;
> +    uint64_t vmx_cap_exit;
> +    uint64_t vmx_cap_preemption_timer;
> +} hvf_vcpu_caps;
> +
> +struct HVFState {
> +    AccelState parent;
> +    hvf_slot slots[32];
> +    int num_slots;
> +
> +    hvf_vcpu_caps *hvf_caps;
> +};
> +extern HVFState *hvf_state;
> +
> +void assert_hvf_ok(hv_return_t ret);
> +int hvf_get_registers(CPUState *cpu);
> +int hvf_put_registers(CPUState *cpu);
> +int hvf_arch_init_vcpu(CPUState *cpu);
> +void hvf_arch_vcpu_destroy(CPUState *cpu);
> +int hvf_vcpu_exec(CPUState *cpu);
> +hvf_slot *hvf_find_overlap_slot(uint64_t, uint64_t);
> +
> +#endif


