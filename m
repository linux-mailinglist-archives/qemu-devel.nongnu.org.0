Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 053E72AF536
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 16:41:10 +0100 (CET)
Received: from localhost ([::1]:34472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcsFB-0004xE-1i
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 10:41:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kcsDe-0003Sj-Am
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 10:39:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kcsDc-0002Yp-KS
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 10:39:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605109171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UVG0U3ckKhBZ3J+ZJG4zKVG04Yc6/XmOL/hTGv/tpyw=;
 b=bS45+SpRBttQp2cE9a6zEpw7i8YBrDAY9z/MSl0UHMXrzGlLg/fgPk4uEVbBwzIcRLeQ16
 DOMmOLhwo+3FHBzgJkNgZHq7IkfsvsXq8hovGrn6/vjguPH/Jy3bOlrgYK7nSvTFtU5Qig
 Y5G1H59WbqnLAQG20JoOgYuWN0iOZ5E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-cxdDAsiaOKSHChsP8PxOjA-1; Wed, 11 Nov 2020 10:39:30 -0500
X-MC-Unique: cxdDAsiaOKSHChsP8PxOjA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79CCE193ED13;
 Wed, 11 Nov 2020 15:39:26 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.206.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 479305B4A7;
 Wed, 11 Nov 2020 15:39:22 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] qemu-img: align next status sector on destination
 alignment.
Date: Wed, 11 Nov 2020 17:39:13 +0200
Message-Id: <20201111153913.41840-3-mlevitsk@redhat.com>
In-Reply-To: <20201111153913.41840-1-mlevitsk@redhat.com>
References: <20201111153913.41840-1-mlevitsk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Jan Kara <jack@suse.cz>,
 qemu-block@nongnu.org, "Darrick J . Wong" <darrick.wong@oracle.com>,
 Peter Lieven <pl@kamp.de>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This helps avoid unneeded writes and discards.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 qemu-img.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/qemu-img.c b/qemu-img.c
index c2c56fc797..7e9b0f659f 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -1722,7 +1722,7 @@ static void convert_select_part(ImgConvertState *s, int64_t sector_num,
 static int convert_iteration_sectors(ImgConvertState *s, int64_t sector_num)
 {
     int64_t src_cur_offset;
-    int ret, n, src_cur;
+    int ret, n, src_cur, alignment;
     bool post_backing_zero = false;
 
     convert_select_part(s, sector_num, &src_cur, &src_cur_offset);
@@ -1785,11 +1785,14 @@ static int convert_iteration_sectors(ImgConvertState *s, int64_t sector_num)
         n = DIV_ROUND_UP(count, BDRV_SECTOR_SIZE);
 
         /*
-         * Avoid that s->sector_next_status becomes unaligned to the source
-         * request alignment and/or cluster size to avoid unnecessary read
-         * cycles.
+         * Avoid that s->sector_next_status becomes unaligned to the
+         * source/destination request alignment and/or cluster size to avoid
+         * unnecessary read/write cycles.
          */
-        tail = (sector_num - src_cur_offset + n) % s->src_alignment[src_cur];
+        alignment = MAX(s->src_alignment[src_cur], s->alignment);
+        assert(is_power_of_2(alignment));
+
+        tail = (sector_num - src_cur_offset + n) % alignment;
         if (n > tail) {
             n -= tail;
         }
-- 
2.26.2


