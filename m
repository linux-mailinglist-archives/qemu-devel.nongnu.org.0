Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEB229927A
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 17:32:41 +0100 (CET)
Received: from localhost ([::1]:59514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kX5QG-00034F-Uh
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 12:32:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kX5Ee-0004a3-MC
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 12:20:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kX5Ec-0000FX-Nr
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 12:20:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603729237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WtMh7k8qGJAfN5KPhYoC0pIzjQsQjvzJT8baziDbCOs=;
 b=gFgxrh7UeekKCS9hGKTzVpXQkTxHzMaxIOy+Ou4bJKHn8aeHeItq+i2/wmRR2iwD/9QZro
 bf+T8h5r25qP3vz46ODnCWjD6KEqz421XXglDwhd3EjyMTSH7RiRM8Y84TfA37+x3R9Wy1
 MGubQGi2ghuuvknhWEKFYuaBsZgJZIA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-JzssjUwcMLWO5-63WwpsNg-1; Mon, 26 Oct 2020 12:20:35 -0400
X-MC-Unique: JzssjUwcMLWO5-63WwpsNg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62ACF18B9EEA;
 Mon, 26 Oct 2020 16:20:34 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-112-208.ams2.redhat.com
 [10.36.112.208])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 03B125D9E4;
 Mon, 26 Oct 2020 16:20:32 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, yubihong@huawei.com, peterx@redhat.com,
 peter.maydell@linaro.org
Subject: [PULL 07/16] migration: Do not initialise statics and globals to 0 or
 NULL
Date: Mon, 26 Oct 2020 16:19:43 +0000
Message-Id: <20201026161952.149188-8-dgilbert@redhat.com>
In-Reply-To: <20201026161952.149188-1-dgilbert@redhat.com>
References: <20201026161952.149188-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/26 02:39:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bihong Yu <yubihong@huawei.com>

Signed-off-by: Bihong Yu <yubihong@huawei.com>
Reviewed-by: Chuan Zheng <zhengchuan@huawei.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <1603163448-27122-7-git-send-email-yubihong@huawei.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/ram.c    | 2 +-
 migration/savevm.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 09178cc3a3..2da2b622ab 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2743,7 +2743,7 @@ static int load_xbzrle(QEMUFile *f, ram_addr_t addr, void *host)
  */
 static inline RAMBlock *ram_block_from_stream(QEMUFile *f, int flags)
 {
-    static RAMBlock *block = NULL;
+    static RAMBlock *block;
     char id[256];
     uint8_t len;
 
diff --git a/migration/savevm.c b/migration/savevm.c
index e9fd95b1ba..6ebd7e66ad 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -63,7 +63,7 @@
 #include "qemu/bitmap.h"
 #include "net/announce.h"
 
-const unsigned int postcopy_ram_discard_version = 0;
+const unsigned int postcopy_ram_discard_version;
 
 /* Subcommands for QEMU_VM_COMMAND */
 enum qemu_vm_cmd {
-- 
2.28.0


