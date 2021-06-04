Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2363E39BBB5
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 17:23:02 +0200 (CEST)
Received: from localhost ([::1]:40742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpBf3-0004cm-6i
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 11:23:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lpBaC-0008Cc-W4; Fri, 04 Jun 2021 11:18:01 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:41666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lpBaB-0008JW-9R; Fri, 04 Jun 2021 11:18:00 -0400
Received: by mail-ed1-x52f.google.com with SMTP id g18so9577804edq.8;
 Fri, 04 Jun 2021 08:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hMO3rWRVi2QUNYgD6FmPDbeKJ7JN3j43s7wZ/c1R3mA=;
 b=DXuNSo0Xr1WW15NciK8cf88vpyFlbUCnDyqgXrzJaK4gp5/6f2vfaadBxH7lCGDu6X
 4d9IiJVw1iErEhM2Kd3+9JUo87V4abDjCWbf6631Uru449D70PM4K4uWTnCkoUuqGqa0
 gX6FqpQAZVgdHX2PPB2IhbaKeC+DloAX4BKZtqJAo0wVo6Pst3GefFxUExTS4CTsB/Gu
 qlpfW7tWJXNNEh4cN2NDH/pW+uL73GoSZR3/53hSpMMPJ05gk4r2WqamzD3IjOjkqD3W
 dQp4CgXYKos7xCWJnGBoDCezktbpCFkmUfrfaW6IJjzSpkFZedfOBazzttr+VlkNI3XT
 mKDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=hMO3rWRVi2QUNYgD6FmPDbeKJ7JN3j43s7wZ/c1R3mA=;
 b=KSZHn1Eo72jUgpRB2pt9h1DfhYGZfwYIEgiM+yy0ANxuUpRUgCTiZj+pMfDH2B2Y7N
 Fvtr8pIDgLm7du0DZovFAF0EuG0KkBcwy4+xFbDMiBtLTCLQgKw9KfB8PLgsNvoIMwwv
 f4tVG8ENXBCvxdsm2oBsfQbrvEWizPkJNDY0KKhQb6jcnYtA884Nz3Jn+7e3z//Gu/ZE
 E37vWlDuY/YeOx6D+2eNa9/j5oGDa8NQS9U9nRciJyjV5NGi5JtHpw45U2LQv/9jBNYc
 kVdI+Mlaj1kY3lGjcqEzxNDuuFFBXaKae+pXWEstEzs5SQPDJy5DFEPblTfdseCRbhlD
 kgaQ==
X-Gm-Message-State: AOAM532QzzLcHUM0rSJzJC+OPogZ1qCzV2u3K1jLa4iE94noMnVw16pJ
 Y6Mr/gEeHmcxjc+J+uk4l8rfI41geErQjg==
X-Google-Smtp-Source: ABdhPJyH/kRwBRNWsUIbbW0zt5q3gPMMDW/Yw6wFp9HpwaXc1spoJfqLWJmHOZnSix8X6RsOz+6/Hg==
X-Received: by 2002:aa7:d14d:: with SMTP id r13mr5286111edo.212.1622819877591; 
 Fri, 04 Jun 2021 08:17:57 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 w1sm2402451eds.37.2021.06.04.08.17.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 08:17:57 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/13] vl: plug -object back into -readconfig
Date: Fri,  4 Jun 2021 17:17:45 +0200
Message-Id: <20210604151745.310318-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210604151745.310318-1-pbonzini@redhat.com>
References: <20210604151745.310318-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit bc2f4fcb1d ("qom: move user_creatable_add_opts logic to vl.c
and QAPIfy it", 2021-03-19) switched the creation of objects from
qemu_opts_foreach to a bespoke QTAILQ in preparation for supporting JSON
syntax in -object.

Unfortunately in doing so it lost support for [object] stanzas in
configuration files and also for "-set object.ID.KEY=VAL".  The latter
is hard to re-establish and probably best solved by deprecating -set.
This patch uses the infrastructure introduced by the previous two
patches in order to parse QOM objects correctly from configuration
files.

Cc: Markus Armbruster <armbru@redhat.com>
Cc: qemu-stable@nongnu.org
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210524105752.3318299-4-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/vl.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 5e8240b9d8..326c1e9080 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1722,9 +1722,15 @@ static void object_option_foreach_add(bool (*type_opt_predicate)(const char *))
     }
 }
 
+static void object_option_add_visitor(Visitor *v)
+{
+    ObjectOption *opt = g_new0(ObjectOption, 1);
+    visit_type_ObjectOptions(v, NULL, &opt->opts, &error_fatal);
+    QTAILQ_INSERT_TAIL(&object_opts, opt, next);
+}
+
 static void object_option_parse(const char *optarg)
 {
-    ObjectOption *opt;
     QemuOpts *opts;
     const char *type;
     Visitor *v;
@@ -1752,11 +1758,8 @@ static void object_option_parse(const char *optarg)
         v = opts_visitor_new(opts);
     }
 
-    opt = g_new0(ObjectOption, 1);
-    visit_type_ObjectOptions(v, NULL, &opt->opts, &error_fatal);
+    object_option_add_visitor(v);
     visit_free(v);
-
-    QTAILQ_INSERT_TAIL(&object_opts, opt, next);
 }
 
 /*
@@ -2134,13 +2137,22 @@ static int global_init_func(void *opaque, QemuOpts *opts, Error **errp)
  */
 static bool is_qemuopts_group(const char *group)
 {
+    if (g_str_equal(group, "object")) {
+        return false;
+    }
     return true;
 }
 
 static void qemu_record_config_group(const char *group, QDict *dict,
                                      bool from_json, Error **errp)
 {
-    abort();
+    if (g_str_equal(group, "object")) {
+        Visitor *v = qobject_input_visitor_new_keyval(QOBJECT(dict));
+        object_option_add_visitor(v);
+        visit_free(v);
+    } else {
+        abort();
+    }
 }
 
 /*
-- 
2.31.1


