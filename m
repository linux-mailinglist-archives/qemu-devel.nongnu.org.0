Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15869461308
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 12:03:33 +0100 (CET)
Received: from localhost ([::1]:54586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mreRX-0003Un-Mo
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 06:03:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mrePo-0002nG-GF
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 06:01:44 -0500
Received: from [2a00:1450:4864:20::430] (port=45941
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mrePm-0008Dg-Gb
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 06:01:44 -0500
Received: by mail-wr1-x430.google.com with SMTP id o13so35732122wrs.12
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 03:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Sbtw2mWpxy+bZDm245niaW6/zc1hiOKoZljjl8ATvY4=;
 b=hg18W78FGorooOvuSZXtLyqh6fOYO3x6juKFfMey46DVjMtku3ue/sNm81xhrWXVpz
 S+w9JnuFFnj7ZhNnB0CbIliJRRaoYe5WwtP1moXgiTC64K1CQDDI/I84/pi3fUR4TMEK
 wEvvyyXq3e+X7FfvdPgCnOJi/TYK/1mMkkEnLPQlLljs8EY4Hm2LYrwq88gDlHNRw8E5
 Wfb533dtu9hXfr2d3+U5mrXXT4BMxhG9CM86ajA+xkDaiJvG1kjDZoJxZDqlG/mk9VF1
 f+xLXTQk4j39eA2iL5VA5qzUs8kHiu0ma9muipZP0Z/66NrJNK8T/MaUCkyUQi3I1OIg
 KpmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sbtw2mWpxy+bZDm245niaW6/zc1hiOKoZljjl8ATvY4=;
 b=cK0CE/oF2SXmb0RwVK0XN1qLqQZKiU6HishWVBdAR9NYLuvY7zgVSLai8rVYs6C96f
 S/2yQBG4NNkkEUFCDF0Ls5Z0M3oTXqQYW0Uyd9tDZPHKIvtohaVj298J+Jd99MfxPkSP
 nFeF3dd3+ES7r77BN5/9ByrFoelTD8wti8AyM0vpIer/HC/M0QMiKa5qVyTjN2ofRIqb
 b75soM8vtXuXIoS9WbC4VZBTwgmAc1OrNZIwuXlw/LD6esul7Mkl3kNx8U38F8xDWVgD
 UW+OlaTlgnQXZLHdE8i0D+Ivg+9MNhhMqoVSVNpVLZHDxODX+zii1jPJ3X4aksaSR4Jl
 bNfw==
X-Gm-Message-State: AOAM53155Vrv0fyV3VNLTQtbvDVsZj2jO9BPnLwBFkgCurgsppIP4vjY
 CTn/djBAOuhTOmt7HOgoT73DQdfSOswEcJMOukrwQg==
X-Google-Smtp-Source: ABdhPJxq77s7wHVjkTvJFD+Ua7u4K38GAaPeSAVxDhvTHskW+fqy6jMpO1h2tTk562azATzn2m8ABkVr+4w/Lhc7mSc=
X-Received: by 2002:a05:6000:156a:: with SMTP id
 10mr32999323wrz.87.1638183700779; 
 Mon, 29 Nov 2021 03:01:40 -0800 (PST)
MIME-Version: 1.0
References: <20211123173759.1383510-1-richard.henderson@linaro.org>
 <20211123173759.1383510-3-richard.henderson@linaro.org>
In-Reply-To: <20211123173759.1383510-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Nov 2021 11:01:29 +0000
Message-ID: <CAFEAcA-x6Q_mXbFLzr=7ALGkqijj=gM5DRu_TRMAkFSm8XiZGQ@mail.gmail.com>
Subject: Re: [PATCH v6 02/16] linux-user/host/ppc64: Use r11 for
 signal_pending address
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, imp@bsdimp.com, Laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 23 Nov 2021 at 17:40, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We don't need a register that can live across the syscall;
> we only need a register that can live until the syscall.

What about the case where:
 * we execute the sc instruction (r11 trashed)
 * the syscall is one that from the host kernel point of
   view is restartable
 * the kernel arranges to restart the syscall by rewinding the
   PC to point to the start of the 'sc' instruction
 * our rewind_if_in_safe_syscall() rewinds PC further to
   point at safe_syscall_start
 * we want to use r11 again, but it was trashed in step 1
?

Put another way, this patch is effectively a revert of
commit 5d9f3ea081721, which was a fix to an observed bug.

-- PMM

