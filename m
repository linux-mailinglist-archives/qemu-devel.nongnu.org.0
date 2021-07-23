Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0D13D384E
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 12:05:50 +0200 (CEST)
Received: from localhost ([::1]:43268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6s3w-0001qJ-Vl
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 06:05:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m6s09-0005EK-KP
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 06:01:53 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:44793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m6s07-000405-TW
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 06:01:53 -0400
Received: by mail-ed1-x529.google.com with SMTP id j2so164666edp.11
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 03:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iAzRZTOU3CFNU4Er6w7cCoZipfLzLuXGgpPpVsUOjH0=;
 b=ZdiftygWR6Bgv1AjpNSzntFvafp16J5/NS0bpT3Wix1WEx4iMPs9E4SB+ytljJbzH8
 LDts/pXg+DahM+6Z5IAF6YGyQd9x2Oseh8KmZ7kDhhvH8WaduVZJo/4Q77Oa1paQbypN
 fGXjL6EHmZHpEdRNOHN1tOVvHC5towyxmyCp79Ojs7JxRO3D8TXKAiePgD6x74inNFuQ
 lYRH1/XeU/CRpyaoB7LFjQnOjawDe4uRo5HD0V78CAteYVCD1sf6o2UZ7U2OFpOUFNpY
 UPAsbuBhmDydTVFyoHZtkwm0pooF7AauicL6FE4fI1puoL9ElJ2Uq1Y13UmVwByFLVPa
 lHcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=iAzRZTOU3CFNU4Er6w7cCoZipfLzLuXGgpPpVsUOjH0=;
 b=cQU4F0m2DFnvT0RnmgyKz2xuJdpyFMJgRhoAWEDUn426PgDcDojrauO/YeLSyVJ784
 abTr5EZTWiirJ6U32T8UNsqaJyNxqK1YvW+T7yL+ntKqv9Y0cvLJCOgdLNVkjF3MIkXp
 5uspaYp4L1M85Oi9M9RlFSW8GB1tPnm6b2jHB2qBa2oaNXxZ1DbBLsTHWouBrtzL2KIt
 ZdBZF2EN1n98H0PU4E0CNjG0IllteWlf81cLlLYgW5zA345hcc1Dlbv3jhpsBkY1H3ci
 SAwtwe7099+Pmn6xlOUKvZrbqo5E9NXbzD9/uXC9npSeWkvyXKBtRhk1qHuz2opNkGIR
 5j9A==
X-Gm-Message-State: AOAM532x1TXVwbbEiN+6/sFaphMHanEKVkPVXDYOThEPthuhKvoj/UP1
 08p7IC7hIy6MVWTpqoZcZumToQf3bEQ=
X-Google-Smtp-Source: ABdhPJwY6iZ8nuZyiGCagYjx5dKrLsyku3AqkhTfHK3KdmaKJYHkmRK/r6/4Jp69l8ATnOq+ZkI67w==
X-Received: by 2002:a05:6402:1218:: with SMTP id
 c24mr4508863edw.59.1627034510216; 
 Fri, 23 Jul 2021 03:01:50 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id
 gn13sm10148509ejc.1.2021.07.23.03.01.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 03:01:49 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/2] qom: use correct field name when getting/setting alias
 properties
Date: Fri, 23 Jul 2021 12:01:37 +0200
Message-Id: <20210723100137.978910-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210723100137.978910-1-pbonzini@redhat.com>
References: <20210723100137.978910-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
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


