Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E401A332D4E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 18:32:26 +0100 (CET)
Received: from localhost ([::1]:50336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJgDZ-0002XX-LT
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 12:32:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf6F-0006vK-4h
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:20:52 -0500
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:47062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lJf6C-0002NM-OT
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:20:46 -0500
Received: by mail-oi1-x22b.google.com with SMTP id f3so15491384oiw.13
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 08:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lnwWrhEneEUUM+YHpqRK/Z28UUqQlE1sLsUPEdpUHzc=;
 b=NYZveROCj4x3Zd0gjPRlffBCQz8wWsgl91wH9n6geQZR42+2Brl9Uy5I2LWYivlF4b
 IwJabAq8PaUPm8WuIaYw5t+yW1KfCvWhQFlQcLxpcwOOhl/aPSvuHbABSdN3Geq6ApZ8
 CArAeCQbQJ8ilxQzyfIJy52x/uSrjBn42OTS84SMNuaZhc0UyR+tyJ0BdKU3nwnCwzkE
 8pPMPqz4742ZRtdh9HGmo8JKfZ7DMi+9mmu94agpPSzSNDYVb8MznAAVm03oNRMY81yy
 rhLlnDqwDv+Yt65dMszaU6SLnkD5ibdjIdZ8CObSlgBAeFKFbHq58Ksvoh1qMtWY/iJP
 gpRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lnwWrhEneEUUM+YHpqRK/Z28UUqQlE1sLsUPEdpUHzc=;
 b=AH7UcNhDf1eMtYMcMsmdbL3sDMCee0ZJTLKGHBrJPpn8pHg6J5DlM06cu0dsc6izia
 8UYuw2R6Bw8InArr1zdMPQz3mM9RFnKvptYHhMjNG8UarJDQIluT+DgFgLLOUoPEE89e
 nujIRNtSUjU70MtVwM90ruckdVs1gmCWBKkKC/ZMTIQPpXwQshTlIIEHHp28wvBRBw5c
 IlL4FQEZ315tLOHDGOGMCIa7d23aKlp2zAPIkf/EcUTr2DXtlJsO0nGwV5oYhYaPt2b9
 RvkwXZLZ6+6K9GrRtBC0iG9t5eb8UslWAD9XwgXOvEPLdLdig2sTAEaFg3nXhxVVpNcB
 vWQQ==
X-Gm-Message-State: AOAM530eUDO+GX9nTLt/82grqXzP9XGVyv+/sdEaAu1y17kbLAlu/q6C
 ASv7FuFU7r+Z+27rmbNj+yKOj0oCt6wZ2OCb
X-Google-Smtp-Source: ABdhPJzJxOFUD4BMJ2dE+GdZWvJuj6HIkkm3BhL09NgN39JdjWqOkpiOVg7B5selxuzBSo9huyOwBA==
X-Received: by 2002:aca:b544:: with SMTP id e65mr3510183oif.78.1615306843476; 
 Tue, 09 Mar 2021 08:20:43 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id v23sm2516474ots.63.2021.03.09.08.20.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 08:20:43 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/78] target/arm: Implement SVE2
Date: Tue,  9 Mar 2021 08:19:23 -0800
Message-Id: <20210309162041.23124-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22b.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After a 6-month hiatus, sve2 is back.  This time, with RISU
testing vs FVP 11.13.36.

Based-on: 20210309155305.11301-1-richard.henderson@linaro.org
("target/arm: sve1 fixes")


r~


Richard Henderson (60):
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
  target/arm: Implement SVE2 integer multiply long (indexed)
  target/arm: Implement SVE2 saturating multiply (indexed)
  target/arm: Implement SVE2 signed saturating doubling multiply high
  target/arm: Implement SVE2 saturating multiply high (indexed)
  target/arm: Implement SVE2 multiply-add long (indexed)
  target/arm: Implement SVE2 complex integer multiply-add (indexed)
  target/arm: Implement SVE mixed sign dot product (indexed)
  target/arm: Implement SVE mixed sign dot product
  target/arm: Implement SVE2 crypto unary operations
  target/arm: Implement SVE2 crypto destructive binary operations
  target/arm: Implement SVE2 crypto constructive binary operations
  target/arm: Share table of sve load functions
  target/arm: Implement SVE2 LD1RO
  target/arm: Implement 128-bit ZIP, UZP, TRN
  target/arm: Implement SVE2 complex integer dot product
  target/arm: Enable SVE2 and some extensions

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

 target/arm/cpu.h                |   56 +
 target/arm/helper-sve.h         |  722 ++++++-
 target/arm/helper.h             |  104 +-
 target/arm/translate-a64.h      |    3 +
 target/arm/vec_internal.h       |  143 ++
 target/arm/sve.decode           |  568 +++++-
 target/arm/cpu64.c              |   11 +
 target/arm/helper.c             |    3 +-
 target/arm/kvm64.c              |   11 +
 target/arm/neon_helper.c        |  507 +----
 target/arm/sve_helper.c         | 2123 ++++++++++++++++++++-
 target/arm/translate-a64.c      |   68 +-
 target/arm/translate-sve.c      | 3157 +++++++++++++++++++++++++++++--
 target/arm/vec_helper.c         |  777 +++++++-
 target/arm/translate-neon.c.inc |   20 +-
 15 files changed, 7425 insertions(+), 848 deletions(-)

-- 
2.25.1


