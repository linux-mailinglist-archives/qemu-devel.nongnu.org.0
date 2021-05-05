Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 801B9373BE0
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 15:01:27 +0200 (CEST)
Received: from localhost ([::1]:59326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leH9a-0002mW-In
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 09:01:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leH6j-000152-Sm
 for qemu-devel@nongnu.org; Wed, 05 May 2021 08:58:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leH6g-0003tz-OY
 for qemu-devel@nongnu.org; Wed, 05 May 2021 08:58:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620219505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KvNHYhxkAqUqa9h+Qg11UCChxb8z3nuwgPPE3IGPHzY=;
 b=M50zQExdI5z6pjmc9weBAtq99Zye3QYcml8OgkFIQ+jiaNNt81uTYNMI+zCYH9yAtLwBtA
 8yGmUfrH4OyQRiUHZzm1589k1pWgTrSDpS9TxYc5ahwb26cqsVdOEgyWTdeWgjlY6jdfj2
 UYljISgH830oIIJTNDGUvEs/i436T5c=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-MI-BnDHRN4el-SMgiKK-Cg-1; Wed, 05 May 2021 08:58:24 -0400
X-MC-Unique: MI-BnDHRN4el-SMgiKK-Cg-1
Received: by mail-wr1-f71.google.com with SMTP id
 a7-20020adfc4470000b029010d875c66edso652627wrg.23
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 05:58:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KvNHYhxkAqUqa9h+Qg11UCChxb8z3nuwgPPE3IGPHzY=;
 b=YRguh1TiSvH4yQnx9umrW7/WNIV3I1u616ft7nlccTNWUQoAMUJsnPQWa4qR057f2o
 CN1uVGx/ym8OkU1TBdzTKQN8PzdPyt6hsTsbk4LQ/F9MproKHW36dM3fqwhz+h0TvaFL
 3ITNxQfxVeO82enF2b6PzKvShpXkNH/qWQDb377fTgH0TaQwe0yVfYMntKLmRixoXOz9
 Mxw8L57dK4/iMX6lf/KGlN1rVT8xxdIENlJAborygysNmdGZdo3UQcZaLnnNR70zZSW9
 6JzqcB1pZN5nLvidwjD/hqpjvPPkiF7fI0L6PhBYc1q7psya7dy5YQlgL0ZptpX/ttyp
 FIfw==
X-Gm-Message-State: AOAM532T2Cur51xxk1WPWUhixkODeb3Db3tQ7J1t9O0eDFLO1w9kLEe+
 jofVa+UetpQrH8MpTZZeNCWD+U4M0Bx7xuGn4g1xrWEigzDjEaO0rtODaeFf7fdXJvTi6hcLHJ3
 EubI6HssCIx6N78blfiNdgh3Z3+cSMnzK0rTsEAJ0StjfAfDmjeSzQ6lBpCRa2eok
X-Received: by 2002:adf:ed45:: with SMTP id u5mr15829989wro.199.1620219502865; 
 Wed, 05 May 2021 05:58:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNo2D6PZILA0Vq7wMbOkg2iDt7DfReg4mZ/bqMRnkvskJr+2GGSYypqiaUTWJko9PE3n/uNQ==
X-Received: by 2002:adf:ed45:: with SMTP id u5mr15829959wro.199.1620219502615; 
 Wed, 05 May 2021 05:58:22 -0700 (PDT)
Received: from x1w.redhat.com
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id m18sm19402579wrn.69.2021.05.05.05.58.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 05:58:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 03/12] qtest: Add qtest_has_accel() method
Date: Wed,  5 May 2021 14:57:57 +0200
Message-Id: <20210505125806.1263441-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210505125806.1263441-1-philmd@redhat.com>
References: <20210505125806.1263441-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce the qtest_has_accel() method which allows a runtime
query on whether a QEMU instance has an accelerator built-in.

Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/libqos/libqtest.h |  8 ++++++++
 tests/qtest/libqtest.c        | 29 +++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/tests/qtest/libqos/libqtest.h b/tests/qtest/libqos/libqtest.h
index a68dcd79d44..d80c618c18d 100644
--- a/tests/qtest/libqos/libqtest.h
+++ b/tests/qtest/libqos/libqtest.h
@@ -763,6 +763,14 @@ void qmp_expect_error_and_unref(QDict *rsp, const char *class);
  */
 bool qtest_probe_child(QTestState *s);
 
+/**
+ * qtest_has_accel:
+ * @accel_name: Accelerator name to check for.
+ *
+ * Returns: true if the accelerator is built in.
+ */
+bool qtest_has_accel(const char *accel_name);
+
 /**
  * qtest_set_expected_status:
  * @s: QTestState instance to operate on.
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 71e359efcd3..2156b7e3972 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -393,6 +393,35 @@ QTestState *qtest_init_with_serial(const char *extra_args, int *sock_fd)
     return qts;
 }
 
+bool qtest_has_accel(const char *accel_name)
+{
+    bool has_accel = false;
+    QDict *response;
+    QList *accels;
+    QListEntry *accel;
+    QTestState *qts;
+
+    qts = qtest_initf("-accel qtest -machine none");
+    response = qtest_qmp(qts, "{'execute': 'query-accels'}");
+    accels = qdict_get_qlist(response, "return");
+
+    QLIST_FOREACH_ENTRY(accels, accel) {
+        QDict *accel_dict = qobject_to(QDict, qlist_entry_obj(accel));
+        const char *name = qdict_get_str(accel_dict, "name");
+
+        if (g_str_equal(name, accel_name)) {
+            has_accel = true;
+            break;
+        }
+    }
+    qobject_unref(response);
+
+    qtest_quit(qts);
+
+    return has_accel;
+}
+
+
 void qtest_quit(QTestState *s)
 {
     qtest_remove_abrt_handler(s);
-- 
2.26.3


