Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7ED22819F
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jul 2020 16:05:17 +0200 (CEST)
Received: from localhost ([::1]:52994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxstQ-0004q1-U4
	for lists+qemu-devel@lfdr.de; Tue, 21 Jul 2020 10:05:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jxsrF-0001xo-Vl
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 10:03:02 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:46195
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jxsr7-0008Ry-H1
 for qemu-devel@nongnu.org; Tue, 21 Jul 2020 10:03:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595340172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=dptqPmov5HgQE54qsZ8h1j2fyNagrwA/gqq92TDkDyY=;
 b=h1WJ9MKuVeHxTuXzg2z0krMooKCKf3awBS095RRXXXdZl1MIK6eeER0ePIlaNbhf65gsbz
 BV9Ab1ew6n4u0SAsCaes+FDLdyzwb0+WhnP8ghqbWSzkmaOs00QnkKyaCohJVPts6f9S7W
 2qnUF0cySaO/0kY7iDk5L/NqahOl2LI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-0hjrS8bVMsyCNZzogDPGcw-1; Tue, 21 Jul 2020 10:02:50 -0400
X-MC-Unique: 0hjrS8bVMsyCNZzogDPGcw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB305100CCC8
 for <qemu-devel@nongnu.org>; Tue, 21 Jul 2020 14:02:49 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-115-89.ams2.redhat.com
 [10.36.115.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE8ED7268E;
 Tue, 21 Jul 2020 14:02:46 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id EF45F9D57; Tue, 21 Jul 2020 16:02:45 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/3] qxl: fix modular builds with dtrace
Date: Tue, 21 Jul 2020 16:02:44 +0200
Message-Id: <20200721140245.14634-3-kraxel@redhat.com>
In-Reply-To: <20200721140245.14634-1-kraxel@redhat.com>
References: <20200721140245.14634-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/21 03:39:19
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Checking the enable/disable state of tracepoints via
trace_event_get_state_backends() does not work for modules.

qxl checks the state for a small optimization (avoid g_strndup
call in case log_buf will not be used anyway), so we can just
drop that check for modular builds.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20200720100352.2477-2-kraxel@redhat.com>
---
 hw/display/qxl.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index d5627119ec62..11871340e75d 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -1762,7 +1762,16 @@ async_common:
         qxl_set_mode(d, val, 0);
         break;
     case QXL_IO_LOG:
+#ifdef CONFIG_MODULES
+        /*
+         * FIXME
+         * trace_event_get_state_backends() does not work for modules,
+         * it leads to "undefined symbol: qemu_qxl_io_log_semaphore"
+         */
+        if (true) {
+#else
         if (trace_event_get_state_backends(TRACE_QXL_IO_LOG) || d->guestdebug) {
+#endif
             /* We cannot trust the guest to NUL terminate d->ram->log_buf */
             char *log_buf = g_strndup((const char *)d->ram->log_buf,
                                       sizeof(d->ram->log_buf));
-- 
2.18.4


