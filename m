Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 967451F6E82
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jun 2020 22:08:17 +0200 (CEST)
Received: from localhost ([::1]:58124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjTUm-0006rB-K8
	for lists+qemu-devel@lfdr.de; Thu, 11 Jun 2020 16:08:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jjT8s-0007rj-7d
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 15:45:38 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:42822
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jjT8o-000111-IQ
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 15:45:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591904733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/d1fb6+JZPNJokrNEuReFcQeKnhzqrR4dIWJFcmCqJ0=;
 b=deRpuOxkvtbkh5hwrkJlJ3qoUbev6sXQV1aLIQzX8f35DFUvBRF/P8mRAb8P6e/sA8cR8t
 T/EfXRDT3TgMp68OoqnjXUSGjICPyFLmAP8DfpOZci9RoOXktg+NM9jM1UWeGuU9CoPZms
 b5FZIK7c9/cyjzRrS2J3y1l8tLKnPVc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-cWXKVHEqM1eFaog-MZ9F6g-1; Thu, 11 Jun 2020 15:45:29 -0400
X-MC-Unique: cWXKVHEqM1eFaog-MZ9F6g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 160981005512;
 Thu, 11 Jun 2020 19:45:28 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C53645C1B2;
 Thu, 11 Jun 2020 19:45:27 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 043/115] qom/object: pass (Object *) to
 object_initialize_with_type()
Date: Thu, 11 Jun 2020 15:43:37 -0400
Message-Id: <20200611194449.31468-44-pbonzini@redhat.com>
In-Reply-To: <20200611194449.31468-1-pbonzini@redhat.com>
References: <20200611194449.31468-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/11 14:52:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Masahiro Yamada <masahiroy@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Masahiro Yamada <masahiroy@kernel.org>

object_new_with_type() already passes (Object *) pointer.
Avoid casting back and forth.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Message-Id: <20200512173104.2293073-1-masahiroy@kernel.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qom/object.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/qom/object.c b/qom/object.c
index bc39ad4b99..b0ed560fd8 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -494,10 +494,8 @@ static void object_class_property_init_all(Object *obj)
     }
 }
 
-static void object_initialize_with_type(void *data, size_t size, TypeImpl *type)
+static void object_initialize_with_type(Object *obj, size_t size, TypeImpl *type)
 {
-    Object *obj = data;
-
     type_initialize(type);
 
     g_assert(type->instance_size >= sizeof(Object));
-- 
2.26.2



