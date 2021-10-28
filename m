Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B99843DA74
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 06:38:28 +0200 (CEST)
Received: from localhost ([::1]:39204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfxBL-0002fj-Kc
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 00:38:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mfx5C-0004Nd-Jb
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 00:32:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mfx5A-0000TU-Ke
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 00:32:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635395524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pgTHIAPHXkkbULyCuKmi+XPo0/hjZBL6MtokIFprPvs=;
 b=ILBa41sv3eW1c+ZkP5ONgbslte7p3Rwe35r28+Di10nh2WK0lB+tGH2R43PjqCskYNxBRZ
 6A1vokyphwoDihfYOBjtYYg+TbwItXzm5oDXronPgg6XNX54zVFC40kZpPVSNj+Ec+3scE
 fwYP4h9jHpUaj/w0g4pILGBqHbsEm+I=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-Zf3P0FPtNECbl7ORgjqlSA-1; Thu, 28 Oct 2021 00:32:02 -0400
X-MC-Unique: Zf3P0FPtNECbl7ORgjqlSA-1
Received: by mail-pg1-f198.google.com with SMTP id
 p28-20020a637f5c000000b002a3c58b5917so2646264pgn.23
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 21:32:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pgTHIAPHXkkbULyCuKmi+XPo0/hjZBL6MtokIFprPvs=;
 b=0iLPonlqe2VAhYWzRiysLa4encL9eAsOzeX/3mUyfgq2PrRtbR/RoC3ALIhMXglFV6
 S9XPbuy1hURU1DKROEGM3FviMsZGQ8wD0QbxXqDEmG/i4hoK6jkDoyQfYeE0AF1LOdNt
 Pd8Dl+Fg3amMf3sAkD0MbVF8O3z3HmEfSHEYvCPXjx8gMEGQfr8nEY/4v2FKj97ncxrh
 hznxzx2odHyWUau2cvNF1TueDYahdm9Oqe+DDbXzlJT+czxpZIsVUhvBpXIk1alLrudy
 pVt7bIAlIbbiQx5s8x5dxcdiKBK04xqw6z+qSeOzgLhWutCQZUmgzxT5F9xntQcta2hC
 J+pQ==
X-Gm-Message-State: AOAM531MyqsqaNb8Th7N0GTtxbjwgykQui5jr4N1rEnjUNdnO7r7JlJG
 9YHjXxfKFwaHsiTtjG1E8P7rPP0x8JhJd3Vd6thrTglw7Pg/McNEaPGhTA1vpMVHr36XhEwejPi
 eHZbalc4KRWwJaB3eTi8MmsaVy6Bo3SYXMFEoxEwxi5vTFjBnyTXH3h2XeX7nui2D
X-Received: by 2002:a17:90a:644d:: with SMTP id
 y13mr2057980pjm.10.1635395521299; 
 Wed, 27 Oct 2021 21:32:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxi2balo4iS5FNHItyKoQlOCvZ7NFqP/tawuSh5V7bmrhkfP9tEpS7se0TnwisRipUc2HduSg==
X-Received: by 2002:a17:90a:644d:: with SMTP id
 y13mr2057939pjm.10.1635395520974; 
 Wed, 27 Oct 2021 21:32:00 -0700 (PDT)
Received: from localhost.localdomain ([191.101.132.60])
 by smtp.gmail.com with ESMTPSA id k22sm1483074pfi.149.2021.10.27.21.31.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 27 Oct 2021 21:32:00 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/5] qom: object_child_foreach_recursive_type()
Date: Thu, 28 Oct 2021 12:31:27 +0800
Message-Id: <20211028043129.38871-4-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211028043129.38871-1-peterx@redhat.com>
References: <20211028043129.38871-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, peterx@redhat.com,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add this sister helper besides object_child_foreach_recursive() to loop over
child objects only if the object can be casted to a specific type.

Suggested-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/qom/object.h | 20 ++++++++++++++++++++
 qom/object.c         | 27 +++++++++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/include/qom/object.h b/include/qom/object.h
index faae0d841f..355277db40 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -1926,6 +1926,26 @@ int object_child_foreach(Object *obj, int (*fn)(Object *child, void *opaque),
 int object_child_foreach_recursive(Object *obj,
                                    int (*fn)(Object *child, void *opaque),
                                    void *opaque);
+
+/**
+ * object_child_foreach_recursive_type:
+ * @obj: the object whose children will be navigated
+ * @type: the typename string to scan
+ * @fn: the iterator function to be called
+ * @opaque: an opaque value that will be passed to the iterator
+ *
+ * This is a special version of object_child_foreach_recursive() so that we
+ * only call the fn() if the child can be casted to the @typename specified.
+ * Please refer to the comments above object_child_foreach_recursive() for
+ * more details.
+ *
+ * Returns: The last value returned by @fn, or 0 if there is no child.
+ */
+int object_child_foreach_recursive_type(Object *obj,
+                                        const char *typename,
+                                        int (*fn)(Object *child, void *opaque),
+                                        void *opaque);
+
 /**
  * container_get:
  * @root: root of the #path, e.g., object_get_root()
diff --git a/qom/object.c b/qom/object.c
index 6be710bc40..d25ca09b1d 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -1134,6 +1134,33 @@ int object_child_foreach_recursive(Object *obj,
     return do_object_child_foreach(obj, fn, opaque, true);
 }
 
+typedef struct {
+    const char *typename;
+    int (*fn)(Object *child, void *opaque);
+    void *opaque;
+} ObjectTypeArgs;
+
+static int object_child_hook(Object *child, void *opaque)
+{
+    ObjectTypeArgs *args = opaque;
+
+    if (object_dynamic_cast(child, args->typename)) {
+        return args->fn(child, args->opaque);
+    }
+
+    return 0;
+}
+
+int object_child_foreach_recursive_type(Object *obj,
+                                        const char *typename,
+                                        int (*fn)(Object *child, void *opaque),
+                                        void *opaque)
+{
+    ObjectTypeArgs args = { .typename = typename, .fn = fn, .opaque = opaque };
+
+    return object_child_foreach_recursive(obj, object_child_hook, &args);
+}
+
 static void object_class_get_list_tramp(ObjectClass *klass, void *opaque)
 {
     GSList **list = opaque;
-- 
2.32.0


