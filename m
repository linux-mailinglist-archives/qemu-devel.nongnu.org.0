Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CCF4C8FD4
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 17:13:06 +0100 (CET)
Received: from localhost ([::1]:38152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP57Z-0007Pn-HS
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 11:13:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nP538-0003Qa-1r
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 11:08:31 -0500
Received: from [2607:f8b0:4864:20::1133] (port=42843
 helo=mail-yw1-x1133.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nP536-0007xR-FO
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 11:08:29 -0500
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-2dbd97f9bfcso31886587b3.9
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 08:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XBlSZMHPrBz8nzQJopY9dlxE7HXyvMAdlZ77hEr7jzc=;
 b=lVSut1NZ1QZ9f+A2RdeLvEWRCcUd4Hfi9eDJVgKAuT8uiLTprIa4s/7mEdhiiVsu92
 a6QcIw0J3nohsvSrr+hxIjgT8U+USAPbhy6lRIPWMapCg12ofwk8N+0Fua4/j/siLile
 koRsPP7/7iLmrNzKo6b+67bsHEawD6ECoW98Hfno5Vzb73xda2m1H99/tHvrFT5BWK+O
 vK7RBTmX+XITSYqpXHKMctJWx/FXToQrBs2cVwJhxd6UTmG2Ix+VxR7fymmoVLpY449k
 VmE2OZjmIwB8d/pXiMI/Ym+isnh7UpGhMtPuHPC+IJUWfjXuWbAP01uwwxedk22z110p
 uSIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XBlSZMHPrBz8nzQJopY9dlxE7HXyvMAdlZ77hEr7jzc=;
 b=umFYXbZzSkkXD/WNDXAtyq3WvBEMhNxEndSL5dQPl3dpJ2fuRtDG6uKASyInzWswfh
 HVf1/H3zpbcBQR0gChA7n4bACeL+hkD/nQbxBZDY5aS17w6+tIuHHol8Cqj02KGQ9NYw
 Hm94PXacGFhiPT8/1HTygpATD3OabxqBJLIyXB7AWDZ9NRJQVlKSaf/MOLGQCAlLvpL9
 Q9KaswwzdujH4kb0FvoCabuBOTEckMYoa2iAN/gj4MFNtv/YM760jMVO3o7HPCiilhwZ
 CIAhuwVZ4bChhsGpGYpenYqVnehmmUoyBn20xweHab/wvNuRb+QwJSXJeInpuTBgrE9W
 29/g==
X-Gm-Message-State: AOAM531DbFG5PwSXsir0zZkxQ0nyNilELrbl8X33HHIhVTci6JXniS0r
 KDdTPfpSmZYMTuvHKX3+sz3ZX4oIMluA+uDPvJtDNA==
X-Google-Smtp-Source: ABdhPJy3NWL5T7RqBHlfGnSs91lyvALTsP2ALs2FQ2lptasRHVsTI/KH1hlXFzqae6Uo6uBpcmqi26MdW0hVkmmxOSk=
X-Received: by 2002:a81:b49:0:b0:2db:f472:dfca with SMTP id
 70-20020a810b49000000b002dbf472dfcamr1952169ywl.455.1646150906563; Tue, 01
 Mar 2022 08:08:26 -0800 (PST)
MIME-Version: 1.0
References: <20220223223137.114264-1-richard.henderson@linaro.org>
In-Reply-To: <20220223223137.114264-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Mar 2022 16:08:15 +0000
Message-ID: <CAFEAcA84cFnF9EygS6Xun3VorjeGKf+Lw7zRdkBbcRp6YT_OeQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/17] target/arm: Implement LVA, LPA, LPA2 features
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1133
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 23 Feb 2022 at 22:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Changes for v3:
>   * Update emulation.rst.
>   * Split out separate update to ID_AA64MMFR0.
>   * Hack for avocado.
>
> If the avocado hack isn't acceptable, perhaps just drop the
> last two patches for now?

I think that given that there are Linux kernels out there
that won't boot if LPA2 is enabled, we should probably have
a -cpu command line option to disable it. Otherwise we might
get a bunch of "why did my kernel stop booting" bug reports.

thanks
-- PMM

