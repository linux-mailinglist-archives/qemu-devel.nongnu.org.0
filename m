Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BB83DA612
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 16:12:11 +0200 (CEST)
Received: from localhost ([::1]:44962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m96le-0001fE-Mb
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 10:12:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m96ka-0000Ad-4N
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 10:11:04 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:39671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m96kY-0006Nc-57
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 10:11:03 -0400
Received: by mail-ej1-x62e.google.com with SMTP id go31so10930785ejc.6
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 07:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uKkyh3OYQ0mfw6Y9gyrWs6boJPfL3KQaIy+v+IFJpNM=;
 b=t/iOHOTpTHrab11MN/WHq83V6RA9Fg08YO7LGfKQaAFTuQMRBXXB6M4SFza7wx0seh
 bXYBp5eH6tjtmNAJDKZ9E1EC4eLdslsTQ3oVwv/WeZRUxmTAJHw0ffIyzftHxyWltz0u
 gqzB7svb4Z8xyhBAk6c96ym82aSxn/tXqwg44Y22XaiHidY1yb1cvp4yxjmGbmpD9nK2
 VNH1AXUZtWbDSU7ZjVJ4GuzINgTbEdZ4u7tkum0+4sdxChyxt07X/ERqERO6Am7jt27z
 wpMRm1pFTTTzWS/LNMzvDdv1ANOPK4FDY1/4XLaWWDlMWPG02yZ2QLTo2SJu3Rv8uhrf
 LFEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uKkyh3OYQ0mfw6Y9gyrWs6boJPfL3KQaIy+v+IFJpNM=;
 b=bWGMPmQJqO4g+Y7OryItMEIihazaDtb9J7S5zDjx8VD7eIVW6AZRZ1vDGnt8ttb52y
 Zq51u14+AR+DcxqulKFE4hxjlS6EycUJb73lT1rzMhepc6p3w2cCvmoYxew/HtiN1F+e
 61vW/0/LXZ0RSSwxkvZnV8ASuEruiNxKeqxRpvpOJjYbClsOSSdslUaX1EAtzxobQIND
 ohYUG3q51st1469I+2wMDYi8Dx6ef9p4HzyxwRDWYwsYFJNXZjnxfl04n8rgeIcdeubU
 s85lCTYwBCk2T3cz/8u0bCSoV974WdsXLSO+pz9VjKczAjuhpxQSNpJqVsr/BIORpBF0
 JPZw==
X-Gm-Message-State: AOAM531NCTHV05l9CBY9VmBG3lf4LRfRtoeGwBrahqXyiElAKvhApwea
 skGqPVTf6RgAubPaavawjMQz8YSYme/LBg==
X-Google-Smtp-Source: ABdhPJwixTjf714DwiEMDZ279T1Q0xpAo4HsOcdJBF+NodKmCcZpGlQ24N25uPhlnd56/sl+cTRAvw==
X-Received: by 2002:a17:906:948f:: with SMTP id
 t15mr4843007ejx.85.1627567860860; 
 Thu, 29 Jul 2021 07:11:00 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id mf1sm1024132ejb.51.2021.07.29.07.10.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 07:11:00 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] vl: introduce machine_merge_property
Date: Thu, 29 Jul 2021 16:10:57 +0200
Message-Id: <20210729141058.228405-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210729141058.228405-1-pbonzini@redhat.com>
References: <20210729141058.228405-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62e.google.com
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

It will be used to parse smp-opts config groups from configuration
files.  The point to note is that it does not steal a reference
from the caller.  This is better because this function will be called
from qemu_config_foreach's callback; qemu_config_foreach does not cede
its reference to the qdict to the callback, and wants to free it.  To
balance that extra reference, machine_parse_property_opt now needs
a qobject_unref.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/vl.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 4dee472c79..93aef8e747 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1534,23 +1534,36 @@ static void machine_help_func(const QDict *qdict)
     }
 }
 
+static void
+machine_merge_property(const char *propname, QDict *prop, Error **errp)
+{
+    QDict *opts;
+
+    opts = qdict_new();
+    /* Preserve the caller's reference to prop.  */
+    qobject_ref(prop);
+    qdict_put(opts, propname, prop);
+    keyval_merge(machine_opts_dict, opts, errp);
+    qobject_unref(opts);
+}
+
 static void
 machine_parse_property_opt(QemuOptsList *opts_list, const char *propname,
                            const char *arg, Error **errp)
 {
-    QDict *opts, *prop;
+    QDict *prop = NULL;
     bool help = false;
-    ERRP_GUARD();
 
     prop = keyval_parse(arg, opts_list->implied_opt_name, &help, errp);
     if (help) {
         qemu_opts_print_help(opts_list, true);
         exit(0);
     }
-    opts = qdict_new();
-    qdict_put(opts, propname, prop);
-    keyval_merge(machine_opts_dict, opts, errp);
-    qobject_unref(opts);
+    if (!prop) {
+        return;
+    }
+    machine_merge_property(propname, prop, errp);
+    qobject_unref(prop);
 }
 
 static const char *pid_file;
-- 
2.31.1



