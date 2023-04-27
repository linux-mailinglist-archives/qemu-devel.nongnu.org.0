Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5646F08CA
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 17:54:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps3wy-0007nc-0j; Thu, 27 Apr 2023 11:54:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ps3wv-0007mC-7X
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:54:25 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ps3wt-0006mE-58
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:54:24 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-2febac9cacdso5384333f8f.1
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 08:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682610861; x=1685202861;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ce0cdJ9i1NfBLh1+Cb1T4HPYjQLrv+NJRBLrnGH/7bo=;
 b=sqP16VpKZOgf/EXdW4ghzExsmDZrjiEQEUpIASL4UhPilg8U9IiNGhdOtzAiQ6D/BS
 mhPWxIDCcqQU46Ct/SCXUHlkuPuREOIY3TuJobbsByj89fhUQGqOQ9s1BmnDh9XnWB/a
 7zo8fYv9N4cZbD1Td5jysdkXJDmNpJlZ4Bv0tij7DOFZyfWbd40xlcRtF6TrU+ruqlzS
 89JxOKmh3SgvaeTWPVh5FAtZ9Slqs9dnt2UDl7Syw2D0G29n3xZO+jy1CLvlUd3Y/9sa
 dh2xLgD0WdIDXQBgNWZl09sBHRvzwnMPzbj0msQndDud/ki4c2sTWq/9r8CIb9PCnEdT
 MauQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682610861; x=1685202861;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ce0cdJ9i1NfBLh1+Cb1T4HPYjQLrv+NJRBLrnGH/7bo=;
 b=ekvfIL7D4mCFtK1fONgDbwLknsI7GsiB+mftg0wSyQtpn9eRhCy+YRzJjLwRBX4Rza
 89lUD3B90mGZVB5zHWeCrl5/QVKaqEh9VtIccRb05lK0iiQlodah3UPgXG82HnOTI2bC
 Gg3bDTXPbEw1oBv+Rz+CoBBwkGlq1TNKd+pKSpca3ZSgMGgIeWfSZ+DUVV7E6/5mNVEf
 x03MWv5i7L9UmGZJ9USfcSx/dYvN9VtRU1lBffCCuIynQo4QKDvqPAI9Lc5mvgXPOBGd
 W8swxbZ7tW/OrY8I6PLRQbUP6REtLmcIrI2PgaXZXA5up8nllDSY4Bro+yYNrj1+1iBd
 JKPg==
X-Gm-Message-State: AC+VfDyCc/5eyNOR3KTLNEitXezUcky5s9vEcyHskaqNzuBqnT66ibfA
 Nj7gcHBRg/RWoJr9P6VfF85IXQ==
X-Google-Smtp-Source: ACHHUZ4GOR01TJ9omc3Zb5sMrTzh/eu99XyqvcLHyWsr3SJMZUCsy+dtJt1w4HIPpngKzRkcNO/ysw==
X-Received: by 2002:a5d:4d4a:0:b0:2f9:5841:a4d4 with SMTP id
 a10-20020a5d4d4a000000b002f95841a4d4mr1827847wru.27.1682610860790; 
 Thu, 27 Apr 2023 08:54:20 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 j14-20020adfea4e000000b002fc3d8c134bsm18943318wrn.74.2023.04.27.08.54.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 08:54:20 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8D2461FFC7;
 Thu, 27 Apr 2023 16:45:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>
Subject: [PULL 18/18] docs/style: call out the use of GUARD macros
Date: Thu, 27 Apr 2023 16:45:10 +0100
Message-Id: <20230427154510.1791273-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230427154510.1791273-1-alex.bennee@linaro.org>
References: <20230427154510.1791273-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Message-Id: <20230424092249.58552-19-alex.bennee@linaro.org>

diff --git a/docs/devel/style.rst b/docs/devel/style.rst
index ac2ce42a2f..aa5e083ff8 100644
--- a/docs/devel/style.rst
+++ b/docs/devel/style.rst
@@ -665,6 +665,60 @@ Note that there is no need to provide typedefs for QOM structures
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


