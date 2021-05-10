Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD98378CB3
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 15:22:40 +0200 (CEST)
Received: from localhost ([::1]:39168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg5rp-00045j-Od
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 09:22:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lg5qV-0002TK-UK
 for qemu-devel@nongnu.org; Mon, 10 May 2021 09:21:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lg5qU-0002TE-66
 for qemu-devel@nongnu.org; Mon, 10 May 2021 09:21:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620652872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jUXahY6wA0f0yJt2l73AAskOOlNqZnjM2gx169j7NUw=;
 b=eZXf4Q//9T+1ybrFuzjzpbvH0XLrtrZywnoXZ6amSRgVVp9ZWbN5XEQRIfhCF/k0qv7sfd
 09ROskrAQ1qz/L+gvLHfwPNjVS5NQGjcmbxUZwT7sfdKOg2Qxsv/5Hs8kLMscPEoywHcrk
 s9BgP4tzHwI7UkNE2pcTZlQFnAhDA+c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-TJwy9UEzN7Kpcm5UHQUpfA-1; Mon, 10 May 2021 09:21:11 -0400
X-MC-Unique: TJwy9UEzN7Kpcm5UHQUpfA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1AD098015F5
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 13:21:10 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-11.ams2.redhat.com
 [10.36.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D13D85DEF8;
 Mon, 10 May 2021 13:20:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1CEE71800385; Mon, 10 May 2021 15:20:51 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/25] qemu-edid: use qemu_edid_size()
Date: Mon, 10 May 2021 15:20:27 +0200
Message-Id: <20210510132051.2208563-2-kraxel@redhat.com>
In-Reply-To: <20210510132051.2208563-1-kraxel@redhat.com>
References: <20210510132051.2208563-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

So we only write out that part of the edid blob
which has been filled with data.
Also use a larger buffer for the blob.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-id: 20210427150824.638359-1-kraxel@redhat.com
Message-Id: <20210427150824.638359-2-kraxel@redhat.com>
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
2.31.1


