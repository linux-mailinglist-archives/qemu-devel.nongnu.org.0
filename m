Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DC260DDA3
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 11:01:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oncDx-0006F1-7F; Wed, 26 Oct 2022 04:57:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oncDv-0006B9-33
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 04:57:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oncDf-0000WN-5b
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 04:57:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666774622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3y6uBtQ/zA2SdT/qrNkOEOIaXH4LO+St7na1j07ASJU=;
 b=Rnc+6w5A28s2ejdccLKjEsShJpKZFFZyvj6relRe70cmKccUxTRoYEV99Jgdh63oeqKHmu
 LyQyafmxPj0HFhvhiKLkOUEllxrf8cKHFDybuHpaJ1285i9Qbplj1rh/aHRg7ara/46P4q
 fvhkbrVtlQkceBmULAr29yx8GLa/tUk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-578-YHxt_mwiPtmHWEpq2io-IA-1; Wed, 26 Oct 2022 04:56:57 -0400
X-MC-Unique: YHxt_mwiPtmHWEpq2io-IA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 530823C1E74B;
 Wed, 26 Oct 2022 08:56:57 +0000 (UTC)
Received: from localhost (unknown [10.39.208.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 169BE2022EA2;
 Wed, 26 Oct 2022 08:56:51 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Viktor Prutyanov <viktor.prutyanov@redhat.com>
Subject: [PULL v3 11/11] dump/win_dump: limit number of processed PRCBs
Date: Wed, 26 Oct 2022 12:55:39 +0400
Message-Id: <20221026085540.254253-12-marcandre.lureau@redhat.com>
In-Reply-To: <20221026085540.254253-1-marcandre.lureau@redhat.com>
References: <20221026085540.254253-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Viktor Prutyanov <viktor.prutyanov@redhat.com>

When number of CPUs utilized by guest Windows is less than defined in
QEMU (i.e., desktop versions of Windows severely limits number of CPU
sockets), patch_and_save_context routine accesses non-existent PRCB and
fails. So, limit number of processed PRCBs by NumberProcessors taken
from guest Windows driver.

Signed-off-by: Viktor Prutyanov <viktor.prutyanov@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20221019235948.656411-1-viktor.prutyanov@redhat.com>
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
2.37.3


