Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACB5268C6E
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Sep 2020 15:44:06 +0200 (CEST)
Received: from localhost ([::1]:53832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHom5-0004P3-0s
	for lists+qemu-devel@lfdr.de; Mon, 14 Sep 2020 09:44:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kHokl-0002fa-2X
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 09:42:43 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:23505
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kHokf-00035g-Ht
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 09:42:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600090956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ozdCNqPxHUIVCYpTw7BPVWd2I2aNiWMludowt4idVAA=;
 b=QF0tP8zY0HLzYFhcOJgd/hCptCFt+9cVGSJWrDHKtshE6HYXsFJt0XK5v1LyyoHKyl7dCN
 lR3kQQlEZe1yUy3V5GFScBQbuG4908ypI98SAcXCciHUtAyHUFa2z7+3cWg3fmEm2bCIWq
 pjVggl/pHDzeZXuMNpWVuhuN9JzyAkU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-8OVHnPqgOUKDYtbupMS6yg-1; Mon, 14 Sep 2020 09:42:34 -0400
X-MC-Unique: 8OVHnPqgOUKDYtbupMS6yg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5D191882FA1
 for <qemu-devel@nongnu.org>; Mon, 14 Sep 2020 13:42:33 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-85.ams2.redhat.com
 [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 242C27B7B8;
 Mon, 14 Sep 2020 13:42:26 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B946B31E68; Mon, 14 Sep 2020 15:42:24 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/6] object_initialize: try module load
Date: Mon, 14 Sep 2020 15:42:22 +0200
Message-Id: <20200914134224.29769-5-kraxel@redhat.com>
In-Reply-To: <20200914134224.29769-1-kraxel@redhat.com>
References: <20200914134224.29769-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/14 02:33:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.792,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Needed to allow virtio-gpu-pci initialize the
virtio-gpu-device child device.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 qom/object.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/qom/object.c b/qom/object.c
index b1822a2ef4be..387efb25ebe9 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -518,6 +518,12 @@ void object_initialize(void *data, size_t size, const char *typename)
 {
     TypeImpl *type = type_get_by_name(typename);
 
+#ifdef CONFIG_MODULES
+    if (!type) {
+        module_load_qom_one(typename);
+        type = type_get_by_name(typename);
+    }
+#endif
     if (!type) {
         error_report("missing object type '%s'", typename);
         abort();
-- 
2.27.0


