Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAAD3CD21C
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 12:42:57 +0200 (CEST)
Received: from localhost ([::1]:57438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Qjg-0003zQ-3n
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 06:42:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m5QhY-0001sf-1Z
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 06:40:47 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:41798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m5QhU-0008Io-01
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 06:40:43 -0400
Received: by mail-ej1-x62d.google.com with SMTP id go30so27884950ejc.8
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 03:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V/oJpMIKrYVUqk0aWU4T27HfIQvaI2un/rxaetk/LuE=;
 b=ZViHejM7e3cUaVkywaFqRLSKNVoipF+kOrhN7X+do6yoKMbN9VUJwrqyCCrksAiZ1D
 9rSRuG3lz0zQAykjYLKfu0s2u/lerkBahkOyOcPnnAjtarK7WlDUy+v/jMqRYDpCVFS9
 ps2P59qeCkN9ppLrEdgun2JaYRAEmzvmUMzqC6GgyjDer3McFBfOTQvwD95XYmqM5dfG
 q0zzruSzf6UBMw3m49Lcqc/+9P8gei1egzy/a1z5eT8/Nh6hy8RbFbagSdp2AW1L4kks
 IvnGkHZ1KlKqfC2wj7Wh6BLf/kYjOHECaeiSPjBv9WQD73g3MroLBizcYqyhplKPsmJ8
 oy5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=V/oJpMIKrYVUqk0aWU4T27HfIQvaI2un/rxaetk/LuE=;
 b=lwnICVC6rXibP5hziwCyR4LVcngUYBOab1HXc6PMoT7EvW93fIr1PsqUTL+zfYhEGG
 vjsv1QpJUZTMtgITFhhakXBk4bH2CuVO4WdYeA/09nKAEmkT0vbrNqAGXPreHSwW8f9D
 vmeoF9EGXSyYUC7tyjRttj/avpVXggdga5f9SuRvB+/GOeDO+pUqqBBmEx4PMyTj6kwh
 M+70vPjcijT03J3vsni6UiO3+tmrk+etvFaX6zWAiUYfU8ixvv1HFgaih6W+cMH6uyaF
 QH3ipMafR/wmD2w7TskTP4vsOjJpVGYSGmKBy2kK2Zjl7agrr2HB9MJTU1k5OAk+XhIs
 TMFg==
X-Gm-Message-State: AOAM533KmN59tGlChOkFgKM9/uB9v3HX4Kod19PWYQ+YxJsV9jg2vSjA
 NUAmoXtRVjbVr4U5FkZ/nSiSazaMSSnf7w==
X-Google-Smtp-Source: ABdhPJweGHfmKvkdkCLxqWYr89b4XvjiHFWRTXhCEGYjr1WRCLxS6itUjH6KVoUtGeN7LWoxXneXQA==
X-Received: by 2002:a17:906:2752:: with SMTP id
 a18mr27629671ejd.458.1626691237197; 
 Mon, 19 Jul 2021 03:40:37 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id j22sm5872015ejt.11.2021.07.19.03.40.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jul 2021 03:40:36 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] qom: use correct field name when getting/setting alias
 properties
Date: Mon, 19 Jul 2021 12:40:33 +0200
Message-Id: <20210719104033.185109-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210719104033.185109-1-pbonzini@redhat.com>
References: <20210719104033.185109-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62d.google.com
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
Cc: imammedo@redhat.com, alex.williamson@redhat.com, eblake@redhat.com,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Alias targets have a different name than the alias property itself
(e.g. a machine's pflash0 might be an alias of a property named 'drive').
When the target's getter or setter invokes the visitor, it will use
a different name than what the caller expects, and the visitor will
not be able to find it (or will consume erroneously).

The solution is for alias getters and setters to wrap the incoming
visitor, and forward the sole field that the target is expecting while
renaming it appropriately.

This bug has been there forever, but it was exposed after -M parsing
switched from QemuOptions and StringInputVisitor to keyval and
QObjectInputVisitor.  Before, the visitor ignored the name. Now, it
checks "drive" against what was passed on the command line and finds
that no such property exists.

Fixes: #484
Reported-by: Alex Williamson <alex.williamson@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qom/object.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/qom/object.c b/qom/object.c
index 6a01d56546..e86cb05b84 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -20,6 +20,7 @@
 #include "qapi/string-input-visitor.h"
 #include "qapi/string-output-visitor.h"
 #include "qapi/qobject-input-visitor.h"
+#include "qapi/forward-visitor.h"
 #include "qapi/qapi-builtin-visit.h"
 #include "qapi/qmp/qerror.h"
 #include "qapi/qmp/qjson.h"
@@ -2683,16 +2684,20 @@ static void property_get_alias(Object *obj, Visitor *v, const char *name,
                                void *opaque, Error **errp)
 {
     AliasProperty *prop = opaque;
+    Visitor *alias_v = visitor_forward_field(v, prop->target_name, name);
 
-    object_property_get(prop->target_obj, prop->target_name, v, errp);
+    object_property_get(prop->target_obj, prop->target_name, alias_v, errp);
+    visit_free(alias_v);
 }
 
 static void property_set_alias(Object *obj, Visitor *v, const char *name,
                                void *opaque, Error **errp)
 {
     AliasProperty *prop = opaque;
+    Visitor *alias_v = visitor_forward_field(v, prop->target_name, name);
 
-    object_property_set(prop->target_obj, prop->target_name, v, errp);
+    object_property_set(prop->target_obj, prop->target_name, alias_v, errp);
+    visit_free(alias_v);
 }
 
 static Object *property_resolve_alias(Object *obj, void *opaque,
-- 
2.31.1


