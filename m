Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3099F59F6E4
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 11:52:58 +0200 (CEST)
Received: from localhost ([::1]:33418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQn4D-0004Um-8V
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 05:52:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmsU-00012L-D0
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:40:50 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:41972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmsS-0001GJ-Ov
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:40:50 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 p9-20020a17090a2d8900b001fb86ec43aaso593984pjd.0
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 02:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=1DPLOLxJPplKModHASULqKHpd5A7q1S4jYAA/H54UVA=;
 b=NTMJESw9CbFuTPFTy7uDbRb7S0q4eiAUy9o9dKmBv5zpRZDNA8lqIkJ+UlpVJTCLpd
 EX0PfRq/IkFCg2Ss90LMEawZU4SYIlOdqkx8RbE09Y0CqsGJcxKLK6BET+RcoPbQo6/J
 V/YJQvhPFTWvmZlwgLUeODuOi6vwLCvsCGexqxEVstebFUMj5DLO0rz9lXIQdpyKhfFu
 7oA7I9jlze/5ip/RvD7em2qId9qwr8YfKEGKknSb5ivQSG+ZYtXTnJX89I2vii+HqGop
 k4TOzQ9br5yN0iLIaAeEAMJCvJDA/2Oca9moGHOwhd0CUZZRv3zY+kgdq4Ro+N4C+hnj
 fCqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=1DPLOLxJPplKModHASULqKHpd5A7q1S4jYAA/H54UVA=;
 b=qHeAtz73o+AyOj5h+nKQ1HyIsCVtcc/IjOSvP8x/uSygpDiNDbhwBDbyC2EH11Kf3+
 kkqrU65Im5BNk7j0fOee8pIKJWWF7OcFAt8GctHa56ywGLSRjo9Ewd7vZEDjyOu6oGCR
 V29Hfx0G6+hONyuRWu4/L1i9X9Jt4SXzD59ArDklrz2hW5zhMcqP5t4tnWOyaKVJ+MUD
 +Eyz4gZml0FrhBljF83z4UcuKi8Ls12UhUfuBUFj/2J/DLoEN50MfUh7boi91Ebbg8Gp
 hg/s5avgWUXhA5jgx0LWV+31+kb1Zhr1ojZJblt1+JFigMtIoAq1zAmQLZUuCzLuVmeE
 OBtw==
X-Gm-Message-State: ACgBeo0QJEmJMk5mGbZHQtK3gmA85IcW22yPt6yt51i4wNRtMTjaa4Yz
 VVz7h7iMVNj9DXyHXB1gv10MjDj+hPI=
X-Google-Smtp-Source: AA6agR4zk0Xa55oBSL+RlSkfR4P9shz7zdk6fr0tBv+CAIvLj0MPkj97lg0oUYwhGQOUO+jgxZKitw==
X-Received: by 2002:a17:902:b413:b0:172:a628:7915 with SMTP id
 x19-20020a170902b41300b00172a6287915mr28472711plr.99.1661334046118; 
 Wed, 24 Aug 2022 02:40:46 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a170903228e00b001728eb339e2sm12165972plh.286.2022.08.24.02.40.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 02:40:45 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH 01/51] tests/qtest: Use g_setenv()
Date: Wed, 24 Aug 2022 17:39:39 +0800
Message-Id: <20220824094029.1634519-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824094029.1634519-1-bmeng.cn@gmail.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Bin Meng <bin.meng@windriver.com>

Windows does not provide a setenv() API, but glib does.
Replace setenv() call with the glib version.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 tests/qtest/fuzz/generic_fuzz.c | 8 ++++----
 tests/qtest/libqtest.c          | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index 447ffe8178..afc1d20355 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -994,16 +994,16 @@ static GString *generic_fuzz_predefined_config_cmdline(FuzzTarget *t)
     g_assert(t->opaque);
 
     config = t->opaque;
-    setenv("QEMU_AVOID_DOUBLE_FETCH", "1", 1);
+    g_setenv("QEMU_AVOID_DOUBLE_FETCH", "1", 1);
     if (config->argfunc) {
         args = config->argfunc();
-        setenv("QEMU_FUZZ_ARGS", args, 1);
+        g_setenv("QEMU_FUZZ_ARGS", args, 1);
         g_free(args);
     } else {
         g_assert_nonnull(config->args);
-        setenv("QEMU_FUZZ_ARGS", config->args, 1);
+        g_setenv("QEMU_FUZZ_ARGS", config->args, 1);
     }
-    setenv("QEMU_FUZZ_OBJECTS", config->objects, 1);
+    g_setenv("QEMU_FUZZ_OBJECTS", config->objects, 1);
     return generic_fuzz_cmdline(t);
 }
 
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 8c159eacf5..ad6860d774 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -1424,7 +1424,7 @@ QTestState *qtest_inproc_init(QTestState **s, bool log, const char* arch,
      * way, qtest_get_arch works for inproc qtest.
      */
     gchar *bin_path = g_strconcat("/qemu-system-", arch, NULL);
-    setenv("QTEST_QEMU_BINARY", bin_path, 0);
+    g_setenv("QTEST_QEMU_BINARY", bin_path, 0);
     g_free(bin_path);
 
     return qts;
-- 
2.34.1


