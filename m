Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F2150641E
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 08:02:44 +0200 (CEST)
Received: from localhost ([::1]:43504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nggwl-0001i2-0B
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 02:02:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ngglr-000197-AG
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:28 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:36807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nggln-0004Ov-JR
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 01:51:25 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 u17-20020a05600c211100b0038eaf4cdaaeso790856wml.1
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 22:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QDFagQlYRGOosDLeECh2JtUZAH1swXIXmWLoc6DTcyI=;
 b=k+sp+A1WA2dyPNpqYgMZ0f5AAiR69fQt5OUWFHJpTVI5NJyoCTO2igW1nHXGWhseJJ
 TP2dWy4U188wZG5WAuEyv06tWXUgWBjx8VsLyIzq1umi4K/jaV+uuGSqpFq45BHlzutC
 FMxIXues8PyJIvVw3E9MdUfi1JmmyHXnnrcUIrWyJ7vuEW8jR5N0RUj0S9Yd/QX48H92
 RWuYRYBM1MZda6T35I+t9lFhkpQzDdQUvDQ89DHjt9p5qn3vm27+6uN5GIObRRmVsCaC
 oVd5KfyAfnNCyReDnsBAVmwAyZLQt7XIuwTGq1+9/RGJtWnZ3VW6K3hR+N6R7/IW5hwx
 evKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=QDFagQlYRGOosDLeECh2JtUZAH1swXIXmWLoc6DTcyI=;
 b=b8D/cNSsS4yNGUK2m5iT9IZ16EXzefl1hHWMUGoHFoOYjugarv4n7tvtp5DNRMSL0p
 85AOyjN8qP1ahtOPHFIRuJTY5e3dxhtgdC0XB/m5NXEavGAfGK5Ui7/Zu7hEAfzXMoue
 6EV2KS/8GV6ZoBfIpyQ4Wd9jx6AOArkfkUl05Hin18IMHCRj4ypg3R+F6QyI3dw1r+fE
 cKL6SRngtzD9EncMXA0gq7jWP6+JWEDtD5UUNDWL+n7Snx43jL5SMk516dYsQ2uFyHAT
 /kNI7kZySFk4qI7oU3cGsyenvQU73H1OusgNOegnG3Oimo+HCC/mtdnbSGQ1rbwUSBGK
 YevQ==
X-Gm-Message-State: AOAM5319g8AJ8Ib6UrkkzSAlpwq5xW2cWVolWGHsHMXIeyItkfKyr0Nk
 dy/Y+f7BIe2AvJ2OtE5xF9ap5oh4xH1BvQ==
X-Google-Smtp-Source: ABdhPJyG2klFJ63P30hr2fK1mYppnNmcf/eSD6mdi/IyBKWD1Em31pl692gYfbgxTBDdmsA3TtUFsg==
X-Received: by 2002:a1c:f30b:0:b0:380:e444:86b9 with SMTP id
 q11-20020a1cf30b000000b00380e44486b9mr14266626wmq.81.1650347482196; 
 Mon, 18 Apr 2022 22:51:22 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 bg8-20020a05600c3c8800b0038e4c5967besm15763510wmb.3.2022.04.18.22.51.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 22:51:21 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/53] include/qapi: add g_autoptr support for qobject types
Date: Tue, 19 Apr 2022 07:50:30 +0200
Message-Id: <20220419055109.142788-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419055109.142788-1-pbonzini@redhat.com>
References: <20220419055109.142788-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Need wrappers for qobject_unref() calls, which is a macro.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220323155743.1585078-10-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qapi/qmp/qbool.h   | 4 ++++
 include/qapi/qmp/qdict.h   | 4 ++++
 include/qapi/qmp/qlist.h   | 4 ++++
 include/qapi/qmp/qnull.h   | 4 ++++
 include/qapi/qmp/qnum.h    | 4 ++++
 include/qapi/qmp/qstring.h | 4 ++++
 qobject/qbool.c            | 5 +++++
 qobject/qdict.c            | 5 +++++
 qobject/qlist.c            | 5 +++++
 qobject/qnull.c            | 5 +++++
 qobject/qnum.c             | 5 +++++
 qobject/qstring.c          | 5 +++++
 12 files changed, 54 insertions(+)

diff --git a/include/qapi/qmp/qbool.h b/include/qapi/qmp/qbool.h
index 2f888d1057..0d09726939 100644
--- a/include/qapi/qmp/qbool.h
+++ b/include/qapi/qmp/qbool.h
@@ -21,6 +21,10 @@ struct QBool {
     bool value;
 };
 
+void qbool_unref(QBool *q);
+
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(QBool, qbool_unref)
+
 QBool *qbool_from_bool(bool value);
 bool qbool_get_bool(const QBool *qb);
 
diff --git a/include/qapi/qmp/qdict.h b/include/qapi/qmp/qdict.h
index d5b5430e21..882d950bde 100644
--- a/include/qapi/qmp/qdict.h
+++ b/include/qapi/qmp/qdict.h
@@ -30,6 +30,10 @@ struct QDict {
     QLIST_HEAD(,QDictEntry) table[QDICT_BUCKET_MAX];
 };
 
