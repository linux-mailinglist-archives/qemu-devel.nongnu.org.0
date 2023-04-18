Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0056E6BE7
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 20:17:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1popsO-0008OG-30; Tue, 18 Apr 2023 14:16:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1popsB-0008Nx-4O
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 14:16:11 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pops8-0006st-VQ
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 14:16:10 -0400
Received: by mail-ej1-x62d.google.com with SMTP id dx24so31506167ejb.11
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 11:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681841767; x=1684433767;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DAVXvHR/ES7Vw55lHSaBTlkSJVsKBzrR4HdICzILZmg=;
 b=ASe2C3ZkcLoLuf5XKLlcXRPPc+IPwl8ahmU2nFXmcl2KDsLxHHeEfbLmvYwX0xKlzN
 nPfZBqhsB/W3JRBOtL+Vahr6I+8S1TVL3ELDuLFWFxVaXEzRaGo+RQKnaaPb9PxYNUmv
 I5NRlvgAWz+ZRIrw7BAXdFz2j4dQYvdZ7AzuKplOkhV3W6/C8J2bEt8TkNd1P/h/kVgK
 xaSl75Uli9p3Gd9zWAQyP5zqSW91sHRZHvjk/o5jroYcd31pC+jBcWUe4soKOuChc8is
 Pn7bQqdO60WxQT65rMbJhfJ4LBnz735AHSuAVlvQAF1f+VsLfd7BQ/8Z4mai+wBVxj9C
 iRYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681841767; x=1684433767;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DAVXvHR/ES7Vw55lHSaBTlkSJVsKBzrR4HdICzILZmg=;
 b=Xn+fknZGDgYSB/sE7tNQeFhc/5iTiDtdqqI+fi6X9/Rh0Q8IGnrsJXFcxP3W3Z1+4E
 eOSHOz7fkq2/+T339mo/vUb2QOVLgxMN50ylZZbOtThQL1y/LGLnpN9eZUWjxZzRyjw2
 /jIE8bpQTDDqaXLdpyw676dpJR5290uRCvXOt2aAWzjkAUy6+H1b+4D8dV5BvnnIJeC3
 pqKYEQAqeSpJBhh2P08mm3l7wt1V6c8NGoYLeFO/kbD493Uk0yBwk4VDe9OswobYGb3q
 XsD6SbMNxb3BxQ01lE5SkTRPNnj0Fj+V9oT9ZJ6z2JnD/tFeaMVtAjIsxqYNLNBaOQf4
 egAQ==
X-Gm-Message-State: AAQBX9dGBqXGIqYFbE4jgnUoesKodkppioDn6mOH3sB+ENF+Gebu4cpm
 HBDNEiLzVKcJ3c++RzKd72c=
X-Google-Smtp-Source: AKy350Z1VsCIGc1LFOWmeNIdcwlmZZ0kV4wCA5YCT9cZyR5Rsd7pV1x3F93gP5gOySfhk9gxLKuDYA==
X-Received: by 2002:a17:907:a0c7:b0:953:42bf:9917 with SMTP id
 hw7-20020a170907a0c700b0095342bf9917mr359974ejc.70.1681841766924; 
 Tue, 18 Apr 2023 11:16:06 -0700 (PDT)
Received: from [127.0.0.1] ([62.214.191.67]) by smtp.gmail.com with ESMTPSA id
 wy5-20020a170906fe0500b0094f1d0bad81sm5327971ejb.139.2023.04.18.11.16.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 11:16:06 -0700 (PDT)
Date: Tue, 18 Apr 2023 18:14:58 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Volker_R=FCmelin?= <vr_qemu@t-online.de>,
 =?ISO-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
CC: qemu-devel@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH v2 1/1] ui/sdl2: disable SDL_HINT_GRAB_KEYBOARD on Windows
In-Reply-To: <20230418065652.7152-1-vr_qemu@t-online.de>
References: <59ffc014-ec48-64a4-3403-7e64c5594053@t-online.de>
 <20230418065652.7152-1-vr_qemu@t-online.de>
Message-ID: <B538687F-5D53-4463-A620-574855BBA103@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62d.google.com
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



Am 18=2E April 2023 06:56:52 UTC schrieb "Volker R=C3=BCmelin" <vr_qemu@t-=
online=2Ede>:
>Windows sends an extra left control key up/down input event for
>every right alt key up/down input event for keyboards with
>international layout=2E Since commit 830473455f ("ui/sdl2: fix
>handling of AltGr key on Windows") QEMU uses a Windows low level
>keyboard hook procedure to reliably filter out the special left
>control key and to grab the keyboard on Windows=2E
>
>The SDL2 version 2=2E0=2E16 introduced its own Windows low level
>keyboard hook procedure to grab the keyboard=2E Windows calls this
>callback before the QEMU keyboard hook procedure=2E This disables
>the special left control key filter when the keyboard is grabbed=2E
>
>To fix the problem, disable the SDL2 Windows low level keyboard
>hook procedure=2E
>
>Reported-by: Bernhard Beschow <shentey@gmail=2Ecom>
>Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online=2Ede>

FWIW:

Tested-by: Bernhard Beschow <shentey@gmail=2Ecom>

>---
> ui/sdl2=2Ec | 3 +++
> 1 file changed, 3 insertions(+)
>
>diff --git a/ui/sdl2=2Ec b/ui/sdl2=2Ec
>index 00aadfae37=2E=2E9d703200bf 100644
>--- a/ui/sdl2=2Ec
>+++ b/ui/sdl2=2Ec
>@@ -855,7 +855,10 @@ static void sdl2_display_init(DisplayState *ds, Disp=
layOptions *o)
> #ifdef SDL_HINT_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR /* only available sin=
ce SDL 2=2E0=2E8 */
>     SDL_SetHint(SDL_HINT_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR, "0");
> #endif
>+#ifndef CONFIG_WIN32
>+    /* QEMU uses its own low level keyboard hook procecure on Windows */
>     SDL_SetHint(SDL_HINT_GRAB_KEYBOARD, "1");
>+#endif
> #ifdef SDL_HINT_ALLOW_ALT_TAB_WHILE_GRABBED
>     SDL_SetHint(SDL_HINT_ALLOW_ALT_TAB_WHILE_GRABBED, "0");
> #endif

