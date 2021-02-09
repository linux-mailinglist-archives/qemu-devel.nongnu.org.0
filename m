Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4693152B4
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 16:26:16 +0100 (CET)
Received: from localhost ([::1]:56728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Uu7-00039d-JT
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 10:26:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l9Us3-0001fb-WA
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 10:24:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l9Urv-00020d-Nk
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 10:24:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612884237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kEI4vDF0/E1+Fku5FUUjd726RMzTveHrhPMWu5zHuvM=;
 b=dOuFVRj3QVSSHW49TmY8vWYgZuGBs+SYmgZ9oIieWMBn3g1oJmDs3RYlPORC0EGkZNp28D
 XhR9DYo5+YDo5pXzP2XleOoIV3M4WLghulJlMK5JPZH2LVXgr10ncR6vOxJ38WKBDWNIJ9
 Gf0u12uj2C4msMqTI2WjZnhx2fGmTB0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-dL3O9zhcM3-KahG6TeCXQw-1; Tue, 09 Feb 2021 10:23:56 -0500
X-MC-Unique: dL3O9zhcM3-KahG6TeCXQw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06D54835E20;
 Tue,  9 Feb 2021 15:23:55 +0000 (UTC)
Received: from blue.redhat.com (ovpn-114-150.phx2.redhat.com [10.3.114.150])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A8BB160CCF;
 Tue,  9 Feb 2021 15:23:54 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] scsi: Silence gcc warning
Date: Tue,  9 Feb 2021 09:23:50 -0600
Message-Id: <20210209152350.207958-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fedora 33, gcc 10.2.1 notes that scsi_cdb_length(buf) can set
len==-1, which in turn overflows g_malloc():

[5/5] Linking target qemu-system-x86_64
In function ‘scsi_disk_new_request_dump’,
    inlined from ‘scsi_new_request’ at ../hw/scsi/scsi-disk.c:2608:9:
../hw/scsi/scsi-disk.c:2582:19: warning: argument 1 value ‘18446744073709551612’ exceeds maximum object size 9223372036854775807 [-Walloc-size-larger-than=]
 2582 |     line_buffer = g_malloc(len * 5 + 1);
      |                   ^

Silence it with a decent assertion, since we only convert a buffer to
bytes when we have a valid cdb length.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 hw/scsi/scsi-disk.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index ed52fcd49ff0..b3311a5657b7 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -2579,6 +2579,7 @@ static void scsi_disk_new_request_dump(uint32_t lun, uint32_t tag, uint8_t *buf)
     int len = scsi_cdb_length(buf);
     char *line_buffer, *p;

+    assert(len > 0 && len <= 16);
     line_buffer = g_malloc(len * 5 + 1);

     for (i = 0, p = line_buffer; i < len; i++) {
-- 
2.30.0


