Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EE11BF9CD
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Apr 2020 15:44:02 +0200 (CEST)
Received: from localhost ([::1]:55254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jU9Tt-000132-BU
	for lists+qemu-devel@lfdr.de; Thu, 30 Apr 2020 09:44:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47756)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jU9KV-00081L-CA
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 09:37:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jU9Gn-0004Kp-M0
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 09:34:19 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:39057
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jU9Gn-0004KX-8c
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 09:30:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588253428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZBXu548uWHsUziQiPVqN0GngVfBoamsskJ3rPepcQIg=;
 b=OilS1EBnrkZciYcAcmNi94mCQvl9lsLbjeHXfJnby5DlrWc0/oMnnvor3d0WNfVw1GYAXU
 fwfHI19lb0UMIj1bXqkNL0RzQv8XdVA2695NW+QgpT4OKc1kOorTkejOH6oA44AyaBNrab
 5XoC3/L4PIp8gmmBjuH9j+ay6ghaM3I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-NlrRkFq3OXWmssgIncxUtg-1; Thu, 30 Apr 2020 09:30:26 -0400
X-MC-Unique: NlrRkFq3OXWmssgIncxUtg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5FBF6804042;
 Thu, 30 Apr 2020 13:30:25 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-114-60.ams2.redhat.com [10.36.114.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F90E5798D;
 Thu, 30 Apr 2020 13:30:22 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 5/6] vmdk: Flush only once in vmdk_L2update()
Date: Thu, 30 Apr 2020 15:30:06 +0200
Message-Id: <20200430133007.170335-6-kwolf@redhat.com>
In-Reply-To: <20200430133007.170335-1-kwolf@redhat.com>
References: <20200430133007.170335-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/30 01:04:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If we have a backup L2 table, we currently flush once after writing to
the active L2 table and again after writing to the backup table. A
single flush is enough and makes things a little less slow.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/vmdk.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/block/vmdk.c b/block/vmdk.c
index dcd30f1419..d3eb9a5cdc 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -1435,7 +1435,7 @@ static int vmdk_L2update(VmdkExtent *extent, VmdkMeta=
Data *m_data,
     offset =3D cpu_to_le32(offset);
     /* update L2 table */
     BLKDBG_EVENT(extent->file, BLKDBG_L2_UPDATE);
-    if (bdrv_pwrite_sync(extent->file,
+    if (bdrv_pwrite(extent->file,
                 ((int64_t)m_data->l2_offset * 512)
                     + (m_data->l2_index * sizeof(offset)),
                 &offset, sizeof(offset)) < 0) {
@@ -1444,13 +1444,16 @@ static int vmdk_L2update(VmdkExtent *extent, VmdkMe=
taData *m_data,
     /* update backup L2 table */
     if (extent->l1_backup_table_offset !=3D 0) {
         m_data->l2_offset =3D extent->l1_backup_table[m_data->l1_index];
-        if (bdrv_pwrite_sync(extent->file,
+        if (bdrv_pwrite(extent->file,
                     ((int64_t)m_data->l2_offset * 512)
                         + (m_data->l2_index * sizeof(offset)),
                     &offset, sizeof(offset)) < 0) {
             return VMDK_ERROR;
         }
     }
+    if (bdrv_flush(extent->file->bs) < 0) {
+        return VMDK_ERROR;
+    }
     if (m_data->l2_cache_entry) {
         *m_data->l2_cache_entry =3D offset;
     }
--=20
2.25.3


