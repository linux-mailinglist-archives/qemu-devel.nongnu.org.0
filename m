Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0803AB810
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 17:58:50 +0200 (CEST)
Received: from localhost ([::1]:43354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltuPp-00081b-Df
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 11:58:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltuKQ-0006Zv-RO
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 11:53:14 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:43558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltuKO-0001RV-U8
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 11:53:14 -0400
Received: by mail-ed1-x52d.google.com with SMTP id s6so4665688edu.10
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 08:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QV2IkEhhrKo5mk74ZPyHtqyoKqzRDGwZB/XiBTg7CPQ=;
 b=lO2N7GkNLpd9DMXe6JQ6c7OzuaI2tImTDWK33PVk7rqRQoWL/i8LPsxZzYkwTra2y1
 mrHJ8bvaqK5ooLqCYymEBw3OS4kt89J5aGzGvvfJau1ZdjKNMLrlE6MjxMV/XRFgGfrK
 CoSFobXB3FfvuC7romwHOtu570tVv8M3uCUZsQmkJ+J++klXLNzdGO+1pJH5L7xSFjKs
 NO78WOVxGFzec53vxBiN1AXiFFO2Ym24V5rWeg1daXYfxrArrMndoZ2JhGnmrpu5NMvZ
 u5KX5VPJ1Ag3SBTOdMbJnU5+8WaUdX+m1Mm1qvq7QeAjdfUAxsnamdyf7wMO7V7iXYM/
 gb2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=QV2IkEhhrKo5mk74ZPyHtqyoKqzRDGwZB/XiBTg7CPQ=;
 b=BFm9fLCG8V0+h5XWbYfrWzF453PBVHSyJZX/Go1TVbCETmv6gWZz0PBpgTSyk/L6kU
 X0o4t7KJpbOLV126KbnZ3M3BIQfveCGl07302Cwm08V0OpUcIwPU9bI9Ljddw8h2r0TL
 zuTlRoHVbD0b2yLvdEqPWf0K4xS8lB49No+kwP20hHS6Qgd3D3psLSDTcjDBiwYOki4+
 0nyhFxsJmsqbhK4i5sRDWH27jmZ1NCcGlFTreGOQQ3qFJACMxIUwRwko2+8bGhB1/G7m
 RNrguAqEe/Q08pUIsYwor9Zp93TPFVAFPN14GepoD/6SLJbax0KYVqvIz/qkDebta2ZA
 sQtw==
X-Gm-Message-State: AOAM531j8CdJT1QseFOhYDH00QX22RR4stR0/D6Z4BDo+cJyUeDtX+51
 Sn+F8dWRWpeBprqH1rq+pWdu054pzkI=
X-Google-Smtp-Source: ABdhPJxLB5UlhMIOg98sHI+qKfPVo/uMPbJeYNJPSBOtnb4I5uyk4aewDiGSBs4IKDc64eI8JgO4FA==
X-Received: by 2002:a05:6402:31a9:: with SMTP id
 dj9mr5113142edb.164.1623945191452; 
 Thu, 17 Jun 2021 08:53:11 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p13sm4604061edh.79.2021.06.17.08.53.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 08:53:10 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/11] keyval: introduce keyval_merge
Date: Thu, 17 Jun 2021 17:52:59 +0200
Message-Id: <20210617155308.928754-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617155308.928754-1-pbonzini@redhat.com>
References: <20210617155308.928754-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch introduces a function that merges two keyval-produced
(or keyval-like) QDicts.  It can be used to emulate the behavior of
.merge_lists = true QemuOpts groups, merging -readconfig sections and
command-line options in a single QDict, and also to implement -set.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/option.h    |  1 +
 tests/unit/test-keyval.c | 58 ++++++++++++++++++++++++++++++++
 util/keyval.c            | 71 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 130 insertions(+)

diff --git a/include/qemu/option.h b/include/qemu/option.h
index f73e0dc7d9..d89c66145a 100644
--- a/include/qemu/option.h
+++ b/include/qemu/option.h
@@ -149,5 +149,6 @@ QemuOptsList *qemu_opts_append(QemuOptsList *dst, QemuOptsList *list);
 
 QDict *keyval_parse(const char *params, const char *implied_key,
                     bool *help, Error **errp);
+void keyval_merge(QDict *old, const QDict *new, Error **errp);
 
 #endif
diff --git a/tests/unit/test-keyval.c b/tests/unit/test-keyval.c
index e20c07cf3e..af0581ae6c 100644
--- a/tests/unit/test-keyval.c
+++ b/tests/unit/test-keyval.c
@@ -747,6 +747,61 @@ static void test_keyval_visit_any(void)
     visit_free(v);
 }
 
