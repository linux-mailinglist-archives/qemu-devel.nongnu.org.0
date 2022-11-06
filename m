Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA11861E692
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Nov 2022 22:30:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ornCS-0005L7-51; Sun, 06 Nov 2022 16:29:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ornCQ-0005Ku-DD
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 16:29:02 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ornCO-0004F8-Rv
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 16:29:02 -0500
Received: by mail-pj1-x1036.google.com with SMTP id o7so8893308pjj.1
 for <qemu-devel@nongnu.org>; Sun, 06 Nov 2022 13:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fkDXzz28NjRzlTJOFYmBkKuiC/yT5mUlXIO5xumc7Co=;
 b=HA35fM7dV+eClpruwUqVylv/oRbOkcQ//nlLm3C9pkl+HpeuM6x8fFRRh0G40Y+7KC
 LzJdPbNJcg6JIyz2HEGl3pMwLhMsF4xVTK2GxJ0Tz4DEpMIxGQEbqFhgBPnlNhFh1f+W
 ewyrlBKqjjrQ5g4HdN2b4OwmgENm37iYi+b8bnK/lVL6n86TQVdiYi3DQB7Bggdrl3o2
 rcQTp2sP5fNmimp1UPLSxzDPa/D9r1i3aoyAhqfA5qjkWw2TkBFlmlHil/qWlgHMe+HB
 NAc9+l443k0udhdccUL/hSXUArN8qz0QzsBJXucgMlo+qeM8wMmrO3Cjl7c2VyINBRqp
 RPGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fkDXzz28NjRzlTJOFYmBkKuiC/yT5mUlXIO5xumc7Co=;
 b=lRAvwIeHWXGTCzUozeiNnCtC06F8xOAOzhYqdEG2m9DaPbZppR6wmM+p7hn4dHwrqb
 moB3mP1y0c/HQrkemmYiy8QDnqZJrAPWTuQXMxqmTqmU9A/KId5GPmv3wQ0yiRtfit3v
 3zL0AQvwVN+xChg5KoY09o9lUaFeorNIUdQfv0V5Alj7NEQZNN5PF/6L9IGyBiHQZGNm
 HoUrCBct57l/TraK3Eaj6GaY9CgfWYTkUhPJGVqeZj0oE7fPf3YJCWYS1e3KRq+tXqwo
 fVFtrvPVtCvLBs/9RVDo0jJAHFA/WmDivfEIGEP+ejpJdFXCQouzUO9JwZvW4r1ffFNa
 4k5w==
X-Gm-Message-State: ACrzQf3buYcpefCT3uGaKjIv4KnYmlXn/i/FJyc2Hn4VC1GZuPV+k44W
 lRzOLZmFbhuf4pUgONsrekixVLFcxPdeH4wM
X-Google-Smtp-Source: AMsMyM76WFI9hHA4016ub3bK5pC8+7eQRPVDPKmPQQkWkD1SRcv+cbakKvViEKDdBktbeb1crWFGww==
X-Received: by 2002:a17:90b:1c88:b0:203:8400:13a9 with SMTP id
 oo8-20020a17090b1c8800b00203840013a9mr49067698pjb.46.1667770138503; 
 Sun, 06 Nov 2022 13:28:58 -0800 (PST)
Received: from localhost.localdomain ([2001:8003:d918:7a00:f28:fa55:3b51:3624])
 by smtp.gmail.com with ESMTPSA id
 20-20020a621914000000b00563ce1905f4sm2998746pfz.5.2022.11.06.13.28.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 13:28:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: balaton@eik.bme.hu,
	philmd@linaro.org,
	sw@weilnetz.de
Subject: [PATCH v2 0/6] Two -Wclobbered fixes, plus other cleanup
Date: Mon,  7 Nov 2022 08:28:46 +1100
Message-Id: <20221106212852.152384-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Stefan reported for accel/tcg, and I reproduced on Ubuntu 22.04.

Changes for v2:
  * Incorporate suggested changes to nanomips.c (phil, balaton).


r~


Richard Henderson (6):
  disas/nanomips: Move setjmp into nanomips_dis
  disas/nanomips: Merge insn{1,2,3} into words[3]
  disas/nanomips: Split out read_u16
  disas/nanomips: Tidy read for 48-bit opcodes
  tcg: Move TCG_TARGET_HAS_direct_jump init to tb_gen_code
  accel/tcg: Split out setjmp_gen_code

 accel/tcg/translate-all.c |  68 ++++++++++++-----------
 disas/nanomips.c          | 110 ++++++++++++++++----------------------
 tcg/tcg.c                 |  12 +++++
 3 files changed, 90 insertions(+), 100 deletions(-)

-- 
2.34.1


