Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A59615AD49
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Feb 2020 17:23:38 +0100 (CET)
Received: from localhost ([::1]:40016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1unZ-0001ks-2V
	for lists+qemu-devel@lfdr.de; Wed, 12 Feb 2020 11:23:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33469)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1j1uiw-0001eu-8P
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 11:18:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1j1uiv-0004YM-9G
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 11:18:50 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:25368
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1j1uiv-0004Xk-5k
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 11:18:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581524328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WwAdZkFTA+k84+vbH3AhktyI2fkZKZ5DVj945SvB/nA=;
 b=gibOxR1ZNGt7DOU6g+BN4dFthnREBBwd/M+yziuRdXZFC1QBc49ij9lsnWH4KTULxhO4Ed
 a2JXitw59u+Z1ZA+6F/zl+5rQPO5rj5IR3rCEGL5sMGC8V/xPdHlSz3Jgz3Mk31fLaYDo+
 IQsxXV6qLWiy/OdGTjwGkVt59eLcK/U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-1ICVHIP1Ny2PsbgOnmzOVg-1; Wed, 12 Feb 2020 11:18:44 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 888B218C8C04;
 Wed, 12 Feb 2020 16:18:43 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-39.ams2.redhat.com
 [10.36.117.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 91F565C1B2;
 Wed, 12 Feb 2020 16:18:36 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E1D5C1FCF2; Wed, 12 Feb 2020 17:18:35 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/10] ui: add show-cursor option
Date: Wed, 12 Feb 2020 17:18:28 +0100
Message-Id: <20200212161835.28576-4-kraxel@redhat.com>
In-Reply-To: <20200212161835.28576-1-kraxel@redhat.com>
References: <20200212161835.28576-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: 1ICVHIP1Ny2PsbgOnmzOVg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Peter Maydell <peter.maydell@linaro.org>, libvir-list@redhat.com,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When enabled, this forces showing the mouse cursor,
i.e. do not hide the pointer on mouse grabs.
Defaults to off.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: J=C3=A1n Tomko <jtomko@redhat.com>
---
 qapi/ui.json | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/qapi/ui.json b/qapi/ui.json
index e04525d8b44b..f8c803fe4328 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1144,6 +1144,8 @@
 # @type:          Which DisplayType qemu should use.
 # @full-screen:   Start user interface in fullscreen mode (default: off).
 # @window-close:  Allow to quit qemu with window close button (default: on=
).
+# @show-cursor:   Force showing the mouse cursor (default: off).
+#                 (since: 5.0)
 # @gl:            Enable OpenGL support (default: off).
 #
 # Since: 2.12
@@ -1153,6 +1155,7 @@
   'base'    : { 'type'           : 'DisplayType',
                 '*full-screen'   : 'bool',
                 '*window-close'  : 'bool',
+                '*show-cursor'   : 'bool',
                 '*gl'            : 'DisplayGLMode' },
   'discriminator' : 'type',
   'data'    : { 'gtk'            : 'DisplayGTK',
--=20
2.18.2


