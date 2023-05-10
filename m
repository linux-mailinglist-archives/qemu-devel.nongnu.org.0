Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6956FE42B
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 20:44:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwonC-0003f5-Dn; Wed, 10 May 2023 14:44:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pwon6-0003en-Rb
 for qemu-devel@nongnu.org; Wed, 10 May 2023 14:43:56 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pwon3-000821-Jz
 for qemu-devel@nongnu.org; Wed, 10 May 2023 14:43:56 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-50bcb229adaso14103484a12.2
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 11:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683744232; x=1686336232;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VFhdUDKDKq/WCLz5+q77fgYIaZMPav/biFnwBmiGa24=;
 b=RhZM/JX+zgi3rnJ5eJYpmNRbT86JVMEhP3vFjHzbYIX3OLU1Rwz3I0gS9rUf3+A95z
 ExqdZyRBIGO7Wsv58ZyR6vTyZIzQr71MigSv8oZZwI+hRsSwx870Y8jN6L708rekI2Wt
 mehSbyuQgZ8hXuM5cJL6UfHZiyPM4/OwwatKmJyZde5WR4oUzGgpqC6XFAOw/XtlcgL8
 RfkOqDA6tvYwJ3vABKiG9JWYcf4LfId+Zjti0eJudmKY4KwzEj5eILfdfuLKseb8E8sb
 eiRfTlb8pzJbHCvTC9OTv4dN6M5KiUIw8nXR9rT38Ho5+2PE7Gl23r/rb3SGRlkdk2hk
 Mv6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683744232; x=1686336232;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VFhdUDKDKq/WCLz5+q77fgYIaZMPav/biFnwBmiGa24=;
 b=kLujWmI7DU+JL3yksXjXj7g16AxaTUVUHPwGgIUIdm5ipwYWqWE+KXuSDu0d2hhDBV
 W/ZqdyfpXqfsJkYFWktwqxgiFNevO+QgfNtxawnTuMWfddCTLCyMI3avx9MSkhtix9pl
 R7EMeTn5JRZOwNR/NWxlGJ/Pw9iJlJITr8hVY6uuopWkqsOsIYziwfVdr+eCHWETh7Wp
 GWZA+v/nWW9ki2ZTVOVuH5G9p2HDEvikJmtFuqGD4vMYo+E+KL1Fc0ZdlLcdtuOSYkE0
 l/a7RF9W6mYBxxlInwZNiSbWNqp3cadW+3qiIUkmr0dwNdxxnbdAm787cZemE6DWkKVN
 Tqpg==
X-Gm-Message-State: AC+VfDwm0UpohSsiWGEnYycnOJtCK7DBghBGEmyZaHoAy5geuQtGvm3c
 f268+0KznRVBrIHWniQzHJI=
X-Google-Smtp-Source: ACHHUZ7/i13uTewxPrwOEHsZ/xbxeTJ98J3sRcHowXBjpXxBLBWHlg8Yd6RX4sOHCL20hajK8WyPlw==
X-Received: by 2002:aa7:c548:0:b0:50b:b7f5:3128 with SMTP id
 s8-20020aa7c548000000b0050bb7f53128mr13478086edr.12.1683744231849; 
 Wed, 10 May 2023 11:43:51 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-089-012-021-051.89.12.pool.telefonica.de.
 [89.12.21.51]) by smtp.gmail.com with ESMTPSA id
 dy28-20020a05640231fc00b0050d8b5757d1sm2097164edb.54.2023.05.10.11.43.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 11:43:51 -0700 (PDT)
Date: Wed, 10 May 2023 18:43:48 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Stefan Weil <sw@weilnetz.de>,
 =?ISO-8859-1?Q?Volker_R=FCmelin?= <vr_qemu@t-online.de>,
 =?ISO-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
CC: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 1/1] ui/sdl2: disable SDL_HINT_GRAB_KEYBOARD on Windows
In-Reply-To: <37f99255-20a9-807d-77eb-0465d57cad34@weilnetz.de>
References: <59ffc014-ec48-64a4-3403-7e64c5594053@t-online.de>
 <20230418065652.7152-1-vr_qemu@t-online.de>
 <37f99255-20a9-807d-77eb-0465d57cad34@weilnetz.de>
Message-ID: <35B8ED7D-AF57-4411-8BBD-81793DBAED01@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x534.google.com
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



Am 24=2E April 2023 03:33:05 UTC schrieb Stefan Weil <sw@weilnetz=2Ede>:
>Am 18=2E04=2E23 um 08:56 schrieb Volker R=C3=BCmelin:
>
>> Windows sends an extra left control key up/down input event for
>> every right alt key up/down input event for keyboards with
>> international layout=2E Since commit 830473455f ("ui/sdl2: fix
>> handling of AltGr key on Windows") QEMU uses a Windows low level
>> keyboard hook procedure to reliably filter out the special left
>> control key and to grab the keyboard on Windows=2E
>>=20
>> The SDL2 version 2=2E0=2E16 introduced its own Windows low level
>> keyboard hook procedure to grab the keyboard=2E Windows calls this
>> callback before the QEMU keyboard hook procedure=2E This disables
>> the special left control key filter when the keyboard is grabbed=2E
>>=20
>> To fix the problem, disable the SDL2 Windows low level keyboard
>> hook procedure=2E
>>=20
>> Reported-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online=2Ede>
>> ---
>>   ui/sdl2=2Ec | 3 +++
>>   1 file changed, 3 insertions(+)
>>=20
>> diff --git a/ui/sdl2=2Ec b/ui/sdl2=2Ec
>> index 00aadfae37=2E=2E9d703200bf 100644
>> --- a/ui/sdl2=2Ec
>> +++ b/ui/sdl2=2Ec
>> @@ -855,7 +855,10 @@ static void sdl2_display_init(DisplayState *ds, Di=
splayOptions *o)
>>   #ifdef SDL_HINT_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR /* only available =
since SDL 2=2E0=2E8 */
>>       SDL_SetHint(SDL_HINT_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR, "0");
>>   #endif
>> +#ifndef CONFIG_WIN32
>> +    /* QEMU uses its own low level keyboard hook procecure on Windows =
*/
>
>
>s/procecure/procedure/
>
>
>>       SDL_SetHint(SDL_HINT_GRAB_KEYBOARD, "1");
>> +#endif
>>   #ifdef SDL_HINT_ALLOW_ALT_TAB_WHILE_GRABBED
>>       SDL_SetHint(SDL_HINT_ALLOW_ALT_TAB_WHILE_GRABBED, "0");
>>   #endif
>
>
>The typo fix for the comment does not require a v3 and can be applied in =
the pull request=2E
>
>Reviewed-by: Stefan Weil <sw@weilnetz=2Ede>

Ping


