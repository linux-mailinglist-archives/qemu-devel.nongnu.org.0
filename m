Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B0331CAC8
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 13:59:51 +0100 (CET)
Received: from localhost ([::1]:38066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBzxG-0000xu-4l
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 07:59:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBzvb-0000Fb-Hv
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 07:58:07 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:38630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBzvX-00074D-3d
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 07:58:07 -0500
Received: by mail-ed1-x536.google.com with SMTP id s11so11989994edd.5
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 04:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uGyZosdhuTXTwKk4YoT7A1hmckjpaUYKPqG5nnfYS3w=;
 b=A55qv3DMGnqWs9Q7K0QtGb4LLis3BUigO4HPxz/lM+g7VSCrCgJA6vbIM8XluFi2GK
 jYWhZ1YjIg7wd66LcpURf3PYr60k4lxV/d73lAN97rLuWrGxial4QLHeg7NR9XrV23TB
 4/uJPvn31kTZ3NrmWSvqBXgSGcxVDJOM7kgKcF3Xa2DXYk5O3dSBxBMXKk1T/fcI2Ukf
 rMGi0bFv7MPeyz8xi230hHXt7hbNuVk3uI3aRKJoE1lgiJHFJoOhT51+L5Wvg27A/K6d
 VTJuzSqbpWJuVrKS42+9hd+hPBLjrON1QtMXJbR2hKo7wk6b2/sX06X2A1wZjOvbGFXN
 3C8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uGyZosdhuTXTwKk4YoT7A1hmckjpaUYKPqG5nnfYS3w=;
 b=Ld7sWq19tp/6fiMlB3xmZkOSr/QSHLCVZHcyk47s7L2KK8euz2MaV9xWOei68oaBA8
 qKagL0F958oJKYB7Sa9FHPSrKZW9gJBWFhvhGRAIafuHepmpKWDOVCgi/eNtnoYGOvjJ
 E47ZXlfTywhQJSKWUhopzUainzmGcagOaQdxqHSof6HGNC+etWQRFKb8HSbK7EokKld/
 rGGOscw+4tZ4iUb58dI1xU9cqX4+dzWGdl3Iqt2wqgnx+8ZB+jyGMoCb7FxYEOSIUvuo
 VgLR/uj9FoCsSu2E3zbWgoVYE3LQUspB756DzdQERTf4DF5Cdx/b53FqGlccEDn8yqnu
 SmYA==
X-Gm-Message-State: AOAM533D2KsQfeDhf5diWxHqh+SJSQZi6zTN5nlM1k1byUnAVrIKHpUO
 52v+CniFc/CC6ENZAazUIjeUF49dwRMl7AXXDg2VnQ==
X-Google-Smtp-Source: ABdhPJzYXhFNPO0TUfv2QSnNLoa0kI1X1sY1GwdvlBPZSrgVTjM/2foTS45ZeMsk59E2TOMvGC4sF5RXBvCSNPiwzLo=
X-Received: by 2002:a50:9e01:: with SMTP id z1mr20606605ede.44.1613480281670; 
 Tue, 16 Feb 2021 04:58:01 -0800 (PST)
MIME-Version: 1.0
References: <20210212184902.1251044-1-richard.henderson@linaro.org>
 <20210212184902.1251044-18-richard.henderson@linaro.org>
In-Reply-To: <20210212184902.1251044-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Feb 2021 12:57:50 +0000
Message-ID: <CAFEAcA-vdNDZ4gd329+yYDWHinP6E1HFW36XT8KKWp2egym61w@mail.gmail.com>
Subject: Re: [PATCH v7 17/31] linux-user: Move lock_user et al out of line
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 12 Feb 2021 at 18:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These functions are not small, except for unlock_user
> without debugging enabled.  Move them out of line, and
> add missing braces on the way.
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

>  /* Lock an area of guest memory into the host.  If copy is true then the
>     host area will have the same contents as the guest.  */
> -static inline void *lock_user(int type, abi_ulong guest_addr, long len, int copy)
> -{
> -    if (!access_ok_untagged(type, guest_addr, len)) {
> -        return NULL;
> -    }
> -#ifdef DEBUG_REMAP
> -    {
> -        void *addr;
> -        addr = g_malloc(len);
> -        if (copy)
> -            memcpy(addr, g2h(guest_addr), len);
> -        else
> -            memset(addr, 0, len);
> -        return addr;
> -    }
> -#else
> -    return g2h_untagged(guest_addr);
> -#endif
> -}
> +void *lock_user(int type, abi_ulong guest_addr, long len, int copy);
>
>  /* Unlock an area of guest memory.  The first LEN bytes must be
>     flushed back to guest memory. host_ptr = NULL is explicitly
>     allowed and does nothing. */
> -static inline void unlock_user(void *host_ptr, abi_ulong guest_addr,
> -                               long len)
> -{
> -
>  #ifdef DEBUG_REMAP
> -    if (!host_ptr)
> -        return;
> -    if (host_ptr == g2h_untagged(guest_addr))
> -        return;
> -    if (len > 0)
> -        memcpy(g2h_untagged(guest_addr), host_ptr, len);
> -    g_free(host_ptr);
> +static inline void unlock_user(void *host_ptr, abi_ulong guest_addr, long len)
> +{ }
> +#else
> +void unlock_user(void *host_ptr, abi_ulong guest_addr, long len);
>  #endif

This ifdef is the wrong way around, and causes the series to
fail to compile at this point. It gets silently fixed again
(by changing the ifdef to ifndef) in patch 18.

-- PMM

