Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1B948F8DD
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Jan 2022 19:48:19 +0100 (CET)
Received: from localhost ([::1]:52010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8o60-0000vi-QG
	for lists+qemu-devel@lfdr.de; Sat, 15 Jan 2022 13:48:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <svens@stackframe.org>)
 id 1n8nv8-0007VQ-MB
 for qemu-devel@nongnu.org; Sat, 15 Jan 2022 13:36:58 -0500
Received: from outbound5a.eu.mailhop.org ([3.124.88.253]:44963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <svens@stackframe.org>)
 id 1n8nv6-0006SR-Pp
 for qemu-devel@nongnu.org; Sat, 15 Jan 2022 13:36:58 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1642271809; cv=none;
 d=outbound.mailhop.org; s=arc-outbound20181012;
 b=QWitpspZyOH28YxPxtVFr2s+Ro9xSm+/qgu07ZhOEJ/uphufSuCfozNVp83BM98OXmvVKrIX1oBjU
 hKdGUafc5ZJXd68+MINkwySbc6b/OCHjSPXoCMmERilHLEQl4nmKH/F3UvXATi0NtpfrxKESuuM1lD
 fGD4RjcBbl2D8uxVGohmHu8irTF3j66hhweouyzruiXaGouNO9zDI3mmF1TdRB0BoXBoWyMSqNdKQx
 e9TyvbI/7Kbx+QIYIzLWk6n6s7fHYCwkh69JpmvlupoeYFsoDFTXLaOOJ+RNrtb0d6IHP1r/J4BMcn
 tS9D042N7H3f3E4FoMTa+0El4qLd8uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=outbound.mailhop.org; s=arc-outbound20181012;
 h=content-transfer-encoding:content-type:mime-version:message-id:in-reply-to:
 date:references:subject:cc:to:from:dkim-signature:dkim-signature:from;
 bh=l9X56lkVQVjg3PJNKf2JU+637zUptsq9H0ZMXl/ZZZA=;
 b=KjAox19BgRl6RzdvIpVX9LR7qWyV8Q+uAts07LMtQOI7oeHhgwKsaXyRnA4aBUv3wyiS53Z0liQlA
 lQhCp2A/XXPJZ4b42RPWVErKFGJeS2qch08SQRwfeG52zH4BV4UT3s5sownob/oKdivKP6CMVao8Ik
 D4eA+HPJTOitlJZdI1bXcTpRknJwMIxVT7HKlJbNFAaqxggyENKsffUcx8wJ+XNvtX1eJC9zSV2V01
 aB1uPps0VA34ioPeZstGX/KN2HRD9XrSw38eUxa12Prz4GVZEIYYOnOlEzgJeCWOjvJkXKCuN8jYmv
 aN2jkSr5hBGAyCnwGw8EJOnEMhhXp3g==
ARC-Authentication-Results: i=1; outbound3.eu.mailhop.org;
 spf=pass smtp.mailfrom=stackframe.org smtp.remote-ip=91.207.61.48;
 dmarc=none header.from=stackframe.org;
 arc=none header.oldest-pass=0;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stackframe.org; s=duo-1634547266507-560c42ae;
 h=content-transfer-encoding:content-type:mime-version:message-id:in-reply-to:
 date:references:subject:cc:to:from:from;
 bh=l9X56lkVQVjg3PJNKf2JU+637zUptsq9H0ZMXl/ZZZA=;
 b=YEQmSxKQdXzjwPq1m+VN1REHBgZxWlZ94ObsEE/ziEIQQsKXAaLmB2jwA9zJz4U69P0Ohea9Asrv3
 2ODZ3UGkR4lBoszYQzaZlk/qzW3siyc5IhORAXRuey0sE5yosrGmBLv+pb7v6wA5kZeIJAN44akNNf
 MH9bjVD6s6HDJk/E=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=outbound.mailhop.org; s=dkim-high;
 h=content-transfer-encoding:content-type:mime-version:message-id:in-reply-to:
 date:references:subject:cc:to:from:from;
 bh=l9X56lkVQVjg3PJNKf2JU+637zUptsq9H0ZMXl/ZZZA=;
 b=pAt4JOnKTe7qq8mazNbT71ixjc/qamOW9fdT6ScrBIgLH/CgQ8QmuwzqxLx81ezJtTS4aysNozi8g
 yOxKUFVIsH+s0Vu9tCi8Y3VEFlifcdoHLagv6/le7SGTwgLHC04SXC3usij2QN0Cu2QH4IZeVky++v
 bHyLKezdzsLOSvjjdpXZrK1wBD/zN3buZMi4M6QDFge5q4mgzbiXxSZx2XhWTN/qiXRghjL5Np8ovI
 WkNUYWSkdx8BPl6wKam5M8wfugRXyICw9wie1lilb4ZuWbHG+yNq7R7oSOgfjU9sZo4iVOxjzNRc7F
 mDmEcmD6i4N6AuRek5CO9MfrSKXunRQ==
