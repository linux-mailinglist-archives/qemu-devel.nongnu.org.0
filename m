Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CF14462F4
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 12:42:51 +0100 (CET)
Received: from localhost ([::1]:36094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mixcQ-00054Z-Aj
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 07:42:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1mixXj-000463-GR
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 07:38:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1mixXg-0008C6-Lm
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 07:37:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636112276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=10ITT67kv1mDB5fZSS8ViTS6Wh8tY9mDSr3nXI+BH/A=;
 b=aARNKMzu51QY4oC13Y5wGUceoOaZzXynITSbGyFB1ZUZkeGrzIJPKr1n2SUEN7X4gfO7kw
 VpKL+7uMPZftnRnsJW2SHMToFFtNkeGWnhg3TjaLCwM4TY7fbF8Pd6hRg4QfDUUsrKDJei
 q7ubdqGhgZNWDHC86KIgRLt3QzBOab8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-EAlO-R7QNwSkJgKctYvodA-1; Fri, 05 Nov 2021 07:37:55 -0400
X-MC-Unique: EAlO-R7QNwSkJgKctYvodA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B97B8797D3;
 Fri,  5 Nov 2021 11:37:54 +0000 (UTC)
Received: from f33-work.redhat.com (unknown [10.39.194.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ED5715D740;
 Fri,  5 Nov 2021 11:37:52 +0000 (UTC)
From: Mauro Matteo Cascella <mcascell@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/scsi/scsi-disk: MODE_PAGE_ALLS not allowed in MODE SELECT
 commands
Date: Fri,  5 Nov 2021 12:37:29 +0100
Message-Id: <20211105113729.530200-1-mcascell@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mcascell@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mcascell@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: pbonzini@redhat.com, mcascell@redhat.com, qiuhao.li@outlook.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

MODE_PAGE_ALLS causes an off-by-one error in mode_sense_page() when accessing
the stack-allocated mode_sense_valid buffer. MODE_PAGE_ALLS is only valid for
MODE SENSE commands. Do not process it in MODE SELECT commands.

Fixes: CVE-2021-3930
RHBZ: https://bugzilla.redhat.com/show_bug.cgi?id=2020588
Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
Reported-by: Qiuhao Li <qiuhao.li@outlook.com>
---
 hw/scsi/scsi-disk.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index e8a547dbb7..5852e8dcfd 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -1087,6 +1087,7 @@ static int mode_sense_page(SCSIDiskState *s, int page, uint8_t **p_outbuf,
     uint8_t *p = *p_outbuf + 2;
     int length;
 
+    assert(page != MODE_PAGE_ALLS);
     if ((mode_sense_valid[page] & (1 << s->qdev.type)) == 0) {
         return -1;
     }
@@ -1428,6 +1429,11 @@ static int scsi_disk_check_mode_select(SCSIDiskState *s, int page,
         return -1;
     }
 
+    /* MODE_PAGE_ALLS is only valid for MODE SENSE commands */
+    if (page == MODE_PAGE_ALLS) {
+        return -1;
+    }
+
     p = mode_current;
     memset(mode_current, 0, inlen + 2);
     len = mode_sense_page(s, page, &p, 0);
-- 
2.31.1


