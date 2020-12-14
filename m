Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F74E2D9B0B
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 16:33:20 +0100 (CET)
Received: from localhost ([::1]:41374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kopqg-00011j-Up
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 10:33:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kopnn-0007en-OH
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 10:30:20 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:37081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kopnk-00064c-OU
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 10:30:18 -0500
Received: by mail-wr1-x441.google.com with SMTP id i9so16844869wrc.4
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 07:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ejBoa35NvmJdoqdjO2U6bmOxkDwtFjD8jBAiwm3jgj4=;
 b=QZcyRRVj07exTksozA6MU6shlczZLFbjZf/sYA4zHxmuvKR+cq9pkECO8v2szprPUU
 LksNWMosu1kJGN/I+tJJ9V2zUrLg8Aph67TgjhmhJshbaswTv2siIn0np4Y+zbDVKfLl
 pRwb7dTmp821+Jf4Fk8/jwhQ3itZdhMWEPt6lcIchta2OroQUSAhWchxPwiZ+XD475tV
 oNTYOCzYQi4OzW/04H+AH61rDuuvQkEjZ0zAJXIQPB3oWL0JPmcPUSfFOtm6pgB+sRXp
 6LO3Tk1Ol2VLpyazLuqS71CGGLAY4o/SpjzE3qXOJHpTFcHY8aLcY6o5EfepaInTZaai
 MPxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ejBoa35NvmJdoqdjO2U6bmOxkDwtFjD8jBAiwm3jgj4=;
 b=jF52koKm074rjGy9F5V82TEjoyirXez35E1+NKu9tAJJ9UgISdFDBl/qiSNDNkAKE2
 9Hj1zzA6p7rvAzTW6CwhEt43eSZRH9L82x2/PnHswbl6GNXx2M1AdyYsiSj1ux4jC4NI
 l11kUEI86o/u5WZwR7X9FwgmKCH4Y4bQTQ3l+h0UJ8sDNcNa502ggQn00qmaPMc6QwZe
 mmuZkXhqmvVh9vepxn+N8Y+5CSHT+XLckb8Xt7Um5vku67mYTc3jWz3q1d+FXGx6pOu/
 nzrxGcKlNTrXUkeSthM+UUd9BCDmdX1+k21lk6qsPoHURXnSwhUDzF+TTuC0jb9NUgk4
 MDug==
X-Gm-Message-State: AOAM533LNSJHXhVG9rRMW5KfxrE942bPm3TcVf+Fi5D/oSibfqOefh1z
 gXKfD7Wh9nKSQ0AjlaElVmRZTw==
X-Google-Smtp-Source: ABdhPJwjjpHCsK/PuXVKBdUgclh/mvW1a7gjVOWZdtwUmR5jEivRaQb+ofSS3Qx66X311tBeE0tbzA==
X-Received: by 2002:a5d:4307:: with SMTP id h7mr12303897wrq.353.1607959815058; 
 Mon, 14 Dec 2020 07:30:15 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v189sm32582798wmg.14.2020.12.14.07.30.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 07:30:13 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AB1AF1FF7E;
 Mon, 14 Dec 2020 15:30:12 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 0/6] gdbstub (auxv, tests, cleanup)
Date: Mon, 14 Dec 2020 15:30:06 +0000
Message-Id: <20201214153012.12723-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x441.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I realised I had a pending gdbstub fix in my trees and then
immediately ran into a bunch of minor niggles after looking at a gdb
failure Peter ran into. The upshot is I've just hard gated the gdb
tests to a more-recent than most distros version of gdb which
hopefully involves less faff. I also did a bit of clean-up to the
handling of cleaning up while I was at it. 

Please review.

Alex Bennée (5):
  test/guest-debug: echo QEMU command as well
  configure: gate our use of GDB to 8.3.1 or above
  gdbstub: drop CPUEnv from gdb_exit()
  gdbstub: drop gdbserver_cleanup in favour of gdb_exit
  gdbstub: ensure we clean-up when terminated

Lirong Yuan (1):
  gdbstub: add support to Xfer:auxv:read: packet

 configure                                     |  7 +-
 include/exec/gdbstub.h                        | 14 +++-
 bsd-user/syscall.c                            |  6 +-
 gdbstub.c                                     | 65 ++++++++++++++++---
 linux-user/exit.c                             |  2 +-
 softmmu/vl.c                                  |  2 +-
 target/arm/arm-semi.c                         |  2 +-
 target/m68k/m68k-semi.c                       |  2 +-
 target/nios2/nios2-semi.c                     |  2 +-
 MAINTAINERS                                   |  1 +
 tests/guest-debug/run-test.py                 |  1 +
 tests/tcg/multiarch/Makefile.target           |  9 ++-
 .../multiarch/gdbstub/test-qxfer-auxv-read.py | 57 ++++++++++++++++
 13 files changed, 148 insertions(+), 22 deletions(-)
 create mode 100644 tests/tcg/multiarch/gdbstub/test-qxfer-auxv-read.py

-- 
2.20.1


