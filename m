Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A41A60F601
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 13:15:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo0ox-0003lv-OZ; Thu, 27 Oct 2022 07:13:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oo0ov-0003io-Hf
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 07:13:09 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oo0os-0008Lv-CT
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 07:13:09 -0400
Received: by mail-pl1-x631.google.com with SMTP id l2so1058614pld.13
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 04:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jxquUY8639+3yb9rm/83g2e4/0fMtxF688t00ZVP6ys=;
 b=gsQorsyh1c8uDvQyKGCva8gCOWRs496wJOK6c3ZtUv2eRWMrre1fhEJZnLcrLd8ogg
 OOWoVzTksFwzwnBjOzAlxkjpc+6g4kMlPddlCX8X1TrhrWhSZzjD2I0p2wSPbM+kXtvZ
 YzLkuBpUACRpuhmm8GU2J9P5PI42Iyf3iS3HdCQzSJDy4E5WaPGW0hhueaVXFOV+qOiu
 w5lOMSW/Xv+czeIn3pT86l24AmyBsgjsK5ULeBs/+EOLn1igP+LnNIa11uIKlK6UShZJ
 iAX2bTFdSa5ouL+k672ioPj4VxAwGigHYvZRaq5/ee3LlI4fmzRsBTciSKv+oOcMv0rG
 oIsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jxquUY8639+3yb9rm/83g2e4/0fMtxF688t00ZVP6ys=;
 b=GMo/XqrD9kSez1tSJjigeQF3okSu0az7sWtadU/g2NeJN9AkFv1Ihss2WCBp1D2HWV
 WV4qCjz1nhj3Iws/JhG0nBsDnOjl7pdimclUI5TmSKL8QEP6NXbe4neknEIssa8Cf45e
 ch9leFAN5Lc+cNKPzN86Cj8u6E5Z7/7qXlY1X4z9fSc72HKRChPwGHkpaOqEtj378+Gq
 Y1MW2+bvfrSEul6hxUgj8YekayhJgXFtvruB5Y5ugehiV5TRDkPxxl7Eo6+DpatrKoOM
 NzS/MkpHOu/+b3AkkscgXSN8F0G8kHGfs5DvQ3w2XxP+5mM+zvIxZqo92mi2gF/gzAMj
 /mdg==
X-Gm-Message-State: ACrzQf0kOhrwy/UehVVWpuZrr2Df5SQUbONzobVMowF4wLnsNv6gUHYS
 tb72UY6Oez2jPIb8lg90uYSX2sQ+Awy68BE3
X-Google-Smtp-Source: AMsMyM5qtdP+2CYaDXJq33vfpZ0S9FV5/SFa6/NHiVInVdeywQY45PoMr2KkMsDGe+N0f+uinzUQjQ==
X-Received: by 2002:a17:90a:582:b0:20a:97f6:f52e with SMTP id
 i2-20020a17090a058200b0020a97f6f52emr9656279pji.126.1666869184711; 
 Thu, 27 Oct 2022 04:13:04 -0700 (PDT)
Received: from localhost.localdomain ([2001:8003:501a:d301:3a91:9408:3918:55a])
 by smtp.gmail.com with ESMTPSA id
 j5-20020a170902c3c500b00172ea8ff334sm969621plj.7.2022.10.27.04.13.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 04:13:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	laurent@vivier.eu
Subject: [PATCH v2 0/7] accel/tcg: Rewrite user-only vma tracking
Date: Thu, 27 Oct 2022 22:12:51 +1100
Message-Id: <20221027111258.348196-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

The primary motivator here are the numerous bug reports (e.g. #290)
about not being able to handle very large memory allocations.
I presume all or most of these are due to guest use of the clang
address sanitizer, which allocates a massive shadow vma.

This patch set copies the linux kernel code for interval trees,
which is what the kernel itself uses for managing vmas.  I then
purge all (real) use of PageDesc from user-only.  This is easy
for user-only because everything tricky happens under mmap_lock();

I have thought only briefly about using interval trees for system
mode too, but the locking situation there is more difficult.  So
for now that code gets moved around but not substantially changed.

The test case from #290 is added to test/tcg/multiarch/.
Before this patch set, on my moderately beefy laptop, it takes 39s
and has an RSS of 28GB before the qemu process is killed.  After
the patch set, the test case successfully allocates 16TB and
completes in 0.013s.

Changes for v2:
  * Rebase on master, 17 patches merged.
  * Structure of page_get_target_data adjusted (ajb).


r~


Richard Henderson (7):
  util: Add interval-tree.c
  accel/tcg: Use interval tree for TBs in user-only mode
  accel/tcg: Use interval tree for TARGET_PAGE_DATA_SIZE
  accel/tcg: Move page_{get,set}_flags to user-exec.c
  accel/tcg: Use interval tree for user-only page tracking
  accel/tcg: Move PageDesc tree into tb-maint.c for system
  accel/tcg: Move remainder of page locking to tb-maint.c

 accel/tcg/internal.h            |  85 +--
 include/exec/exec-all.h         |  43 +-
 include/exec/translate-all.h    |   6 -
 include/qemu/interval-tree.h    |  99 ++++
 accel/tcg/tb-maint.c            | 856 +++++++++++++++++++++++++------
 accel/tcg/translate-all.c       | 746 ---------------------------
 accel/tcg/user-exec.c           | 659 +++++++++++++++++++++++-
 tests/tcg/multiarch/test-vma.c  |  22 +
 tests/unit/test-interval-tree.c | 209 ++++++++
 util/interval-tree.c            | 882 ++++++++++++++++++++++++++++++++
 tests/unit/meson.build          |   1 +
 util/meson.build                |   1 +
 12 files changed, 2592 insertions(+), 1017 deletions(-)
 create mode 100644 include/qemu/interval-tree.h
 create mode 100644 tests/tcg/multiarch/test-vma.c
 create mode 100644 tests/unit/test-interval-tree.c
 create mode 100644 util/interval-tree.c

-- 
2.34.1


