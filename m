Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD6236C87F
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 17:16:50 +0200 (CEST)
Received: from localhost ([::1]:35532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbPSD-0001Gr-NK
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 11:16:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lbPKG-0003L6-1a
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 11:08:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lbPKD-0002At-R2
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 11:08:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619536113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/HJFAud+TtfwJvJFxfYcM/EjMumg7bYZoLYxL2UHqFA=;
 b=OGWqOSQQ0Aw6d2jIeax4jdILAf+T6klf2ZSQ3OEsoRWJTIHfJTev9VRFpe17s+9uoPpCWF
 kNKiDr8xwFA1Hfksdwykp+AfnPI2FiWsLd0m3WnwegoIVOzJ9bMzLx3hAaJtbFowsavo6e
 35WUeT8mhqrUgcjifa8S32eKKPEzipk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-sYUSFxUjM9GSsHW1J3hwBg-1; Tue, 27 Apr 2021 11:08:31 -0400
X-MC-Unique: sYUSFxUjM9GSsHW1J3hwBg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81D6E1922960
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 15:08:30 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-203.ams2.redhat.com
 [10.36.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CFC76064B;
 Tue, 27 Apr 2021 15:08:27 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id F27201800399; Tue, 27 Apr 2021 17:08:24 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/8] qemu-edid: use qemu_edid_size()
Date: Tue, 27 Apr 2021 17:08:17 +0200
Message-Id: <20210427150824.638359-2-kraxel@redhat.com>
In-Reply-To: <20210427150824.638359-1-kraxel@redhat.com>
References: <20210427150824.638359-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

So we only write out that part of the edid blob
which has been filled with data.
Also use a larger buffer for the blob.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 qemu-edid.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/qemu-edid.c b/qemu-edid.c
index 1cd6a9517238..c3a9fba10dc4 100644
--- a/qemu-edid.c
+++ b/qemu-edid.c
@@ -41,7 +41,8 @@ static void usage(FILE *out)
 int main(int argc, char *argv[])
 {
     FILE *outfile = NULL;
-    uint8_t blob[256];
+    uint8_t blob[512];
+    size_t size;
     uint32_t dpi = 100;
     int rc;
 
@@ -119,7 +120,8 @@ int main(int argc, char *argv[])
 
     memset(blob, 0, sizeof(blob));
     qemu_edid_generate(blob, sizeof(blob), &info);
-    fwrite(blob, sizeof(blob), 1, outfile);
+    size = qemu_edid_size(blob);
+    fwrite(blob, size, 1, outfile);
     fflush(outfile);
 
     exit(0);
-- 
2.30.2


