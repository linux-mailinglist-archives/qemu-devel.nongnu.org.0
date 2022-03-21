Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDE04E2E7C
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 17:47:56 +0100 (CET)
Received: from localhost ([::1]:57712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWLCF-0005TP-M6
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 12:47:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nWL7M-0007BT-8s
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 12:42:52 -0400
Received: from [2a00:1450:4864:20::52c] (port=34531
 helo=mail-ed1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nWL7K-0007d8-GI
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 12:42:51 -0400
Received: by mail-ed1-x52c.google.com with SMTP id h1so18558038edj.1
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 09:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OfhcIiLCY45YF/Ut1w62m8ui11c4whw09XU1Y5ZWGnU=;
 b=etcDERE97ferYwARvLG6VLfhPq3WCSK3EhA6eZlkbTF46qE4GyeJpBhRnn/DZueCDZ
 CMLVXO5/MJyv/EyIRILpBHsmgfZk349Q6IMdIOnjSaj2Co90mSKSkSyn3+QOwrAPtv69
 BcSva1QPSBbhnbnk6T4qc4MR7rUBQFFOJxS1o+yZT17ltm5ZruIoFRwSCE9E5XyAivJ8
 qjJSOCWFe9e3VGg2/j+82hMEQ5RSmTiLzB2jOFrnXhOhIDGjD9osF2BEw2lNzZNRTdYm
 cIppwLsUbMlzkom19OrA7Ne+lpxwniK4LrP18oWMl/PUOJLqeNtdpLeSApaaaC4y4zAA
 LGFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=OfhcIiLCY45YF/Ut1w62m8ui11c4whw09XU1Y5ZWGnU=;
 b=MnLHTjOjwv5Jgb5C91jYOz46oIRbVwIhu7spNl8Pzw4cpMuc7zCNIImCAI4JFcZssO
 Mj4gxAZKuKbsh/OxtpOFfNZsymgDJwid2x5Bl4q5oac1yg0kggzQnTt3LgfMQ8phn5E6
 PD5qZwRWP4W3kbm2LP+KIFAuUDkkzZM47OJWpdtSgvQkyvGdDn8yUNplYNB3qNM9lDql
 i+8wAwKjlQ6Wc4Hd1fkGd9+UJoWvY0Bl/BPoncthJgHNvuagk6nSz0OLwGYfaLFZJCTd
 7l/KvlHO8fYZJywd83GpUZZqFK7LaRnvNrgrm0AWdaLVYsig9ohp7fzYg+Bj5lUV77g1
 6k9w==
X-Gm-Message-State: AOAM532vt5tfkDAcY3sYtmnAa9TR4S7cmu+fmRzgI1+/S8WpetdygdB6
 en/gtW0KG2pc/RgLvye5QmLKuTLVVuM=
X-Google-Smtp-Source: ABdhPJxcKFpyVITHq65sijmLrsEGvf3IU7bOWcoUnfeUL0PqtIIopImxFbAg7PhAEdNe4TN0wk2muw==
X-Received: by 2002:aa7:c683:0:b0:418:f5f3:9684 with SMTP id
 n3-20020aa7c683000000b00418f5f39684mr23605511edq.184.1647880969213; 
 Mon, 21 Mar 2022 09:42:49 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a50d802000000b00410d7f0c52csm8289385edj.8.2022.03.21.09.42.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 09:42:48 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] qapi-schema: test: add a unit test for parsing array
 alternates
Date: Mon, 21 Mar 2022 17:42:43 +0100
Message-Id: <20220321164243.200569-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220321164243.200569-1-pbonzini@redhat.com>
References: <20220321164243.200569-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/qapi-schema/qapi-schema-test.json |  1 +
 tests/qapi-schema/qapi-schema-test.out  |  4 +++
 tests/unit/test-qobject-input-visitor.c | 43 +++++++++++++++++++++++++
 3 files changed, 48 insertions(+)

diff --git a/tests/qapi-schema/qapi-schema-test.json b/tests/qapi-schema/qapi-schema-test.json
index 43b8697002..ba7302f42b 100644
--- a/tests/qapi-schema/qapi-schema-test.json
+++ b/tests/qapi-schema/qapi-schema-test.json
@@ -119,6 +119,7 @@
 { 'alternate': 'AltEnumNum', 'data': { 'e': 'EnumOne', 'n': 'number' } }
 { 'alternate': 'AltNumEnum', 'data': { 'n': 'number', 'e': 'EnumOne' } }
 { 'alternate': 'AltEnumInt', 'data': { 'e': 'EnumOne', 'i': 'int' } }
+{ 'alternate': 'AltListInt', 'data': { 'l': ['int'], 'i': 'int' } }
 
 # for testing use of 'str' within alternates
 { 'alternate': 'AltStrObj', 'data': { 's': 'str', 'o': 'TestStruct' } }
diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schema/qapi-schema-test.out
index 1f9585fa9b..043d75c655 100644
--- a/tests/qapi-schema/qapi-schema-test.out
+++ b/tests/qapi-schema/qapi-schema-test.out
@@ -121,6 +121,10 @@ alternate AltEnumInt
     tag type
     case e: EnumOne
     case i: int
+alternate AltListInt
+    tag type
+    case l: intList
+    case i: int
 alternate AltStrObj
     tag type
     case s: str
diff --git a/tests/unit/test-qobject-input-visitor.c b/tests/unit/test-qobject-input-visitor.c
index 6f59a7f432..2af002dd82 100644
--- a/tests/unit/test-qobject-input-visitor.c
+++ b/tests/unit/test-qobject-input-visitor.c
@@ -776,6 +776,7 @@ static void test_visitor_in_alternate_number(TestInputVisitorData *data,
     AltEnumNum *aen;
     AltNumEnum *ans;
     AltEnumInt *asi;
+    AltListInt *ali;
 
     /* Parsing an int */
 
@@ -802,6 +803,12 @@ static void test_visitor_in_alternate_number(TestInputVisitorData *data,
     g_assert_cmpint(asi->u.i, ==, 42);
     qapi_free_AltEnumInt(asi);
 
+    v = visitor_input_test_init(data, "42");
+    visit_type_AltListInt(v, NULL, &ali, &error_abort);
+    g_assert_cmpint(ali->type, ==, QTYPE_QNUM);
+    g_assert_cmpint(ali->u.i, ==, 42);
+    qapi_free_AltListInt(ali);
+
     /* Parsing a double */
 
     v = visitor_input_test_init(data, "42.5");
@@ -827,6 +834,40 @@ static void test_visitor_in_alternate_number(TestInputVisitorData *data,
     qapi_free_AltEnumInt(asi);
 }
 
+static void test_visitor_in_alternate_list(TestInputVisitorData *data,
+                                 const void *unused)
+{
+    intList *item;
+    Visitor *v;
+    AltListInt *ali;
+    int i;
+
+    v = visitor_input_test_init(data, "[ 42, 43, 44 ]");
+    visit_type_AltListInt(v, NULL, &ali, &error_abort);
+    g_assert(ali != NULL);
+
+    g_assert_cmpint(ali->type, ==, QTYPE_QLIST);
+    for (i = 0, item = ali->u.l; item; item = item->next, i++) {
+        char string[12];
+
+        snprintf(string, sizeof(string), "string%d", i);
+        g_assert_cmpint(item->value, ==, 42 + i);
+    }
+
+    qapi_free_AltListInt(ali);
+    ali = NULL;
+
+    /* An empty list is valid */
+    v = visitor_input_test_init(data, "[]");
+    visit_type_AltListInt(v, NULL, &ali, &error_abort);
+    g_assert(ali != NULL);
+
+    g_assert_cmpint(ali->type, ==, QTYPE_QLIST);
+    g_assert(!ali->u.l);
+    qapi_free_AltListInt(ali);
+    ali = NULL;
+}
+
 static void input_visitor_test_add(const char *testpath,
                                    const void *user_data,
                                    void (*test_func)(TestInputVisitorData *data,
@@ -1188,6 +1229,8 @@ int main(int argc, char **argv)
                            NULL, test_visitor_in_wrong_type);
     input_visitor_test_add("/visitor/input/alternate-number",
                            NULL, test_visitor_in_alternate_number);
+    input_visitor_test_add("/visitor/input/alternate-list",
+                           NULL, test_visitor_in_alternate_list);
     input_visitor_test_add("/visitor/input/fail/struct",
                            NULL, test_visitor_in_fail_struct);
     input_visitor_test_add("/visitor/input/fail/struct-nested",
-- 
2.35.1


