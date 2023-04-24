Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF60B6EC8DD
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:31:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsWA-0003zL-Pj; Mon, 24 Apr 2023 05:29:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pqsVj-0003o9-D6
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:29:29 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pqsVe-0006cD-DC
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:29:26 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-2f7db354092so2465916f8f.2
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 02:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682328560; x=1684920560;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b/rn85BLkY7Z2OPz7xDZllD6kTbU8YWvJhq44VxZVFA=;
 b=cWdCeBFwHORwSIrh3xV/ytU3JtqALq3T08Tf2im2Jdj3x4XRhiqBmltJDubRUTBGOz
 vxuIOf1QQFS8BEj47uBdidywyPym28gKmcXooJGHaOSXjivv9TfSkFAl4SMuBcASMcNk
 SPXPk9FpxtjzpBujJsucdfrW1Tz7pQp6xMk9Vr9P8qzVyCBSQYGsbat14saVL/b7DAXt
 0T5hylQqJW2AGYoqZkqHO5nyvhkcG/Cbp2nYfOGXfdczWF9DRniEWrT6eta42O2JKvob
 A++PQuWWIMLOJLFFFyZtvjmmSFWadE3cRXBvpKniYcyvcK3fow/Ufv0s0upQZ1b5aYQZ
 5qFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682328560; x=1684920560;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b/rn85BLkY7Z2OPz7xDZllD6kTbU8YWvJhq44VxZVFA=;
 b=VLGR7KogXtRJpd9fc2Dxfw4GROdpb2i7hYSSsCyjSmNX1Jf23s+UXC84KslM3fPpNk
 AWwOkqt2dBsR3tEq8lCwG+rWp93TkFk3Llr0qLVLzFOuicnhO5Yls+6k5EyxZ59A4xAK
 mdwxU96SYJvThwn5W2GtZKvCkoqMNVzQYyuOu3b/ka3FTU3WQy4hj6MAoMFWvnLb7eJa
 JspTUMRhm29j4BVbUAZwrBiS9+6qwWJ50oJcwh2WLcZt+Sicpb/7pw4fiqTxlEyS3eOY
 6xpUeRH4DZZh/n8mr8aKJyBBomTwsyYLCCKYizTwDOsf55rxO9eBp+MLImauhC1PPn35
 a72Q==
X-Gm-Message-State: AAQBX9fQ4Y1U5gMPVPIQpbFUbZzDlTXkvENiPD6D/xLUzH5ET6ZMqzHO
 pITsrxSbUpnrWJngFjU13wwxMA==
X-Google-Smtp-Source: AKy350ZKWTquy6A7fyB1c9SkjqRVf+6u4YmGch3J6MJ7gzXAtWD52fKtfo+fzD6lZz04/hfSHGkWCg==
X-Received: by 2002:a5d:4e01:0:b0:304:6715:8728 with SMTP id
 p1-20020a5d4e01000000b0030467158728mr5095286wrt.18.1682328560614; 
 Mon, 24 Apr 2023 02:29:20 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 h3-20020a5d5043000000b002c70ce264bfsm10327237wrt.76.2023.04.24.02.29.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 02:29:19 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 87A481FFC8;
 Mon, 24 Apr 2023 10:22:51 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Markus Armbruster <armbru@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PATCH 18/18] docs/style: call out the use of GUARD macros
Date: Mon, 24 Apr 2023 10:22:49 +0100
Message-Id: <20230424092249.58552-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230424092249.58552-1-alex.bennee@linaro.org>
References: <20230424092249.58552-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Message-Id: <20230420155723.1711048-10-alex.bennee@linaro.org>

---
vppr:
  - show example of what QEMU_LOCK_GUARD makes easier (although I
  didn't repeat for the WITH_ form)
---
 docs/devel/style.rst | 54 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/docs/devel/style.rst b/docs/devel/style.rst
index e9fce0fc69..b97e5111fc 100644
--- a/docs/devel/style.rst
+++ b/docs/devel/style.rst
@@ -668,6 +668,60 @@ Note that there is no need to provide typedefs for QOM structures
 since these are generated automatically by the QOM declaration macros.
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
+will ensure s->lock is released however the function is exited. The
+equivalent code without _GUARD macro makes us to carefully put
+qemu_mutex_unlock() on all exit points:
+
+.. code-block:: c
+
+    static int my_critical_function(SomeState *s, void *data)
+    {
+        qemu_mutex_lock(&s->lock);
+        do_thing1(data);
+        if (check_state2(data)) {
+            qemu_mutex_unlock(&s->lock);
+            return -1;
+        }
+        do_thing3(data);
+        qemu_mutex_unlock(&s->lock);
+        return 0;
+    }
+
+There are often ``WITH_`` forms of macros which more easily wrap
+around a block inside a function.
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


