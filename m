Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61532309D4C
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 16:15:28 +0100 (CET)
Received: from localhost ([::1]:60656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6ERi-0003yB-RL
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 10:15:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6EQb-0002cd-IF; Sun, 31 Jan 2021 10:14:17 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:40463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6EQZ-0006iF-Kt; Sun, 31 Jan 2021 10:14:17 -0500
Received: by mail-wr1-x42a.google.com with SMTP id c12so13855013wrc.7;
 Sun, 31 Jan 2021 07:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Tau/sJuxIvYCq+2aNAnlvFVViJN2yuLitklopPIVzDY=;
 b=TtWZB8/t2fGCTKPS9HwAzJglAjEs3XhKNgQ10V6CGv/IVr2o4NQWZSxN4e/9qWsQr/
 s7c+vSi0yTUrpWbYHyA6LuZ82fgKj4MzZZIDqP15vj7/2W6qSEcrMUI6CpomFOYcBCZP
 4ZD/V0TegzVx382HwYrfnONiumFDbruq3vHNLUd2rommJNCsfmM9bDonINn2UsllBbjJ
 hp2vrE34cF1ZnDFgRQAlXNlStJRO1RYlH8MaDzKQUY46qEDK+nQJHtR8Ym/jcA1Tr+xx
 BnUwm2+p6gqip7L0BJLPHJk7zvgfDbHIr+Uqr19agZdfydwDpGjESuvORj4VxqcKWNNh
 jW6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Tau/sJuxIvYCq+2aNAnlvFVViJN2yuLitklopPIVzDY=;
 b=AgHb7sufZma/iV3h7qw53Km5hb6efz+ThTVFZQNGftlnVkpL5YcGJ+j6A1M/gCj+m3
 DrXn/VW/xsmhQsSOQGrhPW2OEg6fm7P4pxcfmHHBx+U0p3U85S1Qiktwou15eqhc7c4N
 MXIfrcUNBx/TZKAotrL/m1bCxkeogpB6hAMo2y7NDejubQpkteM6BV0sGJ7Yne6QO8Yp
 EElmu4V3QhiZ1c7vam/9+UWc9M7RA9ZU3lc9dJq1rVOyRerrG3ku0feeHlLsEKp9Q62I
 DpWkTeFqqnr6m0zdNCY2EdYJxls/mK4VG22U5hv3rCXgjRS7AzZ3KVNqazg6d5CKsWk8
 l2RQ==
X-Gm-Message-State: AOAM532rd9IdtyIGLIWVrc1pCPsEwPUwGbe2BYYht6dKSt1IE0q+H6uj
 qIHZaLAENB44vG9W0AwfIeGxfeqNl2s=
X-Google-Smtp-Source: ABdhPJwIgDlwpI0/S1QdPSb+DE/CDxzfaK+tdTPSaQKdt/hWlLehBqr8egeHHFfgTj0FZ4pV4lbaZg==
X-Received: by 2002:a05:6000:1372:: with SMTP id
 q18mr13720695wrz.280.1612106052749; 
 Sun, 31 Jan 2021 07:14:12 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id t205sm18622237wmt.28.2021.01.31.07.14.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 07:14:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 0/2] hw/arm/raspi: Restrict BCM2835 / BCM2836 SoC to TCG
Date: Sun, 31 Jan 2021 16:14:08 +0100
Message-Id: <20210131151410.318649-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Luc Michel <luc@lmichel.fr>,
 qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter mentioned [*] KVM only support ARMv8 targets. Restrict the=0D
non-ARMv8 machines to TCG.=0D
=0D
While this is still not enough to boot a raspi3 image using KVM:=0D
=0D
  $ qemu-system-aarch64 -M raspi3b -enable-kvm ...=0D
  qemu-system-aarch64: ../../softmmu/physmem.c:745: cpu_address_space_init:=
 A=3D=0D
ssertion `asidx =3D3D=3D3D 0 || !kvm_enabled()' failed.=0D
  Aborted (core dumped)=0D
=0D
This increases the odds to have a KVM-only build pass qtests.=0D
=0D
[*]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg777669.html=0D
=0D
Philippe Mathieu-Daud=3DC3=3DA9 (2):=0D
  hw/arm/raspi: Trivial code movement=0D
  hw/arm/raspi: Restrict BCM2835 / BCM2836 SoC to TCG=0D
=0D
 hw/arm/bcm2836.c | 38 +++++++++++++++++++++++---------------=0D
 hw/arm/raspi.c   | 22 ++++++++++++++--------=0D
 2 files changed, 37 insertions(+), 23 deletions(-)=0D
=0D
--=3D20=0D
2.26.2=0D
=0D