+static void test_keyval_merge_dict(void)
+{
+    QDict *first = keyval_parse("opt1=abc,opt2.sub1=def,opt2.sub2=ghi,opt3=xyz",
+                                NULL, NULL, &error_abort);
+    QDict *second = keyval_parse("opt1=ABC,opt2.sub2=GHI,opt2.sub3=JKL",
+                                 NULL, NULL, &error_abort);
+    QDict *combined = keyval_parse("opt1=ABC,opt2.sub1=def,opt2.sub2=GHI,opt2.sub3=JKL,opt3=xyz",
+                                   NULL, NULL, &error_abort);
+    Error *err = NULL;
+
+    keyval_merge(first, second, &err);
+    g_assert(!err);
+    g_assert(qobject_is_equal(QOBJECT(combined), QOBJECT(first)));
+    qobject_unref(first);
+    qobject_unref(second);
+    qobject_unref(combined);
+}
+
+static void test_keyval_merge_list(void)
+{
+    QDict *first = keyval_parse("opt1.0=abc,opt2.0=xyz",
+                                NULL, NULL, &error_abort);
+    QDict *second = keyval_parse("opt1.0=def",
+                                 NULL, NULL, &error_abort);
+    QDict *combined = keyval_parse("opt1.0=abc,opt1.1=def,opt2.0=xyz",
+                                   NULL, NULL, &error_abort);
+    Error *err = NULL;
+
+    keyval_merge(first, second, &err);
+    g_assert(!err);
+    g_assert(qobject_is_equal(QOBJECT(combined), QOBJECT(first)));
+    qobject_unref(first);
+    qobject_unref(second);
+    qobject_unref(combined);
+}
+
+static void test_keyval_merge_conflict(void)
+{
+    QDict *first = keyval_parse("opt2=ABC",
+                                NULL, NULL, &error_abort);
+    QDict *second = keyval_parse("opt2.sub1=def,opt2.sub2=ghi",
+                                 NULL, NULL, &error_abort);
+    QDict *third = qdict_clone_shallow(first);
+    Error *err = NULL;
+
+    keyval_merge(first, second, &err);
+    error_free_or_abort(&err);
+    keyval_merge(second, third, &err);
+    error_free_or_abort(&err);
+
+    qobject_unref(first);
+    qobject_unref(second);
+    qobject_unref(third);
+}
+
 int main(int argc, char *argv[])
 {
     g_test_init(&argc, &argv, NULL);
@@ -760,6 +815,9 @@ int main(int argc, char *argv[])
     g_test_add_func("/keyval/visit/optional", test_keyval_visit_optional);
     g_test_add_func("/keyval/visit/alternate", test_keyval_visit_alternate);
     g_test_add_func("/keyval/visit/any", test_keyval_visit_any);
+    g_test_add_func("/keyval/merge/dict", test_keyval_merge_dict);
+    g_test_add_func("/keyval/merge/list", test_keyval_merge_list);
+    g_test_add_func("/keyval/merge/conflict", test_keyval_merge_conflict);
     g_test_run();
     return 0;
 }
diff --git a/util/keyval.c b/util/keyval.c
index be34928813..8006c5df20 100644
--- a/util/keyval.c
+++ b/util/keyval.c
@@ -310,6 +310,77 @@ static char *reassemble_key(GSList *key)
     return g_string_free(s, FALSE);
 }
 
+/*
+ * Recursive worker for keyval_merge.  @str is the path that led to the
+ * current dictionary, to be used for error messages.  It is modified
+ * internally but restored before the function returns.
+ */
+static void keyval_do_merge(QDict *dest, const QDict *merged, GString *str, Error **errp)
+{
+    size_t save_len = str->len;
+    const QDictEntry *ent;
+    QObject *old_value;
+
+    for (ent = qdict_first(merged); ent; ent = qdict_next(merged, ent)) {
+        old_value = qdict_get(dest, ent->key);
+        if (old_value) {
+            if (qobject_type(old_value) != qobject_type(ent->value)) {
+                error_setg(errp, "Parameter '%s%s' used inconsistently", str->str, ent->key);
+                return;
+            } else if (qobject_type(ent->value) == QTYPE_QDICT) {
+                /* Merge sub-dictionaries.  */
+                g_string_append(str, ent->key);
+                g_string_append_c(str, '.');
+                keyval_do_merge(qobject_to(QDict, old_value),
+                                qobject_to(QDict, ent->value),
+                                str, errp);
+                g_string_truncate(str, save_len);
+                continue;
+            } else if (qobject_type(ent->value) == QTYPE_QLIST) {
+                /* Append to old list.  */
+                QList *old = qobject_to(QList, old_value);
+                QList *new = qobject_to(QList, ent->value);
+                const QListEntry *item;
+                QLIST_FOREACH_ENTRY(new, item) {
+                    qobject_ref(item->value);
+                    qlist_append_obj(old, item->value);
+                }
+                continue;
+            } else {
+                assert(qobject_type(ent->value) == QTYPE_QSTRING);
+            }
+        }
+
+        qobject_ref(ent->value);
+        qdict_put_obj(dest, ent->key, ent->value);
+    }
+}
+
+/* Merge the @merged dictionary into @dest.  The dictionaries are expected to be
+ * returned by the keyval parser, and therefore the only expected scalar type
+ * is the * string.  In case the same path is present in both @dest and @merged,
+ * the semantics are as follows:
+ *
+ * - lists are concatenated
+ *
+ * - dictionaries are merged recursively
+ *
+ * - for scalar values, @merged wins
+ *
+ * In case an error is reported, @dest may already have been modified.
+ *
+ * This function can be used to implement semantics analogous to QemuOpts's
+ * .merge_lists = true case, or to implement -set for options backed by QDicts.
+ */
+void keyval_merge(QDict *dest, const QDict *merged, Error **errp)
+{
+    GString *str;
+
+    str = g_string_new("");
+    keyval_do_merge(dest, merged, str, errp);
+    g_string_free(str, TRUE);
+}
+
 /*
  * Listify @cur recursively.
  * Replace QDicts whose keys are all valid list indexes by QLists.
-- 
2.31.1



