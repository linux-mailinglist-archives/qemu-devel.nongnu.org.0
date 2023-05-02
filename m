Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A0B6F4256
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 13:12:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptnuH-0005eq-W3; Tue, 02 May 2023 07:10:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dani@danielbertalan.dev>)
 id 1ptnuE-0005eK-Bu
 for qemu-devel@nongnu.org; Tue, 02 May 2023 07:10:51 -0400
Received: from mail-0301.mail-europe.com ([188.165.51.139])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dani@danielbertalan.dev>)
 id 1ptnuB-00009s-N8
 for qemu-devel@nongnu.org; Tue, 02 May 2023 07:10:50 -0400
Date: Tue, 02 May 2023 11:10:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=danielbertalan.dev;
 s=protonmail; t=1683025841; x=1683285041;
 bh=TknfIgaxzR+ZJuIIyBbjoqhO2J0jNOEXRNk0vVgjNL4=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=xDIevwLVIWQQQ4kCdx5OVmYLMOzHdw1k4E/j5wWwB/nD4ogW09dtDgeVByL2sRJmX
 aPSDrhYvG4Qir8NXUuao+xNI82sn11DM9mgsD95+SZThPYv6A8EI48o/a2otiBc6DK
 gx+0CBzPuGmxGbHvwrbt0mF4Pdh4B3ENgDKEHfZp3581XBxyknby6Dy1dugkxF70yw
 qLWMbbM6npW5ohkygY8DNDPk61fXmOaKN983EjH3bqPeNyF5OUZK+RoRudpCQOHy/R
 v1b9OLBDm2iW7DF84ZT5LI8wA5k0n+t086EKsJ0mhUx0UzSzq47misJz+oCk0K2hRV
 Vn4DD3a1cs2xQ==
To: Peter Maydell <peter.maydell@linaro.org>
From: Daniel Bertalan <dani@danielbertalan.dev>
Cc: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH] hw/arm/bcm2835_property: Implement "get command line"
 message
Message-ID: <vxR7X7H0IH2rUOb1rvzXmmG3_3raS-2LMKN-ugFoq0ziCSX199bwb_i-zZ5_KdhWzllmtwIlvJF74epNBag-Etjya_nhkplFFNGmi6blpvs=@danielbertalan.dev>
In-Reply-To: <CAFEAcA9vHxxNGp4SC9AYnqCmLZ-a87MeD7Uq6no8n2Vxy9gi_w@mail.gmail.com>
References: <20230425103250.56653-1-dani@danielbertalan.dev>
 <CAFEAcA9vHxxNGp4SC9AYnqCmLZ-a87MeD7Uq6no8n2Vxy9gi_w@mail.gmail.com>
Feedback-ID: 20340505:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=188.165.51.139;
 envelope-from=dani@danielbertalan.dev; helo=mail-0301.mail-europe.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Hi Peter,

Thank you for merging the patch.

On Tuesday, May 2nd, 2023 at 12:15, Peter Maydell <peter.maydell@linaro.org=
> wrote:
>=20
> Are there any particularly interesting bits of guest software
> that try to read this property ?

We plan to use it in the AArch64 port of SerenityOS temporarily, while
we are in the process of bringing up device tree support.
I added it here: <https://github.com/SerenityOS/serenity/pull/18557>

[sidenote]
By the way, do you know if anyone has managed to run the raspi3b emulation =
in
EL1 (under KVM/HVF)?

We are currently only targeting the Raspberry Pi as the the AArch64 porting=
 effort
is a small subproject -- virtio peripheral support is out of the question
at the moment. It would be great if those of us that use AArch64 developmen=
t
machines could run the OS under hardware acceleration, while still using th=
e
existing Raspi kernel drivers.

I'd be happy to put in the work to make it possible, but I don't know where
to start.
[/sidenote]

I haven't checked any mainstream OSes if they use this message, sorry.

Regards,

Daniel


