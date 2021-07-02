Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F5A3BA304
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 18:02:17 +0200 (CEST)
Received: from localhost ([::1]:47474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzLcO-0005Xa-Ep
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 12:02:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzLZK-0002w6-Sg; Fri, 02 Jul 2021 11:59:06 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:39682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzLZJ-00049h-Ci; Fri, 02 Jul 2021 11:59:06 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso9407075wmh.4; 
 Fri, 02 Jul 2021 08:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jZ+Cy9X1+1MHEH2q3A9NyO8pX06fh1A0AsPvui5QDSg=;
 b=IjqeEi2n8NPsVk51YeUcAKkARcsLkPuwfT9lKdj/MniD8cO1xO04iNWImyVBUzQ9t3
 WXV1VOoXlef2zi4kC7fYH7R98p0pPgQ01FtCNkBicj1rX2O8FBfbCn0EzYWgKRl1H2gM
 Kr5cBF7zDA335J9G8rfz2cyr/MZqyzO2D0I8PByK9UA9vWVzjl4IjmNPugdF6W6zWOS6
 MDu9FmtbBXepz5TcMGrBJF//9kbOF2hxRqd31B02oBsSySvc/YGV5Uu/QAruumhuZtbc
 DmBsTQyt9PZA6sB80u+15tAzozYGUU5DcFug6//KjAu1mIh/gB31WfB8mjjyZRl2ExKx
 DWnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=jZ+Cy9X1+1MHEH2q3A9NyO8pX06fh1A0AsPvui5QDSg=;
 b=HsMQMGotykQmE4Qi3yQ8neRZGuiuB9uQcU8evwS5LmA+fTFeuT+TsqtpaJrLLyHF31
 6gPicxl30kMbFyzXE5P6wVzKPp72KajXIL3XYqRovYAGVzn6EM+T5Ls8qvvRieWm9B1K
 tSDD7qVLF1nLK7BiQ9wggGPRJmNA9arjwqi1aqmnIwTfOubrq7dJMKfSDqGGV6Z/EkIX
 3o3fUwewuIB49vsgLlV7yOo4svpbyDjPfjwLyxpLrHA0LsthL7lp8DljPNHoW+PxOZQX
 beUCJMR1OLJ7DyOfdFM5ycpt8PyZTdg1IRDU8f9AHwsJ8pPJ0hgUfOD8oCC7Slrtclmr
 oLsw==
X-Gm-Message-State: AOAM5336PF64L2KtC1OEmLZgOMwoyhnzINB7XAMggwl4u13+VzpGJAc5
 9IFwRq2hv8nC7nOeWe3aVkwaWdF8yu86GA==
X-Google-Smtp-Source: ABdhPJzEXekvEY56o4UAf+F0Q7rKD1+yKyF8lu627gcqr/mwvbUFzKmVZpuAz153VTTKG6Lbog/VHg==
X-Received: by 2002:a1c:f616:: with SMTP id w22mr159230wmc.131.1625241543216; 
 Fri, 02 Jul 2021 08:59:03 -0700 (PDT)
Received: from x1w.Ascou-CH1 (pop.92-184-108-23.mobile.abo.orange.fr.
 [92.184.108.23])
 by smtp.gmail.com with ESMTPSA id s7sm3595055wrp.97.2021.07.02.08.59.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 08:59:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] hw/sd: Check for valid address range in SEND_WRITE_PROT
 (CMD30)
Date: Fri,  2 Jul 2021 17:58:57 +0200
Message-Id: <20210702155900.148665-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alexander Bulekov <alxndr@bu.edu>, Michael Olbrich <m.olbrich@pengutronix.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Trivial fix for https://gitlab.com/qemu-project/qemu/-/issues/450=0D
=0D
Missing review: patch #3=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  hw/sd: When card is in wrong state, log which state it is=0D
  hw/sd: Extract address_in_range() helper, log invalid accesses=0D
  hw/sd: Check for valid address range in SEND_WRITE_PROT (CMD30)=0D
=0D
 hw/sd/sd.c                     | 40 ++++++++++++++-------=0D
 tests/qtest/fuzz-sdcard-test.c | 66 ++++++++++++++++++++++++++++++++++=0D
 MAINTAINERS                    |  3 +-=0D
 tests/qtest/meson.build        |  1 +=0D
 4 files changed, 96 insertions(+), 14 deletions(-)=0D
 create mode 100644 tests/qtest/fuzz-sdcard-test.c=0D
=0D
-- =0D
2.31.1=0D
=0D

