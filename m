Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BF920723C
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 13:37:09 +0200 (CEST)
Received: from localhost ([::1]:37296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jo3iG-0006s4-ME
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 07:37:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jo3c8-0004AW-NH
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 07:30:48 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:42771
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jo3c1-0007xO-OX
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 07:30:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592998240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=1Vv9AT621ICkypcsTO25i0HBy7rRbjf8YKBPKUfrZtM=;
 b=g8P4V4aHMuJRwdJNnPFJ+zV0jnnwMPMZfNP9VzL+KH2PWUUanfMEewwFTH2BJXQCdHLMOA
 LZVqFSC3sr0pyYZ8qa3UlNecTokPAZTyqo9MEAw4AyaeclVNcChiE6EgUR1QfItWxaQu/P
 rbM8Cv/Thhe/hI5cMrhMN57LZP/GBss=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-kE0r48ZSN52hfqhEkZigdQ-1; Wed, 24 Jun 2020 07:30:39 -0400
X-MC-Unique: kE0r48ZSN52hfqhEkZigdQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EBC23A0BDF;
 Wed, 24 Jun 2020 11:30:37 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-67.ams2.redhat.com
 [10.36.112.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 843CD7E59F;
 Wed, 24 Jun 2020 11:30:27 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C03CB6DE2; Wed, 24 Jun 2020 13:30:26 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 04/20] audio: deprecate -soundhw ac97
Date: Wed, 24 Jun 2020 13:30:10 +0200
Message-Id: <20200624113026.13343-5-kraxel@redhat.com>
In-Reply-To: <20200624113026.13343-1-kraxel@redhat.com>
References: <20200624113026.13343-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 03:27:53
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
Cc: qemu-ppc@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Switch to deprecated_register_soundhw().  Remove the now obsolete init
function.  Add an alias so both ac97 and AC97 are working with -device.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/audio/ac97.c | 9 ++-------
 qdev-monitor.c  | 1 +
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/hw/audio/ac97.c b/hw/audio/ac97.c
index 8a9b9924c495..38522cf0ba44 100644
--- a/hw/audio/ac97.c
+++ b/hw/audio/ac97.c
@@ -1393,12 +1393,6 @@ static void ac97_exit(PCIDevice *dev)
     AUD_remove_card(&s->card);
 }
 
-static int ac97_init (PCIBus *bus)
-{
-    pci_create_simple(bus, -1, TYPE_AC97);
-    return 0;
-}
-
 static Property ac97_properties[] = {
     DEFINE_AUDIO_PROPERTIES(AC97LinkState, card),
     DEFINE_PROP_END_OF_LIST (),
@@ -1436,7 +1430,8 @@ static const TypeInfo ac97_info = {
 static void ac97_register_types (void)
 {
     type_register_static (&ac97_info);
-    pci_register_soundhw("ac97", "Intel 82801AA AC97 Audio", ac97_init);
+    deprecated_register_soundhw("ac97", "Intel 82801AA AC97 Audio",
+                                0, TYPE_AC97);
 }
 
 type_init (ac97_register_types)
diff --git a/qdev-monitor.c b/qdev-monitor.c
index 22da107484c5..105d9792ecdf 100644
--- a/qdev-monitor.c
+++ b/qdev-monitor.c
@@ -53,6 +53,7 @@ typedef struct QDevAlias
 
 /* Please keep this table sorted by typename. */
 static const QDevAlias qdev_alias_table[] = {
+    { "AC97", "ac97" }, /* -soundhw name */
     { "e1000", "e1000-82540em" },
     { "ich9-ahci", "ahci" },
     { "lsi53c895a", "lsi" },
-- 
2.18.4


