Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A98E8353240
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Apr 2021 06:05:02 +0200 (CEST)
Received: from localhost ([::1]:36190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSXWu-0006tP-VY
	for lists+qemu-devel@lfdr.de; Sat, 03 Apr 2021 00:05:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1lSXW1-0006MI-5a; Sat, 03 Apr 2021 00:04:05 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:36839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1lSXVz-0004ji-KJ; Sat, 03 Apr 2021 00:04:04 -0400
Received: by mail-pg1-x533.google.com with SMTP id h25so4666703pgm.3;
 Fri, 02 Apr 2021 21:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xg4WzxtO4C/JOGvXXxcmYIFXrx59NHNCnX86F3t0aDY=;
 b=aMsi+mwK07cqHT+Ed8fKOjfL3rI804EMMGk3gUO7KaOVA+To5fZ51UvwjSufVN9oiR
 o9tUzZW0YX/laZBf302cWRldhAmPKn5F6VAcmqktIC1Wm6lf8801jJEwhPGMA/kRFRC9
 6V5hlPvOIJXpatZxs61raYlAzCBnes7qMkqMS9f594ruxVZvGiqpSQqj+ocK/e4Zyi+C
 Ubid0Zb0/qzxGWgwNKDbY6UhEoicNXve2cE6ozpUJjaA7hc5BRptnG7Eaes2KzaGNkIj
 CwJkfq+s6wFbmREWFbHbsmy29wSKy/DT2jZLOinhr0qBkJrBIuJZ05EhMqYwrP2jYT5V
 xIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xg4WzxtO4C/JOGvXXxcmYIFXrx59NHNCnX86F3t0aDY=;
 b=SGuzC46VXNiCrhK4ek4uosh+xV8jxTw5oIFyB5CIiR4zxEwZLjSyJWQ4xcy1Z+5OrB
 RZVGsKQqLHCbpG9UHxDdduIk3L4dR2IMdLNX1RuEb91wwmwB+CLF2TmreiUID0k6ZrEM
 3H7X9rQ9wkcGbElQ7a/CWSTtfmWPIaNpBiyEX9eK784m7Om8ZbLHe3pfXOaWsPrNiMsc
 L9vMQtU7Yey6NZG/oAmyP97c+gbDiQvoLm/BJqgoIMxg/zIx+/k1+7itfW93vCN51XAo
 csSeTKWrX0gPtjQPK8iluS2vcRFBb/tCYjzU7twk0Kgyrbw4TMLhVnABBuOyAvSWtqq+
 Vw2w==
X-Gm-Message-State: AOAM53380k9fsqAx482TX/4RmHWpttaWruyIZwq5JHaGvm4LbvaGgWHK
 kYE8bnAuoajPKyE93OyCgarnWMr3KJE=
X-Google-Smtp-Source: ABdhPJwPPLFecAeNRgpOpTUHO4Db0i/I43vsML/AFkUa3SNLSxXBvKFYXzTDgJqOar8RCl8f9nVT4g==
X-Received: by 2002:a63:1b5c:: with SMTP id b28mr14711993pgm.186.1617422641034; 
 Fri, 02 Apr 2021 21:04:01 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:400:9e10:2d94:bd34:41ff:d945])
 by smtp.gmail.com with ESMTPSA id fv9sm10510709pjb.23.2021.04.02.21.04.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Apr 2021 21:04:00 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/xtensa: fix meson.build rule for xtensa cores
Date: Fri,  2 Apr 2021 21:03:38 -0700
Message-Id: <20210403040338.18929-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Max Filippov <jcmvbkbc@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

import_core.sh tries to change Makefile.objs when importing new xtensa
core, but that file no longer exists. Rewrite meson.build rule to pick
up all source files that match core-*.c pattern and drop commands that
change Makefile.objs.

Cc: qemu-stable@nongnu.org # v5.2.0
Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 target/xtensa/import_core.sh |  3 ---
 target/xtensa/meson.build    | 13 ++++---------
 2 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/target/xtensa/import_core.sh b/target/xtensa/import_core.sh
index c8626a8c02eb..1120a4a2a5e1 100755
--- a/target/xtensa/import_core.sh
+++ b/target/xtensa/import_core.sh
@@ -65,6 +65,3 @@ static XtensaConfig $NAME __attribute__((unused)) = {
 
 REGISTER_CORE($NAME)
 EOF
-
-grep -q core-${NAME}.o "$BASE"/Makefile.objs || \
-    echo "obj-y += core-${NAME}.o" >> "$BASE"/Makefile.objs
diff --git a/target/xtensa/meson.build b/target/xtensa/meson.build
index dd750a977ef9..7c4efa6c6290 100644
--- a/target/xtensa/meson.build
+++ b/target/xtensa/meson.build
@@ -1,14 +1,9 @@
 xtensa_ss = ss.source_set()
+
+xtensa_cores = run_command('sh', '-c', 'cd $MESON_SOURCE_ROOT/$MESON_SUBDIR ; ls -1 core-*.c')
+xtensa_ss.add(files(xtensa_cores.stdout().strip().split('\n')))
+
 xtensa_ss.add(files(
-  'core-dc232b.c',
-  'core-dc233c.c',
-  'core-de212.c',
-  'core-de233_fpu.c',
-  'core-dsp3400.c',
-  'core-fsf.c',
-  'core-sample_controller.c',
-  'core-test_kc705_be.c',
-  'core-test_mmuhifi_c3.c',
   'cpu.c',
   'exc_helper.c',
   'fpu_helper.c',
-- 
2.20.1


