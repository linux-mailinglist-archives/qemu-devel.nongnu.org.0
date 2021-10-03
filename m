Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B382420098
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 09:58:38 +0200 (CEST)
Received: from localhost ([::1]:60108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWwOL-0003jb-Jt
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 03:58:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw9R-00043q-Lm
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:43:13 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:37837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw9Q-0000yz-0H
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:43:13 -0400
Received: by mail-ed1-x536.google.com with SMTP id ba1so51824217edb.4
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 00:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m3Y5hCRoZxoZcQML796y/BIVxhl18IJOQWKwSNYcpos=;
 b=d5a+djjuAeQwkYT9I820dvbEEDKiKWo8bkz9cyO++9WqRMQomfa+CbPR/ILB9Lihbe
 a339urxaG6o/lfbyjkgJYLUUOwV3UDjbq5WpS+ua/bytPwjqbHBipFANGeAAY8XmO9UW
 dHWeQ5aArOOgO4+YRf74eKXCZsu1kZgEChWssDBkJ7/OWoGpVNe4UuDCzjaPO/3jqRtu
 UjR91hsSLtuFFietULdM7SadRZDaENQO9/LkB1PQxeaf0HnI7ZVlc+jNlcAhF0ADc7hC
 QXpNW+RzQ/shXvb+/LfWZUmj3CF/vlMCpc/csqNEtecj1bIVU+V1W4l1S7oEKVUq1/Wd
 IJcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=m3Y5hCRoZxoZcQML796y/BIVxhl18IJOQWKwSNYcpos=;
 b=TPMkEeM0QWoUNNfFPmc99jYYNYn+KtzTtjd4emVpxceW99/z9UmCbIaHR25i6lL+Y3
 zk7rJAHX/MwojWF44dDE6cwB8fRqD+CGTgKW0oj5nJAVRMAR+vjFv6Ilili5WKJTqwWS
 iFr6en+6/p/2YDCAJNRBEvoidcLl9nQsX04AjLhLsb8511qWliewRg8Ql66mnpZBSCGc
 X4nfOyNw401mxnulmdijzkOIUJ5tAABUUsQk+NqaAfMLvKh6yL097Nz6d4N2QFVka3lO
 Tneh7+lt+tMOWiIrBr8kHz15ZwLeq4NAXWLGUcec9VPty6S6jsNL91VKXRpfxdwANY5j
 CoTg==
X-Gm-Message-State: AOAM533zIKmm8wzJG2DWonHFNSb97IhOIUdXZd5AbLq7u63ujoGePNvD
 7bR230Q0K8+nmM0eM6YPKUwWF9ixVhE=
X-Google-Smtp-Source: ABdhPJzkh3CkRinMoN5Sn9bKTDGRX036kMK2ewSpuopjEO3n9nK5dVnN4/bIis2MUkZv9bFWyKD8Tw==
X-Received: by 2002:a17:906:c015:: with SMTP id
 e21mr8945822ejz.113.1633246990622; 
 Sun, 03 Oct 2021 00:43:10 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n6sm5560856eds.10.2021.10.03.00.43.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 00:43:10 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 25/30] qapi: Include qom-path in MEMORY_DEVICE_SIZE_CHANGE qapi
 events
Date: Sun,  3 Oct 2021 09:42:45 +0200
Message-Id: <20211003074250.60869-26-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211003074250.60869-1-pbonzini@redhat.com>
References: <20211003074250.60869-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Markus Armbruster <armbru@redhat.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

As we might not always have a device id, it is impossible to always
match MEMORY_DEVICE_SIZE_CHANGE events to an actual device. Let's
include the qom-path in the event, which allows for reliable mapping of
events to devices.

Fixes: 722a3c783ef4 ("virtio-pci: Send qapi events when the virtio-mem size changes")
Suggested-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210929162445.64060-3-david@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/virtio/virtio-mem-pci.c | 5 ++++-
 qapi/machine.json          | 5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/virtio-mem-pci.c b/hw/virtio/virtio-mem-pci.c
index 7e384b7397..be2383b0c5 100644
--- a/hw/virtio/virtio-mem-pci.c
+++ b/hw/virtio/virtio-mem-pci.c
@@ -87,9 +87,12 @@ static void virtio_mem_pci_size_change_notify(Notifier *notifier, void *data)
     VirtIOMEMPCI *pci_mem = container_of(notifier, VirtIOMEMPCI,
                                          size_change_notifier);
     DeviceState *dev = DEVICE(pci_mem);
+    char *qom_path = object_get_canonical_path(OBJECT(dev));
     const uint64_t * const size_p = data;
 
-    qapi_event_send_memory_device_size_change(!!dev->id, dev->id, *size_p);
+    qapi_event_send_memory_device_size_change(!!dev->id, dev->id, *size_p,
+                                              qom_path);
+    g_free(qom_path);
 }
 
 static void virtio_mem_pci_class_init(ObjectClass *klass, void *data)
diff --git a/qapi/machine.json b/qapi/machine.json
index 0e91a57a76..5db54df298 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1336,8 +1336,11 @@
 # action).
 #
 # @id: device's ID
+#
 # @size: the new size of memory that the device provides
 #
+# @qom-path: path to the device object in the QOM tree (since 6.2)
+#
 # Note: this event is rate-limited.
 #
 # Since: 5.1
@@ -1350,7 +1353,7 @@
 #
 ##
 { 'event': 'MEMORY_DEVICE_SIZE_CHANGE',
-  'data': { '*id': 'str', 'size': 'size' } }
+  'data': { '*id': 'str', 'size': 'size', 'qom-path' : 'str'} }
 
 
 ##
-- 
2.31.1



