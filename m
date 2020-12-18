Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F992DE2B3
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 13:20:19 +0100 (CET)
Received: from localhost ([::1]:37228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqEk6-00039p-Gk
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 07:20:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kqEbJ-0002AI-Rz
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 07:11:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kqEbA-0001ju-L2
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 07:11:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608293463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ccgIRhdO0U4GBPLzwo7rPz7AchOlZZI+p/DMXQC/T08=;
 b=LEb+VXT5DsHzas+umZcAbyVUYtN6izpwGAg6ZSBtX3hSjLWzNc0kXv2YuOUhYBo+M8m4Ki
 Rwe94aIG4+1slSd2AnMOR/aOKxObAvW1ds5qZUfJIgmyVvYt+rXMGlZRe6iKSGhDmPkp85
 2Kv7uC9juHBHO9B0lxOjGEgByyFHdlw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-4v1kXlpaNwSVFmv_bOqMUA-1; Fri, 18 Dec 2020 07:11:01 -0500
X-MC-Unique: 4v1kXlpaNwSVFmv_bOqMUA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91E5B8049CA;
 Fri, 18 Dec 2020 12:10:59 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-34.ams2.redhat.com [10.36.115.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A5B960C15;
 Fri, 18 Dec 2020 12:10:58 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 10/17] block/vpc: Don't abuse the footer buffer as BAT sector
 buffer
Date: Fri, 18 Dec 2020 13:10:34 +0100
Message-Id: <20201218121041.299788-11-kwolf@redhat.com>
In-Reply-To: <20201218121041.299788-1-kwolf@redhat.com>
References: <20201218121041.299788-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Markus Armbruster <armbru@redhat.com>

create_dynamic_disk() takes a buffer holding the footer as first
argument.  It writes out the footer (512 bytes), then reuses the
buffer to initialize and write out the dynamic header (1024 bytes),
then reuses it again to initialize and write out BAT sectors (512).

Works, because the caller passes a buffer that is large enough for all
three purposes.  I hate that.

Use a separate buffer for writing out BAT sectors.  The next commit
will do the same for the dynamic header.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20201217162003.1102738-3-armbru@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/vpc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/block/vpc.c b/block/vpc.c
index 2fcf3f6283..d18ecc3da1 100644
--- a/block/vpc.c
+++ b/block/vpc.c
@@ -824,6 +824,7 @@ static int create_dynamic_disk(BlockBackend *blk, uint8_t *buf,
 {
     VHDDynDiskHeader *dyndisk_header =
         (VHDDynDiskHeader *) buf;
+    uint8_t bat_sector[512];
     size_t block_size, num_bat_entries;
     int i;
     int ret;
@@ -847,9 +848,9 @@ static int create_dynamic_disk(BlockBackend *blk, uint8_t *buf,
     /* Write the initial BAT */
     offset = 3 * 512;
 
-    memset(buf, 0xFF, 512);
+    memset(bat_sector, 0xFF, 512);
     for (i = 0; i < DIV_ROUND_UP(num_bat_entries * 4, 512); i++) {
-        ret = blk_pwrite(blk, offset, buf, 512, 0);
+        ret = blk_pwrite(blk, offset, bat_sector, 512, 0);
         if (ret < 0) {
             goto fail;
         }
-- 
2.29.2


