Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF5A1FA1E2
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jun 2020 22:45:13 +0200 (CEST)
Received: from localhost ([::1]:49806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkvyi-0000Wv-Pl
	for lists+qemu-devel@lfdr.de; Mon, 15 Jun 2020 16:45:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jkvu5-0002Wn-FZ
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 16:40:25 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:40537
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jkvu3-0000Ux-MK
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 16:40:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592253622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BpK7tju1jN6W13szrwlI/NOIge/Yvb+o2mvw3PHw0jQ=;
 b=C49RnAHmoCOk7Jj3HN5YzUvwRSGTwFHrBbUtMT6GJVGGYf3qYSUNMYR5NkwpHns+kmIZ8W
 Rs1zJKWe92XsLyXiCKHLtKrURutZAxwHaKfFnvHUFolmac4yUZL3wPrTUdXcYCRsI56REb
 4hKTuO+BDsiI1alyJEpJV8PL1+B4SCY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-eMUMhwkgNTORyoNMISL0cA-1; Mon, 15 Jun 2020 16:40:21 -0400
X-MC-Unique: eMUMhwkgNTORyoNMISL0cA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC926873402;
 Mon, 15 Jun 2020 20:40:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FDA0707C6;
 Mon, 15 Jun 2020 20:40:19 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5365311358CD; Mon, 15 Jun 2020 22:40:08 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/84] macio: Put "macio-nvram" device on the macio bus
Date: Mon, 15 Jun 2020 22:39:00 +0200
Message-Id: <20200615204008.3069956-17-armbru@redhat.com>
In-Reply-To: <20200615204008.3069956-1-armbru@redhat.com>
References: <20200615204008.3069956-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/15 15:33:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-ppc@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

macio_oldworld_init() creates a "macio-nvram", sysbus device, but
neglects to but it on a bus.

Put it on the macio bus.  Affects machine g3beige.  Visible in "info
qtree":

             bus: macio.0
               type macio-bus
               [...]
    +          dev: macio-nvram, id ""
    +            size = 8192 (0x2000)
    +            it_shift = 4 (0x4)

This also makes it a QOM child of macio-oldworld.  Visible in "info
qom-tree":

     /machine (g3beige-machine)
       [...]
       /unattached (container)
         [...]
         /device[6] (macio-oldworld)
           [...]
    -    /device[7] (macio-nvram)
    -      /macio-nvram[0] (qemu:memory-region)
    +      /nvram (macio-nvram)
    +        /macio-nvram[0] (qemu:memory-region)
         [rest of device[*] renumbered...]

Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: qemu-ppc@nongnu.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20200609122339.937862-15-armbru@redhat.com>
---
 hw/misc/macio/macio.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/misc/macio/macio.c b/hw/misc/macio/macio.c
index b3dddf8be7..ebc96cc8f6 100644
--- a/hw/misc/macio/macio.c
+++ b/hw/misc/macio/macio.c
@@ -245,7 +245,8 @@ static void macio_oldworld_init(Object *obj)
 
     macio_init_child_obj(s, "cuda", &s->cuda, sizeof(s->cuda), TYPE_CUDA);
 
-    object_initialize(&os->nvram, sizeof(os->nvram), TYPE_MACIO_NVRAM);
+    macio_init_child_obj(s, "nvram", &os->nvram, sizeof(os->nvram),
+                         TYPE_MACIO_NVRAM);
     dev = DEVICE(&os->nvram);
     qdev_prop_set_uint32(dev, "size", 0x2000);
     qdev_prop_set_uint32(dev, "it_shift", 4);
-- 
2.26.2


