Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BD92D9B75
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 16:51:42 +0100 (CET)
Received: from localhost ([::1]:55706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koq8T-0002hQ-Bo
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 10:51:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1koq4k-0007je-9U
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 10:47:50 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:34639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1koq4h-00005B-CQ
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 10:47:49 -0500
Received: by mail-ej1-x642.google.com with SMTP id g20so23170948ejb.1
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 07:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5dH0FUa9/iLUNy6OO849zJ1HziIZ9thd34JHsivNycM=;
 b=VD5cpRw2XE0UIOQwSGrgqAyGJRwOqWOZ98Dl2BVCEv9vBWFjJhJ55ePenhuMhpK4o9
 TMb6F5Ny+ywwcXy9eyLhP+tTvgG8wUoR6s/wFby3Jo3ptrKSg3Lz/tVzh9ns5646GjI3
 AX1U0B2pAVLCMdEUgYRYxFFGjzyjpBCeaiQU44ReQbjPcg6vXal1Iqr8rPudGXHHBrfP
 dQnUszGkBEXNlcqs3+j3BLF/IpTJQi936do/tlYLwuuJnnt+Jo9w7T0Bo0o6b9eTTpry
 QUQjAcXgg3p1XIaYEtTHruh0MgbqjQxt93dgz+AUMGTuMKwn6n2iR1n4Kln01d4Fwb+W
 PenA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5dH0FUa9/iLUNy6OO849zJ1HziIZ9thd34JHsivNycM=;
 b=juPLGWd1v6uha44ZJB3GxopWO2FJ3N1mg3GIGn7wxC06QBndQVvj3uqX3DkhsiqJot
 ZjeMrVxb3F+6YWwckIGDtaJE1v6Bx9cJy7bXYOlgqIBwpzvs3nV/EcL3Vb0aJQD7lCQ9
 VAZhqOrKLfQ6+KMR+O9qz2K6wLAd3ItYEdc6sItnxFwlxEL0xVtSRbuZ5o6JdvC6vn8s
 5gxaFEKx/TwRPNdrZVhokYsDdY+H5wzNVmlwzsZEXM6PERTUnDoFIJFIcJOU4SmnO5uk
 um/wwrLpzrslWt19LQC2JDjnStcNyc7G5lUP+KJHrp8H/3TaZmatQa1NMtMXqESg4ToH
 53NQ==
X-Gm-Message-State: AOAM532tX93sFpY5NoQQTtKQE+KrKo7+fMkloz30x77CJOHR2wYgO2gC
 GNY9D4g2kZhyBPiMJ2n5rKj8098mvoormeXhZkia7g==
X-Google-Smtp-Source: ABdhPJxJ40OmlRl2ywVV1+FI5sDRpXo+Y5jALGS3i+jhCU69ByBIiqgRGScH1cxg3KWEj5458tkcy6O/ja9RYflualw=
X-Received: by 2002:a17:907:971c:: with SMTP id
 jg28mr22975883ejc.85.1607960864348; 
 Mon, 14 Dec 2020 07:47:44 -0800 (PST)
MIME-Version: 1.0
References: <20201214153012.12723-1-alex.bennee@linaro.org>
 <20201214153012.12723-3-alex.bennee@linaro.org>
In-Reply-To: <20201214153012.12723-3-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Dec 2020 15:47:33 +0000
Message-ID: <CAFEAcA_2N=bMikxfHQWoX=rOOockSAAjpbBf8upm=w-LWp4KqQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/6] configure: gate our use of GDB to 8.3.1 or above
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
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

On Mon, 14 Dec 2020 at 15:36, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Certain earlier versions of GDB have (possibly distro) derived issues
> when running against multiarch guests. Also given the problem of
> clashing ports it is preferable to use socket comms rather than TCP
> ports for testing.

What's a "multiarch guest" ?

Incidentally I think the problem I have been running into
with the Ubuntu gdb 8.1 is that it doesn't support registers
larger than 64 bytes, and if AArch64 QEMU is emulating SVE
then it tries to expose registers bigger than that to the
gdbstub.

thanks
-- PMM

