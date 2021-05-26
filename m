Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B0B391DA3
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 19:13:56 +0200 (CEST)
Received: from localhost ([::1]:39850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llx6R-0007fG-KI
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 13:13:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1llwy8-0006mL-JE
 for qemu-devel@nongnu.org; Wed, 26 May 2021 13:05:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1llwy2-00041z-Oz
 for qemu-devel@nongnu.org; Wed, 26 May 2021 13:05:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622048712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tsozEC/O65XrXttGJnvmQubqaZycdAh0e//OeWpacrI=;
 b=ApDg/FL51dMVaRqM/ClYXzEpGmWZCS+emYnb+s/tifYDI0dJZtu5maadojoWIxw/M2NRMX
 dvmtaPuvC3UAL+kTVax8Kicr0AsIls9aLEL2+vrvJBp84f+XAuZxZcKevmYaxFQnZj2df1
 1EXIJmmngwE+1zC2AHXHiFHY6+0XkjE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-J0zmMjraNU6Dn7eB0s0-4A-1; Wed, 26 May 2021 13:05:11 -0400
X-MC-Unique: J0zmMjraNU6Dn7eB0s0-4A-1
Received: by mail-wr1-f69.google.com with SMTP id
 p11-20020adfc38b0000b0290111f48b8adfso607422wrf.7
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 10:05:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tsozEC/O65XrXttGJnvmQubqaZycdAh0e//OeWpacrI=;
 b=f4889DVfEXijuypgPccxEayjD/RbGrTpPTXxcRbIERJV/mse0jas3SmTMVKTRd2UpM
 tS5oeu62JxJc7J+twr9p934nFT30ZyS64ahU/tvvn/s2bcAgRwvymSb916R22XQZOVyM
 ASJ5KIsve5SXG+b0Hh+0uI8REvKaQDM4pLSA+CJVp1IlbHPX6QLqhPa1IVYBmL3Xs0ib
 dGjonSGIQSFhvAtbN37YbdWiP+njm0jIrrFkZd5naBPJrq7t3lQC2GTLytm0hCya2fYP
 bwxiP8G3+HOFSfBhyHFxze1PjZDeuT8jZyuUFRlPYC/Ox5JPyj5MgpkbMXosKILx9FY1
 3svg==
X-Gm-Message-State: AOAM530hkh2u7xZhojbRAq26xfbbo3udvfwnmhIddUkA4TFmK7H8l81M
 x1j0HOZYVTAVnV3K2DpZtui/lCeuvsEEE8zacza+JRQR7Fopb3+hgBHoWOIY0W90PqWRjiZwEEh
 pIQADF7I4utggdaTwOy8r/qWKE5xiSiiEv2uAp4ngYYPipAdpaS3stJr5AYC8uaw6
X-Received: by 2002:a1c:f30a:: with SMTP id q10mr30088636wmq.138.1622048709997; 
 Wed, 26 May 2021 10:05:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdUHV0TwEgMp9/a0pLsB6U6jSNoUBBCYInmUfTEf71eMiyFKmsXsugqLhQmeAm3ljYZwYUsw==
X-Received: by 2002:a1c:f30a:: with SMTP id q10mr30088602wmq.138.1622048709808; 
 Wed, 26 May 2021 10:05:09 -0700 (PDT)
Received: from localhost.localdomain (64.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.64])
 by smtp.gmail.com with ESMTPSA id p2sm21017502wrj.10.2021.05.26.10.05.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 10:05:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 03/12] qtest: Add qtest_has_accel() method
Date: Wed, 26 May 2021 19:04:23 +0200
Message-Id: <20210526170432.343588-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210526170432.343588-1-philmd@redhat.com>
References: <20210526170432.343588-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
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
index 825b13a44c7..6bda6e1f331 100644
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


