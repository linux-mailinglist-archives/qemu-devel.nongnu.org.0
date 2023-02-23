Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 174146A0D5C
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 16:56:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVDwn-0005Kz-Fn; Thu, 23 Feb 2023 10:55:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVDwh-0005Je-Uv
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:55:47 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVDwf-0004LW-5D
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:55:47 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 j19-20020a05600c1c1300b003e9b564fae9so5150947wms.2
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 07:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TsseaSdT9PbH8TX+zXaKELUHDz1s5Vbz0ij/dFWewlU=;
 b=MtcxiP1NmEGmiJyR6JkmZP8UqfuOewwr/kAafFrcNuCVG98XgnMzijRgfgeNjjKVJZ
 DT5lNv0pkIysWNcvbehxk+GsQZXNStc6YUicu5loTkGXsooUrdU7g2CBkhf5wljVUgTY
 oOoaHEfLhuunySKjB3+hS96htinj5U4ogRAmRsuMqyp+URtAztX0wbDgOfGmWTij7txh
 7Evwpun2MoFQRSF2C2Xz4A1XI/56W6CHhynCrCKw1fWmzstfF2uFs82Rrs1aCJhfhQ3j
 XmryBRMJaBYqnThA+dleicWHDtc6mrdAxiTh+sYx/X57hlUzdodwGvV6NQ6ohknycwrB
 sMVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TsseaSdT9PbH8TX+zXaKELUHDz1s5Vbz0ij/dFWewlU=;
 b=mUETBdJxmLjld3B9KwJbcE43Vt+lLYTiqjfd/jj6oy3QWi1nZuQmWzaFadnqDjJWqA
 NSrNi4eyDFrKbqxahg32jIzzT0VtqnFljUb5W8NwaIikGo9aRLNsx7UqulyOryVAoTTr
 QOQ7MXg1oAC02VBhG1byowaKfZSNatuXCPPyEj4BKaYBz1rHRjoPr5r0OHKF064+UIle
 12NBP7xgxl79lYuEYcj61E0McPJ3G748TvvnLsKvn7J9jew6Lryl94xzcDnWK0xn37Ci
 WaoaoQC6VOH0t97Xo3sYmYQXDXnhcDTvJ2RUmMfjgs160TSUtFhk5BmCQuVhmp4lq0sW
 aP6A==
X-Gm-Message-State: AO0yUKWMq4kOJkp7AftJQWBL76EHn7SCq+4/4wSO/aCkOjuJdqF2Is3I
 AQnrTORc1EFhvWQSm8s0eiEOAw==
X-Google-Smtp-Source: AK7set8b1JjjPkzwLDkj+u8xKT7KkaVEnhkvdZREjR3hIuOezSg45Xudbk4uBZe6rYY1Yep1xwJmPw==
X-Received: by 2002:a05:600c:a694:b0:3da:1f6a:7b36 with SMTP id
 ip20-20020a05600ca69400b003da1f6a7b36mr9346583wmb.0.1677167743296; 
 Thu, 23 Feb 2023 07:55:43 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a05600c451000b003dc5b59ed7asm13461379wmo.11.2023.02.23.07.55.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Feb 2023 07:55:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Peter Maydell <peter.maydell@linaro.org>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 0/4] target: Restrict 'qapi-commands-machine.h' to system
 emulation
Date: Thu, 23 Feb 2023 16:55:36 +0100
Message-Id: <20230223155540.30370-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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
maintainers, or should I include them in on of my PRs?

The "qapi-commands-machine.h" header is not generated in user-only
emulation. This series removes its use in user-emu code by moving
the QMP code depending on this header into a separate sysemu unit.

Since v3:
- Addressed Markus' review comments

Since v2:
- Rebased
- Renamed target/$foo/monitor.c -> target/$foo/$foo-qmp-cmds.c (Markus)

Since v1:
- renamed cpu-monitor.c -> monitor.c on loongarch

Philippe Mathieu-Daudé (4):
  target/arm: Restrict 'qapi-commands-machine.h' to system emulation
  target/i386: Restrict 'qapi-commands-machine.h' to system emulation
  target/loongarch: Restrict 'qapi-commands-machine.h' to system
    emulation
  target/ppc: Restrict 'qapi-commands-machine.h' to system emulation

 target/arm/{monitor.c => arm-qmp-cmds.c} | 28 +++++++++
 target/arm/helper.c                      | 29 ----------
 target/arm/meson.build                   |  2 +-
 target/i386/cpu.c                        | 74 +++++++++++++-----------
 target/loongarch/cpu.c                   | 27 ---------
 target/loongarch/loongarch-qmp-cmds.c    | 37 ++++++++++++
 target/loongarch/meson.build             |  1 +
 target/ppc/cpu-qom.h                     |  2 +
 target/ppc/cpu_init.c                    | 48 +--------------
 target/ppc/meson.build                   |  2 +-
 target/ppc/{monitor.c => ppc-qmp-cmds.c} | 50 +++++++++++++++-
 11 files changed, 159 insertions(+), 141 deletions(-)
 rename target/arm/{monitor.c => arm-qmp-cmds.c} (90%)
 create mode 100644 target/loongarch/loongarch-qmp-cmds.c
 rename target/ppc/{monitor.c => ppc-qmp-cmds.c} (78%)

-- 
2.38.1


