Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4B523D7E1
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Aug 2020 10:13:27 +0200 (CEST)
Received: from localhost ([::1]:37932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3b1i-00029O-GM
	for lists+qemu-devel@lfdr.de; Thu, 06 Aug 2020 04:13:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1k3b0I-0000TW-N4
 for qemu-devel@nongnu.org; Thu, 06 Aug 2020 04:11:59 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:20890
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1k3b0G-0006AV-6n
 for qemu-devel@nongnu.org; Thu, 06 Aug 2020 04:11:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596701515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y0barxTYUSvJ2TwDPT7a4rxHIHf5wsrh45pkC4a/134=;
 b=iWyvPIur/oCG//GbVA5F6UY1UvZcj+JsZOOLRC8vSaMxaSB2S9CNNsh8JEIWtY67z7s1CN
 JPeTP2rk5owahJGEKg9WlI79/B5KuV28CsHDblPCgnQt+d8mPyVsYuYP7Gr3f/IWgo6fES
 rjA7baiYsvU1TYUNBTV05iIoSimD15A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-wN0BBGeuPOWzJ7UAjG1vZw-1; Thu, 06 Aug 2020 04:11:53 -0400
X-MC-Unique: wN0BBGeuPOWzJ7UAjG1vZw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CA4580183C;
 Thu,  6 Aug 2020 08:11:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 19B625FC36;
 Thu,  6 Aug 2020 08:11:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A58F010FDD9D; Thu,  6 Aug 2020 10:11:47 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] qapi: Document event VSERPORT_CHANGE is rate-limited
Date: Thu,  6 Aug 2020 10:11:46 +0200
Message-Id: <20200806081147.3123652-3-armbru@redhat.com>
In-Reply-To: <20200806081147.3123652-1-armbru@redhat.com>
References: <20200806081147.3123652-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/06 00:07:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit e2ae6159de "virtio-serial: report frontend connection state via
monitor" neglected to document the new event is rate-limited.  Fix
that.

Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
Cc: Eric Blake <eblake@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/char.json | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/qapi/char.json b/qapi/char.json
index 8aeedf96b2..b4d66ec90b 100644
--- a/qapi/char.json
+++ b/qapi/char.json
@@ -562,6 +562,8 @@
 #
 # @open: true if the guest has opened the virtio-serial port
 #
+# Note: This event is rate-limited.
+#
 # Since: 2.1
 #
 # Example:
-- 
2.26.2


