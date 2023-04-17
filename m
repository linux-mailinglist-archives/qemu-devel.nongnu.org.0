Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E0B6E520F
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Apr 2023 22:48:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1poVkf-0007uI-QE; Mon, 17 Apr 2023 16:47:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1poVkd-0007tn-3e
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 16:47:03 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1poVka-0005Sq-Uz
 for qemu-devel@nongnu.org; Mon, 17 Apr 2023 16:47:02 -0400
Received: by mail-ej1-x636.google.com with SMTP id c9so28816700ejz.1
 for <qemu-devel@nongnu.org>; Mon, 17 Apr 2023 13:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681764419; x=1684356419;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LZ/m3NZ9Ji+uRN8D4tcMvX/264xsATOMiz98NBXgOYk=;
 b=gVgNpeTLHeH/ZeCjotInd1Jkf0+OcfunDEjs1dybUYiyI3ivYUdv079XL9NX+7QkrO
 Ar3Eb4MNBnJw/VaOaj8cHXAm1uZFcfwgJVb3ZEssmyc5S7UTzITm4Q7KTCtCBklFgZMY
 biK/jAOVpBqMRxXQvLLhA3F5vEFdZ2hN7yC/n85l/wv2LgmVTyd5MOUs/YpQabRal6+V
 6O63P9fZwv5UjD/KWXfV5MZoojOxbbXZYriQjuFfHnasgrIEiftJ1RBuNXDnqyFhk/CD
 WCAEhNIs/o15ZV9y11NGTEWDgwuU6lV2wyUPCpV7IiczUuheHZNNXlzGJy4s9s65/ko4
 CdFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681764419; x=1684356419;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LZ/m3NZ9Ji+uRN8D4tcMvX/264xsATOMiz98NBXgOYk=;
 b=LS0HBWM2Vgo/mGisGYUvcIvcnH6Z096laguBV/3MDRPddyzmF6miSv9Y+fZpUTtPkO
 bVunN7ZySLO0M90b0dN3Issulq30D2x26UhyDmLPCTw1BW5Ls+v0ADGWyB6P8GcHinqC
 3ZqZR1/setrBICIENQvI9Cq7puqlXNPsONmDmPfi79Z7cqGldL8WdLXsv3ONRPxwvAtr
 KMUjVY4SY3jp4AVHQLZeOkaEzA4VQMP+do1XxD2t+INTtylWniQdQCOgEhJcmk4urCh8
 2MGDdO7FW53GOiVSCvjemudav67edEr0SaemtWeQiwA50ZORYDC833YZy472G6SfTvbb
 NV7w==
X-Gm-Message-State: AAQBX9e3+cOolnoWhAkKOanOTnMro+GanoWozJJ99p7Zu20+O/tPssRg
 i/PX5ZhYCKW4ox6KZ1s2saI=
X-Google-Smtp-Source: AKy350bRDWzU3zicNrjq/xh8rlTn80B41IrI5EXcri6lHMoSK26LSXcI7eeZRREvHmuj05V+iCMu2g==
X-Received: by 2002:a17:906:34cb:b0:94f:4992:4770 with SMTP id
 h11-20020a17090634cb00b0094f49924770mr5835529ejb.7.1681764419316; 
 Mon, 17 Apr 2023 13:46:59 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-089-012-025-091.89.12.pool.telefonica.de.
 [89.12.25.91]) by smtp.gmail.com with ESMTPSA id
 tg10-20020a1709078dca00b0094ef2003581sm5152676ejc.153.2023.04.17.13.46.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Apr 2023 13:46:58 -0700 (PDT)
Date: Mon, 17 Apr 2023 19:24:57 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Volker_R=FCmelin?= <vr_qemu@t-online.de>,
 qemu-devel@nongnu.org
CC: Stefan Weil <sw@weilnetz.de>,
 =?ISO-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH 0/3] SDL2 usability fixes
In-Reply-To: <e1d85b75-9ae2-9a78-b07a-4017c919c1ec@t-online.de>
References: <20230412203425.32566-1-shentey@gmail.com>
 <9e951bfd-a657-5968-5318-0cd276cd5b2d@t-online.de>
 <FF1C15C5-33A9-46FD-A491-3248CFE5167A@gmail.com>
 <071a249e-2168-0bdf-2088-7faaa4987df8@t-online.de>
 <e1d85b75-9ae2-9a78-b07a-4017c919c1ec@t-online.de>
Message-ID: <07916782-1A01-4255-A20A-4399E8A45F72@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



