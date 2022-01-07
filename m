Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9289A487785
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 13:16:52 +0100 (CET)
Received: from localhost ([::1]:44138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5oAs-0004wv-BQ
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 07:16:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n5nwT-0005yU-Ll
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 07:02:01 -0500
Received: from [2a00:1450:4864:20::52e] (port=37846
 helo=mail-ed1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1n5nwR-00059z-Ma
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 07:01:57 -0500
Received: by mail-ed1-x52e.google.com with SMTP id o6so21311885edc.4
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 04:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xOp66BTPLCh5HYAFBG7r4bQF7i+AcGWZvd+puB1plOM=;
 b=ROqj7bXcD88O9QRtzl/W44Hr9aD7ekiGRFpypXp/3ENEhc0UtQ6ZPRzP0VhYq6CsUY
 Cl3XLxFm3qlrKlXMJhCE3CoKjBjdraf6U/St/PInVgQCWfrb1FqMGRncfeoTYrsd/Y6T
 GKOoqujw9cFEQAqfuhuT+LUdKiUZxtlBf3r5hAr8RR4iazGrN6tioiexPSgPrdNdK9Ly
 iPXLCGBiv4t7HcwMRLD1Hle4En+pEq29HeI3ALvWBViVw67PQE89K84wDp8ypj066ZVT
 9/fTHNm7Pshr18n8uZPKsLrLo4PMaLs/uJ4o1j6GoBqm54qtXsuc5fXsJiNDM96wwkVQ
 +3qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=xOp66BTPLCh5HYAFBG7r4bQF7i+AcGWZvd+puB1plOM=;
 b=2dtC7ZmjCCx4NKsXx/8eLzsgJR3aEuv8hW8hpe2H22OiiLZ2drqPWM47nq1aajbvl/
 SDncCN3mQ2o+h+8W+gfX9oQ8hnN3DyYdLB//wV+JcrUCkcoLP/Y/fE4dLqdDdAaZps/N
 fHkEsOncNbJnYsCyZQgDh/sJLFjvyCzv67rUvHhQ5zOtgmF/ljj0a8h01SKPrq0ea90y
 bw351e1IuZom+E+CP+uUt1PiY53imPnz5C2rwA9OaoxaBaWzzLKnWvqEea9KL8BdXkBd
 DtsrK85+fWOF048vozXGUwR95tOm/BQsWyVKOiuYRnN/OBvMP2fto6jDayrTo4WvjPts
 dVUA==
X-Gm-Message-State: AOAM532i5yadAsRSeuGaHprgF95Qnz9Qna933fe7ZVFgqo6VqsFptLsY
 XgHj790GwOzrVZC7gu7LGrdRHEzEhuM=
X-Google-Smtp-Source: ABdhPJwDhBaSPmL+rM5BWHY/0MI4MyYkClLJMBtglHrSxUPkgnGYTP2vXWw+Bf1blDsHKp32+pJWhw==
X-Received: by 2002:a17:907:2ce3:: with SMTP id
 hz3mr48682205ejc.737.1641556912251; 
 Fri, 07 Jan 2022 04:01:52 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6468:f312::224])
 by smtp.gmail.com with ESMTPSA id gs17sm1325180ejc.116.2022.01.07.04.01.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 04:01:51 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] meson: build all modules by default
Date: Fri,  7 Jan 2022 13:01:43 +0100
Message-Id: <20220107120143.522834-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With more recent versions of Meson, the build.ninja file is more selective
as to what is built by default, and not building the modules results in test
failures.

Mark the modules as built-by-default and, to make the dependencies more
precise, also require them to be up-to-date before running tests.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/801
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build             | 4 +++-
 tests/qtest/meson.build | 3 +--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meson.build b/meson.build
index 6489ff8425..703eefea13 100644
--- a/meson.build
+++ b/meson.build
@@ -2866,8 +2866,10 @@ common_ss.add(hwcore)
 # Targets #
 ###########
 
+emulator_modules = []
 foreach m : block_mods + softmmu_mods
-  shared_module(m.name(),
+  emulator_modules += shared_module(m.name(),
+                build_by_default: true,
                 name_prefix: '',
                 link_whole: m,
                 install: true,
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 37e1eaa449..26937deb6d 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -335,10 +335,9 @@ foreach dir : target_dirs
         test: executable(test, src, dependencies: deps)
       }
     endif
-    # FIXME: missing dependency on the emulator binary and qemu-img
     test('qtest-@0@/@1@'.format(target_base, test),
          qtest_executables[test],
-         depends: [test_deps, qtest_emulator],
+         depends: [test_deps, qtest_emulator, emulator_modules],
          env: qtest_env,
          args: ['--tap', '-k'],
          protocol: 'tap',
-- 
2.33.1


