Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D43F7698AFE
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 04:11:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSUdr-0007F9-Jg; Wed, 15 Feb 2023 22:09:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUdp-0007Eh-Hx
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 22:09:01 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUdn-0008WC-Pk
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 22:09:01 -0500
Received: by mail-pg1-x534.google.com with SMTP id z6so458008pgk.0
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 19:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/GxJhFdPqx/4DoO1k6kgRLfEU03I4v3aY/Rgmc6DRpw=;
 b=jmI1GS0wVdnxLk+6xbKmpsu46oQm9DKnQMQJ8zowu/KTFpVpPaJagfhtO8c0uBOqQW
 K9P+9YunYoSefAYGCnV0bj90BVdEbsJtrMNUbZrQu2znprUwOLFvCjjuCGXZVAyD9CfB
 OKjvI4ZiGRE/6IeTZvuQEku3EguasE8J6fs7G6j9P6aAuL0ZWqzhrnMRx4cBwTOBgux5
 lZDz6Jbsa1XQLqSog3p25MDoSIuNVh8Yp7pWMqy7y3/8OUQN1j8LGo+KRMZBpFHPd1Md
 finGb8M2B9bM42jDHGgzg4ghOOPZKLpzC9SvYL4ubrfUD04m0xP04DLUH5EvfbyGnoxh
 AbuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/GxJhFdPqx/4DoO1k6kgRLfEU03I4v3aY/Rgmc6DRpw=;
 b=R/0kBVDjunlaoLxmm8fQNMH43hTgzQBZ1mZ549HqxQvYsyrYyCBNjgl9Wgg+y6+GnU
 4d7lpy8i/NGrws4/3sGuoImIiYblNJXk/Y4AAPzEZWFXGHY7/oRe3jr+vJhVhvoHFz09
 3ApeJizhAkssENEWkOWdXQDfXArXzyNhSRKVuaBwL/4Q67ZjdQNG+2+T+EyWJ8BFIgVX
 OwuOVdY6RZnd2z/6Prmkt0WsRrgIafddMyz+ByPQoTgI1zXT9nTazLqvQRzOD/DAd5JP
 vozcm2gnO6Rz2O33u9rSLdrLLYKDsRsNayAXEh7VDVnBa7S9kkVB/wnCB1hUgH/2v8Gt
 mkXg==
X-Gm-Message-State: AO0yUKUA3z0PMON7BxtmysIkJvVK/xUp5ABqWOk1dkJSXyKS9LTmaYR9
 iYbxll2FEEuv+nXpV3bUTFs7Wm3MiUKFByjrht0=
X-Google-Smtp-Source: AK7set9on7RqfTujKT8Km516M8nkoA/HlhcEYXmvWZFUZRyRDWZfYF5tNehxpzEq9ZFHCL3OEeWrgA==
X-Received: by 2002:a62:1c51:0:b0:5a8:b4a5:bf98 with SMTP id
 c78-20020a621c51000000b005a8b4a5bf98mr3932280pfc.3.1676516937942; 
 Wed, 15 Feb 2023 19:08:57 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 i25-20020aa79099000000b005810a54fdefsm79051pfa.114.2023.02.15.19.08.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 19:08:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v1 00/19] target/arm: Implement FEAT_LSE2
Date: Wed, 15 Feb 2023 17:08:35 -1000
Message-Id: <20230216030854.1212208-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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

Based-on: 20230216025739.1211680-1-richard.henderson@linaro.org
("[PATCH v2 00/30] tcg: Improve atomicity support")

Testing has not been extensive, but it does boot and run stuff.
Suggestions for actually testing atomicity solicited.
I would imagine it would have to involve -semihosting...


r~


Richard Henderson (19):
  target/arm: Make cpu_exclusive_high hold the high bits
  target/arm: Use tcg_gen_qemu_ld_i128 for LDXP
  target/arm: Use tcg_gen_qemu_{st,ld}_i128 for do_fp_{st,ld}
  target/arm: Use tcg_gen_qemu_st_i128 for STZG, STZ2G
  target/arm: Use tcg_gen_qemu_{ld,st}_i128 in gen_sve_{ld,st}r
  target/arm: Sink gen_mte_check1 into load/store_exclusive
  target/arm: Add feature test for FEAT_LSE2
  target/arm: Add atom_data to DisasContext
  target/arm: Load/store integer pair with one tcg operation
  target/arm: Hoist finalize_memop out of do_gpr_{ld,st}
  target/arm: Hoist finalize_memop out of do_fp_{ld,st}
  target/arm: Pass memop to gen_mte_check1*
  target/arm: Pass single_memop to gen_mte_checkN
  target/arm: Check alignment in helper_mte_check
  target/arm: Add SCTLR.nAA to TBFLAG_A64
  target/arm: Relax ordered/atomic alignment checks for LSE2
  target/arm: Move mte check for store-exclusive
  test/tcg/multiarch: Adjust sigbus.c
  target/arm: Enable FEAT_LSE2 for -cpu max

 docs/system/arm/emulation.rst |   1 +
 target/arm/cpu.h              |   8 +-
 target/arm/helper-a64.h       |   3 +
 target/arm/internals.h        |   3 +-
 target/arm/translate-a64.h    |   4 +-
 target/arm/translate.h        |  16 +-
 target/arm/cpu64.c            |   1 +
 target/arm/helper-a64.c       |   7 +
 target/arm/helper.c           |   6 +
 target/arm/mte_helper.c       |  18 ++
 target/arm/translate-a64.c    | 521 ++++++++++++++++++++++------------
 target/arm/translate-sve.c    | 118 ++++++--
 target/arm/translate.c        |   1 +
 tests/tcg/aarch64/mte-7.c     |   3 +-
 tests/tcg/multiarch/sigbus.c  |  13 +-
 15 files changed, 498 insertions(+), 225 deletions(-)

-- 
2.34.1


