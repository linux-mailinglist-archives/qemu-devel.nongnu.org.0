Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C905E30C589
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 17:28:46 +0100 (CET)
Received: from localhost ([::1]:33474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6yXl-0003Am-SO
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 11:28:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l6y5J-0001Ar-8M
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:59:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1l6y5F-00034M-Ra
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 10:59:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612281557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=JWoaUGEw6eWklzeeQ4G5o/1OWamhYde193gJvNSjvGk=;
 b=BNCdzk+vpK2i+KP2gQ9ovh5f+Xiic/J+O7ZDGLqKpvTqccXcD4EmIRrsT+cXyIAJolCImz
 YcdvTga7ddxina2CczFsVdUy3sxh5xaaCEkExFGUtNthKEAKobudgdvtwnL05URPjSzRMQ
 k8H/UrXSjE34OWMt2B8vvaQVN9d7LAI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-526-jmuOG9NXNkSqE7MHxfSGIg-1; Tue, 02 Feb 2021 10:59:15 -0500
X-MC-Unique: jmuOG9NXNkSqE7MHxfSGIg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67CBE800D55;
 Tue,  2 Feb 2021 15:59:14 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-19.ams2.redhat.com [10.36.112.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 70E3C60C66;
 Tue,  2 Feb 2021 15:59:13 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH] block: Fix VM size column width in bdrv_snapshot_dump()
Date: Tue,  2 Feb 2021 16:59:11 +0100
Message-Id: <20210202155911.179865-1-kwolf@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

size_to_str() can return a size like "4.24 MiB", with a single digit
integer part and two fractional digits. This is eight characters, but
commit b39847a5 changed the format string to only reserve seven
characters for the column.

This can result in unaligned columns, which in turn changes the output of
iotests case 267 because exceeding the column size defeats the attempt
to filter the size out of the output (observed with the ppc64 emulator).
The resulting change is only a whitespace change, but since commit
f203080b this is enough for iotests to consider the test failed.

Taking a character away from the tag name column and adding it to the VM
size column doesn't change anything in the common case (the tag name is
left justified, the VM size is right justified), but fixes this case.

Fixes: b39847a50553b7679d6d7fefbe6a108a17aacf8d
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/qapi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/qapi.c b/block/qapi.c
index 0a96099e36..84a0aadc09 100644
--- a/block/qapi.c
+++ b/block/qapi.c
@@ -677,7 +677,7 @@ void bdrv_snapshot_dump(QEMUSnapshotInfo *sn)
     char *sizing = NULL;
 
     if (!sn) {
-        qemu_printf("%-10s%-18s%7s%20s%13s%11s",
+        qemu_printf("%-10s%-17s%8s%20s%13s%11s",
                     "ID", "TAG", "VM SIZE", "DATE", "VM CLOCK", "ICOUNT");
     } else {
         ti = sn->date_sec;
@@ -696,7 +696,7 @@ void bdrv_snapshot_dump(QEMUSnapshotInfo *sn)
             snprintf(icount_buf, sizeof(icount_buf),
                 "%"PRId64, sn->icount);
         }
-        qemu_printf("%-9s %-17s %7s%20s%13s%11s",
+        qemu_printf("%-9s %-16s %8s%20s%13s%11s",
                     sn->id_str, sn->name,
                     sizing,
                     date_buf,
-- 
2.29.2


