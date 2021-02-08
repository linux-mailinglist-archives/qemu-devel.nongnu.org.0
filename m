Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CFA312984
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 04:46:31 +0100 (CET)
Received: from localhost ([::1]:48996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8xVO-0006rC-D4
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 22:46:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wdv-00086X-FS
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:51:15 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:46709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wdn-0001JA-By
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:51:15 -0500
Received: by mail-pg1-x52f.google.com with SMTP id r38so9240995pgk.13
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UCBwnY6t144zbw+yyyPrSDYBQqKP3U1djHEo3wxPmIc=;
 b=hqEKervmrhDYjgHkLU3GjCaBE7ELH1QW2kFP6ZjqX6h12JSu1xaDjFQrz4KV/7byRB
 SYmQN67VTZumxXgBMKf2hRU2fRXGwrkit917V9AoYbwqrG0JoxPdiAfzeqfpcX16BHLL
 /AVj9tGLyW3tjjZSxEzuq90TR93iUkLrDC295FgbDd1858Fq7iz2oF/+Ig3Ui6BJb7AP
 hXKlRQVFMgr4tDFf7X4/I5bnpLhXz4JIx87OUJSdkFlInP4pNrL1XJMxdSPgokY+46Ly
 l0e/dLzhGz6utjHbBzXxgz486821SKEXooLPO/IOQf0awqoPJ69/eDaMYXkNe3KIYiay
 Nqig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UCBwnY6t144zbw+yyyPrSDYBQqKP3U1djHEo3wxPmIc=;
 b=JdJmczqXI+dv2RUMXcT2aJpVRG17svPrdUBZr6so2qGbIdjBkc+htscVzQJ4fgrz1L
 rRs1h95IpD1RcKl1+ULXqiFXTTAbbWKlcYVTurBCqBoEpFbAwC00D9nw/s/4JUMfPC5j
 92wovfNk7EsaJJXN5a2ngABZlNGkpZ6vQpJ6Gf2fK7Nh8P3eGkV83ndwMqgEDbxWj77N
 kxANfnF8vcurs4XNRwYT3mwUDUSW6Tw8AppeIqpV71uNHGmTvTJzzCIdjZ255FtTBYgo
 sQNyCOCw1/DjTEIWBqcC5wuB97mS+LlTYlbhI35iJUdSQz2TagaNdvaIsFNNCTNCZWKF
 uRBw==
X-Gm-Message-State: AOAM532PR5lOZ7j4AT6pybJo7cN9C47peiKZzQcR8iGCOpQg8Vn7ZuGU
 Z5f3r2Fp9R11ElCniC+XRW4XiHoqZVpuXw==
X-Google-Smtp-Source: ABdhPJzwJHDDa0D+1yY6vC2enliXWzs1C8rpXRb2dm2BXsk5WoxIFzM/X9wi1Fs61dPGcRHioUlLuw==
X-Received: by 2002:a65:5ac9:: with SMTP id d9mr1720107pgt.74.1612752663256;
 Sun, 07 Feb 2021 18:51:03 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id p12sm10308690pju.35.2021.02.07.18.51.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:51:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/16] tcg/s390x: host vector support
Date: Sun,  7 Feb 2021 18:50:45 -0800
Message-Id: <20210208025101.271726-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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

Changes for v2:
  * Rebase on master, now that all prereq are upstream.


r~


Richard Henderson (16):
  tcg/s390x: Rename from tcg/s390
  tcg/s390x: Change FACILITY representation
  tcg/s390x: Merge TCG_AREG0 and TCG_REG_CALL_STACK into TCGReg
  tcg/s390x: Add host vector framework
  tcg/s390x: Implement tcg_out_ld/st for vector types
  tcg/s390x: Implement tcg_out_mov for vector types
  tcg/s390x: Implement tcg_out_dup*_vec
  tcg/s390x: Implement minimal vector operations
  tcg/s390x: Implement andc, orc, abs, neg, not vector operations
  tcg/s390x: Implement TCG_TARGET_HAS_mul_vec
  tcg/s390x: Implement vector shift operations
  tcg/s390x: Implement TCG_TARGET_HAS_minmax_vec
  tcg: Expand usadd/ussub with umin/umax
  tcg/s390x: Implement TCG_TARGET_HAS_sat_vec
  tcg/s390x: Implement TCG_TARGET_HAS_bitsel_vec
  tcg/s390x: Implement TCG_TARGET_HAS_cmpsel_vec

 meson.build                              |   2 -
 tcg/{s390 => s390x}/tcg-target-con-set.h |   7 +
 tcg/{s390 => s390x}/tcg-target-con-str.h |   1 +
 tcg/{s390 => s390x}/tcg-target.h         |  90 ++-
 tcg/s390x/tcg-target.opc.h               |  15 +
 tcg/tcg-op-vec.c                         |  37 +-
 tcg/{s390 => s390x}/tcg-target.c.inc     | 920 +++++++++++++++++++++--
 7 files changed, 977 insertions(+), 95 deletions(-)
 rename tcg/{s390 => s390x}/tcg-target-con-set.h (86%)
 rename tcg/{s390 => s390x}/tcg-target-con-str.h (96%)
 rename tcg/{s390 => s390x}/tcg-target.h (66%)
 create mode 100644 tcg/s390x/tcg-target.opc.h
 rename tcg/{s390 => s390x}/tcg-target.c.inc (73%)

-- 
2.25.1


