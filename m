Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A32AF53D8C9
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Jun 2022 01:12:54 +0200 (CEST)
Received: from localhost ([::1]:58762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxcwu-0001vS-VK
	for lists+qemu-devel@lfdr.de; Sat, 04 Jun 2022 19:12:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxcv4-0008KU-3B
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 19:10:58 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:47003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxcuu-0004zf-9i
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 19:10:54 -0400
Received: by mail-pg1-x52d.google.com with SMTP id c14so9990564pgu.13
 for <qemu-devel@nongnu.org>; Sat, 04 Jun 2022 16:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xE0JixDucXOZWfm+NU+Ml9ipga/MhUak7SEZLV+X5J8=;
 b=u661/7pKm4qqVc417sz5LSn4489tXlIhGXAuifDfvMuHnGkCgPna5UdCALUF9i8g5J
 mGVSiMNGOY6HHqxeGqYSs7wyrB3c2UvbYPWFARHOs2yVFKdThzZtx6J0gKFKlBJV1Ov/
 Fvs+n4VBSW+NukS//Li88li8kPtZDIOjn/sEK4EqttrApR+y8pBGES36lTGKcBoZyRxa
 xhDxa4LNwqrA4qe+m+bNYzaRrf4fKFZNcOmFAEIAe1xuiZ+w0bJ15SYB52ZvuIjeT1Fl
 yehQrhBCA+blXX6Ulh3BnB3tCHa8r38w+tfIJ9Vtr9CgsBdnOt0cLxkvU2ZNrvT4zHUo
 ouLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xE0JixDucXOZWfm+NU+Ml9ipga/MhUak7SEZLV+X5J8=;
 b=fMgnkbTfNe1xhe25DoTIlEnIIeo+5JRp7FM/wRYRh0sjW1NlG2Fa616LXx5xV9wnhU
 BoaN3/BaIgMCjIefBJYJL2rK440Yw2OfnoCK2OrsrpeCI1RjNLGevKWmtP9FN/6EvVu2
 9U7WA89jzaa7lUZlaehnSigWeCBAoJkYylClxfK831GT+UC78lmQ8rukhuuze0Ge2mNb
 AfBzU+vQ2oOj2CY9TADqBzLwXDIL33jJonFj/wSqfg4qjnn97BCbojEgaU/CHCEygEZs
 o5reN5csWL282aj+cCvRFgDZ8l/Z7+4oDRUkcojAUu0ijHe8QgqaCsuY3f1JjHQU07ID
 4jNg==
X-Gm-Message-State: AOAM5307GUU9KQvV0bT4zCRpHqrOw/L0F8Ck9Hod6vGjDB5wqyGapWDT
 HIcsWvxEd6FzrJQZSpQKHTTKDDVqnNN7BA==
X-Google-Smtp-Source: ABdhPJw/gSaqOCQJmxRzWBzgMoTjwGitdlbpjbZahl/WfxBG8UqYMX6Xi85m24HN3RApSKHDBo1fBQ==
X-Received: by 2002:a63:5a41:0:b0:3fb:bd55:5871 with SMTP id
 k1-20020a635a41000000b003fbbd555871mr14365074pgm.449.1654384205974; 
 Sat, 04 Jun 2022 16:10:05 -0700 (PDT)
Received: from bigtime.. ([2602:ae:1547:e101:250:b6ff:fe24:58ae])
 by smtp.gmail.com with ESMTPSA id
 184-20020a6302c1000000b003fcf1279c84sm5562151pgc.33.2022.06.04.16.10.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jun 2022 16:10:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] target/riscv: Fix issue 1060
Date: Sat,  4 Jun 2022 23:10:01 +0000
Message-Id: <20220604231004.49990-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This issue concerns the value of mtval for illegal
instruction exceptions, and came with a great test case.
The fix is just two lines, in the first patch, but
I noticed some cleanups on the way.


r~


Richard Henderson (3):
  target/riscv: Set env->bins in gen_exception_illegal
  target/riscv: Remove generate_exception_mtval
  target/riscv: Minimize the calls to decode_save_opc

 target/riscv/translate.c                      | 31 +++++------
 .../riscv/insn_trans/trans_privileged.c.inc   |  4 ++
 target/riscv/insn_trans/trans_rvh.c.inc       |  2 +
 target/riscv/insn_trans/trans_rvi.c.inc       |  2 +
 tests/tcg/riscv64/Makefile.softmmu-target     | 21 ++++++++
 tests/tcg/riscv64/issue1060.S                 | 53 +++++++++++++++++++
 tests/tcg/riscv64/semihost.ld                 | 21 ++++++++
 7 files changed, 116 insertions(+), 18 deletions(-)
 create mode 100644 tests/tcg/riscv64/Makefile.softmmu-target
 create mode 100644 tests/tcg/riscv64/issue1060.S
 create mode 100644 tests/tcg/riscv64/semihost.ld

-- 
2.34.1


