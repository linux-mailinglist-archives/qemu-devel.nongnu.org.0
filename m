Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF6F5463D2
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 12:33:35 +0200 (CEST)
Received: from localhost ([::1]:56000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzbxO-0000Eo-FH
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 06:33:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nzapT-00085C-SN
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 05:21:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nzapR-0001hJ-NK
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 05:21:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654852877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ufj4JscCAW57Vs14x1NDo2rKzUHuAo6KJO/7yvjLaQA=;
 b=hRVA5tBZNrI28pxvTX90+JpQH7jccCsXIFoJhe3Vj2k9PEqbm+JAl6+tQsBadF0QemOp1C
 AIeeoh1H8DOOY+2onA/KjU+FipsLUTguWCeJrvr2+IdRNzGH3SM8i/s5RnlC69DH0jD0eZ
 VzJQdRAMjY4LGUVH2Xc+dHngw/374gM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-498--HdTtoCQPHeme0T9yXjfvg-1; Fri, 10 Jun 2022 05:21:14 -0400
X-MC-Unique: -HdTtoCQPHeme0T9yXjfvg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 54D40811E75;
 Fri, 10 Jun 2022 09:21:13 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 13CD1404E4B5;
 Fri, 10 Jun 2022 09:21:12 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1FC3F180060A; Fri, 10 Jun 2022 11:20:44 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Canokeys.org" <contact@canokeys.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Hongren (Zenithal) Zheng" <i@zenithal.me>, xen-devel@lists.xenproject.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PULL 04/17] hw/audio/cs4231a: Const'ify global tables
Date: Fri, 10 Jun 2022 11:20:30 +0200
Message-Id: <20220610092043.1874654-5-kraxel@redhat.com>
In-Reply-To: <20220610092043.1874654-1-kraxel@redhat.com>
References: <20220610092043.1874654-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Bernhard Beschow <shentey@gmail.com>

The tables contain spcifically crafted constants for algorithms, so make
them immutable.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220520180109.8224-3-shentey@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/audio/cs4231a.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/audio/cs4231a.c b/hw/audio/cs4231a.c
index 0723e3943044..7f17a72a9cb7 100644
--- a/hw/audio/cs4231a.c
+++ b/hw/audio/cs4231a.c
@@ -84,7 +84,7 @@ struct CSState {
     int transferred;
     int aci_counter;
     SWVoiceOut *voice;
-    int16_t *tab;
+    const int16_t *tab;
 };
 
 #define MODE2 (1 << 6)
@@ -142,13 +142,13 @@ enum {
     Capture_Lower_Base_Count
 };
 
-static int freqs[2][8] = {
+static const int freqs[2][8] = {
     { 8000, 16000, 27420, 32000,    -1,    -1, 48000, 9000 },
     { 5510, 11025, 18900, 22050, 37800, 44100, 33075, 6620 }
 };
 
 /* Tables courtesy http://hazelware.luggle.com/tutorials/mulawcompression.html */
-static int16_t MuLawDecompressTable[256] =
+static const int16_t MuLawDecompressTable[256] =
 {
      -32124,-31100,-30076,-29052,-28028,-27004,-25980,-24956,
      -23932,-22908,-21884,-20860,-19836,-18812,-17788,-16764,
@@ -184,7 +184,7 @@ static int16_t MuLawDecompressTable[256] =
          56,    48,    40,    32,    24,    16,     8,     0
 };
 
-static int16_t ALawDecompressTable[256] =
+static const int16_t ALawDecompressTable[256] =
 {
      -5504, -5248, -6016, -5760, -4480, -4224, -4992, -4736,
      -7552, -7296, -8064, -7808, -6528, -6272, -7040, -6784,
-- 
2.36.1


