Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 173DC64727D
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 16:09:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3IW7-0003Wa-Go; Thu, 08 Dec 2022 10:08:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cwrogg@umich.edu>) id 1p3IVu-0003UP-Ne
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 10:08:42 -0500
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cwrogg@umich.edu>) id 1p3IVs-0008BY-Lt
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 10:08:42 -0500
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-3c21d6e2f3aso17185987b3.10
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 07:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=umich.edu; s=google-2016-06-03;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Kp+BdeFu3S0j9AQg8AQsideuzGk4wDEnkeAmW/+Hbbg=;
 b=omVqnK2CwBr1u9NIOKUDO6Kqw7GEfAgyrPfcs3UqyPCsTTrYpCU2KyjH+nnByQYZX9
 2PcyNwIgvmdcu8Am+vIzbCZ9ItEOoLvvOqb8OIXEwT9YDg/O2ph1saCID4upt0KcsPky
 nImlMRv93FfqgQN/Dj5+NifMScFB7hFod/M2xOzsZ+cc2nDtWQM0EbYv9WQHQrnQQtX4
 +U85CMYbb/317YvF9e4+RA3IyTWlzrNUFpukFl1ep+sqfxhFh08lnL1SlNXqwaOHELXX
 n/i3bzCjqtdwssU2NvSI3aHOgACtebxzsXoCZ0Bsi5TALyFBdkRX3t0rbhAuyuc3fuXK
 GmnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Kp+BdeFu3S0j9AQg8AQsideuzGk4wDEnkeAmW/+Hbbg=;
 b=JMK6zhyPG7vBDfsb37rkbGIpbVIFlWSDe2WF2CLNitd8FbDH4WKa2SD3Y1Q9/2tdiT
 i5sqUppiwCKkfeUNEh5rmKAouja5E/Z4qpj7Eu/IM8hmP2caDjhMamAZ9WvPa170yUMp
 mn0wIxCKYxG3rnAdzF7WVVmFsDXcp2jBAgDab5ZJtb6HLbI0HpaJAgdaBXO7dwoyZ3NO
 tRrT0RDE7gJF5eQ2PRri0MIr269jswfAdTpOD7Mvs1HafGyNSAjvdg/DJsjbgob58pHh
 F3EPxMf5kEpHMvAr4IlPgGLNj6PP1TRB2Y/3xSm+WQaYS+6jjfQTh8yBkkR+N2kDUnlC
 vKYw==
X-Gm-Message-State: ANoB5pkfMdYiYdy0jus45GFOQYAR2+3881+/pYVeDtXHmvMPdAF5ZtMY
 tcLrxAT2LnC97ov33wcPRHnh1vkcNpp9XhvEM6B1XDhHKjxSuP85
X-Google-Smtp-Source: AA0mqf6ONcaAeTzmKNZ6EsIgAL2FjhxjTIzfrAT+SOew/NhqaMD3NbrpvNb/r21YeHP2jUKNt3IQBV6iEIhKiJ2Ag34=
X-Received: by 2002:a05:690c:c84:b0:3d4:f6cb:6dd4 with SMTP id
 cm4-20020a05690c0c8400b003d4f6cb6dd4mr35678609ywb.365.1670512106802; Thu, 08
 Dec 2022 07:08:26 -0800 (PST)
MIME-Version: 1.0
From: Christopher Wrogg <cwrogg@umich.edu>
Date: Thu, 8 Dec 2022 10:08:16 -0500
Message-ID: <CAG7Es24cbb24S1k7=XyA+N7uXCghQT6mt_QkJW4zcO7_usbmjw@mail.gmail.com>
Subject: CVMSEG Emulation
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="000000000000b8255505ef5268ad"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=cwrogg@umich.edu; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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

--000000000000b8255505ef5268ad
Content-Type: text/plain; charset="UTF-8"

<https://matrix.to/#/!xtcopKjjucUQThGiEn:matrix.org/$16705104253940lCHrT:matrix.org?via=matrix.org&via=matrix.im&via=matrix.alindner.org>
In userspace emulation how do I make a set of addresses always valid and
initialized to 0 even though the process does not map it in? In particular
I want to map the CVMSEG for Cavium qemu-mips64 and qemu-mipsn32. The
addresses would be 0xFFFFFFFFFFFF8000 - 0xFFFFFFFFFFFFBFFF. I've looked at
target_mmap but it can't handle addresses that large. The lack of an
emulated mmu for 64 bit guests is going to be a problem.

--000000000000b8255505ef5268ad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail-mx_EventTile_line"><a href=3D"https://=
matrix.to/#/!xtcopKjjucUQThGiEn:matrix.org/$16705104253940lCHrT:matrix.org?=
via=3Dmatrix.org&amp;via=3Dmatrix.im&amp;via=3Dmatrix.alindner.org" aria-la=
bel=3D"09:40"></a></div><span class=3D"gmail-mx_EventTile_body" dir=3D"auto=
">In userspace emulation how do I make a set of addresses always valid and =
initialized to 0 even though the process does not map it in?

In particular I want to map the CVMSEG for Cavium qemu-mips64 and qemu-mips=
n32. The addresses would be 0xFFFFFFFFFFFF8000 - 0xFFFFFFFFFFFFBFFF.

I&#39;ve looked at target_mmap but it can&#39;t handle addresses that large=
. The lack of an emulated mmu for 64 bit guests is going to be a problem.<b=
r></span></div>

--000000000000b8255505ef5268ad--

