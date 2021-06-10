Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE9D3A2D35
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 15:37:33 +0200 (CEST)
Received: from localhost ([::1]:48504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrKsG-0004Gi-Gw
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 09:37:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lrKqY-0001av-0w
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:35:46 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:33661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lrKqV-0005dT-W0
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:35:45 -0400
Received: by mail-wr1-x42d.google.com with SMTP id a20so2401029wrc.0
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 06:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qih0GKGRLKmsxOwD0kzGhjmPgfqEGBiIre4xMkTVeaI=;
 b=ROyIpx71McJWuMv6RtnBZWNiPCQ4qKObtSw5JojLQA+1wwQpxp1gnrlzcBWKX8SJf6
 swaGWKQEVILBPfZYOK/Xl2JXmVf5WRO0lTAVBMphQYR9cXT9o3HUS75HCh9T7gb68DHu
 Z0u8f122RhhOn9QTBRA1aYaS9VSDRE5ZFOchpmo2r2kk3bqOjGN2YuG/FlxA2IUdIjPY
 ACbvDHeFN5qOAonE/1voEgv3VAWmuEmNKOJZ2AapJujJnITGfxUm/ZEfrB3Pb77CFp8c
 wVwLVKubBdP0KTna3AitzpwNOWFDbi70K4fVslLutbAZkWGE+pbQw3Mu66/OJv6H760W
 2+BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Qih0GKGRLKmsxOwD0kzGhjmPgfqEGBiIre4xMkTVeaI=;
 b=Q8YY63tsONvibBUjvDDUHdJt0VHAVtuPr02ingfi8vKljFTwZ041cpWfG3vp0DYw8I
 UKnEMTviG7Lh1AYzmirkdLOLpukKlQpT0NvdlK6t/jAn3bYiUUyuYffw+182oxO48Pbr
 p9KiNw4+0uiQxjCIEY3VWs4IqIUhTPyf3ebF0J0FSO6jjM2GAlsxOrcScDikR2aOJ7jl
 Z435gfuHO44xNRv0gxeIcJRB4C0AE3w6hbvpPrtkDYS+r+0h5B+VAjJNRSEhgVpSbJsR
 xs8HxAm9ltTNagL6109w6gCxPymVlrNTulIa4AxQJbahw0EQuKSbkZ5cUK5+lDMJY/7d
 Oljg==
X-Gm-Message-State: AOAM530NGvgJu31QQTBgmKwGP95w9JGXCS7WuxKuijGb4LSj/UGBEEVP
 +d5TQ0gqln0+AB/e/MMPX04+tdZKu74EPA==
X-Google-Smtp-Source: ABdhPJze1A0r9/w316C1CMA2QQEwUjVzwNoqob/lLzFnSeXcKaKxmulTIcUFit8AEVfcoFfvMs1cbg==
X-Received: by 2002:a5d:6acf:: with SMTP id u15mr5620993wrw.262.1623332141869; 
 Thu, 10 Jun 2021 06:35:41 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 v8sm4032519wrc.29.2021.06.10.06.35.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 06:35:41 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/11] keyval: introduce keyval_merge
Date: Thu, 10 Jun 2021 15:35:29 +0200
Message-Id: <20210610133538.608390-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210610133538.608390-1-pbonzini@redhat.com>
References: <20210610133538.608390-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42d.google.com
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
Cc: berrange@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch introduces a function that merges two keyval-produced
(or keyval-like) QDicts.  It can be used to emulate the behavior of
.merge_lists = true QemuOpts groups, merging -readconfig sections and
command-line options in a single QDict, and also to implement -set.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/option.h    |  1 +
 tests/unit/test-keyval.c | 56 ++++++++++++++++++++++++++++++++++++++++
 util/keyval.c            | 47 +++++++++++++++++++++++++++++++++
 3 files changed, 104 insertions(+)

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
index e20c07cf3e..254b51e98c 100644
--- a/tests/unit/test-keyval.c
+++ b/tests/unit/test-keyval.c
@@ -747,6 +747,59 @@ static void test_keyval_visit_any(void)
     visit_free(v);
 }
 
