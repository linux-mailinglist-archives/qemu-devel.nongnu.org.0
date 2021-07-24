Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7583D467D
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Jul 2021 10:57:42 +0200 (CEST)
Received: from localhost ([::1]:40296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7DTZ-0005vs-V6
	for lists+qemu-devel@lfdr.de; Sat, 24 Jul 2021 04:57:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m7DR4-00036p-HG
 for qemu-devel@nongnu.org; Sat, 24 Jul 2021 04:55:06 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:37582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m7DR2-0002yB-Sx
 for qemu-devel@nongnu.org; Sat, 24 Jul 2021 04:55:06 -0400
Received: by mail-ed1-x535.google.com with SMTP id h8so4697865ede.4
 for <qemu-devel@nongnu.org>; Sat, 24 Jul 2021 01:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iAzRZTOU3CFNU4Er6w7cCoZipfLzLuXGgpPpVsUOjH0=;
 b=Lo/RhUsVgn3VPKLbr1G6IYFmrO/M1zgC2Cg5nvnGF5v1RXL4SgEK+X4dAHTLAUPU74
 VVnYYxlWTSHnJxd7TCfHbf8HAijQj1D1QEKLUISpfPxAQHtpYkNCfi6axP+orvOdrrih
 xZX5Z9HtelqV62tDATb26eo3g0N/mmLnYfRe14tgLXCRFOKUPuXESlcyZzXEBUO7uARm
 jY09IrzdaHdVp93ffD6UcUzefL+3zb0+WwhLGaeYkaMY/Angz73WBvmHq36YR4sj9N+d
 ofi8WIgmQ5YXWSpMkCVcSgDzSK3wulP6U5yKSGQvOHpbmFwp8JAxrmAvyr9KOFKlQCSa
 v8Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=iAzRZTOU3CFNU4Er6w7cCoZipfLzLuXGgpPpVsUOjH0=;
 b=qxkoLSxIKDRkiI2zIx2VWyy1rpvDm2K7jjgPzICFKjRh4Wr+5nGafVxnxbJXK890WF
 xBZC9HSdo2ICn8GjR6WL/KUNzsK3IHKwmzh89XIUtdyoONvCQtcDC0kId7ShDnsGXx7h
 sDmTyc+odsUXDCytmeoo0v9DjdBNCFVhwJn7sr3r7IGgfNGGLXN27fXUypoKJNExeYAZ
 KTX8nvCPI89Po9qDFACb0D7kHBX+Pv1XREXCouiLgnqwrD0PzphzEDjUOqr6KBc5d022
 BhVbLesscaUpvtyhItWXLPJLJ6LeDl5rzJiMFZCmqz2ApBSTB/AM2K/djxaEhNYjesKR
 /WOg==
X-Gm-Message-State: AOAM531+jOnu2i93j30CvfwZODyGB+SgfNmOMlo9SvbMnFIIqEVgemqG
 ns4Kwbpsr/kJo4Mp3VSYPNsKU+cVPveFHA==
X-Google-Smtp-Source: ABdhPJx58FpYAKtk38HPDo3s3NUTIxuEBJo6lGBrGRuCBUD9ejf/JDXfNx5PG37MBHrhXoJj2x29ag==
X-Received: by 2002:a50:ff0a:: with SMTP id a10mr10200662edu.273.1627116902207; 
 Sat, 24 Jul 2021 01:55:02 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id j21sm15723881edq.76.2021.07.24.01.55.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jul 2021 01:55:01 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 9/9] qom: use correct field name when getting/setting alias
 properties
Date: Sat, 24 Jul 2021 10:54:53 +0200
Message-Id: <20210724085453.16791-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210724085453.16791-1-pbonzini@redhat.com>
References: <20210724085453.16791-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
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
Cc: Alex Williamson <alex.williamson@redhat.com>
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

Fixes: https://gitlab.com/qemu-project/qemu/-/issues/484
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


