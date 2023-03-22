Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 573356C4DB0
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 15:29:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pezSh-0003sW-2z; Wed, 22 Mar 2023 10:29:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pezSe-0003mR-BZ
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:29:08 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pezSc-0001x8-LV
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:29:08 -0400
Received: by mail-wr1-x430.google.com with SMTP id r29so17263815wra.13
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 07:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679495345;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hXmwYHo1gPcSAkkXS7unYoWJnodWmu733MTvi8aYqgI=;
 b=gOxAYGDzG/q+RX5JCf979qb+uyEflliQe9IsFbNOfoO7t47af8yVeIWlHkM9hE2UDH
 5ADvUJJxiDEnE+pcA6S5Yg5pyHvzche1Fyb+zlJVJhjOHxAy5POnlZF90LLm4bG1d/Pc
 g/qSzo0bx3jB/jLWb2JVr6eGt8l2dAkKZH1/2NxQrmmI8fUqItmWlBjMmq0OMWTSq4Y5
 oTUEdZf2FFN1ejRGl1WVjQfaDx+878yWSKWrf6rDxoJ/MNUgYSa6ybZGGacFv3oStsj/
 fy45Md+meQnhHYCjm+eHL9zKqFGTKZSuc0ftGmpnsamdenR1/iyrgElyhbk5ji3JnFGw
 aCkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679495345;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hXmwYHo1gPcSAkkXS7unYoWJnodWmu733MTvi8aYqgI=;
 b=SnjtqM/+8q8kZ+iH4VSmUBSWL2QIHDz9buIk2cOEyC0LZnr8B4933l508FbRgebv5y
 C/dCzjalkBsxpG/uTCqLFgxB9DB1Jw45zDoBZl7XSDtN6d1D4p79xDtMA34sTUkNpSna
 X68DbqQUTsCJdKC2Gx/moxpyBEN2T3Uuww9Ua60K9NDLcW5g9OQbxhSGs+W93e2mEeYJ
 ARvuEj5M+h8c727plIdyUEAJtD6JZzpjLjn0fRa6p2Djvo+pTpS4ruPA1U/irDSIyaoH
 UM+3BCSlIllnkNDEUcTa0DFN9uisVKmaBpbYBry4WuqO8kWuHbmTxiDwKcKwOQfBUAOy
 o3CQ==
X-Gm-Message-State: AAQBX9em5GqaWuPYYHpGIzkEBOORex0Kfnf04qqnZWmSIVBVrgFftX8d
 KPJEMDJT22VLq5t52N0rI7dg4B4kKmLQTNv0jHJvxg==
X-Google-Smtp-Source: AKy350Z6PTonO4aFY7YL7hkRs7Ss/y6pHFUJAGCoDFp8sFvnCQmsv56dT8UBgi7jZdiMPMO927gkkw==
X-Received: by 2002:a5d:5956:0:b0:2da:f0b5:258a with SMTP id
 e22-20020a5d5956000000b002daf0b5258amr95282wri.0.1679495344783; 
 Wed, 22 Mar 2023 07:29:04 -0700 (PDT)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 h13-20020a5d430d000000b002d75ef32032sm7020469wrq.68.2023.03.22.07.29.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 22 Mar 2023 07:29:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, Fabiano Rosas <farosas@suse.de>,
 Claudio Fontana <cfontana@suse.de>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.0 0/2] target/arm/gdbstub: Fix builds when TCG is
 disabled
Date: Wed, 22 Mar 2023 15:29:00 +0100
Message-Id: <20230322142902.69511-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Fix when building QEMU configured with --disable-tcg:

  Undefined symbols for architecture arm64:
    "_arm_v7m_get_sp_ptr", referenced from:
        _m_sysreg_get in target_arm_gdbstub.c.o
    "_arm_v7m_mrs_control", referenced from:
        _arm_gdb_get_m_systemreg in target_arm_gdbstub.c.o
    "_pauth_ptr_mask", referenced from:
        _aarch64_gdb_get_pauth_reg in target_arm_gdbstub64.c.o
  ld: symbol(s) not found for architecture arm64
  clang: error: linker command failed with exit code 1 (use -v to see invocation)

Philippe Mathieu-Daudé (2):
  target/arm/gdbstub: Restrict aarch64_gdb_get_pauth_reg() to CONFIG_TCG
  target/arm/gdbstub: Only advertise M-profile features if TCG available

 target/arm/gdbstub.c   | 7 ++++---
 target/arm/gdbstub64.c | 4 ++++
 2 files changed, 8 insertions(+), 3 deletions(-)

-- 
2.38.1


