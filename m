Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A6B650369
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 18:04:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6x3P-0001GQ-Gw; Sun, 18 Dec 2022 12:02:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6x31-00015L-QH
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 12:02:12 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6x2t-0008M5-Nq
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 12:01:53 -0500
Received: by mail-pg1-x529.google.com with SMTP id s196so4779836pgs.3
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 09:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1L9XZtQHpXLLM9BGbpPibUZtylO9YDyTStXCuMRazcw=;
 b=EzIt/pK/yMs8Mx6s5DqKGjydjlIFWaxs9CBpvJsNGS/FsKtbGyEzrQqYU7Wk68YgfN
 zrNHibsr+hSM4Xg4Q+n/nNFB20t24t8sMm40RfvcVC0hjNvMdh50kLplsAYqhVHkLAsL
 qKPQLL1yqVpz/T+d+T7eLNRpLAdiWvMWdSsizSLIkupSyoHv/mgrbLX+WAPkvYdxYwWX
 DgaL7nhDAzLYZSCJqSbBJqBsmkwyzbCQFCiD90vOt9jv5egI5fx+Act2V4Xt8NDCahyv
 hAJ8CwyfEZ5Mlxkj11cDu0xnkV7Uo/iwCMtUkARfJD47KM1eE+6xxeef6oOtO+zITkbI
 9uIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1L9XZtQHpXLLM9BGbpPibUZtylO9YDyTStXCuMRazcw=;
 b=pVuWGpMAYNgEei/Net3RQRCiVYm11QgoCgc8AxyBpablG5mTvIrM5sPf6T1lc3y6sk
 e/CXxBkhZ9mwl4Om3YSrT6iVilC2jvYhgdlD+bqTyiL1vwLvKOeH6JIpc3rd0W3QLIsx
 bZ3yoSIiHzKg/Tq8do7lTZa7uPE3xjCQJS5gO60AXWYUDPtf3fhXvdcAMaFDKWcp//Hs
 b/wAttHh2auHlsZm2ydg2gK6JX3yjfbT3yFT11lxKK8AXOL5wYVgrvXhXcKH+PSvdkUl
 WGJ3PPPpLtiHMotplaCNjp/V2bGbrIjthRjTHVeXbFSyLj2HIX2fsX90+Sxp0XOyGoin
 WNbA==
X-Gm-Message-State: ANoB5pmxM+GBtVJJBsYtT+paHxDg3icYMqXwvBFPgqSh915hMzBu7SzS
 ZSEigA+A2zrVNVdD5RzoLgNdLnMUkalRYaLq805m2eqiDmhyIA==
X-Google-Smtp-Source: AA0mqf5GKRp8Gq0DqLzfA/0YWcABAtMzKR8vbfN5nshLCl6N49lxCbcjpXU0tLKUKkpj3dDrPqkXPaD1sx9LQ62CiGo=
X-Received: by 2002:a65:45c5:0:b0:46b:2753:2a60 with SMTP id
 m5-20020a6545c5000000b0046b27532a60mr71850635pgr.192.1671382910436; Sun, 18
 Dec 2022 09:01:50 -0800 (PST)
MIME-Version: 1.0
References: <20221216204845.19290-1-tsimpson@quicinc.com>
 <CAFEAcA-Tr-RU0TjsXpn59EJPy9rnT6tVdkcyAENYHjxaXr+2VA@mail.gmail.com>
 <2f0247c5-0824-0157-94ed-10296ba7b5fa@linaro.org>
In-Reply-To: <2f0247c5-0824-0157-94ed-10296ba7b5fa@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 18 Dec 2022 17:01:39 +0000
Message-ID: <CAFEAcA82nb54j2t5dao-ADCsVBfWJF=fd42gsnjEU9V88i3Fkg@mail.gmail.com>
Subject: Re: [PULL 00/21] Hexagon update: bug fixes, performance, idef-parser
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Taylor Simpson <tsimpson@quicinc.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-devel@nongnu.org, philmd@linaro.org, bcain@quicinc.com, 
 quic_mathbern@quicinc.com, stefanha@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Sun, 18 Dec 2022 at 16:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 12/18/22 05:52, Peter Maydell wrote:
> > On Fri, 16 Dec 2022 at 20:49, Taylor Simpson <tsimpson@quicinc.com> wrote:
> >>
> >> The following changes since commit 4208e6ae114ac8266dcacc9696a443ce5c37b04e:
> >>
> >>    Merge tag 'pull-request-2022-12-15' of https://gitlab.com/thuth/qemu into staging (2022-12-15 21:39:56 +0000)
> >>
> >> are available in the Git repository at:
> >>
> >>    https://github.com/quic/qemu tags/pull-hex-20221216-1
> >>
> >> for you to fetch changes up to 585a86b1041a45c3b4074440c7f1b54944570867:
> >>
> >>    target/hexagon: import additional tests (2022-12-16 12:30:28 -0800)
> >
> >
> > Failed to build, s390x:
> >
> > https://gitlab.com/qemu-project/qemu/-/jobs/3492490152
> >
> > Program scripts/decodetree.py found: YES (/usr/bin/python3
> > /home/gitlab-runner/builds/-LCfcJ2T/0/qemu-project/qemu/scripts/decodetree.py)
> > Program flex found: NO
> > ../target/hexagon/meson.build:179:4: ERROR: Program 'flex' not found
> > or not executable
> >
> > Can you get the CI requirements sorted out first, and then
> > let me know when I can try re-merging this, please?
>
> Our s390x host won't be affected by any of the scripts,
> it simply needs to be installed.
>
> Alex, can you please install flex + bison on s390x.ci.qemu.org?

Ah, if that's all we need to do, I have access for that. I'll
install the packages and retry.

thanks
-- PMM

