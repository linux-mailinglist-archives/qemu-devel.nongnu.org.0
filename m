Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53ACD4C35FB
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 20:38:25 +0100 (CET)
Received: from localhost ([::1]:55520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNJwV-0003Mn-EV
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 14:38:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNJq6-0006VU-5R
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 14:31:47 -0500
Received: from [2607:f8b0:4864:20::102b] (port=35486
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNJq3-0003aH-Li
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 14:31:45 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 v5-20020a17090ac90500b001bc40b548f9so6568649pjt.0
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 11:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=bVPk/Lq1GLU+69eOfHyd7jKuisIcw+w8uQ4Os2s21Cw=;
 b=zOxqKs9vNvMed2KogB0RDruPrT4+3JpFRT/ziQp8ixAc1bFwYToeY9YfVaqMGED31R
 f6fOKWGpdN5rO5dowzRByNy6Yt9fWpYOzK1tkaU66bG3UUGy5VTgm3jOxjOFHoSr9Fqr
 33dHb8s/5+fUsWhKxp8IpzYWd7eC6i7lb6DtPICaT5TJyotKCoE6KcVJ5Iw7zjxyvXyM
 WhFsvKt39mAeOYS9LV4VIpO5RX85rerODKr+mQFJgh9iQp5Ty4ucqFGCjwc0DkuVEPuR
 ALGC1ZM4XIuiaiMphkjo59Ndew0tB4m0IPhLFkWPvhM6k9nZrJyySO5I7+702HoW/M0U
 da+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bVPk/Lq1GLU+69eOfHyd7jKuisIcw+w8uQ4Os2s21Cw=;
 b=i0SQnLZzrEmjy75Q72fRREW+ehRMs0y9o9z3asfV8wXgXD7lFDEmmGRJjtVrDnSg3K
 YvQYZmF+SDS5unXdoJzLDwYVs1xKVq/CHfwwAcVbp5/w2F7q05qSl4pQaVawuKGLSdgT
 SvUTtdHhAsFlINvdxDg54+SDI/OPSgqjt0buGssyQNchQXs0fwE4Vx5bLd4qhwsenFZO
 FwSjTOO/AgVXn08YH7n5Kg/Xgx1LygqXpRy543KfPW218CLGJeJRBJDvv1nHiamoWHaL
 Ws7RnZMvdOezxCVI5c3JpIViLAKo5O6rUSxYSVCOxkKaxXhvePho4FlB3N+GgwnhJh4n
 UeSA==
X-Gm-Message-State: AOAM530UPFC2J22LiBxU8dLqeCr1CzujBV2k9xM7rYrZvkMrytkskq8g
 iatWMG8FecZCrqkGaku7RrzS/Q==
X-Google-Smtp-Source: ABdhPJyKIemhqeDTU9GHKDFCvwQzuoilNGJUoi69oUptqLd9FMeGpn5MQuQAxAm5Adlzrc5Z9GMKcg==
X-Received: by 2002:a17:903:3092:b0:14f:9c1c:45a4 with SMTP id
 u18-20020a170903309200b0014f9c1c45a4mr3922640plc.126.1645731101301; 
 Thu, 24 Feb 2022 11:31:41 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 x3-20020a17090ad68300b001b8bcd47c35sm7081380pju.6.2022.02.24.11.31.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 11:31:40 -0800 (PST)
Message-ID: <6af27303-1a30-991e-570f-1d594846738a@linaro.org>
Date: Thu, 24 Feb 2022 09:31:37 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 04/12] compiler.h: replace QEMU_NORETURN with G_NORETURN
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220224183701.608720-1-marcandre.lureau@redhat.com>
 <20220224183701.608720-5-marcandre.lureau@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220224183701.608720-5-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, f4bug@amsat.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/22 08:36, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> G_NORETURN was introduced in glib 2.68, fallback to G_GNUC_NORETURN in
> glib-compat.
> 
> Note that this attribute must be placed before the function declaration
> (bringing a bit of consistency in qemu codebase usage).
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>

For C11, G_NORETURN is a wrapper for _Noreturn.
Since we're using C11, we should just use _Noreturn.

>   void xtensa_cpu_do_unaligned_access(CPUState *cpu, vaddr addr,
>                                       MMUAccessType access_type, int mmu_idx,
> -                                    uintptr_t retaddr) QEMU_NORETURN;
> +                                    uintptr_t retaddr) G_NORETURN;

Incorrect placement.  I didn't scan the whole patch; I assume that using _Noreturn will 
flag this up as an error.

> -static void QEMU_NORETURN dump_core_and_abort(int target_sig)
> +G_NORETURN static void dump_core_and_abort(int target_sig)

I guess this can go either place, but I think I prefer the scope specifier first.


r~

