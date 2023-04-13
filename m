Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FED6E160A
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 22:45:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pn3nq-0005wX-GH; Thu, 13 Apr 2023 16:44:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pn3nh-0005vv-JH
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 16:44:14 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pn3nf-0006jM-PT
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 16:44:13 -0400
Received: by mail-wr1-x430.google.com with SMTP id q6so3991529wrc.3
 for <qemu-devel@nongnu.org>; Thu, 13 Apr 2023 13:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681418647; x=1684010647;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cnjnxGin6SJzONjV+5dKVdsmgd66iZusRAWcd0R+I3g=;
 b=f+ErJxibt0wBX+aER2M3EpZLLbJ61lfCxlz4qIQ+7+RfguVti3bo6Pwi9rl9AndEFF
 wUA0GwHYrl5bEAYzCAImdRjysMQliN8Wnfs6GiUeR7hlErPn1se/4jEPsZFQYbHhI0jN
 XgUPRXqbmpGdRL+TzoA6klpdZfCpj6fHUPNjO62Xv5LB0ZxxnE8tZ4UpoJHHePLjzVx+
 y6OfozEVcuCLL9DRhkkl2+aDu+kXGQMt3xtwDvqPLftJbUzLfKulal4sHtBbQHhg1yUE
 7Oq6GgetNV6SrqvFBbOf5LdijJjeX2qpYPZCK2WoexHAY/+r0R4neoq0whhOfGxNQvRO
 ld4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681418647; x=1684010647;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cnjnxGin6SJzONjV+5dKVdsmgd66iZusRAWcd0R+I3g=;
 b=lTZ8d0IsNm9hj6u/utRW7w7Tv8QP/3sV3QBrBaY7LI0t9eMRMYYovqu9s51TgRjL2b
 99/GeF46cp7EhklWdHto05oTFxpTblNTuBLhmTw+WpoanICipknvIljehPJ0k9FZwccC
 +AIUTsve2tQh9OzyAJk61Zp8vJEsco0/tGT/UVXCiOOM7i/QqcUPsndiBGW7OfN1Fp1Y
 +QLMtU+Gwkopk/6Do9phpTMLI/SOZ7B+PpuwNXYHrgqoNaL1o+K7Hsaq5uTX5Qo7vo0s
 jxnzZVYxzdcdeVb/XRuiASBHE11DDhwzCCSf5n5/aayc0uaCJMzZcUYsk8/zNzv42yYm
 30JA==
X-Gm-Message-State: AAQBX9dzTu3pqrJFv/TN9uPbLeFvn/DIxW7bl4SvRY4GEuLhXjCt87XN
 cAyGh53/ERJYE6wO9t0Vmrk=
X-Google-Smtp-Source: AKy350YEWoZiIq0od2gBZd9sHI9H/9744CgQVmwUp/0PySaBexpsWDvGemDPov+tGROF8vuHtIxV5Q==
X-Received: by 2002:a5d:43ce:0:b0:2ef:68cf:248e with SMTP id
 v14-20020a5d43ce000000b002ef68cf248emr2441962wrr.14.1681418647012; 
 Thu, 13 Apr 2023 13:44:07 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-077-191-239-140.77.191.pool.telefonica.de.
 [77.191.239.140]) by smtp.gmail.com with ESMTPSA id
 b3-20020adfde03000000b002efb2d861dasm2010418wrm.77.2023.04.13.13.44.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Apr 2023 13:44:06 -0700 (PDT)
Date: Thu, 13 Apr 2023 20:43:12 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Volker_R=FCmelin?= <vr_qemu@t-online.de>,
 qemu-devel@nongnu.org
CC: Stefan Weil <sw@weilnetz.de>,
 =?ISO-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 0/3] SDL2 usability fixes
In-Reply-To: <9e951bfd-a657-5968-5318-0cd276cd5b2d@t-online.de>
References: <20230412203425.32566-1-shentey@gmail.com>
 <9e951bfd-a657-5968-5318-0cd276cd5b2d@t-online.de>
Message-ID: <FF1C15C5-33A9-46FD-A491-3248CFE5167A@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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



Am 13=2E April 2023 17:54:34 UTC schrieb "Volker R=C3=BCmelin" <vr_qemu@t-=
online=2Ede>:
>> I'm trying to use QEMU on Windows hosts for fun and for profit=2E While=
 the GTK
>> GUI doesn't seem to support OpenGL under Windows the SDL2 GUI does=2E H=
ence I
>> used the SDL2 GUI where I ran into several issues of which three are fi=
xed in
>> this series, which are:
>>=20
>> * Alt+Tab switches tasks on the host rather than in the guest in fullsc=
reen mode
>> * Alt+F4 closes QEMU rather than a graphical task in the guest
>> * AltGr keyboard modifier isn't recognized by a Linux guest
>>=20
>> More information about each issue is provided in the patches=2E
>>=20
>> Bernhard Beschow (3):
>>    ui/sdl2: Grab Alt+Tab also in fullscreen mode
>>    ui/sdl2: Grab Alt+F4 also under Windows
>>    ui/sdl2-input: Fix AltGr modifier on Windows hosts
>>=20
>>   ui/sdl2-input=2Ec | 13 +++++++++++++
>>   ui/sdl2=2Ec       |  2 ++
>>   2 files changed, 15 insertions(+)
>>=20
>
>Hi Bernhard,

Hi Volker,

>I don't think these patches are necessary=2E The AltGr key and the keyboa=
rd grab was fixed in 2020 with commit 830473455f ("ui/sdl2: fix handling of=
 AltGr key on Windows") and a few commits before=2E

Indeed, this patch addresses the AltGr issue=2E What I noticed in my case =
is that the AltGr behavior is different, depending on whether the *guest* i=
s in graphics mode or not=2E Pressing AltGr in graphics mode issues two key=
 modifiers while only one is issued when the guest is in text mode=2E I'll =
recheck tomorrow when I have access to a Windows host=2E

What about the other two issues? My other two patches override SDL2 defaul=
ts which aren't addressed yet in QEMU AFAICS=2E The Alt+Tab one isn't even =
Windows-specific=2E

>Something broke in the last few weeks=2E At the moment my Linux guest fai=
ls to start on Windows with -display sdl=2E QEMU locks up a short time afte=
r the Linux kernel starts=2E

This doesn't happen for me with 8=2E0rc4 and latest msys2 environment=2E I=
'm running with `-accel whpx -vga none -device virtio-vga-gl -display sdl,g=
l=3Don` and I even get decent OpenGL accelleration when the Linux guest is =
in graphics mode, with wobbly windows etc=2E Sometimes QEMU aborts when it =
can't map some OpenGL stuff when the guest enters graphics mode but once th=
at succeeds it runs absolutely stable=2E

>I'll try to find the commit that caused this regression=2E

Yes, this would be interesting=2E

Best regards,
Bernhard

>
>With best regards,
>Volker

