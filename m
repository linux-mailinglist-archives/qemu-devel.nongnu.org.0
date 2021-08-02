Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2513DDD6D
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 18:19:45 +0200 (CEST)
Received: from localhost ([::1]:48048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAafI-00014H-CQ
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 12:19:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mAabT-0000xG-PT
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 12:15:52 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:37563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mAabS-0006pY-2S
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 12:15:47 -0400
Received: by mail-ej1-x62c.google.com with SMTP id h9so16305115ejs.4
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 09:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2fwd9objZBu7/3yhUZG7id8W9kbZ76Fri7jal/zJS04=;
 b=Imz9H59sQ212Pegl0EVDMC49YQD6RvgEVGVrT/fKciL0UNL4d8HnyEGxg0SrH+Hs60
 iVNP5LnzbvTF/Qmo/MjaeR1wlwHjBoBT/12R+CTvNfoV9rpIXxzhoeVQuL8sp7kiblrI
 WPNHDbmiKs/ok76AJXpscKG22NJRv/I3ZDi1b4TNxS57jmVoH7P9VKaH4AtE5XXkpYYM
 E5CCpv4x4OLwA8w3eY1kwtXI/eFC7fQqFJPZAjmUasvxGvyi7uxycWhYFOpTbkduqtAz
 L+oqtKXaO8z4YUDQdsZRTHqC15ZCRD/3LAIryBAUBIFtRu6UTmlmRdlv9Dv5MZfnMFQt
 CB+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2fwd9objZBu7/3yhUZG7id8W9kbZ76Fri7jal/zJS04=;
 b=EQUF9TUbErWlka1kkigcFYzNkm9qu1xlml7WNX/hKfkMZskin0Sp4VWScNFh/wjyYM
 60iUvc93jntrJLG8GwRKUqv8cWIdZSMR3vwXLqXC3/VfW8WXxS6kM7JzfyUj2bBQXeQo
 IDtc1fRfdrT1qiuh7iD3yunVo06sscGkdmY5HbV5fyXYK0zHy7aoDplCFlF3MgpiG5cK
 1n9JGhYsOAuu2kvWXoQwvebcx9hlYtlUuy9g92GmLGzk1HZgVAxUdOdjP4oTb8j7TiIQ
 +RF167bBWxSGhNnNQ2AOFhuJzXHNHzS2N16OL1ocg8j246HpDpxqAV+tA5H1j5pKvpx9
 jWZQ==
X-Gm-Message-State: AOAM530RE3eRJrHGmvXXGqShgstzNJDk5HvTS5OLSSbggvUpZv/QvfBe
 XiKisQoNq6LDZcOLBEdYdoP+G6tdZ9dsXw==
X-Google-Smtp-Source: ABdhPJzT3G22aY29jV4KRokmhzU7K6sYH3NBSMuT0lFOcgOI3y8638t1HLr5zk/qvNPH6/IS0MwuZQ==
X-Received: by 2002:a17:906:32d6:: with SMTP id
 k22mr15818313ejk.228.1627920944741; 
 Mon, 02 Aug 2021 09:15:44 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id f15sm4835144ejb.125.2021.08.02.09.15.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 09:15:44 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/8] vl: stop recording -smp in QemuOpts
Date: Mon,  2 Aug 2021 18:15:36 +0200
Message-Id: <20210802161542.381976-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210802161542.381976-1-pbonzini@redhat.com>
References: <20210802161542.381976-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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



