Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B444370204
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 22:28:08 +0200 (CEST)
Received: from localhost ([::1]:57390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcZk6-0001ct-Qi
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 16:28:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZiK-00083Z-5q
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:26:16 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:46938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZiH-0005qG-7B
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 16:26:15 -0400
Received: by mail-pg1-x52e.google.com with SMTP id j189so3163015pgd.13
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 13:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TLnAK3F2EuCsyPGbgX4McZcLJW7/N72p142oSUvhLBw=;
 b=WhfqXB/vz8hEbI8/RNPbQAuQVAMixQjyNw8xs8LimgkhIzsy5abmqCuHVjyiccWHCE
 aH6at7n5A6ZN9Nn2BbWQgWsqwOaCRrOwNnRQ9zmNpCa+F92lTLiF6+pSxciNjs8CFmX/
 CaIno4H3ruUhyE3tW3Mdx7JXglsH/02nUzmJ+B3gOR/oY1SOVlgB0BtScIJ2O/rwy1d8
 4Wr2rboy/6opJ4T+PuyAfGjn8GIKypGe4mETvI5HSX79idGY17D7mIHASlFbC341XDhV
 rWKCRtg/X9JV8aqQPX2Cz5iu1laLL669FJmq8VdiULRdaIaizneZR3FhG9w0XfoV6/Sy
 G1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TLnAK3F2EuCsyPGbgX4McZcLJW7/N72p142oSUvhLBw=;
 b=Z5BlLFfoNX4+FQasg05WOqyNQ5D5zHZOQeFs70rC3Xj0+SwBS/5XwmWOZhmHZFF5ee
 /0tQOZ6GW3i1rH0ZlGeUpU2mD9UMrWcs9c6401+Gy18I/NBjdgGP0uI8NcUkYF76uitH
 +u5cYzO8Pv66X2g73eQLijsqNII9DKUf9rbySxOlk2MR4hlZd9XuG3wRjk0m8gzlmmbn
 HpWDpZsN/aC94eMeJv9qmuFCieZBgKV3REAaBrHG453GtYTfwLWlxiILIqJh0XahuxHj
 kqIatOhUGGnFzHhtnnmjd9V3tLNPi+Gpb8u1PhEPhkiyl0bHcf9IaPjJ4FjiTVX8qfrU
 hLkA==
X-Gm-Message-State: AOAM533XBpBOXzoqigf8SUL88EWuS/abUdpUCqyXOkL92yqXKJo20q3X
 k1IFsQztUCjrxCfzQ956+sHWKbxt5Tk3oQ==
X-Google-Smtp-Source: ABdhPJy7KAkS1zw00gO8MRcJWYn+hJtKNARjEg2Drca4Ek5Mrvg5UWWJ586GENnDF31+foR7bKdDXA==
X-Received: by 2002:a05:6a00:1687:b029:253:f417:4dba with SMTP id
 k7-20020a056a001687b0290253f4174dbamr6479649pfc.5.1619814371202; 
 Fri, 30 Apr 2021 13:26:11 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id e6sm2905257pfd.219.2021.04.30.13.26.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:26:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 00/82] target/arm: Implement SVE2
Date: Fri, 30 Apr 2021 13:24:48 -0700
Message-Id: <20210430202610.1136687-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based-on: 20210430132740.10391-1-peter.maydell@linaro.org
("target/arm: Split translate-*.c.inc into separate compilation units")

Based-on: 20210427214108.88503-1-richard.henderson@linaro.org
("linux-user/aarch64: Enable hwcap for RND, BTI, and MTE")

Since I believe Peter has both queued on his target-arm.next,
and I didn't want to get in the way of his bulk code movement.

Changes for v6:
  * Rebase as per above.
  * Rename isar_feature_sve2_{i8mm,f32mm,f64mm} to sve_*,
    because these extensions do not depend on sve2.
  * Update hwcap for the many extensions.


r~


