Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFC51CACBA
	for <lists+qemu-devel@lfdr.de>; Fri,  8 May 2020 14:58:19 +0200 (CEST)
Received: from localhost ([::1]:35672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jX2a2-0004Sd-7B
	for lists+qemu-devel@lfdr.de; Fri, 08 May 2020 08:58:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jX2KT-0000Bc-B6
 for qemu-devel@nongnu.org; Fri, 08 May 2020 08:42:14 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:20193
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jX2KP-00089W-8A
 for qemu-devel@nongnu.org; Fri, 08 May 2020 08:42:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588941728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fIenljgU8lVnBGd8ejQGn4sLrvHalwyb4JbAamzQiyU=;
 b=X3NNlGOv8tFlQQMUzLcKsqT7Ykfu1JthzhGkCTx3hjG+ITUgNbpdoFEPII9HBKfDt+jrfT
 kWnG2m55WEBXWqHbLnZjmMkLZBNp3y0OsYjdzCvopkcARutn+q6sDfrV/ZO35Y8AHnK+2U
 JmJXoDfZoHZDoqRIwk9/IP+bkPkjyQs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-krTZY7QRM8ajR3SOFRoVBA-1; Fri, 08 May 2020 08:42:01 -0400
X-MC-Unique: krTZY7QRM8ajR3SOFRoVBA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AEB11800687;
 Fri,  8 May 2020 12:42:00 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-113-190.ams2.redhat.com
 [10.36.113.190])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B01796E715;
 Fri,  8 May 2020 12:41:59 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 14/30] vmdk: Flush only once in vmdk_L2update()
Date: Fri,  8 May 2020 14:41:19 +0200
Message-Id: <20200508124135.252565-15-kwolf@redhat.com>
In-Reply-To: <20200508124135.252565-1-kwolf@redhat.com>
References: <20200508124135.252565-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/08 02:23:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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

If we have a backup L2 table, we currently flush once after writing to
the active L2 table and again after writing to the backup table. A
single flush is enough and makes things a little less slow.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20200430133007.170335-6-kwolf@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/vmdk.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/block/vmdk.c b/block/vmdk.c
index 2880d88dea..b18f128816 100644
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


