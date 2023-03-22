Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DABE46C4888
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 12:05:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pewHi-0001Hu-FI; Wed, 22 Mar 2023 07:05:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pewHX-0001GJ-5q
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 07:05:28 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pewHV-0005V4-C9
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 07:05:26 -0400
Received: by mail-wr1-x429.google.com with SMTP id d17so8132442wrb.11
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 04:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679483123;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=l8GtnK76XfUw78o0kCPIMz+svD5yze6zrn507ibZyMA=;
 b=nur+yQLrZjQeGNHUMhMkN9iPuVKawlKPSErCgKQwhO0I2DQkJGDCYaMXledc6AAvgE
 FA4YWESgmdPQpIWz/0ZwZ8yc6HCQcS6zm7EVtCT+7+JJSBxPZrwgU+aP25kDuG0FC9Lp
 ovSrLzvIfLGX1qBH/Y7s4Jx0xV85Ogd3yV95MmAufB8JDDPSUI+JC/ceQSgDdWWQK6gr
 zB/TU5xYBSJgB+v4UEYA11MsjG7pdzmD4KtK+LSQvPQ2KhfL4oYx3512xPw91yN9qjWs
 Jjt23631RYaWnjW6gEnmwGdQUPQXx8GpNVa7W+bZPlHH/Z/7exURW1HkPj7oBQ0uhJWZ
 YgkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679483123;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l8GtnK76XfUw78o0kCPIMz+svD5yze6zrn507ibZyMA=;
 b=vyv8x9r62tCI43yTwRGTyGqvRT1QAN34DNl+JoT/GvAx/02spEMS8En4HpHwxG+n2j
 DUMBO4myIQqm76TN0kqtMl18iZT11pjPSrX4k0dxA/bDjMjFm63YepEm+Bf8J+mwXl7z
 0sp2HYtWnpaG1YXNMA5nC42ijBSbmrT+XFZPAdlWdm2l6Q9462Tn4vHnUbzQs0GNnjph
 NlMkEYIau4jTd4aUvnUoTeyh4RkYFCukaXa7FU7Z0XKMnkxhFdtj3QO1k3fAiaIrPfQe
 2uDzNd7ME9XEBcPJSgaFOTQ+veIDejM9omlMOFxZnVdRhLQD4YOj1utHEzVEADiuQfkv
 ct+w==
X-Gm-Message-State: AO0yUKWq7jarKfY0xx3QTgnbj49oz7tE3AvfiJNhNOjbz/IQdxpc7xk4
 FVZ8FB55ovcEAV8ZHkvAG0+h6nXUu9ytwNz8SjEJ0g==
X-Google-Smtp-Source: AK7set+g4Q8KeDyErOMsqJ7TwkFZdpZwzmI+1tweg5Tva+QezxCh/HTHiXElhBIxPT5ILN23sT6LTA==
X-Received: by 2002:adf:de89:0:b0:2cf:aa6e:3ade with SMTP id
 w9-20020adfde89000000b002cfaa6e3ademr4427004wrl.15.1679483123373; 
 Wed, 22 Mar 2023 04:05:23 -0700 (PDT)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 l5-20020adfe585000000b002cea9d931e6sm13632737wrm.78.2023.03.22.04.05.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 22 Mar 2023 04:05:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Yonggang Luo <luoyonggang@gmail.com>, Jintao Yin <nicememory@gmail.com>,
 Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] cirrus.yml: Cover SPICE in the MSYS2 job
Date: Wed, 22 Mar 2023 12:05:21 +0100
Message-Id: <20230322110521.59949-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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

Include the mingw-w64-x86_64-spice package so SPICE is covered:

  C compiler for the host machine: cc -m64 -mcx16 (gcc 12.2.0 "cc (Rev10, Built by MSYS2 project) 12.2.0")
  ...
  Run-time dependency spice-protocol found: YES 0.14.4
  Run-time dependency spice-server found: YES 0.15.1

In particular this would have helped catching the build issue
reported as https://gitlab.com/qemu-project/qemu/-/issues/1553:

  [1851/5253] Compiling C object libcommon.fa.p/ui_spice-core.c.obj
  FAILED: libcommon.fa.p/ui_spice-core.c.obj
  ../ui/spice-core.c: In function 'watch_remove':
  ../ui/spice-core.c:152:5: error: implicit declaration of function 'qemu_close_to_socket' [-Werror=implicit-function-declaration]
  152 |     qemu_close_to_socket(watch->fd);
      |     ^~~~~~~~~~~~~~~~~~~~
  ../ui/spice-core.c:152:5: error: nested extern declaration of 'qemu_close_to_socket' [-Werror=nested-externs]

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
See https://cirrus-ci.com/task/6189732569284608?logs=main#L891

Based-on: <20230322075256.2043812-1-marcandre.lureau@redhat.com>
---
 .cirrus.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.cirrus.yml b/.cirrus.yml
index 5fb00da73d..eb1640814d 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -41,6 +41,7 @@ windows_msys2_task:
       mingw-w64-x86_64-curl
       mingw-w64-x86_64-gnutls
       mingw-w64-x86_64-libnfs
+      mingw-w64-x86_64-spice
     "
     CHERE_INVOKING: 1
   msys2_cache:
-- 
2.38.1


