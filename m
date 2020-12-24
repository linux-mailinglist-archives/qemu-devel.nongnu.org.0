Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AE82E2910
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Dec 2020 23:47:19 +0100 (CET)
Received: from localhost ([::1]:59584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksZO9-0003X7-Pv
	for lists+qemu-devel@lfdr.de; Thu, 24 Dec 2020 17:47:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ksZMG-0001pd-O0
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 17:45:20 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:53817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ksZME-0008HO-4l
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 17:45:20 -0500
Received: by mail-pj1-x1033.google.com with SMTP id iq13so1689768pjb.3
 for <qemu-devel@nongnu.org>; Thu, 24 Dec 2020 14:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9ChX1pOaiz7khh93G8eDeQw3LGYjBZyUMEUgwN7r3IQ=;
 b=JIXelqrbE3iDdkPtkxxDlZtEtHdAZ4634IG0C9lLlaFUbKt3vsR+lznsBcAr68T77q
 Ppca8YBDnJ4kAFWMrUnsm4s7Qd3gW68jf6+ImmLF65hiHcG/AGBSm9XmtpRoM4NO6vNt
 /u57gJf22BBnp8jgeXRNukw1IrgQac452tbIGZVGQOvvW1dgGoR8QnHfLo1GflY4IdkA
 bhH2sr6Yx1z7ZC7cuabOr9G/p9dOPidnR94M9hAyw1/yIxEnEsAqi6NjuWbo1oCj0IuC
 Viy1yH98otG2QdIpCaR6Qdq0LGYbex5BLhTdmfhLqgYS6XFbc4aIQ5/GJKUGw6Hz4Kou
 azhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9ChX1pOaiz7khh93G8eDeQw3LGYjBZyUMEUgwN7r3IQ=;
 b=Mxe1HGNEbdWohYCPLWROWquMI0dI0vAJVBO7swxXUMIc0IqTr6P7zC8o3MqsSC/32W
 Jg6kJYHD8rnRU6NKsYdS5S1oPIAB+LlA962PzKpxiAi7/GYrxpYOd/qUcECgsCzzsnUO
 DClhyW1YEpZtb6jFjHIPEcBBxFUZb3Ot/w0qKUx1Id+mpLCYbbQ7E33UNtzJcdBWveQ7
 LmUYy90rRYuZcD07f6tyS9jya0x9VjGlYnJWTMa+5Nj69+1enZzrd6hI+fMyWg3AQ8k2
 yRv2R/h82EGS7d1OhOveQ5hPer5rnkcvkS6HeqqmxgXqrQqNbHzIo6nY01KpxPUG3QyF
 f76w==
X-Gm-Message-State: AOAM530q16L6T6OpFxyhBpneldsWNJDR1Tyc4KWldBj2Thc1lbEndNUf
 xsO2ppXO88uvK7YmnYK2GMnkeBbpNjuC0w==
X-Google-Smtp-Source: ABdhPJyvxpZ+sdtHVC08rGlicddudda1aJYThf9TlwXt58ejYhfWM97VPzDK0eD1DeP2hO1OomRe7A==
X-Received: by 2002:a17:90a:4042:: with SMTP id
 k2mr6267015pjg.160.1608849915698; 
 Thu, 24 Dec 2020 14:45:15 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id w11sm11844123pge.28.2020.12.24.14.45.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Dec 2020 14:45:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/15] tcg/arm: host neon support
Date: Thu, 24 Dec 2020 14:44:59 -0800
Message-Id: <20201224224514.626561-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based-on: 20201217145215.534637-1-richard.henderson@linaro.org
("tcg: Better handling of constants")
Based-on: 20201223060204.576856-1-richard.henderson@linaro.org
("tcg: backend constraints cleanup")

Generate NEON instructions for tcg vector operations.


r~


Richard Henderson (15):
  tcg/arm: Add host vector framework
  tcg/arm: Implement tcg_out_ld/st for vector types
  tcg/arm: Implement tcg_out_mov for vector types
  tcg/arm: Implement tcg_out_dup*_vec
  tcg: Change parameters for tcg_target_const_match
  tcg/arm: Implement minimal vector operations
  tcg/arm: Implement andc, orc, abs, neg, not vector operations
  tcg/arm: Implement TCG_TARGET_HAS_shi_vec
  tcg/arm: Implement TCG_TARGET_HAS_mul_vec
  tcg/arm: Implement TCG_TARGET_HAS_sat_vec
  tcg/arm: Implement TCG_TARGET_HAS_minmax_vec
  tcg/arm: Implement TCG_TARGET_HAS_bitsel_vec
  tcg/arm: Implement TCG_TARGET_HAS_shv_vec
  tcg/arm: Implement TCG_TARGET_HAS_roti_vec
  tcg/arm: Implement TCG_TARGET_HAS_rotv_vec

 tcg/arm/tcg-target-conset.h  |  10 +
 tcg/arm/tcg-target-constr.h  |   3 +
 tcg/arm/tcg-target.h         |  52 +-
 tcg/arm/tcg-target.opc.h     |  16 +
 tcg/tcg.c                    |   5 +-
 tcg/aarch64/tcg-target.c.inc |   5 +-
 tcg/arm/tcg-target.c.inc     | 956 +++++++++++++++++++++++++++++++++--
 tcg/i386/tcg-target.c.inc    |   4 +-
 tcg/mips/tcg-target.c.inc    |   5 +-
 tcg/ppc/tcg-target.c.inc     |   4 +-
 tcg/riscv/tcg-target.c.inc   |   4 +-
 tcg/s390/tcg-target.c.inc    |   5 +-
 tcg/sparc/tcg-target.c.inc   |   5 +-
 tcg/tci/tcg-target.c.inc     |   6 +-
 14 files changed, 1002 insertions(+), 78 deletions(-)
 create mode 100644 tcg/arm/tcg-target.opc.h

-- 
2.25.1


