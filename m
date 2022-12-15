Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2446564D4D9
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 01:59:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5cZU-0001Lt-4u; Wed, 14 Dec 2022 19:58:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cwrogg@umich.edu>) id 1p5cZS-0001Lk-I5
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 19:57:58 -0500
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cwrogg@umich.edu>) id 1p5cZQ-0004Of-OI
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 19:57:58 -0500
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-3c090251d59so21689107b3.4
 for <qemu-devel@nongnu.org>; Wed, 14 Dec 2022 16:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=umich.edu; s=google-2016-06-03;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=dzyby7T/PkPy2j+iTKvR5njyf+A4DchXRxSpi/QKCxo=;
 b=NsoJXRJG4ZCIE+WFpK8YX6KzG9Vl4RTQemwis3DuebKQ55trSHgqkFBriuRf4a5VIG
 YW8Asp5Zn5NrKlTx+9nLEJFVQSNlFH7a1lhyUQ8dCKl+l+ficBWqPfamMas98Lm/4ejy
 UPkM7rocGEPnczU141FqREe0DwcyLwNzJzIQPpmmjllxQgZs3C1pzFtjsaYgavp43Fn1
 wA3T7uxisDdxJrqHrY9QQW88VwKtmDwjNcRTzIJsJUdztZLAjO7AHR400djL681EZZME
 8hbZYhfGbIp2Se3lYasvOTBmC2cb7nYKHL0c/T85puZN7WzlVTN2+FVvPAyx9TmeqNt9
 wIAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dzyby7T/PkPy2j+iTKvR5njyf+A4DchXRxSpi/QKCxo=;
 b=eOtDATytId/+9I24AH/Li974F2+UE9x4gMTYWKmSO3CYIMcUNK+oZDnbAbMZ97LfNY
 c2Ri8Lu3PvCDGR2LcmQfCGwglQnT7aU1X8B0vWiB8lAOPhGx4aIWlTRFyu9z0oz16R0K
 jQ91J7f20vL5SOCDSDXEWxyWxzLVz9oPNMqU1R1fnNlTCSR667RslNrf3Zad2vKgJimk
 EtKBpPAlZAHMXVlLZq+KaBP7a7wf8t0kQ2Z2Xw2ST4eg5QXHeEZpxdksF4DFyezDiZ22
 SUYO4lGj7oxCRDyDMZ977m3zJ3N1Wu8VRkJ2BWOq2KvqtfsBAdEtv77bOi3izyhccn6k
 qboA==
X-Gm-Message-State: AFqh2kqThfRAHaFdXDtskFe6LP3ueJYILJt9eE7mCLhYSlize8vUOBzG
 fwG+2o1q/kfV6pPrz8lGyUylHVtjqwZvOI7Url33atOeVSGsi8hX
X-Google-Smtp-Source: AMrXdXtNkWDqMIPnHwyk4zWalrsKnNckJspmb5gY38Dtqv14lbzNkNkz53RUtCuMsikSz6RGTEaTWrAj2U80jZZbATM=
X-Received: by 2002:a81:570a:0:b0:3d4:f6cb:6dd4 with SMTP id
 l10-20020a81570a000000b003d4f6cb6dd4mr85150ywb.365.1671065871390; Wed, 14 Dec
 2022 16:57:51 -0800 (PST)
MIME-Version: 1.0
From: Christopher Wrogg <cwrogg@umich.edu>
Date: Wed, 14 Dec 2022 19:57:40 -0500
Message-ID: <CAG7Es25jOe_t5u-B+R4Xm3VkYUvdy88ofKb7PzjMfrOov9ozbw@mail.gmail.com>
Subject: CVMSEG Emulation
To: BALATON Zoltan via <qemu-devel@nongnu.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="000000000000a92c4e05efd357e7"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=cwrogg@umich.edu; helo=mail-yw1-x112c.google.com
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

--000000000000a92c4e05efd357e7
Content-Type: text/plain; charset="UTF-8"

Was wondering if there was a follow up to this. Just a recap but I am
trying to map 0xFFFFFFFFFFFF8000 - 0xFFFFFFFFFFFFBFFF into a userspace
process's virtual address space. It falls squarely in KSEG3.

Here is what I have tried

Attempt 1
    What I did:
        #undef TARGET_VIRT_ADDR_SPACE_BITS and #define
TARGET_VIRT_ADDR_SPACE_BITS 64
    The Result:
        perror reports "Cannot allocate memory"
Attempt 2:
    What I did:
        TARGET_VIRT_ADDR_SPACE_BITS for me is 48 on amd64 so I masked by
0xFFFFFFFFFFFF
    The Result:
        perror reports "Cannot allocate memory"

--000000000000a92c4e05efd357e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Was wondering if there was a follow up to this. Just a rec=
ap but I am trying to map 0xFFFFFFFFFFFF8000 - 0xFFFFFFFFFFFFBFFF into a us=
erspace process&#39;s=C2=A0virtual address space. It falls squarely in KSEG=
3.=C2=A0<br><br>Here is what I have tried<br><br><div>Attempt 1<br><div>=C2=
=A0=C2=A0=C2=A0 What I did:</div><div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 #undef TARGET_VIRT_ADDR_SPACE_BITS and #define TARGET_VIRT_ADDR_SPAC=
E_BITS 64<br></div><div>=C2=A0=C2=A0=C2=A0 The Result:</div><div>=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perror reports &quot;Cannot allocate memo=
ry&quot;<br></div></div>Attempt 2:<br><div>=C2=A0=C2=A0=C2=A0 What I did:</=
div><div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TARGET_VIRT_ADDR_SPACE_=
BITS for me is 48 on amd64 so I masked by 0xFFFFFFFFFFFF<br></div><div>=C2=
=A0=C2=A0=C2=A0 The Result:</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 perror re=
ports &quot;Cannot allocate memory&quot;</div></div>

--000000000000a92c4e05efd357e7--

