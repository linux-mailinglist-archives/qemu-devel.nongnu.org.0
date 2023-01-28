Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 100B267F360
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 01:56:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLZUc-0008HK-Un; Fri, 27 Jan 2023 19:54:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLZUb-0008Gm-61
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 19:54:53 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLZUZ-0003nK-0q
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 19:54:52 -0500
Received: by mail-pl1-x634.google.com with SMTP id jm10so6588732plb.13
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 16:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6utUKMPF8zj/VdvWgeC7CFrw40S2dxRjRICjK5XCsio=;
 b=iaTZj5tfOCCtvqGodDIdyRxa7E7NSL6QRxb/70idx5ERpzLrWiK6bq0hiPWEroXxUd
 8qR92aLVU6kLNxtK7hNCuu85YpdRl5yYGzqj53ml1Lpf9dRpUY+UpaccNz3byhrN4BMK
 /tXRi+yIqA3g4NBd1zHVsbwKZUp6/Pr0NUyz4eVg+dFuY6rTo++CalLlfA+oaGi5rD9B
 4eVt80wL7dn5g8xFPZW4QHnAvVVDaK9tASabRkRHuGb0+M4NSi0xZQK+bOZITiHuIKh8
 nnBh9lY3OupuzoP0Rjr9MbolStSlEx9tAeL1S8L0wWDOdru9/6ToRbE+JFdhFUN8daww
 D/tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6utUKMPF8zj/VdvWgeC7CFrw40S2dxRjRICjK5XCsio=;
 b=cydwYNMvYwqt9AAPNPliJHpmfJjTTOi7gfm3PAp3Tov+tmP/Vq23d9daKPi1CsBFtl
 FKvadUPkidKzM1CWKiC7ID73lHv2/RenXHPqLd2YqU70QeMCBBOQ1PfoWzED6mt3OP78
 SdgXYpZHY85e05p+IbLtMf7PrakfE+n3d9yVBy1MDCc4qdXyyBC4dIt4TiU/eqEPWNqh
 HLsShQqM/4nDb8/q1Ql0xCJ6uvnK2MVmJs4uof6PkWKrrYg4iENb9cb3imdO+j4WZHGb
 /POPye1+2a0tDO/1bqIio1biWyRVbheLd912zAfw83/sSNiRiZTyPpw98eySqYyYbcNy
 XRJA==
X-Gm-Message-State: AO0yUKVLPKA4ioMr9s/Cd05eXi4IRou8OJMcU4287K6FQXFOrc/F6tbe
 ZDiP6c38KsF1UNhqN/yUduVLng==
X-Google-Smtp-Source: AK7set8fL60oz5b8/GLF2k+NKeHLPR/lt9JWlgzyeLcVnqT6ZCtFQXy7DVIyQkoYF9/oxJhmTMoOiw==
X-Received: by 2002:a17:90a:347:b0:229:f4f3:e904 with SMTP id
 7-20020a17090a034700b00229f4f3e904mr538776pjf.11.1674867289420; 
 Fri, 27 Jan 2023 16:54:49 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 c4-20020a17090a558400b0022bfbb26bbcsm3341295pji.0.2023.01.27.16.54.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 16:54:48 -0800 (PST)
Message-ID: <1381246a-e2b7-2810-8a4a-c1a6d6e9c853@linaro.org>
Date: Fri, 27 Jan 2023 14:54:44 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 16/16] target/arm/kvm-rme: Disable readonly mappings
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, alex.bennee@linaro.org
References: <20230127150727.612594-1-jean-philippe@linaro.org>
 <20230127150727.612594-17-jean-philippe@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127150727.612594-17-jean-philippe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 1/27/23 05:07, Jean-Philippe Brucker wrote:
> KVM does not support creating read-only mappings for realms at the
> moment. Add an arch helper to detect whether read-only mappings are
> supported.
> 
> Device ROM and flash normally use read-only mappings. Device ROM seems
> limited to legacy use and does not need to be trusted by the guest, so
> trapping reads should be fine. Flash on the other hand, is used for the
> firmware and needs to be both executable and measured. It may be
> necessary to replace flash with RAM in order to run firmwares like edk2
> in realms.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>   include/sysemu/kvm.h | 2 ++
>   accel/kvm/kvm-all.c  | 8 +++++++-
>   target/arm/kvm-rme.c | 9 +++++++++
>   3 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
> index e9a97eda8c..8d467c76c6 100644
> --- a/include/sysemu/kvm.h
> +++ b/include/sysemu/kvm.h
> @@ -581,5 +581,7 @@ bool kvm_arch_cpu_check_are_resettable(void);
>   
>   bool kvm_dirty_ring_enabled(void);
>   
> +bool kvm_arch_readonly_mem_allowed(KVMState *s);
> +
>   uint32_t kvm_dirty_ring_size(void);
>   #endif
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index f99b0becd8..56cdd2e9e9 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -2267,6 +2267,11 @@ bool kvm_dirty_ring_enabled(void)
>       return kvm_state->kvm_dirty_ring_size ? true : false;
>   }
>   
> +bool __attribute__((weak)) kvm_arch_readonly_mem_allowed(KVMState *s)
> +{
> +    return true;
> +}

Not a fan of the weak.  Just populate this like kvm_arch_cpu_check_are_resettable.


r~

