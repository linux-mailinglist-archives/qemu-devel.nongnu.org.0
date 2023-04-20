Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8F66E98F4
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 17:59:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppWfA-0000E5-Pr; Thu, 20 Apr 2023 11:57:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppWf6-0000Bw-Sq
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:57:32 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppWf4-0007vG-Kg
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:57:32 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3023a56048bso375204f8f.3
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 08:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682006249; x=1684598249;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iXPQOZPEUZEREA0kEgOAFX8HZGCmldGugGG6ngHb1YM=;
 b=H2RmtedtHKryhRg+/vuUtN4soB/0wIE2YXEtxi24tXAJLBEScZikGhtSLQUFkwumEW
 svf3n1/uX7b9+Kh97ldiPoURwzWV6xMRW6JiqzEkGUTr0SokN9bbQN5r1rkwPhnUGyPY
 kwA8mqj5apCsmmoNOlZcNh7si62J4O+i2i7yNl5JM4/qJ3aMS9ToU2f1XvyLVhU1gtnF
 b2oGHoZDAWs9WsSypgcsUfnRzhgZk67t7RYViNTK+2CZ5Ruq1+PfYX7qA38Kda9j0lWl
 SUWY1LI9O3mPgt9MO4SB0vz+V/vVQCuGVmMaNQJiwfrX2EQScTTT7+UNGHe0Qj4K7rqE
 SrlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682006249; x=1684598249;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iXPQOZPEUZEREA0kEgOAFX8HZGCmldGugGG6ngHb1YM=;
 b=dHyjLnRedM4SNfDQCApMkVjBA8gZPRsjj+BdaEodXg2qRzX7g1n2hgD43B8SIlpeIZ
 yv3YftrhVtJge4/p2SBThWBzCkdJ70u2lz9cOK76wxBv9zcrsloRNbYzZOvO+Yu/f03j
 vd1wW4Yv7vjtmx5W6dVp86tnIuXR4ZdBKLxRwx63w+o3qDqo0iWw+VkTyt2xATSZe4y0
 QFDvvuVXdTATVL5RhtdQ4CnBjt3HAy1Mx1PtVLK7MeN4Vf5NGSePXqU0lDUIvTLvhQpb
 K999M2AICRZp/TKpNPsx7h9aTwu9uDu/GqecIPMHX4WdmNo7fvI8EZr323oHp6UzH6WR
 ROqQ==
X-Gm-Message-State: AAQBX9d+AfBOg7KFvK5xakE5M0+06BdL78CCuXYgdoqIBAP1ztdmYjH/
 UQHhc/5GwRoBJU6aiwZs2UYZDQ==
X-Google-Smtp-Source: AKy350YhC1dp0R0AIh5O5ew6eoG0T9peMCa3VXbZuVJIm2MQPTaclmOQCz4vTE45o/H89h/dgvmBGw==
X-Received: by 2002:a5d:5304:0:b0:2f8:67ee:5ca9 with SMTP id
 e4-20020a5d5304000000b002f867ee5ca9mr1770490wrv.65.1682006248873; 
 Thu, 20 Apr 2023 08:57:28 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 m7-20020a5d4a07000000b002c55521903bsm2276042wrq.51.2023.04.20.08.57.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 08:57:27 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6D2E11FFC1;
 Thu, 20 Apr 2023 16:57:24 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Juan Quintela <quintela@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: [PATCH 9/9] docs/style: call out the use of GUARD macros
Date: Thu, 20 Apr 2023 16:57:23 +0100
Message-Id: <20230420155723.1711048-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230420155723.1711048-1-alex.bennee@linaro.org>
References: <20230420155723.1711048-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

There use makes our code safer so we should mention them.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/style.rst | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/docs/devel/style.rst b/docs/devel/style.rst
index 0bd01f3fca..b50a981a86 100644
--- a/docs/devel/style.rst
+++ b/docs/devel/style.rst
@@ -657,6 +657,42 @@ that declaration and the new code.
 
 See :ref:`qom` for more details.
 
+QEMU GUARD macros
+=================
+
+QEMU provides a number of ``_GUARD`` macros intended to make the
+handling of multiple exit paths easier. For example using
+``QEMU_LOCK_GUARD`` to take a lock will ensure the lock is released on
+exit from the function.
+
+.. code-block:: c
+
+    static int my_critical_function(SomeState *s, void *data)
+    {
+        QEMU_LOCK_GUARD(&s->lock);
+        do_thing1(data);
+        if (check_state2(data)) {
+            return -1;
+        }
+        do_thing3(data);
+        return 0;
+    }
+
+will ensure s->lock is released however the function is exited. There
+are often ``WITH_`` forms of macros which more easily wrap around a
+block inside a function.
+
+.. code-block:: c
+
+    WITH_RCU_READ_LOCK_GUARD() {
+        QTAILQ_FOREACH_RCU(kid, &bus->children, sibling) {
+            err = do_the_thing(kid->child);
+            if (err < 0) {
+                return err;
+            }
+        }
+    }
+
 Error handling and reporting
 ============================
 
-- 
2.39.2


