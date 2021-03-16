Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D80B933D5F3
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 15:40:41 +0100 (CET)
Received: from localhost ([::1]:59322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMAsC-0005Qa-Sh
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 10:40:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lMApz-0003e9-3u
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 10:38:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lMApx-0002Ah-1r
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 10:38:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615905500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/HJFAud+TtfwJvJFxfYcM/EjMumg7bYZoLYxL2UHqFA=;
 b=AwJwWZJWzKS080ZZcxwkICda0Ou+iSZ0GVXju0qqNrV6In+olyFeu3flXcxCcw/vX3poKk
 cxxNCac47Hc2TPlhFHs1kDYsh1fqueJjUD6pPgbuQu8FuL8CnoaKqUhSyr3KIKdWECoCfY
 U+t8KooUIB5LYhGjF+khSHYUNIj4k/s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-itfo5WXhPke35-mefm_RoQ-1; Tue, 16 Mar 2021 10:38:18 -0400
X-MC-Unique: itfo5WXhPke35-mefm_RoQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 891DF802B7E
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 14:38:17 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CBEA810023B5;
 Tue, 16 Mar 2021 14:38:13 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 420CD1800627; Tue, 16 Mar 2021 15:38:12 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/9] qemu-edid: use qemu_edid_size()
Date: Tue, 16 Mar 2021 15:38:04 +0100
Message-Id: <20210316143812.2363588-2-kraxel@redhat.com>
In-Reply-To: <20210316143812.2363588-1-kraxel@redhat.com>
References: <20210316143812.2363588-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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


