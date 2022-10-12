Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5265B5FC894
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 17:43:01 +0200 (CEST)
Received: from localhost ([::1]:42774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oidsq-0006GS-Bg
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 11:43:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oidoH-0006pT-Bi
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 11:38:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45140)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oido8-0001EK-IT
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 11:38:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665589088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CGyiNRcDvp1yt2vo5ajS0q1H+fALnTj+obGbwNJPbJw=;
 b=KZVij3Usc7DpEsvqvJlwZjvkIQyw4S633jXBSLdhuPU69KV3UGlr7uEyKEQ3URVJx34KfF
 FgatCMD+TqaFpagh6kIUJn9UDuAF/EtMcx5UDVRASCekVjx5H9fixgumcnGVhiuBoiz7tV
 qT/k0oUcbrFpf7F/NPVATbbRvqi3eOI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-173-V6GUV4scO_Sf-i0YpMKDPA-1; Wed, 12 Oct 2022 11:38:03 -0400
X-MC-Unique: V6GUV4scO_Sf-i0YpMKDPA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E0E4185A7A3;
 Wed, 12 Oct 2022 15:38:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.110])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D1BFF111E3FD;
 Wed, 12 Oct 2022 15:38:02 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6DEF121E6928; Wed, 12 Oct 2022 17:38:01 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: arei.gonglei@huawei.com, lvivier@redhat.com, amit@kernel.org,
 mst@redhat.com, pbonzini@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, thuth@redhat.com, david@redhat.com
Subject: [PATCH 1/4] qom: Improve error messages when property has no getter
 or setter
Date: Wed, 12 Oct 2022 17:37:58 +0200
Message-Id: <20221012153801.2604340-2-armbru@redhat.com>
In-Reply-To: <20221012153801.2604340-1-armbru@redhat.com>
References: <20221012153801.2604340-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When you try to set a property that has no setter, the error message
blames "insufficient permission":

    $ qemu-system-x86_64 -S -display none -nodefaults -monitor stdio
    QEMU 7.1.50 monitor - type 'help' for more information
    (qemu) qom-set /machine type q35
    Error: Insufficient permission to perform this operation

This implies it could work with "sufficient permission".  It can't.
Change the error message to:

    Error: Property 'pc-i440fx-7.2-machine.type' is not writable

Do the same for getting a property that has no getter.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qom/object.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/qom/object.c b/qom/object.c
index d34608558e..e5cef30f6d 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -1383,7 +1383,8 @@ bool object_property_get(Object *obj, const char *name, Visitor *v,
     }
 
     if (!prop->get) {
-        error_setg(errp, QERR_PERMISSION_DENIED);
+        error_setg(errp, "Property '%s.%s' is not readable",
+                   object_get_typename(obj), name);
         return false;
     }
     prop->get(obj, v, name, prop->opaque, &err);
@@ -1402,7 +1403,8 @@ bool object_property_set(Object *obj, const char *name, Visitor *v,
     }
 
     if (!prop->set) {
-        error_setg(errp, QERR_PERMISSION_DENIED);
+        error_setg(errp, "Property '%s.%s' is not writable",
+                   object_get_typename(obj), name);
         return false;
     }
     prop->set(obj, v, name, prop->opaque, errp);
-- 
2.37.2