+void qdict_unref(QDict *q);
+
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(QDict, qdict_unref)
+
 /* Object API */
 QDict *qdict_new(void);
 const char *qdict_entry_key(const QDictEntry *entry);
diff --git a/include/qapi/qmp/qlist.h b/include/qapi/qmp/qlist.h
index 06e98ad5f4..e4e985d435 100644
--- a/include/qapi/qmp/qlist.h
+++ b/include/qapi/qmp/qlist.h
@@ -26,6 +26,10 @@ struct QList {
     QTAILQ_HEAD(,QListEntry) head;
 };
 
+void qlist_unref(QList *q);
+
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(QList, qlist_unref)
+
 #define qlist_append(qlist, obj) \
         qlist_append_obj(qlist, QOBJECT(obj))
 
diff --git a/include/qapi/qmp/qnull.h b/include/qapi/qmp/qnull.h
index e84ecceedb..7feb7c7d83 100644
--- a/include/qapi/qmp/qnull.h
+++ b/include/qapi/qmp/qnull.h
@@ -26,4 +26,8 @@ static inline QNull *qnull(void)
     return qobject_ref(&qnull_);
 }
 
+void qnull_unref(QNull *q);
+
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(QNull, qnull_unref)
+
 #endif /* QNULL_H */
diff --git a/include/qapi/qmp/qnum.h b/include/qapi/qmp/qnum.h
index 7f84e20bfb..e86788dd2e 100644
--- a/include/qapi/qmp/qnum.h
+++ b/include/qapi/qmp/qnum.h
@@ -54,6 +54,10 @@ struct QNum {
     } u;
 };
 
+void qnum_unref(QNum *q);
+
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(QNum, qnum_unref)
+
 QNum *qnum_from_int(int64_t value);
 QNum *qnum_from_uint(uint64_t value);
 QNum *qnum_from_double(double value);
diff --git a/include/qapi/qmp/qstring.h b/include/qapi/qmp/qstring.h
index 1d8ba46936..318d815d6a 100644
--- a/include/qapi/qmp/qstring.h
+++ b/include/qapi/qmp/qstring.h
@@ -20,6 +20,10 @@ struct QString {
     const char *string;
 };
 
+void qstring_unref(QString *q);
+
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(QString, qstring_unref)
+
 QString *qstring_new(void);
 QString *qstring_from_str(const char *str);
 QString *qstring_from_substr(const char *str, size_t start, size_t end);
diff --git a/qobject/qbool.c b/qobject/qbool.c
index 16a600abb9..c7049c0c50 100644
--- a/qobject/qbool.c
+++ b/qobject/qbool.c
@@ -56,3 +56,8 @@ void qbool_destroy_obj(QObject *obj)
     assert(obj != NULL);
     g_free(qobject_to(QBool, obj));
 }
+
+void qbool_unref(QBool *q)
+{
+    qobject_unref(q);
+}
diff --git a/qobject/qdict.c b/qobject/qdict.c
index 0216ca7ac1..8faff230d3 100644
--- a/qobject/qdict.c
+++ b/qobject/qdict.c
@@ -442,3 +442,8 @@ void qdict_destroy_obj(QObject *obj)
 
     g_free(qdict);
 }
+
+void qdict_unref(QDict *q)
+{
+    qobject_unref(q);
+}
diff --git a/qobject/qlist.c b/qobject/qlist.c
index 60562a1f52..356ad946b0 100644
--- a/qobject/qlist.c
+++ b/qobject/qlist.c
@@ -182,3 +182,8 @@ void qlist_destroy_obj(QObject *obj)
 
     g_free(qlist);
 }
+
+void qlist_unref(QList *q)
+{
+    qobject_unref(q);
+}
diff --git a/qobject/qnull.c b/qobject/qnull.c
index b26b368219..445a5db7f3 100644
--- a/qobject/qnull.c
+++ b/qobject/qnull.c
@@ -29,3 +29,8 @@ bool qnull_is_equal(const QObject *x, const QObject *y)
 {
     return true;
 }
+
+void qnull_unref(QNull *q)
+{
+    qobject_unref(q);
+}
diff --git a/qobject/qnum.c b/qobject/qnum.c
index 5dd66938dd..2bbeaedc7b 100644
--- a/qobject/qnum.c
+++ b/qobject/qnum.c
@@ -239,3 +239,8 @@ void qnum_destroy_obj(QObject *obj)
     assert(obj != NULL);
     g_free(qobject_to(QNum, obj));
 }
+
+void qnum_unref(QNum *q)
+{
+    qobject_unref(q);
+}
diff --git a/qobject/qstring.c b/qobject/qstring.c
index b4613899b9..794f8c9357 100644
--- a/qobject/qstring.c
+++ b/qobject/qstring.c
@@ -100,3 +100,8 @@ void qstring_destroy_obj(QObject *obj)
     g_free((char *)qs->string);
     g_free(qs);
 }
+
+void qstring_unref(QString *q)
+{
+    qobject_unref(q);
+}
-- 
2.35.1



