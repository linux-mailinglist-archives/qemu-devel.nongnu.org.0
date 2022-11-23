Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F216350E6
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 08:08:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxjqY-0001qK-U4; Wed, 23 Nov 2022 02:07:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oxjqX-0001oj-41
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 02:07:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oxjqV-0000sM-4q
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 02:07:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669187217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FZEPZRHt7Ei0EQkQmDYwtiUqcb8uhL7vR6QDcopb+fE=;
 b=EUo2CswTxYmpzuPmSLj08M3xuKScSLZ94MFpVITFN3lYwlNre9XbrTIPA1rZm8N+6tEvWV
 sSIHIr19X6V3QFm8PAzxiuiXMEsBqT40eI3+OSTkGbOIR9iXZqnAtafsd3G3ejwMrc2wAK
 +qV8PMcivPA89fpjXM1CrrwKB7CzRUs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-298-BygCDhhiOrSy5yiJP7qSxg-1; Wed, 23 Nov 2022 02:06:53 -0500
X-MC-Unique: BygCDhhiOrSy5yiJP7qSxg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8375D811E81;
 Wed, 23 Nov 2022 07:06:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C638492B07;
 Wed, 23 Nov 2022 07:06:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0F79121E6921; Wed, 23 Nov 2022 08:06:50 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 3/2] ppc4xx_sdram: Simplify sdram_ddr_size() to return
References: <20221122134917.1217307-1-armbru@redhat.com>
Date: Wed, 23 Nov 2022 08:06:50 +0100
In-Reply-To: <20221122134917.1217307-1-armbru@redhat.com> (Markus Armbruster's
 message of "Tue, 22 Nov 2022 14:49:15 +0100")
Message-ID: <87a64i87zp.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/ppc/ppc4xx_sdram.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/hw/ppc/ppc4xx_sdram.c b/hw/ppc/ppc4xx_sdram.c
index 54bf9a2b44..a24c80b1d2 100644
--- a/hw/ppc/ppc4xx_sdram.c
+++ b/hw/ppc/ppc4xx_sdram.c
@@ -192,17 +192,13 @@ static inline hwaddr sdram_ddr_base(uint32_t bcr)
 
 static hwaddr sdram_ddr_size(uint32_t bcr)
 {
-    hwaddr size;
-    int sh;
+    int sh = (bcr >> 17) & 0x7;
 
-    sh = (bcr >> 17) & 0x7;
     if (sh == 7) {
-        size = -1;
-    } else {
-        size = (4 * MiB) << sh;
+        return -1;
     }
 
-    return size;
+    return (4 * MiB) << sh;
 }
 
 static uint32_t sdram_ddr_dcr_read(void *opaque, int dcrn)
-- 
2.37.3


