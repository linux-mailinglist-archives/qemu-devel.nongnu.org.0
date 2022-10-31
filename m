Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B97B613342
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 11:09:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opRhW-0006SB-Hm; Mon, 31 Oct 2022 06:07:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1opRhM-0006RV-1i
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 06:07:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1opRhK-00025V-Do
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 06:07:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667210832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MIcDnkPRgzfuyMfNQWnupubZdfAmOZ6YuhYAcQlSiO8=;
 b=XdTN/bXFMBnMImOmuNhhSi9xoYQkz9L/715LYD4ienQgVqgTaStf4Ile7iZjSPGymSzno6
 Xw7VooBgQMf4awg6zIUxjX5ugqKarFc9t6Kcyyldh+DV2NcRT9H6UO9OEDI6O5misn6bGW
 N4lOgxyeL/IYNZvPN7DLMzFnLW18L/c=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-47-SmXFnBIyN6u-a7RPC_V5Nw-1; Mon, 31 Oct 2022 06:07:11 -0400
X-MC-Unique: SmXFnBIyN6u-a7RPC_V5Nw-1
Received: by mail-qk1-f200.google.com with SMTP id
 az31-20020a05620a171f00b006fa2cc1b0bfso1913098qkb.23
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 03:07:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MIcDnkPRgzfuyMfNQWnupubZdfAmOZ6YuhYAcQlSiO8=;
 b=2imK/qx0vBVKmfowdAlg4E8vGlgrotTMrHcxUDOI4BMGJJ7mED5uUPy7TpYUQ48YHP
 mZvblN7hChW4HplV/EZTYiTxDCb7PkblarkzAiMJfQ1WLOpaCcojVnCE8vF2t1qddOG2
 5O9ZdV+ROzdwu5JNhQ/kJlNKgEr4ZUBhfs/IeHEjeEUm2z6/oE3e0Ap+nGX1EFx0ejcY
 qDWQdQkyGnTjguGeHGJDa9T3Bg5S3M397wD+1Xo7NxxllBDccaTPHEYw7gU2FDBdrXXt
 zpiBeOzQTyHC0Bk5msAVk+qbu4w7hn3wFZul6F1yWWUdgN38jbBIJzGHMuSGNnpMY4Ze
 zOOw==
X-Gm-Message-State: ACrzQf2q+vJaooTmqa/NHHgJSuyf8cTknVeFdfxq87YuQpcb7G0fYyvy
 Gh4kL78xs+Ts+JvalWr4KRu13awUb0E5BVz3w/dHYvZS4VHBboluTZcBVVcJJQzcKVmz4x7GTek
 fNTAeCbXO9YIRDXJLVFLxBL7bXJoryk4LB8LJupRHSRU3YCXEClolHvIAT9eYkrw7zo8=
X-Received: by 2002:ac8:5689:0:b0:3a5:258b:1046 with SMTP id
 h9-20020ac85689000000b003a5258b1046mr3478451qta.73.1667210830905; 
 Mon, 31 Oct 2022 03:07:10 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7J0DLX1cLehE7WUPzi9LQDGhR3dssl09BNpwvT3QtVZmraBgtycypPd4DtnNAu4rPb+DNEFA==
X-Received: by 2002:ac8:5689:0:b0:3a5:258b:1046 with SMTP id
 h9-20020ac85689000000b003a5258b1046mr3478432qta.73.1667210830561; 
 Mon, 31 Oct 2022 03:07:10 -0700 (PDT)
Received: from ovpn-194-149.brq.redhat.com (nat-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id
 b24-20020ac84f18000000b0035badb499c7sm3423507qte.21.2022.10.31.03.07.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 03:07:10 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Liang Yan <lyan@digitalocean.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Yang Zhong <yang.zhong@intel.com>, Jing
 Liu <jing2.liu@intel.com>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH] target/i386/cpu: disable PERFCORE for AMD when cpu.pmu
 is off
In-Reply-To: <20221028150243.34514-1-lyan@digtalocean.com>
References: <20221028150243.34514-1-lyan@digtalocean.com>
Date: Mon, 31 Oct 2022 11:07:07 +0100
Message-ID: <87tu3ks3w4.fsf@ovpn-194-149.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.055,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Liang Yan <lyan@digitalocean.com> writes:

> With cpu.pmu=off, perfctr_core could still be seen in an AMD guest cpuid.
> By further digging, I found cpu.perfctr_core did the trick. However,
> considering the 'enable_pmu' in KVM could work on both Intel and AMD,
> we may add AMD PMU control under 'enabe_pmu' in QEMU too.
>
> This change will overide the property 'perfctr_ctr' and change the AMD PMU
> to off by default.
>
> Signed-off-by: Liang Yan <lyan@digtalocean.com>
> ---
>  target/i386/cpu.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 22b681ca37..edf5413c90 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -5706,6 +5706,10 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>                  *ecx |= 1 << 1;    /* CmpLegacy bit */
>              }
>          }
> +
> +        if (!cpu->enable_pmu) {
> +            *ecx &= ~CPUID_EXT3_PERFCORE;
> +        }
>          break;
>      case 0x80000002:
>      case 0x80000003:

I may be missing something but my first impression is that this will
make CPUID_EXT3_PERFCORE bit disappear when a !enable_pmu VM is migrated
from an old QEMU (pre-patch) to a new one. If so, then additional
precautions should be taking against that (e.g. tying the change to
CPU/machine model versions, for example).

-- 
Vitaly


