Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4FC3F0C1E
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 21:54:34 +0200 (CEST)
Received: from localhost ([::1]:58588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGRdx-0006VV-1p
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 15:54:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mGRT6-00022x-CV
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:43:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mGRT4-0007Xq-IX
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:43:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629315797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WggCVnnM9tjRutsX+jdTEs2ZOjZTGEHbCJiY34rSwe8=;
 b=N25Ozgja3uBIUsxnfjGJnAmunk5FMteH1nSbfefaa/ctljNha8m3I3BjZf1fbiLL9SNY1u
 HgRczSkeG8nNrDg+tEYAqiGUozq3GzJZHoh0ooi8aCtT8rYpBFDAobTvpA4MoQoJqhWpkv
 MVV4lg0YqYNVmsnS0NdoUeMWMhdCJ5k=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-GvXrjdE4Mh6U4E79WglMBQ-1; Wed, 18 Aug 2021 15:43:16 -0400
X-MC-Unique: GvXrjdE4Mh6U4E79WglMBQ-1
Received: by mail-qv1-f70.google.com with SMTP id
 ay14-20020a056214048eb0290357469934easo2955929qvb.8
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:43:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WggCVnnM9tjRutsX+jdTEs2ZOjZTGEHbCJiY34rSwe8=;
 b=QrU1Twx/QX5AnUkO2Ic3wERVDmX9aXjHbh6oFEWcs3MVC0qHPkrw4GQMkAkrcNKOWb
 djH7UXlt+XreJb2ogxoG3sv4fQNF/jTH9yvlHzMYy6xurdswWPyWKXuWWtdxfeIL9cSA
 PK3CEyxvwQ74KDmMneCG3QghzCXhhJgZ+l+b56AurUACdL9Uj2jgbv8HoLjg5C6T5X/Z
 42K7p78rsqzm2OFh+7Q4s+GqMl/u7lHc5JFNyuo7htB9nFOx4zRtKFbFUx7zWy39dUO3
 4j2Ra6LAe+O3cFpHnvoluOuiVulmnYFZNiyWTRi3rxiPhNCvaEEnqBWKubrf/KuFDYpS
 j7mw==
X-Gm-Message-State: AOAM531mozSJVuCFEzLM+NWUL3s0lggLJF/1G8F/8s8qIkblTnCaYMHu
 c4CdwmkPvqBDnBKSnqNLff+GvS0DKakJO37qKM3tppd2NLic3Fxwduf/T9vAi5XTeaLMXxbEcU4
 pKgz8vMEpvqgz5vjKYUhwPwF3zfJ5j7KWjNAkJIFIjbXVkQQiuL8VL/v/CjI/W1kp
X-Received: by 2002:a05:622a:612:: with SMTP id
 z18mr9586550qta.330.1629315796006; 
 Wed, 18 Aug 2021 12:43:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNfT5ZIM6EGf/Epzf62McW0pSL7d/TPwqPnW9VBcQDD1okHVYw878rArem/tja6qhlAI0zRQ==
X-Received: by 2002:a05:622a:612:: with SMTP id
 z18mr9586524qta.330.1629315795680; 
 Wed, 18 Aug 2021 12:43:15 -0700 (PDT)
Received: from t490s.redhat.com ([2607:fea8:56a3:500::d413])
 by smtp.gmail.com with ESMTPSA id d20sm431530qkl.13.2021.08.18.12.43.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:43:15 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] qemu-config: Allow in-place sorting of QemuOptsList
Date: Wed, 18 Aug 2021 15:43:13 -0400
Message-Id: <20210818194313.110892-1-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210818194217.110451-1-peterx@redhat.com>
References: <20210818194217.110451-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 peterx@redhat.com, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the helper qemu_sort_opts() to allow in-place sorting of QemuOptsList.  The
function can be specified in the form defined as qemu_opts_pri_fn(), where it
takes a QemuOpts pointer and generates a number showing the priority of this
QemuOpts entry.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/qemu/config-file.h |  4 ++++
 util/qemu-config.c         | 48 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/include/qemu/config-file.h b/include/qemu/config-file.h
index f605423321..ce50a72985 100644
--- a/include/qemu/config-file.h
+++ b/include/qemu/config-file.h
@@ -3,8 +3,12 @@
 
 typedef void QEMUConfigCB(const char *group, QDict *qdict, void *opaque, Error **errp);
 
+/* Returns the priority for a QemuOpts */
+typedef int (*qemu_opts_pri_fn)(QemuOpts *opt);
+
 void qemu_load_module_for_opts(const char *group);
 QemuOptsList *qemu_find_opts(const char *group);
+void qemu_sort_opts(const char *group, qemu_opts_pri_fn fn);
 QemuOptsList *qemu_find_opts_err(const char *group, Error **errp);
 QemuOpts *qemu_find_opts_singleton(const char *group);
 
diff --git a/util/qemu-config.c b/util/qemu-config.c
index 436ab63b16..e882dc948b 100644
--- a/util/qemu-config.c
+++ b/util/qemu-config.c
@@ -7,6 +7,7 @@
 #include "qapi/qmp/qlist.h"
 #include "qemu/error-report.h"
 #include "qemu/option.h"
+#include "qemu/option_int.h"
 #include "qemu/config-file.h"
 
 static QemuOptsList *vm_config_groups[48];
@@ -41,6 +42,53 @@ QemuOptsList *qemu_find_opts(const char *group)
     return ret;
 }
 
+struct QemuOptsSortEntry {
+    QemuOpts *opts;
+    int priority;
+} __attribute__ ((__aligned__(sizeof(void *))));
+typedef struct QemuOptsSortEntry QemuOptsSortEntry;
+
+static int qemu_opts_cmp_fn(const void *opts_1, const void *opts_2)
+{
+    QemuOptsSortEntry *entry1, *entry2;
+
+    entry1 = (QemuOptsSortEntry *)opts_1;
+    entry2 = (QemuOptsSortEntry *)opts_2;
+
+    return entry1->priority - entry2->priority;
+}
+
+void qemu_sort_opts(const char *group, qemu_opts_pri_fn fn)
+{
+    QemuOptsSortEntry *entries, *entry;
+    QemuOpts *opts, *next_opts;
+    int i = 0, count = 0;
+    QemuOptsList *list;
+
+    list = find_list(vm_config_groups, group, &error_abort);
+
+    QTAILQ_FOREACH(opts, &list->head, next) {
+        count++;
+    }
+
+    entries = g_new0(QemuOptsSortEntry, count);
+    QTAILQ_FOREACH_SAFE(opts, &list->head, next, next_opts) {
+        entry = &entries[i++];
+        entry->opts = opts;
+        entry->priority = fn(opts);
+        /* Temporarily remove them; will add them back later */
+        QTAILQ_REMOVE(&list->head, opts, next);
+    }
+
+    qsort(entries, count, sizeof(QemuOptsSortEntry), qemu_opts_cmp_fn);
+
+    for (i = 0; i < count; i++) {
+        QTAILQ_INSERT_TAIL(&list->head, entries[i].opts, next);
+    }
+
+    g_free(entries);
+}
+
 QemuOpts *qemu_find_opts_singleton(const char *group)
 {
     QemuOptsList *list;
-- 
2.31.1


