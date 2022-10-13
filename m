Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2255FD615
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 10:19:46 +0200 (CEST)
Received: from localhost ([::1]:41286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oitRR-00086i-4X
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 04:19:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ois6L-0005ai-Cb
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 02:53:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ois6J-0006v0-QP
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 02:53:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665644028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PkixRhiE0Ds4x5lGUNAGmbnjj6jQbmiEDsVvhApVZ4w=;
 b=dc1wR7AtRMxewSyQZBtGD0b4jtFXvIwf8HhgddEkoA3ez4ptyHbJlkOKDaFHrkQJXdWtRu
 SdoAdq98VNKuBLMxCt1if22kwwBiSKPlYPzjYo5rrCUpnseE3KFy/iNAkGxTR0Z21KmcpM
 7ktNs/8ERl6p9L7uZ0dEbF1bEkO3v/s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-501-tK9XQJvDOHeyY01I18nzsA-1; Thu, 13 Oct 2022 02:53:45 -0400
X-MC-Unique: tK9XQJvDOHeyY01I18nzsA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A4FEA101A528;
 Thu, 13 Oct 2022 06:53:44 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.183])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3332E2166BA3;
 Thu, 13 Oct 2022 06:53:44 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A4C581800D62; Thu, 13 Oct 2022 08:52:25 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Blake <eblake@redhat.com>,
 Sebastian Mitterle <smitterl@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PULL 23/26] qemu-edid: Restrict input parameter -d to avoid division
 by zero
Date: Thu, 13 Oct 2022 08:52:21 +0200
Message-Id: <20221013065224.1864145-24-kraxel@redhat.com>
In-Reply-To: <20221013065224.1864145-1-kraxel@redhat.com>
References: <20221013065224.1864145-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
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

From: Sebastian Mitterle <smitterl@redhat.com>

A zero value for dpi will lead to a division by zero in qemu_edid_dpi_to_mm().
Tested by runnig qemu-edid -dX, X = 0, 100.

Resolves: qemu-project/qemu#1249

Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Sebastian Mitterle <smitterl@redhat.com>
Message-Id: <20221011151216.64897-1-smitterl@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 qemu-edid.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/qemu-edid.c b/qemu-edid.c
index 20c958d9c7eb..92e1a660a76b 100644
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