Richard Henderson (64):
  target/arm: Add ID_AA64ZFR0 fields and isar_feature_aa64_sve2
  target/arm: Implement SVE2 Integer Multiply - Unpredicated
  target/arm: Implement SVE2 integer pairwise add and accumulate long
  target/arm: Implement SVE2 integer unary operations (predicated)
  target/arm: Split out saturating/rounding shifts from neon
  target/arm: Implement SVE2 saturating/rounding bitwise shift left
    (predicated)
  target/arm: Implement SVE2 integer halving add/subtract (predicated)
  target/arm: Implement SVE2 integer pairwise arithmetic
  target/arm: Implement SVE2 saturating add/subtract (predicated)
  target/arm: Implement SVE2 integer add/subtract long
  target/arm: Implement SVE2 integer add/subtract interleaved long
  target/arm: Implement SVE2 integer add/subtract wide
  target/arm: Implement SVE2 integer multiply long
  target/arm: Implement PMULLB and PMULLT
  target/arm: Implement SVE2 bitwise shift left long
  target/arm: Implement SVE2 bitwise exclusive-or interleaved
  target/arm: Implement SVE2 bitwise permute
  target/arm: Implement SVE2 complex integer add
  target/arm: Implement SVE2 integer absolute difference and accumulate
    long
  target/arm: Implement SVE2 integer add/subtract long with carry
  target/arm: Implement SVE2 bitwise shift right and accumulate
  target/arm: Implement SVE2 bitwise shift and insert
  target/arm: Implement SVE2 integer absolute difference and accumulate
  target/arm: Implement SVE2 saturating extract narrow
  target/arm: Implement SVE2 SHRN, RSHRN
  target/arm: Implement SVE2 SQSHRUN, SQRSHRUN
  target/arm: Implement SVE2 UQSHRN, UQRSHRN
  target/arm: Implement SVE2 SQSHRN, SQRSHRN
  target/arm: Implement SVE2 WHILEGT, WHILEGE, WHILEHI, WHILEHS
  target/arm: Implement SVE2 WHILERW, WHILEWR
  target/arm: Implement SVE2 bitwise ternary operations
  target/arm: Implement SVE2 saturating multiply-add long
  target/arm: Implement SVE2 saturating multiply-add high
  target/arm: Implement SVE2 integer multiply-add long
  target/arm: Implement SVE2 complex integer multiply-add
  target/arm: Implement SVE2 XAR
  target/arm: Pass separate addend to {U,S}DOT helpers
  target/arm: Pass separate addend to FCMLA helpers
  target/arm: Split out formats for 2 vectors + 1 index
  target/arm: Split out formats for 3 vectors + 1 index
  target/arm: Implement SVE2 integer multiply (indexed)
  target/arm: Implement SVE2 integer multiply-add (indexed)
  target/arm: Implement SVE2 saturating multiply-add high (indexed)
  target/arm: Implement SVE2 saturating multiply-add (indexed)
  target/arm: Implement SVE2 saturating multiply (indexed)
  target/arm: Implement SVE2 signed saturating doubling multiply high
  target/arm: Implement SVE2 saturating multiply high (indexed)
  target/arm: Implement SVE mixed sign dot product (indexed)
  target/arm: Implement SVE mixed sign dot product
  target/arm: Implement SVE2 crypto unary operations
  target/arm: Implement SVE2 crypto destructive binary operations
  target/arm: Implement SVE2 crypto constructive binary operations
  target/arm: Share table of sve load functions
  target/arm: Implement SVE2 LD1RO
  target/arm: Implement 128-bit ZIP, UZP, TRN
  target/arm: Implement aarch64 SUDOT, USDOT
  target/arm: Split out do_neon_ddda_fpst
  target/arm: Remove unused fpst from VDOT_scalar
  target/arm: Fix decode for VDOT (indexed)
  target/arm: Split decode of VSDOT and VUDOT
  target/arm: Implement aarch32 VSUDOT, VUSDOT
  target/arm: Implement integer matrix multiply accumulate
  linux-user/aarch64: Enable hwcap bits for sve2 and related extensions
  target/arm: Enable SVE2 and related extensions

Stephen Long (18):
  target/arm: Implement SVE2 floating-point pairwise
  target/arm: Implement SVE2 MATCH, NMATCH
  target/arm: Implement SVE2 ADDHNB, ADDHNT
  target/arm: Implement SVE2 RADDHNB, RADDHNT
  target/arm: Implement SVE2 SUBHNB, SUBHNT
  target/arm: Implement SVE2 RSUBHNB, RSUBHNT
  target/arm: Implement SVE2 HISTCNT, HISTSEG
  target/arm: Implement SVE2 scatter store insns
  target/arm: Implement SVE2 gather load insns
  target/arm: Implement SVE2 FMMLA
  target/arm: Implement SVE2 SPLICE, EXT
  target/arm: Implement SVE2 TBL, TBX
  target/arm: Implement SVE2 FCVTNT
  target/arm: Implement SVE2 FCVTLT
  target/arm: Implement SVE2 FCVTXNT, FCVTX
  target/arm: Implement SVE2 FLOGB
  target/arm: Implement SVE2 bitwise shift immediate
  target/arm: Implement SVE2 fp multiply-add long

 target/arm/cpu.h              |   66 +
 target/arm/helper-sve.h       |  681 ++++++-
 target/arm/helper.h           |  111 +-
 target/arm/translate-a64.h    |    3 +
 target/arm/vec_internal.h     |  143 ++
 target/arm/neon-shared.decode |   24 +-
 target/arm/sve.decode         |  525 +++++-
 linux-user/elfload.c          |   10 +
 target/arm/cpu.c              |    1 +
 target/arm/cpu64.c            |   13 +
 target/arm/helper.c           |    3 +-
 target/arm/kvm64.c            |   11 +
 target/arm/neon_helper.c      |  507 +-----
 target/arm/sve_helper.c       | 1904 +++++++++++++++++++-
 target/arm/translate-a64.c    |  111 +-
 target/arm/translate-neon.c   |  231 ++-
 target/arm/translate-sve.c    | 3117 +++++++++++++++++++++++++++++++--
 target/arm/vec_helper.c       |  854 ++++++++-
 18 files changed, 7377 insertions(+), 938 deletions(-)

-- 
2.25.1


