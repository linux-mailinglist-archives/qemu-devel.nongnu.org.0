Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 257FB3BCA3E
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 12:40:47 +0200 (CEST)
Received: from localhost ([::1]:60634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0iVS-0007Vs-3y
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 06:40:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0hu6-0001TV-0h
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:02:10 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:41895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0hu3-0002UP-SS
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:02:09 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 a5-20020a7bc1c50000b02901e3bbe0939bso1852558wmj.0
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 03:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M3EvHDpYBWYLEeRj8A2fJ1IC2EdtujyKIqQke+rzFYo=;
 b=nQHg1yHaWYgieWCa+vJFqSbwaj0ks1xHXXWgcubBn/LTu9xZNFdkqBzuEDd68VIJ58
 UC/mh9cul+qcxsRPNcG937Cdcz/6AHwd7SUtwMg7wFR/DOhZ497ZxcTsLDa2KR1sVC/7
 8EcKs/y/B2GDSGQURmbQNq1zMpxxiMt437vsfCCdPgC5izxuCg4kIarHJFaEpaoe84aa
 sZ/38LYJGOk0kinbvgtKjOzG3LXNLED/yYzdInWTLzs+hf878W/w97R+CExE28ladQcS
 eu0wvR4Wb2QaoST+c20NeJBbcWd1o/66j2nSKB4guZrPWtdvrK4hILqbZryV72+GlNjw
 wkFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=M3EvHDpYBWYLEeRj8A2fJ1IC2EdtujyKIqQke+rzFYo=;
 b=hY+bw4TRUXuBHAg3bIErQZ/AqsJUM2tjW3P3l9i0HwSr40TOPaIlyHpnsBxHaXd0GA
 zI/dvxEVqYv4OY0Y4dyj9Ams+bO7m/A/0MRo2/BQbVk4/NIF6tzwwomCClQCqpgp4D7v
 BuDahu77n6YwZUEfj0dv9JFWN3fC0BgMwbHp/AKRKOya65CdTIee9xguDnhRZIAyXhlh
 wvVcxSy41lhMzoeIndvTo4pI8yuFg83LThMlP8zsS3shpy/HV+AHrLeA67+frH2SQQPz
 YgDh9k6UJqTUWuLdlmKjt2RXwfy4yvyjz8j5sRiXC/QNH24av70W/1zZyWu5vtf7epjH
 LZcw==
X-Gm-Message-State: AOAM533NgbkuZX0ifpbGl49pI63e4f3m98PgwVSqNNrQgjfovEzMRlCk
 ejVdRBooKIrY3CzIrlvoAjqb4m72N5Q=
X-Google-Smtp-Source: ABdhPJxwccu1TwgQ+7VAWfCzmRK1e2LfYIgH3h9I3dDH5bWHnnA/sHma3mvk6k9qqkDrEkq2KXPoig==
X-Received: by 2002:a05:600c:3648:: with SMTP id
 y8mr19750352wmq.174.1625565726455; 
 Tue, 06 Jul 2021 03:02:06 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v15sm2331268wmj.39.2021.07.06.03.02.05 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 03:02:06 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 34/40] keyval: introduce keyval_merge
Date: Tue,  6 Jul 2021 12:01:35 +0200
Message-Id: <20210706100141.303960-35-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210706100141.303960-1-pbonzini@redhat.com>
References: <20210706100141.303960-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch introduces a function that merges two keyval-produced
(or keyval-like) QDicts.  It can be used to emulate the behavior of
.merge_lists = true QemuOpts groups, merging -readconfig sections and
command-line options in a single QDict, and also to implement -set.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/option.h    |  1 +
 tests/unit/test-keyval.c | 58 +++++++++++++++++++++++++++++
 util/keyval.c            | 80 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 139 insertions(+)

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
index be34928813..9bc380686a 100644
--- a/util/keyval.c
+++ b/util/keyval.c
@@ -310,6 +310,86 @@ static char *reassemble_key(GSList *key)
     return g_string_free(s, FALSE);
 }
 
+/*
+ * Recursive worker for keyval_merge.
+ *
+ * @str is the path that led to the * current dictionary (to be used for
+ * error messages).  It is modified internally but restored before the
+ * function returns.
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
+                error_setg(errp, "Parameter '%s%s' used inconsistently",
+                           str->str, ent->key);
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
+/* Merge the @merged dictionary into @dest.
+ *
+ * The dictionaries are expected to be returned by the keyval parser, and
+ * therefore the only expected scalar type is the string.  In case the same
+ * path is present in both @dest and @merged, the semantics are as follows:
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
+ *
+ * Note: while QemuOpts is commonly used so that repeated keys overwrite
+ * ("last one wins"), it can also be used so that repeated keys build up
+ * a list. keyval_merge() can only be used when the options' semantics are
+ * the former, not the latter.
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



