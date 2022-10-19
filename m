Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3E1605452
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 02:03:47 +0200 (CEST)
Received: from localhost ([::1]:48300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olJ2I-0006GC-KM
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 20:03:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@redhat.com>)
 id 1olIzg-0004Rt-GY
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 20:01:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viktor.prutyanov@redhat.com>)
 id 1olIze-0006UJ-9v
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 20:01:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666224061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=lDUz9wz7wUf3jzR2d8B923non2T8NyHgrvrUPj+L48s=;
 b=h+TgQkXaMlbNIFCJTAVv5ssEepbdyon+JccovB9Ytvik7bDK7McPXoIF7wtZqvgknYLPKO
 EvDb+pmN/mT1cwVJp2Xkts/bmgic81SpKzFT4yA+6eH1FKEOjq2zVE1WIXM6S2SqCOK6+p
 Bky8GjIUBg6vmpHOIgJwKqEQzPFtJXs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-260-JegevN7KMbazAWu49SKtyA-1; Wed, 19 Oct 2022 19:59:51 -0400
X-MC-Unique: JegevN7KMbazAWu49SKtyA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D76F833AEC;
 Wed, 19 Oct 2022 23:59:51 +0000 (UTC)
Received: from vp-pc.redhat.com (ovpn-192-11.brq.redhat.com [10.40.192.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 05D3140C2064;
 Wed, 19 Oct 2022 23:59:49 +0000 (UTC)
From: Viktor Prutyanov <viktor.prutyanov@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org,
	yan@daynix.com,
	viktor.prutyanov@redhat.com
Subject: [PATCH] dump/win_dump: limit number of processed PRCBs
Date: Thu, 20 Oct 2022 02:59:48 +0300
Message-Id: <20221019235948.656411-1-viktor.prutyanov@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=viktor.prutyanov@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

When number of CPUs utilized by guest Windows is less than defined in
QEMU (i.e., desktop versions of Windows severely limits number of CPU
sockets), patch_and_save_context routine accesses non-existent PRCB and
fails. So, limit number of processed PRCBs by NumberProcessors taken
from guest Windows driver.

Signed-off-by: Viktor Prutyanov <viktor.prutyanov@redhat.com>
---
 dump/win_dump.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/dump/win_dump.c b/dump/win_dump.c
index fd91350fbb..f20b6051b6 100644
--- a/dump/win_dump.c
+++ b/dump/win_dump.c
@@ -273,6 +273,13 @@ static void patch_and_save_context(WinDumpHeader *h, bool x64,
         uint64_t Context;
         WinContext ctx;
 
+        if (i >= WIN_DUMP_FIELD(NumberProcessors)) {
+            warn_report("win-dump: number of QEMU CPUs is bigger than"
+                        " NumberProcessors (%u) in guest Windows",
+                        WIN_DUMP_FIELD(NumberProcessors));
+            return;
+        }
+
         if (cpu_read_ptr(x64, first_cpu,
                 KiProcessorBlock + i * win_dump_ptr_size(x64),
                 &Prcb)) {
-- 
2.35.1


