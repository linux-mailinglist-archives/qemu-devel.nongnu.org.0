Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 237A633DB7F
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 18:53:52 +0100 (CET)
Received: from localhost ([::1]:33158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMDt9-0008LS-4Y
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 13:53:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMDRN-0008PN-Fq
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 13:25:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMDRL-0002sB-OG
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 13:25:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615915507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n83T+8pJtXHVyLWFyezdG65ds62knC/7EziKXgLHqlc=;
 b=VN4z9CFcv2XBLhi105wzg1V7dmiVx4QXOz2fW8unQouu2HgQwmfp/Q36LfNmftECXtaSmN
 N6KKaCexSrzNkQ6jpyL/w9RNF34BpEpalwN/6ctozgZo3bYq40uDemMpm2jC8CEfminUpK
 3smtkE+DSx6y75fdd3Jn7n2Qi1kgnwg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-A75USVbQN-aB-0IXnRpWLA-1; Tue, 16 Mar 2021 13:25:04 -0400
X-MC-Unique: A75USVbQN-aB-0IXnRpWLA-1
Received: by mail-wr1-f72.google.com with SMTP id r6so3739484wrt.20
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 10:25:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n83T+8pJtXHVyLWFyezdG65ds62knC/7EziKXgLHqlc=;
 b=fqSeuLeNJ3LeUDZ5y5wSb0cqVpHPk26h5zUxOIF3Ub7fryq10JxDrbY1VE5D3zsx90
 A2bx/QvfvgpUkTT0dFigVP2d+HUps1k8ZRsETBmhH72Q4SfDULuyxdmXyRtmajQ8mLPI
 cQhrW5D35DAiACinzFd7s2bxf0Fx77O7anzWepZD/QtPg2XRbWJPYcBxUK96sQv/maoW
 8NOhrJzlHYDIGKDppx1bxN4vGxmpafGCvsrn0dEaaqbC7pXLdEk/CZZ1vPIF3/UwB/m7
 k7EFv5i35B967PEMsfLfBjLbkMj6LOt3InupJuiCC5vYde1EihfTG+/QwoZ1Nadhz2ps
 nCpA==
X-Gm-Message-State: AOAM532ElvUodzv0fqK5kmOcLIPvbFJ9EraDkhmXo4JBwYzqFmYQURdj
 +XK8iESLQCVG417AxZluexfMtQ4gNphViXYLCeu/6le4X/B6yh1NMcPFughYM29Ha7elLeuTi9L
 0ntpETeKEAav3wg68pbo5GB710PLVNcLCgPYo7CK7XFlGw4Pl0CSzVYEMgl7ZRtaW
X-Received: by 2002:a5d:67cf:: with SMTP id n15mr72689wrw.95.1615915503275;
 Tue, 16 Mar 2021 10:25:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUELAEUWvF83uk7TuLD0mvkv57jXQUtCUcv67bs/lra0Zwjchk66YQ/qVdJgkhlD/1Mki0eg==
X-Received: by 2002:a5d:67cf:: with SMTP id n15mr72658wrw.95.1615915503118;
 Tue, 16 Mar 2021 10:25:03 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id g9sm23621457wrp.14.2021.03.16.10.25.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 10:25:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/4] tests/qtest: Add qtest_has_accel() method
Date: Tue, 16 Mar 2021 18:24:47 +0100
Message-Id: <20210316172449.3148634-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210316172449.3148634-1-philmd@redhat.com>
References: <20210316172449.3148634-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Andrew Jones <drjones@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce the qtest_has_accel() method which allows
to query at runtime if a QEMU instance has an accelerator
built-in.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Since v1:
- rename qtest_probe_accel() -> qtest_has_accel()
- run with -machine none before creating QTestState
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
2.26.2


