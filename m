Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAC92033F8
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Jun 2020 11:51:08 +0200 (CEST)
Received: from localhost ([::1]:42158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnJ6Z-0007p2-AC
	for lists+qemu-devel@lfdr.de; Mon, 22 Jun 2020 05:51:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jnIyX-00022p-SO
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 05:42:49 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:56934
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jnIyL-0003xN-KJ
 for qemu-devel@nongnu.org; Mon, 22 Jun 2020 05:42:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592818957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PNSUg65sBMztUOY92rbEKRLBu711gTzd5r/0Dot1g54=;
 b=NaquBRfeA2yysdciK2MtL2m6x4kt5YQsAdQ/rUulzrzHi5hr1u8T3Nnx616ZjzLHoZsG3v
 t9q4pgnNl9xUbGiXbNlPhglbOm2LEgbkn/iwUeaJLTevRr8x/dVvy0VTV1MmwhbisMwbFK
 Snt3vqLe1IGvM1JB8OdDUeecCOTYRo8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-vRzIwnufPoGp5Pl1IH7JHw-1; Mon, 22 Jun 2020 05:42:35 -0400
X-MC-Unique: vRzIwnufPoGp5Pl1IH7JHw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5921C835B42;
 Mon, 22 Jun 2020 09:42:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A33F10002BC;
 Mon, 22 Jun 2020 09:42:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0A884113847A; Mon, 22 Jun 2020 11:42:28 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/16] qdev: Reject chardev property override
Date: Mon, 22 Jun 2020 11:42:23 +0200
Message-Id: <20200622094227.1271650-13-armbru@redhat.com>
In-Reply-To: <20200622094227.1271650-1-armbru@redhat.com>
References: <20200622094227.1271650-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/22 02:57:26
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
Cc: kwolf@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
 qemu-block@nongnu.org, mreitz@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 pbonzini@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qdev_prop_set_chr() screws up when the property already has a non-null
value: it neglects to release the old value.  Both the old and the new
backend become attached to the same device.  Unlike for block devices
(see previous commit), this can't be observed from the monitor (I
think).

Example: -serial null -chardev null,id=chr0 -global isa-serial.chardev=chr0

Special case: attempting to use the same backend both times crashes:

    $ qemu-system-x86_64 --nodefaults -serial null -global isa-serial.chardev=serial0
    Unexpected error in qemu_chr_fe_init() at /work/armbru/qemu/chardev/char-fe.c:220:
    qemu-system-x86_64: Device 'serial0' is in use
    Aborted (core dumped)

Yet another example: -device with multiple chardev=... (but not
device_add, which silently drops all but the last duplicate property).

Perhaps chardev property override could be made to work.  Perhaps it
should.  I can't afford the time to figure this out now.  What I can
do reject usage that leaves backends in unhealthy states.  For what
it's worth, we've long done the same for netdev properties.

Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/core/qdev-properties-system.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index 6b5fc59901..2561fa09a8 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -244,6 +244,14 @@ static void set_chr(Object *obj, Visitor *v, const char *name, void *opaque,
         return;
     }
 
+    /*
+     * TODO Should this really be an error?  If no, the old value
+     * needs to be released before we store the new one.
+     */
+    if (!check_prop_still_unset(dev, name, be->chr, str, errp)) {
+        return;
+    }
+
     if (!*str) {
         g_free(str);
         be->chr = NULL;
-- 
2.26.2


