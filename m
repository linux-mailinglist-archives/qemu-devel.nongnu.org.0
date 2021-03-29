Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3161C34C4DF
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 09:27:53 +0200 (CEST)
Received: from localhost ([::1]:54386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQmJS-0000KA-Gi
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 03:27:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lQmHs-0008EH-4v
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 03:26:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lQmHq-0001mC-20
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 03:26:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617002767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TardH8dRqyKv6yW/R4ESCjExg2FmibPfOj94+rU2LL4=;
 b=HTIKHh8lmNB5VWmJQ+Eoxhj6ieYPCIGCOMsPbTnepvC95fvm6onPnTtrWBboth57d4VHvA
 I4P+O++yQ4+kuCUPTOqek7Dxwmg6oroK9HXfAZYrzr6+Tyl3kA60jhqWZ/YqmHCVR8ZT/k
 5I0yTpVJn5tIQ3zlnwt+nRPT9vJQXC0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-RX9JoDUlPAWhn9UyQNmomQ-1; Mon, 29 Mar 2021 03:26:04 -0400
X-MC-Unique: RX9JoDUlPAWhn9UyQNmomQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 262AE180FCA1;
 Mon, 29 Mar 2021 07:26:03 +0000 (UTC)
Received: from thuth.com (ovpn-112-129.ams2.redhat.com [10.36.112.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1F6E519C45;
 Mon, 29 Mar 2021 07:26:01 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-block@nongnu.org,
	Kevin Wolf <kwolf@redhat.com>
Subject: [RFC PATCH] block/vpc: Support probing of fixed-size VHD images
Date: Mon, 29 Mar 2021 09:25:59 +0200
Message-Id: <20210329072559.2668780-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixed-size VHD images don't have a header, only a footer. To be able
to still detect them right, support probing via the file name, too.

Without this change, images get detected as raw:

$ qemu-img create -f vpc -o subformat=fixed test.vhd 2G
Formatting 'test.vhd', fmt=vpc size=2147483648 subformat=fixed
$ qemu-img info test.vhd
image: test.vhd
file format: raw
virtual size: 2 GiB (2147992064 bytes)
disk size: 8 KiB

With this change:

$ qemu-img info test.vhd
image: test.vhd
file format: vpc
virtual size: 2 GiB (2147991552 bytes)
disk size: 8 KiB

Resolves: https://bugs.launchpad.net/qemu/+bug/1819182
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 I've marked the subject with RFC since I'm not quite sure whether this
 is really a good idea... please let me know what you think about it...

 block/vpc.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/block/vpc.c b/block/vpc.c
index 17a705b482..be561e4b39 100644
--- a/block/vpc.c
+++ b/block/vpc.c
@@ -191,8 +191,18 @@ static uint32_t vpc_checksum(void *p, size_t size)
 
 static int vpc_probe(const uint8_t *buf, int buf_size, const char *filename)
 {
-    if (buf_size >= 8 && !strncmp((char *)buf, "conectix", 8))
+    if (buf_size >= 8 && !strncmp((char *)buf, "conectix", 8)) {
         return 100;
+    }
+
+    /* It could be a fixed-size image without header -> check extension, too */
+    if (filename) {
+        int len = strlen(filename);
+        if (len > 4 && !strcasecmp(&filename[len - 4], ".vhd")) {
+            return 10;
+        }
+    }
+
     return 0;
 }
 
-- 
2.27.0


