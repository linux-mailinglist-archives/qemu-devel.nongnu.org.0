Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C195C56782D
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 22:08:25 +0200 (CEST)
Received: from localhost ([::1]:41916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8oqO-0001nJ-C5
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 16:08:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1o8ooE-0000Zo-SN
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 16:06:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mcascell@redhat.com>)
 id 1o8ooA-0000Q2-8m
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 16:06:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657051565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=o0+SZhoZBty2UalGAt7idgrFE8ZMR/w4RB0biz2xMko=;
 b=Tojm5grNuSdceLhqVGXeZrCc8f8wR3eaB0EXoLjnzyflhd//1HL2pplNYcAx58ibv4JkPr
 snoFQAYTFBLWKZcOh+hkJMUczh69oiqKE9ZUhzcI+YV/XI0/1/Ut/jdKB3qd7VZHq9Y3Dp
 a7OHeW1HqKUgOVcgWIktakFfV/Z6H20=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-307-AFZcPvFLNUevx6RglH6f3Q-1; Tue, 05 Jul 2022 16:06:01 -0400
X-MC-Unique: AFZcPvFLNUevx6RglH6f3Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9BA21811E87;
 Tue,  5 Jul 2022 20:06:01 +0000 (UTC)
Received: from f35-work.redhat.com (unknown [10.39.193.243])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A40DB400DFD0;
 Tue,  5 Jul 2022 20:06:00 +0000 (UTC)
From: Mauro Matteo Cascella <mcascell@redhat.com>
To: qemu-devel@nongnu.org
Cc: mcascell@redhat.com, pbonzini@redhat.com, fam@euphon.net, thuth@redhat.com
Subject: [PATCH] scsi/lsi53c895a: fix use-after-free in lsi_do_msgout
 (CVE-2022-0216)
Date: Tue,  5 Jul 2022 22:05:43 +0200
Message-Id: <20220705200543.2366809-1-mcascell@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mcascell@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Set current_req->req to NULL to prevent reusing a free'd buffer in case of
repeated SCSI cancel requests. Thanks to Thomas Huth for suggesting the patch.

Fixes: CVE-2022-0216
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/972
Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
---
 hw/scsi/lsi53c895a.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
index c8773f73f7..99ea42d49b 100644
--- a/hw/scsi/lsi53c895a.c
+++ b/hw/scsi/lsi53c895a.c
@@ -1028,8 +1028,9 @@ static void lsi_do_msgout(LSIState *s)
         case 0x0d:
             /* The ABORT TAG message clears the current I/O process only. */
             trace_lsi_do_msgout_abort(current_tag);
-            if (current_req) {
+            if (current_req && current_req->req) {
                 scsi_req_cancel(current_req->req);
+                current_req->req = NULL;
             }
             lsi_disconnect(s);
             break;
-- 
2.35.3


