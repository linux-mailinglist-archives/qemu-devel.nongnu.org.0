Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 102095FB702
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 17:26:46 +0200 (CEST)
Received: from localhost ([::1]:59560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiH9Y-00044t-28
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 11:26:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smitterl@redhat.com>)
 id 1oiGwr-0003US-RA
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 11:13:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smitterl@redhat.com>)
 id 1oiGwo-0000dH-Gl
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 11:13:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665501210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=6M0TxInMFLEYVUqXH7zLeBF60EeWWGKXkxks3lC0MOs=;
 b=Rgbp51bCwi0EtKRYwFeKvY+O4dXunmR/HwMAPCtPhXBa6PhIwqU3WsmaML2HuDHhKL1WXs
 rp4kI5wQdWDIXw0vDPW76kg+MlM42ffE8fjEnKm5XjLYnA+Z7fwEN7chLS89Z4+UcmEc3S
 qgUrQZ3bfyuYwwa9OvsxJ/1S6aqsTN0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-47-Xfro8_jLOKidYuAGEuPTgA-1; Tue, 11 Oct 2022 11:12:18 -0400
X-MC-Unique: Xfro8_jLOKidYuAGEuPTgA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F76D29AB42F;
 Tue, 11 Oct 2022 15:12:18 +0000 (UTC)
Received: from fedora.. (unknown [10.39.192.241])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 600682166B26;
 Tue, 11 Oct 2022 15:12:17 +0000 (UTC)
From: Sebastian Mitterle <smitterl@redhat.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com,
	thuth@redhat.com,
	qemu-trivial@nongnu.org
Subject: [PATCH] qemu-edid: Restrict input parameter -d to avoid division by
 zero
Date: Tue, 11 Oct 2022 17:12:16 +0200
Message-Id: <20221011151216.64897-1-smitterl@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=smitterl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

A zero value for dpi will lead to a division by zero in qemu_edid_dpi_to_mm().
Tested by runnig qemu-edid -dX, X = 0, 100.

Resolves: qemu-project/qemu#1249

Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Sebastian Mitterle <smitterl@redhat.com>
---
 qemu-edid.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/qemu-edid.c b/qemu-edid.c
index 20c958d9c7..92e1a660a7 100644
--- a/qemu-edid.c
+++ b/qemu-edid.c
@@ -92,6 +92,10 @@ int main(int argc, char *argv[])
                 fprintf(stderr, "not a number: %s\n", optarg);
                 exit(1);
             }
+            if (dpi == 0) {
+                fprintf(stderr, "cannot be zero: %s\n", optarg);
+                exit(1);
+            }
             break;
         case 'v':
             info.vendor = optarg;
-- 
2.37.3