Am 14=2E April 2023 19:09:47 UTC schrieb "Volker R=C3=BCmelin" <vr_qemu@t-=
online=2Ede>:
>> Am 13=2E04=2E23 um 22:43 schrieb Bernhard Beschow:
>>>=20
>>> Am 13=2E April 2023 17:54:34 UTC schrieb "Volker R=C3=BCmelin" <vr_qem=
u@t-online=2Ede>:
>>>>> I'm trying to use QEMU on Windows hosts for fun and for profit=2E Wh=
ile the GTK
>>>>> GUI doesn't seem to support OpenGL under Windows the SDL2 GUI does=
=2E Hence I
>>>>> used the SDL2 GUI where I ran into several issues of which three are=
 fixed in
>>>>> this series, which are:
>>>>>=20
>>>>> * Alt+Tab switches tasks on the host rather than in the guest in ful=
lscreen mode
>>>>> * Alt+F4 closes QEMU rather than a graphical task in the guest
>>>>> * AltGr keyboard modifier isn't recognized by a Linux guest
>>>>>=20
>>>>> More information about each issue is provided in the patches=2E
>>>>>=20
>>>>> Bernhard Beschow (3):
>>>>> =C2=A0=C2=A0=C2=A0 ui/sdl2: Grab Alt+Tab also in fullscreen mode
>>>>> =C2=A0=C2=A0=C2=A0 ui/sdl2: Grab Alt+F4 also under Windows
>>>>> =C2=A0=C2=A0=C2=A0 ui/sdl2-input: Fix AltGr modifier on Windows host=
s
>>>>>=20
>>>>> =C2=A0=C2=A0 ui/sdl2-input=2Ec | 13 +++++++++++++
>>>>> =C2=A0=C2=A0 ui/sdl2=2Ec=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
 2 ++
>>>>> =C2=A0=C2=A0 2 files changed, 15 insertions(+)
>>>>>=20
>>>> Hi Bernhard,
>>> Hi Volker,
>>>=20
>>>> I don't think these patches are necessary=2E The AltGr key and the ke=
yboard grab was fixed in 2020 with commit 830473455f ("ui/sdl2: fix handlin=
g of AltGr key on Windows") and a few commits before=2E
>>> Indeed, this patch addresses the AltGr issue=2E What I noticed in my c=
ase is that the AltGr behavior is different, depending on whether the *gues=
t* is in graphics mode or not=2E Pressing AltGr in graphics mode issues two=
 key modifiers while only one is issued when the guest is in text mode=2E I=
'll recheck tomorrow when I have access to a Windows host=2E
>>=20
>> Hi Bernhard,
>>=20
>> the AltGr behavior depends on the keyboard grab=2E The AltGr key works =
without keyboard grabbed and it doesn't with keyboard grabbed=2E That's a b=
ug=2E
>
>Hi Bernhard,
>
>this used to work before SDL2-2=2E0=2E16=2E There was no code for Windows=
 in SDL2 to handle keyboard grabs=2E Version 2=2E0=2E16 introduced a Window=
s low level keyboard hook procedure to grab the keyboard=2E Windows calls t=
his callback before the QEMU keyboard hook procedure=2E This explains the o=
bserved behavior=2E
>
>The fix is to disable SDL_SetHint(SDL_HINT_GRAB_KEYBOARD, "1"); for Windo=
ws=2E This restores the QEMU keyboard grab for all Windows SDL2 versions=2E

As you wrote below I'll let you take care of it=2E Thanks!

> Your first two patches are also necessary=2E But I think you will need a=
 #ifdef SDL_HINT_ALLOW_ALT_TAB_WHILE_GRABBED for older SDL2 versions=2E

[x] Done

v2 is out!

Best regards,
Bernhard

>
>I'll write a patch similar to this one after more tests=2E
>
>diff --git a/ui/sdl2=2Ec b/ui/sdl2=2Ec
>index b011e8d759=2E=2E9f6b959464 100644
>--- a/ui/sdl2=2Ec
>+++ b/ui/sdl2=2Ec
>@@ -855,7 +855,9 @@ static void sdl2_display_init(DisplayState *ds, Displ=
ayOptions *o)
> #ifdef SDL_HINT_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR /* only available sin=
ce SDL 2=2E0=2E8 */
>     SDL_SetHint(SDL_HINT_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR, "0");
> #endif
>+#ifndef CONFIG_WIN32
>     SDL_SetHint(SDL_HINT_GRAB_KEYBOARD, "1");
>+#endif
> #ifdef SDL_HINT_ALLOW_ALT_TAB_WHILE_GRABBED
>     /* available since SDL 2=2E0=2E16 */
>     SDL_SetHint(SDL_HINT_ALLOW_ALT_TAB_WHILE_GRABBED, "0");

