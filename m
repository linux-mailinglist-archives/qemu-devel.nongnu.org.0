Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 258F82E2C4D
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Dec 2020 21:23:51 +0100 (CET)
Received: from localhost ([::1]:57998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kstcr-0004fH-Ny
	for lists+qemu-devel@lfdr.de; Fri, 25 Dec 2020 15:23:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kstZF-0002yV-Np
 for qemu-devel@nongnu.org; Fri, 25 Dec 2020 15:20:05 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:38222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kstZA-00058a-N9
 for qemu-devel@nongnu.org; Fri, 25 Dec 2020 15:20:05 -0500
Received: by mail-pj1-x102d.google.com with SMTP id j13so2854370pjz.3
 for <qemu-devel@nongnu.org>; Fri, 25 Dec 2020 12:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CNZ9TBbm6vL/WgIPuZ0QY4gpv8V/BvvVQY/wnONKfW8=;
 b=mq9iJ6Bb4+IGENUyNFTVHYoeXuuJU5z9el8si0OpK3vDakMuYojL6DNlVeX7KEYFT7
 kdh50VOjIWHzDIWzHAH+QecbY8HnQi940rTtZpPrmAnRWQkxGAD1dipgQLnsO+BIpD1Y
 CHJAZ7oSfzmcLw/a28CmS0TkXvzHXFq5KB7YoLvu4qgP03vjEn9gxKi8RFJNSDfTRmos
 6RYZ89PtG2FgeFGDgxLQRyNXZLu0H/SMPQd933F7Qmv8yJXD2jX+cMZAagRkv4ab8Kig
 sUoGwx7BNBafUdfgAYsZeMxb6pTCKDPZqJiSw+k0rkOevhX+j10Ok9fe1AomprS0nXC9
 5CxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CNZ9TBbm6vL/WgIPuZ0QY4gpv8V/BvvVQY/wnONKfW8=;
 b=T0TF5HCOLhkmH9PqVjdVkopzLk1/V1o45XT7Ie5EionT+l54BRS83dvAY6k+ppqlpJ
 2zqLzc/Y/eA5QXY3K1vdWAypGUJydqj+t9SgYZFS6XmmfGE9nnF6lleUzwsoStmIFScg
 9s9/UMwH8M6f2S6yLq9yZyXTX/Fe29qyJXdna2WR4ELE4+c8LirwR3TvS77mlWZuXx3h
 /0tULocnidpbFnzhac+ZNLbHtafyaMt7ln+Gp8BUhHExDN0/yegy477tr2qyhHiMEzLR
 h2ZjYgZclilaU/I8IqtDpvi+5kVSBBSy5iDfOvPmL4cEB/etPy+OtHNPJf5RAhkXHO4p
 EutA==
X-Gm-Message-State: AOAM531JT6pLvEh/oI4paWaXsI1+a9bJ84O8PcwrV++rC+GYTsT9QBmi
 6Ikrek45UmbIMMHGK7rHCQOQNHvtqz1i/g==
X-Google-Smtp-Source: ABdhPJxUpZloHr1+/MqYmZrszWCTiTtX1JA/1rREQcMcANiAjpPeO6qnY7S1iz78nZGIxyp3qs7XSQ==
X-Received: by 2002:a17:90a:2e84:: with SMTP id
 r4mr9900820pjd.147.1608927598566; 
 Fri, 25 Dec 2020 12:19:58 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id l8sm5816497pjt.32.2020.12.25.12.19.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Dec 2020 12:19:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/16] tcg/s390x: host vector support
Date: Fri, 25 Dec 2020 12:19:40 -0800
Message-Id: <20201225201956.692861-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

Once upon a time there were some previous versions, but it was a
long time ago and I was too lazy to look them up.  I do recall
that the patch was one lump before, and now it's in parts,
including a rename of the directory.


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

 meson.build                             |   2 -
 tcg/{s390 => s390x}/tcg-target-conset.h |   7 +
 tcg/{s390 => s390x}/tcg-target-constr.h |   1 +
 tcg/{s390 => s390x}/tcg-target.h        |  90 ++-
 tcg/s390x/tcg-target.opc.h              |  15 +
 tcg/tcg-op-vec.c                        |  37 +-
 tcg/{s390 => s390x}/tcg-target.c.inc    | 918 ++++++++++++++++++++++--
 7 files changed, 975 insertions(+), 95 deletions(-)
 rename tcg/{s390 => s390x}/tcg-target-conset.h (80%)
 rename tcg/{s390 => s390x}/tcg-target-constr.h (92%)
 rename tcg/{s390 => s390x}/tcg-target.h (66%)
 create mode 100644 tcg/s390x/tcg-target.opc.h
 rename tcg/{s390 => s390x}/tcg-target.c.inc (73%)

-- 
2.25.1


