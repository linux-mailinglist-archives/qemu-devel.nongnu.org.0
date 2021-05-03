Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45620372245
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 23:13:27 +0200 (CEST)
Received: from localhost ([::1]:59812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldfsc-0006ag-9Q
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 17:13:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldfpz-0004He-I8
 for qemu-devel@nongnu.org; Mon, 03 May 2021 17:10:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldfpx-00073u-BP
 for qemu-devel@nongnu.org; Mon, 03 May 2021 17:10:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620076240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KvNHYhxkAqUqa9h+Qg11UCChxb8z3nuwgPPE3IGPHzY=;
 b=c6GMeflLwgBNh5HJfnkv6yD7lw9puZf5hYbELqST3Ii1ajxG0/26l8H3q/KD0bpvlaeTSy
 ws29l8QcaPlh+ryeIh+2Y56gZ/EOY1cIUPMO/0NoBSSRdEw+X3F+t9vJdzqF27AzpWYUHl
 T46URzg68NUI6Z5Bcs2TR/8PWhnIJCk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-L8axM1evM-iyU-pfLitjOA-1; Mon, 03 May 2021 17:10:39 -0400
X-MC-Unique: L8axM1evM-iyU-pfLitjOA-1
Received: by mail-wr1-f69.google.com with SMTP id
 63-20020adf84450000b029010dd0171a96so4075587wrf.21
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 14:10:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KvNHYhxkAqUqa9h+Qg11UCChxb8z3nuwgPPE3IGPHzY=;
 b=g42LQSwYDGgwRLuCMpn/4SZx7cOiE3/siiCYH6MajyeCpk8oZ9vnkDuetCJJ6f4Zse
 jGS2JQ/W6BjSApgvpR1paOagH25az2mWwA04PxvP80836GnufEQo2nsPTw8o+GblNFOX
 IbL6LHbzET193+b/zYQRyQ7saOQtRDp5lqx0QDQfqFFqlyfL3oAMSh3utWx9y8iTu1n6
 cDMmEximyn2KGgrhHFJgLQUSAFFzTzil9BvloWYdr8UwImzvC6MayYdz01b2GsCLJJZs
 XnmHsPpyJd1l24u+5/7oUPynNtmQ+vpJaOqAakr/ndgicp8Jl6Sot5Y2QkpJBDbDcfrG
 j4Hw==
X-Gm-Message-State: AOAM533vXoXgEdf8gFJ/hzwWMK06kCnuaOury2gLknw3ikj8tWeXzHAh
 MHsd99SKP0arMTEXwJEZ4+GJjTSeRUXDRKgIIKoY6xr8fWUrsqncD6qIZ3sIxNzVC56YyMXRlXM
 KLMVUf9kjKXarWGdB/lRRzkGMhYISiSkvKmLr7mEn2zdte+bM2lxP/NKNe1b9pUUX
X-Received: by 2002:a5d:6e85:: with SMTP id k5mr10219327wrz.384.1620076238231; 
 Mon, 03 May 2021 14:10:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwuFuYQ+2aP43smcZO0RPFinXpgl5R5Rb9NrBdPc/+OyGvOVf1asvLGJgxgU7Km23ul2B+CzA==
X-Received: by 2002:a5d:6e85:: with SMTP id k5mr10219301wrz.384.1620076238038; 
 Mon, 03 May 2021 14:10:38 -0700 (PDT)
Received: from x1w.redhat.com (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id c2sm742764wmr.22.2021.05.03.14.10.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 14:10:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 03/12] qtest: Add qtest_has_accel() method
Date: Mon,  3 May 2021 23:10:11 +0200
Message-Id: <20210503211020.894589-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210503211020.894589-1-philmd@redhat.com>
References: <20210503211020.894589-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
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


