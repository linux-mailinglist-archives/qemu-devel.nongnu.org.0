Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F38C761DFC2
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Nov 2022 01:17:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orTKQ-0006iA-B4; Sat, 05 Nov 2022 20:15:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1orTKM-0006hl-Vw
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 20:15:55 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1orTKL-0004Zf-DW
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 20:15:54 -0400
Received: by mail-pg1-x535.google.com with SMTP id q1so7432881pgl.11
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 17:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jdnFHauPkSCiIGvbV+aHkdHdVyCgoUHZ4KntkR664YI=;
 b=aL9S2nFPjou5eaXH61OHLlGK56OwUBrI4zII+m2MMOWfvGUNgj0GOEdR6BDXypsjMf
 kKU9dJrrF4Rdb59dltQv3jI/i+LOAfdo2Zmfl4OgXW/uM3XmxX0uVoGpp7VTtAeHSINo
 8wUjqxpe0bKntJWCCCdIOpeO55+9AcshVkVU/PU1f1+wQ+Keqq/5qn8z0jSInH245Osj
 zcMMRtKcLDdCGeha84QcFUPj++nCDT9Bz8sXLrJ30qjKqtYS+2hqvIFk3AI8esLahw4c
 vcSUnVOeZvE5ypv5Rc4GaAK8h6ZV3ipcJr47pzS++hCgDVCoDGVemKCDH3zUR3qpiutb
 eV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jdnFHauPkSCiIGvbV+aHkdHdVyCgoUHZ4KntkR664YI=;
 b=q3Rk5nl6nrnZ2DmvrOubNLv9AH4/68gTC+zZlvP0Ck/7MBsLCo8NvJnePf5AuCqJPP
 TAx0GVhcDghLA5Js9s3oB2JkWzDRyskyC7EtBokVKekpdoRufkQnNznXS0Pqwom9jjYs
 rpixMlk9eh8fpx+FlsuSNhGtAPFIKZ3hCYFadxt5Q/JJQwV1UrD1R6lca4MhasrgElBg
 GquMmElkzsh0qxHTngG3cczWvItwUGMw15TtkQDAmxFqT9LNU8Z/8438iRVHh/N/2J/5
 JQKtmrq6J2WSTvPX5CV0SDk0NWkUIv4PSuUGqTPOonsKZ78sqPzHeyywOPh6ihnpcvgu
 0fvQ==
X-Gm-Message-State: ACrzQf0PPSfSK9QrKztalDukdJhED1SG1j1P6UB13Zkgu/CO8KKt0JBQ
 pX3TaCruPPlMjAwhLCqTre4VDb8+ZZ7a8A==
X-Google-Smtp-Source: AMsMyM5rwa5V2MkhKFPQ42UOwHH1hcRzVXIv3ghaUYf7mNNyyniGkTAw5S3pTcXcfdINAd3EbXkH6Q==
X-Received: by 2002:a63:4420:0:b0:470:89:8e7c with SMTP id
 r32-20020a634420000000b0047000898e7cmr20498007pga.150.1667693750776; 
 Sat, 05 Nov 2022 17:15:50 -0700 (PDT)
Received: from stoup.. ([172.58.27.185]) by smtp.gmail.com with ESMTPSA id
 b6-20020a170903228600b00186b0ac12c5sm2192692plh.172.2022.11.05.17.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 17:15:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org,
	sw@weilnetz.de
Subject: [PATCH 0/6] Two -Wclobbered fixes, plus other cleanup
Date: Sun,  6 Nov 2022 11:15:33 +1100
Message-Id: <20221106001540.108571-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

As reported by Stefan, and reproduced on Ubuntu 22.04.


r~

Richard Henderson (6):
  disas/nanomips: Move setjmp into nanomips_dis
  disas/nanomips: Merge insn{1,2,3} into words[3]
  disas/nanomips: Split out read_u16
  disas/nanomips: Tidy read for 48-bit opcodes
  tcg: Move TCG_TARGET_HAS_direct_jump init to tb_gen_code
  accel/tcg: Split out setjmp_gen_code

 accel/tcg/translate-all.c |  68 ++++++++++++------------
 disas/nanomips.c          | 106 ++++++++++++++++----------------------
 tcg/tcg.c                 |  12 +++++
 3 files changed, 90 insertions(+), 96 deletions(-)

-- 
2.34.1


