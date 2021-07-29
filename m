Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D314D3DA622
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 16:14:17 +0200 (CEST)
Received: from localhost ([::1]:48710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m96ng-0004At-OY
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 10:14:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m96kb-0000CD-B6
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 10:11:05 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:42898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m96kZ-0006Oq-4A
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 10:11:05 -0400
Received: by mail-ej1-x62c.google.com with SMTP id e19so10924081ejs.9
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 07:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2fwd9objZBu7/3yhUZG7id8W9kbZ76Fri7jal/zJS04=;
 b=SP7Clxm2BTWtiq1cbA2zw+tHu0XNi94z9w2bx3Cu2dnQYjNm+0lmEz/08QcaMSkkKP
 28sMMjo0FkzyddDq+NRkkcwiM6mngv1wczQcVYLdIoN7aOQzpif7fiOFcrGPNoK0vENS
 Od41w63uGUD3D+cR2IuipextTM1h2oChvN9BSwc92ziVB/OGu7d1PtMvAJ73ZnWxdRTM
 TUMLNaa0fHbOHqiC0iAAC+UjsnzW+gafX9yMnis3M3EV6xzrjpfpWMnXoM3716Ju0uQ0
 LGwD1+rYoEYmog4qxlOL5BYRShy+r133+prCeK1M5pft+zbZWzHK8byiCE6Zo1pCSg66
 siaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2fwd9objZBu7/3yhUZG7id8W9kbZ76Fri7jal/zJS04=;
 b=mtZ/1Ijig1CUaFQei0Qvcaz+ucNZYsO8J+xDhBfwOwQY55NZd++RQM9QPXi1tr09Pq
 HoB8sDCAagM3qXNL9uyKzTJUvWrk6H9c53uyuVW5Ve1dTitemu3ZmUG6UvOvJZEO0HlY
 /LfQOwcv002IFqcNaQEb4rQQTBpFecuHP7An5isg5TL5TGTH24KExgXMHRUD9MXZEwn/
 7XpjCdIterBbyavsLHwjXIBssfWAjYaglqvYwQxK51t/zv1jwfNGdpC4xJVv6hIFW1hY
 ZPR89W03hm7lyQMYqg6woOzTVp3g/7YeXELpqpej8GXEAqdPymDusuQTgRk1ygV3s77I
 08OQ==
X-Gm-Message-State: AOAM532QcumKo+Mhm3ZWufM9qrEbSEj4L2b82I2qO6EO9mCvc6x8w+o5
 isNwo/lRYTU7tqpIpTK29wZV6ivQ2O9GyA==
X-Google-Smtp-Source: ABdhPJzXGIGQ32eAVh8CVaLEmmvcMnE+EfdjfkDVDoq9OCPNq2Pq/H/mqgUlVHzXugSgjbAqDPiFaw==
X-Received: by 2002:a17:906:4116:: with SMTP id
 j22mr4699417ejk.423.1627567861522; 
 Thu, 29 Jul 2021 07:11:01 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id mf1sm1024132ejb.51.2021.07.29.07.11.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 07:11:01 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] vl: stop recording -smp in QemuOpts
Date: Thu, 29 Jul 2021 16:10:58 +0200
Message-Id: <20210729141058.228405-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210729141058.228405-1-pbonzini@redhat.com>
References: <20210729141058.228405-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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

-readconfig is still recording SMP options in QemuOpts instead of
using machine_opts_dict.  This means that SMP options from -readconfig
are ignored.

Just stop using QemuOpts for -smp, making it return false for
is_qemuopts_group.  Configuration files will merge the values in
machine_opts_dict using the new function machine_merge_property.

At the same time, fix -mem-prealloc which looked at QemuOpts to find the
number of guest CPUs, which it used as the default number of preallocation
threads.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/vl.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 93aef8e747..5ca11e7469 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -31,6 +31,7 @@
 #include "qapi/compat-policy.h"
 #include "qapi/error.h"
 #include "qapi/qmp/qdict.h"
+#include "qapi/qmp/qstring.h"
 #include "qapi/qmp/qjson.h"
 #include "qemu-version.h"
 #include "qemu/cutils.h"
@@ -2166,7 +2167,8 @@ static int global_init_func(void *opaque, QemuOpts *opts, Error **errp)
 static bool is_qemuopts_group(const char *group)
 {
     if (g_str_equal(group, "object") ||
-        g_str_equal(group, "machine")) {
+        g_str_equal(group, "machine") ||
+        g_str_equal(group, "smp-opts")) {
         return false;
     }
     return true;
@@ -2186,6 +2188,8 @@ static void qemu_record_config_group(const char *group, QDict *dict,
          */
         assert(!from_json);
         keyval_merge(machine_opts_dict, dict, errp);
+    } else if (g_str_equal(group, "smp-opts")) {
+        machine_merge_property("smp", dict, &error_fatal);
     } else {
         abort();
     }
@@ -2452,13 +2456,15 @@ static void qemu_validate_options(const QDict *machine_opts)
 static void qemu_process_sugar_options(void)
 {
     if (mem_prealloc) {
-        char *val;
-
-        val = g_strdup_printf("%d",
-                 (uint32_t) qemu_opt_get_number(qemu_find_opts_singleton("smp-opts"), "cpus", 1));
-        object_register_sugar_prop("memory-backend", "prealloc-threads", val,
-                                   false);
-        g_free(val);
+        QObject *smp = qdict_get(machine_opts_dict, "smp");
+        if (smp && qobject_type(smp) == QTYPE_QDICT) {
+            QObject *cpus = qdict_get(qobject_to(QDict, smp), "cpus");
+            if (cpus && qobject_type(cpus) == QTYPE_QSTRING) {
+                const char *val = qstring_get_str(qobject_to(QString, cpus));
+                object_register_sugar_prop("memory-backend", "prealloc-threads",
+                                           val, false);
+            }
+        }
         object_register_sugar_prop("memory-backend", "prealloc", "on", false);
     }
 
-- 
2.31.1


