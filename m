Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1C764FB52
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 18:35:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6b3C-0005Jg-Ie; Sat, 17 Dec 2022 12:32:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6b2y-0005G4-Tv
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 12:32:29 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6b2w-00033D-RM
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 12:32:28 -0500
Received: by mail-ed1-x52e.google.com with SMTP id i15so7720238edf.2
 for <qemu-devel@nongnu.org>; Sat, 17 Dec 2022 09:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kbGURhtR8kiPArPuIT7PtMe0pr4vn6MOSPaHAOblqTo=;
 b=X42yMpZbqBt1ligOxwOtHZyOGNZQWia47HTXl8TXzAPSfGROnkIkwBYR6ifl6KhP2W
 ExfT6GUvST9IgwnuSJSLnlVQqlmf/LSavah3MbKBKtuLAnUAhfH18xQTyVWnxcU01rTi
 ImQY15BTpP/vx26odW+VWYjOE1A0F+x/o683sKWqbkW+nQ77mO7dq62hBEwydjJly585
 V8ZeMWcvgAyVoOxa/Vg8Pkeu/RwEl74FlFT2F47Tn3a9+rI6aP9tj73323kirYyyk3K6
 7CDBg42VTf/h1HogXNdOIdFJ8MUb2CXdvGv69cPvuRsjTFEVvRbKYGL81Nh4GOc0bbmo
 DWXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kbGURhtR8kiPArPuIT7PtMe0pr4vn6MOSPaHAOblqTo=;
 b=m/VjZiSPt1U7QyXboRIxDiXB9LeYwsztVrqvTpE5a3ua2p68BPiDEcg/QNP/QBy3+d
 kPFtg6FYZht+Q77M5nQciH3WAyGN6euTBWHvLiIszxTz9fFMyg8iHmkwzBFUbbjEcmlB
 PonlIM9qXVFNmQ4fwx6FF6FA87o35w8GqkzGP6Bb2y/1mj0kQTqEOZMqa0mTteImCK5Z
 3xwo/IkD0PYg8VHepJtQoIz410KZfgtetuAHVJ+gA4NTnyjWTnrv06aqUhhlZtM7uj7u
 9lu2XV5Xgq7YwV8t0BwiC/wVzwwV9AG345cn73C/HV82ctKqiJI+bbvXg4qUmTH0bx+/
 nxQw==
X-Gm-Message-State: ANoB5pnZNyG+DAicv8XLonoXrG4Rg918t5CAYzXATwxP48Gb9SPcbDu+
 QL5rDJh5GvU8k6jCOhbYh/3N3+fsnkCUzpcArdQ=
X-Google-Smtp-Source: AA0mqf6l7ojP0+UE1QcPeJ+T+Q/wVcwd/6eIVN0wLK+kt2IlvtQt2vABN+SehVbCeVez0N0RVyoCiA==
X-Received: by 2002:a05:6402:2401:b0:45c:834b:f293 with SMTP id
 t1-20020a056402240100b0045c834bf293mr36278567eda.16.1671298344212; 
 Sat, 17 Dec 2022 09:32:24 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 da15-20020a056402176f00b004615f7495e0sm2211580edb.8.2022.12.17.09.32.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 17 Dec 2022 09:32:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/2] target/hppa: Extract System/FPU helpers from op_helper.c
Date: Sat, 17 Dec 2022 18:32:17 +0100
Message-Id: <20221217173219.8715-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52e.google.com
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

Extract 500 lines of op_helper.c into 2 new files: sys_helper.c
and fpu_helper.c, easing my life with "cpu.h" header cleanup.

Philippe Mathieu-Daudé (2):
  target/hppa: Extract FPU helpers to fpu_helper.c
  target/hppa: Extract system helpers to sys_helper.c

 target/hppa/fpu_helper.c | 450 ++++++++++++++++++++++++++++++++++
 target/hppa/meson.build  |   2 +
 target/hppa/op_helper.c  | 504 ---------------------------------------
 target/hppa/sys_helper.c |  99 ++++++++
 4 files changed, 551 insertions(+), 504 deletions(-)
 create mode 100644 target/hppa/fpu_helper.c
 create mode 100644 target/hppa/sys_helper.c

-- 
2.38.1


