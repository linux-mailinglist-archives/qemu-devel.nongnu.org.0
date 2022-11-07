Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D0D61E8B2
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 03:48:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ors9d-0004hS-DJ; Sun, 06 Nov 2022 21:46:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r@hev.cc>) id 1ors9V-0004gs-1o
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 21:46:21 -0500
Received: from mail-pg1-f175.google.com ([209.85.215.175])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <r@hev.cc>) id 1ors9S-0003OD-7t
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 21:46:20 -0500
Received: by mail-pg1-f175.google.com with SMTP id 78so9239703pgb.13
 for <qemu-devel@nongnu.org>; Sun, 06 Nov 2022 18:46:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yv9YJAtgAytBdMlI9+2ZdMjHLzNijlTzUWAlgWfnjxU=;
 b=E6ZAEbDNALEANibsVjteG8RVu8EDBaQM79tg3TRyZIqaFb5pl3g3pFVkUBQ8i/X1DE
 kb7eJww0wiwrsYcZHJmLOSZUQz8ctUIcMDhseq38GufHC9hBrWMJgezQ/FW/AXRcurKB
 cmiBv/1bIoj6Ncz6dF6jxk0p5C84nm7qaOQOFvw65oQTvKBr/xju4AizM+Mc7pwDwVu6
 kN0l0G2eJCnimf+FGvq3QW++nsnZqeHhOdsOazTD0xyQ3BPl0RKdRFbdDMpzwmKDunuH
 GSPZxiuiAdWqrbjibH+Y7u7fvJaPxeiVCDZx+RzVqeCaR4Y66VQlfMfVN6XuP6NLgXWW
 00xQ==
X-Gm-Message-State: ACrzQf0GrB266ZZvSzK+lK3UbOGO0CvFDp9H6mzxNG6g3F8MJic+h05n
 S1ykGMSp2T4RsBXv/m1NUIlUijZoYl+ib7X/
X-Google-Smtp-Source: AMsMyM7Qb3psH6KE0YRWhaipHA+LudefbYcuHl/U2Ri8WQEMGpQ7RdaK1tKoDS/4N+E7PpDWep0dMg==
X-Received: by 2002:a63:cc43:0:b0:43a:2f12:d326 with SMTP id
 q3-20020a63cc43000000b0043a2f12d326mr40944947pgi.320.1667789175978; 
 Sun, 06 Nov 2022 18:46:15 -0800 (PST)
Received: from localhost.localdomain ([2400:8901:e002:5400::])
 by smtp.gmail.com with ESMTPSA id
 d1-20020a170902cec100b001887e30b9ddsm1284192plg.257.2022.11.06.18.46.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 18:46:15 -0800 (PST)
From: Rui Wang <wangrui@loongson.cn>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>, hev <qemu@hev.cc>,
 Rui Wang <wangrui@loongson.cn>
Subject: [PATCH 0/2] Updates emulation of float-point to v4
Date: Mon,  7 Nov 2022 10:45:24 +0800
Message-Id: <20221107024526.702297-1-wangrui@loongson.cn>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.215.175; envelope-from=r@hev.cc;
 helo=mail-pg1-f175.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Regarding the patchset v3 has been merged into main line, and not
approved, this patch updates to patchset v4.

Link: https://lists.nongnu.org/archive/html/qemu-devel/2022-11/msg00808.html

Rui Wang (2):
  target/loongarch: Separate the hardware flags into MMU index and PLV
  target/loongarch: Fix return value of CHECK_FPE

 target/loongarch/cpu.h                         | 18 +++++++++---------
 target/loongarch/insn_trans/trans_farith.c.inc |  2 +-
 .../insn_trans/trans_privileged.c.inc          |  4 ++--
 target/loongarch/tlb_helper.c                  |  4 ++--
 target/loongarch/translate.c                   |  5 +++--
 target/loongarch/translate.h                   |  3 ++-
 6 files changed, 19 insertions(+), 17 deletions(-)

-- 
2.38.1