X-Originating-IP: 91.207.61.48
X-MHO-RoutePath: dG9ta2lzdG5lcm51
X-MHO-User: 16836fd8-7632-11ec-bf13-95b64d6800c5
X-Report-Abuse-To: https://support.duocircle.com/support/solutions/articles/5000540958-duocircle-standard-smtp-abuse-information
X-Mail-Handler: DuoCircle Outbound SMTP
Received: from mail.duncanthrax.net (propper.duncanthrax.net [91.207.61.48])
 by outbound3.eu.mailhop.org (Halon) with ESMTPSA
 id 16836fd8-7632-11ec-bf13-95b64d6800c5;
 Sat, 15 Jan 2022 18:36:45 +0000 (UTC)
Received: from hsi-kbw-109-193-149-228.hsi7.kabel-badenwuerttemberg.de
 ([109.193.149.228] helo=x1.stackframe.org.stackframe.org)
 by mail.duncanthrax.net with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <svens@stackframe.org>)
 id 1n8nut-004gYQ-AL; Sat, 15 Jan 2022 20:36:43 +0200
From: Sven Schnelle <svens@stackframe.org>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH 5/5] hw/display/artist: Fix framebuffer access for Linux
References: <20220112210730.292775-1-deller@gmx.de>
 <20220112210730.292775-6-deller@gmx.de>
 <70f10b2e-8fda-fc87-c383-5360c6c78993@amsat.org>
 <87wnj1mcx0.fsf@x1.stackframe.org>
Date: Sat, 15 Jan 2022 19:36:41 +0100
In-Reply-To: <87wnj1mcx0.fsf@x1.stackframe.org> (Sven Schnelle's message of
 "Sat, 15 Jan 2022 12:55:07 +0100")
Message-ID: <87o84cn8w6.fsf@x1.stackframe.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=3.124.88.253; envelope-from=svens@stackframe.org;
 helo=outbound5a.eu.mailhop.org
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-stable@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sven Schnelle <svens@stackframe.org> writes:

> Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:
>
>> +Sven
>>
>> On 12/1/22 22:07, Helge Deller wrote:
>>> This patch fixes two problems which prevented Linux to access the
>>> artist graphics framebuffer:
>>> The check if the framebuffer or the color map should be accessed was
>>> incomplete. By using the vram_read/write_bufidx() functions we now check
>>> correctly if ARTIST_BUFFER_CMAP should be accessed.
>>> The second fix is to correctly calculate the X- and Y-coordinates
>>> and
>>> check against the graphics resolution.
>>> With this fix in place, the Linux stifb driver now works correctly,
>>> shows the penguins at bootup and uses the stifb as graphics console.
>>
>> Cool, could you add a test similar to these?
>>
>> $ git grep Tux tests/avocado/
>> tests/avocado/machine_arm_integratorcp.py:69:        Boot Linux and
>> verify the Tux logo is displayed on the framebuffer.
>> tests/avocado/machine_mips_malta.py:44:        Boot Linux kernel and
>> check Tux logo is displayed on the framebuffer.
>>
>>> I haven't seen any negative side effects when running HP-UX.
>

> Hmm, the patch below  breaks hp-ux 10.20 for me, please see the
> attached screenshot.

I think my initial thought that the register 118000 is the buffer access
mode for the color map is just wrong. I think it's setting the SRC & DST
buffer access mode at the same time because on the Visualize FX cards
we have similar registers:

#define B2_FBC_BABoth                     0x00920804 /* DBA & SBA (reads re=
turn DBA) (RW) */
#define B2_FBC_DBA                        0x00920808 /* Destination Bitmap =
Access Register (RW) */
#define B2_FBC_SBA                        0x0092080C /* Source Bitmap Acces=
s Register (RW) */

Looking at Artist, we have:

CMAP_BM_ACCESS =3D 0x118000
DST_BM_ACCESS =3D 0x118004
SRC_BM_ACCESS =3D 0x118008

Given that artist and visualize fx are very similar when it comes to 2D
acceleration, i think CMAP_BM_ACCESS is just changing both registers,
completely unrelated to the color map. I tried changing the code, but
of course that breaks a lot of things. Let me see whether i can make
that work.

/Sven

