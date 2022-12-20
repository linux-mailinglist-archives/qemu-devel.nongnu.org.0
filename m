Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D77651F67
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 12:05:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7aPF-0000fU-IE; Tue, 20 Dec 2022 06:03:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7aP0-0000aM-Ok
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 06:03:20 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7aOx-0002Ff-Ox
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 06:03:18 -0500
Received: by mail-wr1-x42d.google.com with SMTP id bx10so11418847wrb.0
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 03:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fPmO79giYZzgVoPI/GK7FFkiLhjSBTX80hRxj5reGpE=;
 b=JtQt8o0Uvfl+5a8lKDZ0G5urocXjf7pdOmapsI+uQjX20JwkQQNDHpTQKbBUVvSBVL
 y+0g2aA61s98h3zN2o4k+iE5QlxSWSDTTcgJlwu9z8DymYWYT6goGlMVTGxCu7QFCahp
 SQ2ci0Ml0Snldje5/ePa7bwaJuLajKE8LsNkIgbbqSh5pXGwjFhUjQZYjvPZ3CgN/whl
 7iPuQlpvz2dWZOOBJFsGQEGGAzhs9oqCBtMmF9rkBulnsbPA7TB+ZxSTR9vICVdF1eJT
 VoOMDpK5fsV4RHIR9TiD2760UIGY8Ef6lYHGTZpflXZaKIaBHtOHjHVo8FQFBbSVXusF
 YRDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fPmO79giYZzgVoPI/GK7FFkiLhjSBTX80hRxj5reGpE=;
 b=lggb2St1GJedXyMt9PlgRiZDbt+mNX54SBFMOziELjLgRIctFl68dso1O5vbjLfAuX
 JpdhJC9q31vwbf10ZHmwkDkz1fbq8faHrYZrORwgKXrhTH6o7nSsSSCdAY55t4s4QfOK
 u9iqhhVnx73ODuChOxFJENkQj+jfV1OGGF/CdJ7nNfC+PY+WtUMSYYD0l0/oJ+VS31dT
 +NtQ15cbG5PzsKA3EurY9Q80Kms8J6AWN30xO8WJmVyePOiEwLxHbvwLrhTLcgrLsyH8
 VINY57E3OI5VTSyOmc97K2kO8FffbFuPl3EgvZWCIWA6gH8/GoRv/2uVA95Dl+Lco+ux
 be2Q==
X-Gm-Message-State: ANoB5pkmQXqR7xYw3DxGfTUHQIfIH+FLrqZ4bTTv2a/U5vjCsMnObPth
 qaLcOIGccTZfFuy45KR8G7+QWnjqm7dtUCF3ltc=
X-Google-Smtp-Source: AA0mqf5hYynypRuAOpVeWo6KOI62UTJYkXWMBCeV56KaHqYgN3St/P01yvvHYyY/JJtKlVmJ9f4mPw==
X-Received: by 2002:a05:6000:15cb:b0:242:fa3:3825 with SMTP id
 y11-20020a05600015cb00b002420fa33825mr35987048wry.37.1671534193513; 
 Tue, 20 Dec 2022 03:03:13 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 f2-20020a5d50c2000000b002362f6fcaf5sm12315814wrt.48.2022.12.20.03.03.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Dec 2022 03:03:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Song Gao <gaosong@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-arm@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v2 0/5] target: Restrict 'qapi-commands-machine.h' to system
 emulation
Date: Tue, 20 Dec 2022 12:03:05 +0100
Message-Id: <20221220110310.8656-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

All series reviewed, can patches be picked by corresponding
maintainers?

The "qapi-commands-machine.h" header is not generated in user-only
emulation. This series removes its use in user-emu code by moving
the QMP code depending on this header into a separate sysemu unit.

Since v1:
- renamed cpu-monitor.c -> monitor.c on loongarch

Philippe Mathieu-Daude (1):
  target/i386: Restrict 'qapi-commands-machine.h' to system emulation

Philippe Mathieu-Daudé (4):
  target/arm: Restrict 'qapi-commands-machine.h' to system emulation
  target/loongarch: Restrict 'qapi-commands-machine.h' to system
    emulation
  target/mips: Restrict 'qapi-commands-machine.h' to system emulation
  target/ppc: Restrict 'qapi-commands-machine.h' to system emulation

 target/arm/helper.c            | 29 -------------
 target/arm/m_helper.c          |  1 -
 target/arm/monitor.c           | 28 +++++++++++++
 target/i386/cpu.c              | 74 ++++++++++++++++++----------------
 target/loongarch/cpu.c         | 27 -------------
 target/loongarch/meson.build   |  1 +
 target/loongarch/monitor.c     | 37 +++++++++++++++++
 target/mips/cpu.c              | 29 -------------
 target/mips/sysemu/meson.build |  1 +
 target/mips/sysemu/monitor.c   | 39 ++++++++++++++++++
 target/ppc/cpu-qom.h           |  2 +
 target/ppc/cpu_init.c          | 48 +---------------------
 target/ppc/monitor.c           | 50 ++++++++++++++++++++++-
 13 files changed, 197 insertions(+), 169 deletions(-)
 create mode 100644 target/loongarch/monitor.c
 create mode 100644 target/mips/sysemu/monitor.c

-- 
2.38.1


