Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC4548AD53
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 13:07:36 +0100 (CET)
Received: from localhost ([::1]:47130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Fw6-0000Lo-U4
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 07:07:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7Fpw-0007g4-Hp
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 07:01:12 -0500
Received: from [2a00:1450:4864:20::32d] (port=54839
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7Fpr-0002UC-A1
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 07:01:12 -0500
Received: by mail-wm1-x32d.google.com with SMTP id p18so4059161wmg.4
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 04:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3CTrfCnY9RYH2PX6642/qtaxiVQJFzz9J2Fe1Wlpf10=;
 b=lQmjJFpFrlekKoHVypqLlFuOLF72xQFBuFXnvQd59aiXwLcgAOZXQvayq/Jqzq3Sxp
 gt3sg7pv0IQf7SOcvgduqUErwZFBOtQR8gWHfdBV51WWurb26Nu1malcc973dEbMjTIW
 eVj5SBWZAL8uF4jjo5DqdHDYnj27jBLBHwf8jDJhpyIs/WM35ErwWiCwdPwdDMNpS/RY
 upWhseUen8uJc+k5uYiLmYwZPcnTWrhdSGEsWWNCIoCvHp0uR3u69OxSRpP4IbVP5gIY
 eHpwQjTaHg84NgcQR4awabjNhty6O1sWSdohaCM/F2GkVOgzsJhCVEJ6KKLoTp1y2pJR
 /njA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3CTrfCnY9RYH2PX6642/qtaxiVQJFzz9J2Fe1Wlpf10=;
 b=6Bj4BeLuE1fLi5EcQK5hE37wOzKtrauVGIkoN7Kf9jktmrG3mFVQqrZT0glPsKpFxr
 XQgsguxeZ+DOZU7q4L4Xf9yCsi6jWTL+MH0FKvVFxd+dwtvEG14AFJS9OI1qknueMRvs
 +Str77UuI/zf3RSY8s9dkqw/oocvCWrduNRaPMahStsI3nf3caba1qQjlyf2Y/DeK250
 nxbN23qLGvWP8EZEqtCWIk7kM72nR6/etEaZuv/ho3UqZz1RkIntOoTw3IkiALloavDM
 Ol9GpubN9EuoXU43yz8q0VYCa/G2v2YcrCXAk2nHq4YQgDrUn6vbEJ9JdJy32JeavWF0
 U+5g==
X-Gm-Message-State: AOAM530F2l2M/hDZbm6XkIb3tWxxI1cb7dnyZUQfxHG4VM5jxZncoLlE
 Pv0nbd1L52Zb2MB86unXxOHHmsrsLcU2xT02ZgYf/A==
X-Google-Smtp-Source: ABdhPJyidfAa4bGIMiqvNpIBiWetHid3ge7Al3L7dvCjzGGfEvL1G87Iwsd2RFfjjA51V4nxMz8KFt36WcXltswPeOA=
X-Received: by 2002:a05:600c:154e:: with SMTP id
 f14mr2296613wmg.126.1641902465913; 
 Tue, 11 Jan 2022 04:01:05 -0800 (PST)
MIME-Version: 1.0
References: <20220108063313.477784-1-richard.henderson@linaro.org>
 <20220108063313.477784-7-richard.henderson@linaro.org>
In-Reply-To: <20220108063313.477784-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Jan 2022 12:00:54 +0000
Message-ID: <CAFEAcA9h4iWw5YfVsC0s0x--KuBdbObwENQwVfZRGrE+vR_13A@mail.gmail.com>
Subject: Re: [PATCH v4 6/7] tcg/arm: Reserve a register for guest_base
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 8 Jan 2022 at 06:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Reserve a register for the guest_base using aarch64 for reference.
> By doing so, we do not have to recompute it for every memory load.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/arm/tcg-target.c.inc | 39 ++++++++++++++++++++++++++++-----------
>  1 file changed, 28 insertions(+), 11 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

