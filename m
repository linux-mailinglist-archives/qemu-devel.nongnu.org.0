Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B285A3B2A7A
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 10:36:03 +0200 (CEST)
Received: from localhost ([::1]:59652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwKqA-0001DA-Ps
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 04:36:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lwKnE-0003zw-N0
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 04:33:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lwKnB-0001AR-OP
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 04:33:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624523577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KTVt1bcujZaWl3tpwubZ3u9PkdE5cEzM4+eUsXSnzTk=;
 b=F/6Q4nXowGgyxhA4X7/At59yKR6hBxC0iJfu9uBa8a5iXWTF0p8xclyx70p3axN5/fLwyg
 6glyAuizuUFPpUD7YxEoazzrbUO4WZOhcgI5MmaNeJJPxsarkA31+qL/dwuuDyrfMGESYA
 SyqpkVZCv6nM0utpRodllpCUgT9P7vg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-adoQd5HUPQeBpoDGSlINbg-1; Thu, 24 Jun 2021 04:32:55 -0400
X-MC-Unique: adoQd5HUPQeBpoDGSlINbg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C1531922967;
 Thu, 24 Jun 2021 08:32:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CE1C160871;
 Thu, 24 Jun 2021 08:32:53 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1EC2918007A6; Thu, 24 Jun 2021 10:32:47 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/5] input: Add lang1 and lang2 to QKeyCode
Date: Thu, 24 Jun 2021 10:32:44 +0200
Message-Id: <20210624083246.2297440-4-kraxel@redhat.com>
In-Reply-To: <20210624083246.2297440-1-kraxel@redhat.com>
References: <20210624083246.2297440-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Akihiko Odaki <akihiko.odaki@gmail.com>

lang1 and lang2 represents the keys with the same names in the
keyboard/keypad usage page (0x07) included in the "HID Usage Tables for
Universal Serial Bus (USB)" version 1.22. Although the keys are
described as "Hangul/English toggle key" and "Hanja conversion key" in
the specification, the meaning depends on the variety of the keyboard,
and it will be used as the representations of Kana and Eisu keys on
Japanese Macs in qemu_input_map_osx_to_qcode, which is used by ui/gtk.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Message-Id: <20210617023113.2441-2-akihiko.odaki@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 qapi/ui.json | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/qapi/ui.json b/qapi/ui.json
index 1052ca9c3848..90b44c5c5ca9 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -786,6 +786,9 @@
 # @muhenkan: since 2.12
 # @katakanahiragana: since 2.12
 #
+# @lang1: since 6.1
+# @lang2: since 6.1
+#
 # 'sysrq' was mistakenly added to hack around the fact that
 # the ps2 driver was not generating correct scancodes sequences
 # when 'alt+print' was pressed. This flaw is now fixed and the
@@ -818,7 +821,8 @@
             'audionext', 'audioprev', 'audiostop', 'audioplay', 'audiomute',
             'volumeup', 'volumedown', 'mediaselect',
             'mail', 'calculator', 'computer',
-            'ac_home', 'ac_back', 'ac_forward', 'ac_refresh', 'ac_bookmarks' ] }
+            'ac_home', 'ac_back', 'ac_forward', 'ac_refresh', 'ac_bookmarks',
+            'lang1', 'lang2' ] }
 
 ##
 # @KeyValue:
-- 
2.31.1