+static void test_keyval_merge_success(void)
+{
+    QDict *old = keyval_parse("opt1=abc,opt2.sub1=def,opt2.sub2=ghi,opt3=xyz",
+                              NULL, NULL, &error_abort);
+    QDict *new = keyval_parse("opt1=ABC,opt2.sub2=GHI,opt2.sub3=JKL",
+                              NULL, NULL, &error_abort);
+    QDict *combined = keyval_parse("opt1=ABC,opt2.sub1=def,opt2.sub2=GHI,opt2.sub3=JKL,opt3=xyz",
+                                   NULL, NULL, &error_abort);
+    Error *err = NULL;
+
+    keyval_merge(old, new, &err);
+    g_assert(!err);
+    g_assert(qobject_is_equal(QOBJECT(combined), QOBJECT(old)));
+    qobject_unref(old);
+    qobject_unref(new);
+    qobject_unref(combined);
+}
+
+static void test_keyval_merge_list(void)
+{
+    QDict *old = keyval_parse("opt1.0=abc,opt2.0=xyz",
+                              NULL, NULL, &error_abort);
+    QDict *new = keyval_parse("opt1.0=def",
+                              NULL, NULL, &error_abort);
+    QDict *combined = keyval_parse("opt1.0=abc,opt1.1=def,opt2.0=xyz",
+                                   NULL, NULL, &error_abort);
+    Error *err = NULL;
+
+    keyval_merge(old, new, &err);
+    g_assert(!err);
+    g_assert(qobject_is_equal(QOBJECT(combined), QOBJECT(old)));
+    qobject_unref(old);
+    qobject_unref(new);
+    qobject_unref(combined);
+}
+
+static void test_keyval_merge_conflict(void)
+{
+    QDict *old = keyval_parse("opt2.sub1=def,opt2.sub2=ghi",
+                              NULL, NULL, &error_abort);
+    QDict *new = keyval_parse("opt2=ABC",
+                              NULL, NULL, &error_abort);
+    Error *err = NULL;
+
+    keyval_merge(new, old, &err);
+    error_free_or_abort(&err);
+    keyval_merge(old, new, &err);
+    error_free_or_abort(&err);
+
+    qobject_unref(old);
+    qobject_unref(new);
+}
+
 int main(int argc, char *argv[])
 {
     g_test_init(&argc, &argv, NULL);
@@ -760,6 +813,9 @@ int main(int argc, char *argv[])
     g_test_add_func("/keyval/visit/optional", test_keyval_visit_optional);
     g_test_add_func("/keyval/visit/alternate", test_keyval_visit_alternate);
     g_test_add_func("/keyval/visit/any", test_keyval_visit_any);
+    g_test_add_func("/keyval/merge/success", test_keyval_merge_success);
+    g_test_add_func("/keyval/merge/list", test_keyval_merge_list);
+    g_test_add_func("/keyval/merge/conflict", test_keyval_merge_conflict);
     g_test_run();
     return 0;
 }
diff --git a/util/keyval.c b/util/keyval.c
index be34928813..0797f36e1d 100644
--- a/util/keyval.c
+++ b/util/keyval.c
@@ -310,6 +310,53 @@ static char *reassemble_key(GSList *key)
     return g_string_free(s, FALSE);
 }
 
+/* Merge two dictionaries.  */
+static void keyval_do_merge(QDict *old, const QDict *new, GString *str, Error **errp)
+{
+    size_t save_len = str->len;
+    const QDictEntry *ent;
+    QObject *old_value;
+
+    for (ent = qdict_first(new); ent; ent = qdict_next(new, ent)) {
+        old_value = qdict_get(old, ent->key);
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
+            }
+        }
+
+        qobject_ref(ent->value);
+        qdict_put_obj(old, ent->key, ent->value);
+    }
+}
+
+void keyval_merge(QDict *old, const QDict *new, Error **errp)
+{
+    GString *str = g_string_new("");
+    keyval_do_merge(old, new, str, errp);
+    g_string_free(str, TRUE);
+}
+
 /*
  * Listify @cur recursively.
  * Replace QDicts whose keys are all valid list indexes by QLists.
-- 
2.31.1



