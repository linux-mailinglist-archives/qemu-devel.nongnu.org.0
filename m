Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2B53AD616
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 01:43:00 +0200 (CEST)
Received: from localhost ([::1]:43372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luO8Y-0003IG-Tv
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 19:42:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNZN-0000VA-5D
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:06:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNZK-0006tk-VW
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:06:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624057594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h4o1N9WZeRqx/pLPX9wgGLckrdayNGvcjSLAa5GQsw0=;
 b=LeGoVgeVf5gqphocM6JALOp2jsu+yvROHN3/z5ccaxZjHNvhEyPUuda7pOmXSUOLjwXyNb
 n8xPeK1udRlB5fzfbyQD483GYhPfdNXCXcrYtSL86aKhpyzeKsw1IvD0u+Gc748po1iCfO
 K94wWfP76Soq4Ce66+4+CwKACBVbGG0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-sfSUmelnPS6MamxS7jP4uA-1; Fri, 18 Jun 2021 19:06:32 -0400
X-MC-Unique: sfSUmelnPS6MamxS7jP4uA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FFA1343D2;
 Fri, 18 Jun 2021 23:06:31 +0000 (UTC)
Received: from scv.redhat.com (ovpn-113-126.rdu2.redhat.com [10.10.113.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F1B3E1000358;
 Fri, 18 Jun 2021 23:06:30 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 70/72] scripts/qmp-shell: move to python/qemu/qmp/qmp_shell.py
Date: Fri, 18 Jun 2021 19:04:53 -0400
Message-Id: <20210618230455.2891199-71-jsnow@redhat.com>
In-Reply-To: <20210618230455.2891199-1-jsnow@redhat.com>
References: <20210618230455.2891199-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.194,
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
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The script will be unavailable for a commit or two, which will help
preserve development history attached to the new file. A forwarder will
be added shortly afterwards.

With qmp_shell in the python qemu.qmp package, now it is fully type
checked, linted, etc. via the Python CI. It will be quite a bit harder
to accidentally break it again in the future.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-id: 20210607200649.1840382-41-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qmp/qmp-shell => python/qemu/qmp/qmp_shell.py | 3 ---
 1 file changed, 3 deletions(-)
 rename scripts/qmp/qmp-shell => python/qemu/qmp/qmp_shell.py (99%)
 mode change 100755 => 100644

diff --git a/scripts/qmp/qmp-shell b/python/qemu/qmp/qmp_shell.py
old mode 100755
new mode 100644
similarity index 99%
rename from scripts/qmp/qmp-shell
rename to python/qemu/qmp/qmp_shell.py
index 15aedb80c2..337acfce2d
--- a/scripts/qmp/qmp-shell
+++ b/python/qemu/qmp/qmp_shell.py
@@ -1,4 +1,3 @@
-#!/usr/bin/env python3
 #
 # Copyright (C) 2009, 2010 Red Hat Inc.
 #
@@ -96,8 +95,6 @@
     Sequence,
 )
 
-
-sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
 from qemu import qmp
 from qemu.qmp import QMPMessage
 
-- 
2.31.1


