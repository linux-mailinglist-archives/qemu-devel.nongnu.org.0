Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFAC1219D5
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Dec 2019 20:19:46 +0100 (CET)
Received: from localhost ([::1]:58986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1igvuD-0002mt-ME
	for lists+qemu-devel@lfdr.de; Mon, 16 Dec 2019 14:19:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35783)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wainersm@redhat.com>) id 1igvpd-0006U7-SZ
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 14:15:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <wainersm@redhat.com>) id 1igvpc-000867-PQ
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 14:15:01 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:41659
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <wainersm@redhat.com>) id 1igvpc-00085j-M3
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 14:15:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576523700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wpxDs6n6O4frSEEXe94efQ5PjWCAgHDZH3DfoyfB/D4=;
 b=SDQ7e7a8lRciqfTboS/YwnaU1iOYAfNklwjtC08Y4Eidw1R7HpDqj+j1wsdJ+osXsrVmdw
 zgeGms+NEc46K9D5h2NMHulUpomd72lu687cX+ExlQgaCxNZjraS+j8fzVyiUIqnEgKIP3
 AT7zXSclBX/XMAsO3sq4XZf+c6GUESM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28--xXCWYZmOguIcgGL6v61SQ-1; Mon, 16 Dec 2019 14:14:56 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D06521800D7B;
 Mon, 16 Dec 2019 19:14:55 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-67.gru2.redhat.com
 [10.97.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E4F265C1B5;
 Mon, 16 Dec 2019 19:14:53 +0000 (UTC)
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 4/5] python/qemu: accel: Add tcg_available() method
Date: Mon, 16 Dec 2019 16:14:37 -0300
Message-Id: <20191216191438.93418-5-wainersm@redhat.com>
In-Reply-To: <20191216191438.93418-1-wainersm@redhat.com>
References: <20191216191438.93418-1-wainersm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: -xXCWYZmOguIcgGL6v61SQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: fam@euphon.net, ehabkost@redhat.com, philmd@redhat.com, jsnow@redhat.com,
 crosa@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This adds a method to check if the tcg accelerator is enabled
in the QEMU binary.

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>
---
 python/qemu/accel.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/python/qemu/accel.py b/python/qemu/accel.py
index 5fce3aa3dd..0b38ddf0ab 100644
--- a/python/qemu/accel.py
+++ b/python/qemu/accel.py
@@ -67,3 +67,11 @@ def kvm_available(target_arch=3DNone, qemu_bin=3DNone):
     if qemu_bin and "kvm" not in list_accel(qemu_bin):
         return False
     return True
+
+def tcg_available(qemu_bin):
+    """
+    Check if TCG is available.
+
+    @param qemu_bin (str): path to the QEMU binary
+    """
+    return 'tcg' in list_accel(qemu_bin)
--=20
2.23.0


