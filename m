Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C83DB6BA204
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 23:10:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcCpH-0006QC-7u; Tue, 14 Mar 2023 18:08:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1pcCpE-0006Q4-S6
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 18:08:56 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1pcCp4-0005U0-97
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 18:08:47 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 p13-20020a17090a284d00b0023d2e945aebso2087202pjf.0
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 15:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678831724;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oFc+4RSrxquUR0IzpogNJn3dXpIl2o4oCrUSvpFFA1w=;
 b=SGBCiKv/cvzUd3y3Oxv3980EMjg+HwNh2XsFOoTNsIqMl9tg5OAO7RlHlSidqCdaxl
 f8amApCZH2AMB+JjpJ4WvqHIdKYn56WUndT8aDxm6x0D1R8WAHGwkywNe1V1QiimScOu
 ofCQUsAyiUwa0w4QSemJiqWqRVaHQDLjPh4h3UXq9S0XOmeWIZnFhNtbUXfLagPcdmyB
 QQrqFVN/MAycNV9uMzaz+MQLDuFBFfd5UpQ4WyWLD+o/Wgb1lCK5teqSEpR2KEJ86iGX
 o/uYwjcubdW6SSiHVhlUzZL3V/csKW0GOwuMcBaNr4pFYpPuXF1iSdLAkNQRTUVgm3Ae
 cmSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678831724;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oFc+4RSrxquUR0IzpogNJn3dXpIl2o4oCrUSvpFFA1w=;
 b=Q4xGlyPBa279qpJIKJABhfB1/ZE7U9bF8sqdrhsIp7xEl0ypTbyI8bCifGUUzfazZk
 iAJvAIKkWELSV11pbwtghl/9FbAaNrVRHO+RhVd099qiWN9OQ2xBkHuwtYU2cmXUqUoQ
 oP5Cg8LO7JdsPijPNaGG9BeoclQD8Cq8O8HXz9pC2t4GWKgclDe0M7IOJLGwFJb3j4Hc
 Hh1M3p5x6B0rm5Qi6dD2LtRgihoaV6T7qIOytjh8NuavaL4L7YoNAMmUKLKnyJvQV2eX
 lzDXEmo9uYRdP9TQEUOvs2oGuBfBbr6VLAT+5lC62R/Q0kUzQan/liiDjEGmKNGyEBD2
 ft8g==
X-Gm-Message-State: AO0yUKUh0RcT4mlh55YJnjfPpYi2iXzCkUR6UwmDcXWX1ViOBD7E2Q22
 7TNE3F8Ys2VjY/vgYL07FqSdcZlAVbE=
X-Google-Smtp-Source: AK7set/MQLKRjmJ278Hh7L2HLuib1WxnMIAQfqPrrLyN68js9I450saGQKn6eIfqGrq0OftS40pbvA==
X-Received: by 2002:a05:6a20:158d:b0:c7:717f:4863 with SMTP id
 h13-20020a056a20158d00b000c7717f4863mr47990384pzj.21.1678831724009; 
 Tue, 14 Mar 2023 15:08:44 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:401:1d20:6cf0:82fd:def:4205])
 by smtp.gmail.com with ESMTPSA id
 j4-20020aa783c4000000b00592543d7363sm2101702pfn.1.2023.03.14.15.08.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 15:08:43 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: qemu-devel@nongnu.org
Cc: Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH] tests/tcg/xtensa: add linker.ld to CLEANFILES
Date: Tue, 14 Mar 2023 15:08:32 -0700
Message-Id: <20230314220832.2211028-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Linker script for xtensa tests must be preprocessed for a specific
target, remove it as a part of make clean.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 tests/tcg/xtensa/Makefile.softmmu-target | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/tcg/xtensa/Makefile.softmmu-target b/tests/tcg/xtensa/Makefile.softmmu-target
index 973e55298ee4..948c0e6506bd 100644
--- a/tests/tcg/xtensa/Makefile.softmmu-target
+++ b/tests/tcg/xtensa/Makefile.softmmu-target
@@ -26,6 +26,7 @@ ASFLAGS = -Wa,--no-absolute-literals
 LDFLAGS = -Tlinker.ld -nostartfiles -nostdlib
 
 CRT        = crt.o vectors.o
+CLEANFILES += linker.ld
 
 linker.ld: linker.ld.S
 	$(CC) $(XTENSA_INC) -E -P $< -o $@
-- 
2.30.2


