Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DDC670FAE
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 02:13:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHwzD-0001yA-Ne; Tue, 17 Jan 2023 20:11:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHwzC-0001xy-EJ
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 20:11:30 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pHwzA-0002Dw-Nw
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 20:11:30 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 z4-20020a17090a170400b00226d331390cso647513pjd.5
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 17:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0Ul5xLQD2pTVs5KU88hy/3v5sPh0HeFfKCb/jilT058=;
 b=BmK0+4ztBREKBElYN7Efq10L/y6TxvGsF2ggHDu/18Ws6JsNJTL4O5U58+PEHNjuwm
 Z+EOZBrSrYhDLcjn90hYlbMpTIS8CWIcNN4LUl011RyjGeY3CTpD5wIl4bVCSYJ/sXRB
 dqHcmdLQ337k3j0MO04VHdwJC8nTVrEAcqsq8oFnVzNQjFSf0GNF0UM7upt0DqctGxhL
 JHREFg+y/th5y5BFO691S7s00cVHfUMhF+Sk9QLS/TuG4dXk/8cnrv6GVabOn7SYyA1A
 /eLyHuhnCK3nzR+8ytiOJ5p6y+8DLso82FtWrehKFR/d+Z0Bo+oACZBA2G8g1NhDcJWK
 p4AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0Ul5xLQD2pTVs5KU88hy/3v5sPh0HeFfKCb/jilT058=;
 b=RpF1n55fNRmfYZiLRYhBAykmibGW3UTDqSXeShCQtQ1u8ITRWQAuBgK63K4Eq1EhnI
 H1sakgR0lZ1CxxfbyqKBJaosRRVTRSLysw6l46GvASVkb0W3tzwMuVWSEhi15LmJB95q
 dqVUVbs3j9y8UzGcWN44L7T4jEouFkyeD9YYYGd+j4Db2QJBf55VM7+Goj/2ZJdzhqfX
 TvDFqBmrBQpAOs4mOHhKrlKiVpHLneulXi5ORFTmOPaY9Nfzgf/9sX6i1ywoZOFlzKrJ
 vQhxfe//Ddfhspsj/K5MRQRGAxoN+J1tk38xreG2oKPZXK+229ZCQ3pDwdV/bXv0jjjJ
 Xs0A==
X-Gm-Message-State: AFqh2koPIvzQqpZRPeYAlD8J/WEBUD1FIJCTOlBiw+UDi3WimDRDJ3ML
 uNDl22oApk2R4K11LmXh43YdrRfIQu1Zp+by
X-Google-Smtp-Source: AMrXdXuSTS6FYFJTknNwuMiRgee4Ejyg7bKdIgEKxrSq8lNGY1lRZ7fmmbgcvjEON99rvELHXuPHLg==
X-Received: by 2002:a17:902:e402:b0:193:3980:98d5 with SMTP id
 m2-20020a170902e40200b00193398098d5mr3933317ple.57.1674004287141; 
 Tue, 17 Jan 2023 17:11:27 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 s7-20020a170902988700b0017ec1b1bf9fsm21660259plp.217.2023.01.17.17.11.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 17:11:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: git@xen0n.name
Subject: [PATCH v2 00/10] tcg/loongarch64: Reorg goto_tb and cleanups
Date: Tue, 17 Jan 2023 15:11:13 -1000
Message-Id: <20230118011123.392823-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

Based-on: 20230117231051.354444-1-richard.henderson@linaro.org
("[PULL 00/22] tcg patch queue")

Includes:
  * Disassembler from target/loongarch/.
  * Improvements to movi by Rui Wang, with minor tweaks.
  * Improvements to setcond.
  * Implement movcond.
  * Fix the same goto_tb bug that affected some others.


r~


Richard Henderson (9):
  target/loongarch: Enable the disassembler for host tcg
  target/loongarch: Disassemble jirl properly
  target/loongarch: Disassemble pcadd* addresses
  tcg/loongarch64: Update tcg-insn-defs.c.inc
  tcg/loongarch64: Introduce tcg_out_addi
  tcg/loongarch64: Improve setcond expansion
  tcg/loongarch64: Implement movcond
  tcg/loongarch64: Use tcg_pcrel_diff in tcg_out_ldst
  tcg/loongarch64: Reorg goto_tb implementation

Rui Wang (1):
  tcg/loongarch64: Optimize immediate loading

 tcg/loongarch64/tcg-target-con-set.h          |   5 +-
 tcg/loongarch64/tcg-target-con-str.h          |   2 +-
 tcg/loongarch64/tcg-target.h                  |  11 +-
 disas.c                                       |   2 +
 target/loongarch/disas.c                      |  39 +-
 .../loongarch/insn_trans/trans_branch.c.inc   |   2 +-
 target/loongarch/insns.decode                 |   3 +-
 target/loongarch/meson.build                  |   3 +-
 tcg/loongarch64/tcg-insn-defs.c.inc           |  10 +-
 tcg/loongarch64/tcg-target.c.inc              | 364 ++++++++++++------
 10 files changed, 300 insertions(+), 141 deletions(-)
 mode change 100644 => 100755 tcg/loongarch64/tcg-insn-defs.c.inc

-- 
2.34.1


