Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E2839BD06
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 18:23:27 +0200 (CEST)
Received: from localhost ([::1]:50176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpCbW-0007wz-DZ
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 12:23:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lpCAv-0001KD-Rz
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:55:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lpCAm-0001Wm-02
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:55:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622822146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pVOVgW4XOJaSUHs2A9nKoYwOQNkUz6BRnI9FXfz8z4Y=;
 b=ITjLixzdQvHC3+AE+hac1HzwPrJP/0CQqxxj/UxnBFIZVOUMIkFCOejXOwZQWTIt6FbMrF
 qui8NxacR8Na6ETgl5Q3BzPC4aj4ZtZzHs+hHykHCEVMffEJ7LKIYpBv/UzGuX/Rl4jfJe
 +m2rwrAvMe0g/d2voH3fE0NSUlEehr4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-__L2NlMCNoqZ3Iocs63xNQ-1; Fri, 04 Jun 2021 11:55:45 -0400
X-MC-Unique: __L2NlMCNoqZ3Iocs63xNQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 332AA10CE781;
 Fri,  4 Jun 2021 15:55:44 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 751835B4A4;
 Fri,  4 Jun 2021 15:55:43 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/11] python/qemu-ga-client: add entry point
Date: Fri,  4 Jun 2021 11:55:31 -0400
Message-Id: <20210604155532.1499282-11-jsnow@redhat.com>
In-Reply-To: <20210604155532.1499282-1-jsnow@redhat.com>
References: <20210604155532.1499282-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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
Cc: Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 "Niteesh G . S ." <niteesh.gs@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove the shebang, and add a package-defined entry point instead. Now,
it can be accessed using 'qemu-ga-client' from the command line after
installing the package.

The next commit adds a forwarder shim that allows the running of this
script without needing to install the package again.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/qmp/qemu_ga_client.py | 2 --
 python/setup.cfg                  | 1 +
 2 files changed, 1 insertion(+), 2 deletions(-)
 mode change 100755 => 100644 python/qemu/qmp/qemu_ga_client.py

diff --git a/python/qemu/qmp/qemu_ga_client.py b/python/qemu/qmp/qemu_ga_client.py
old mode 100755
new mode 100644
index d2938ad47c..67ac0b4211
--- a/python/qemu/qmp/qemu_ga_client.py
+++ b/python/qemu/qmp/qemu_ga_client.py
@@ -1,5 +1,3 @@
-#!/usr/bin/env python3
-
 """
 QEMU Guest Agent Client
 
diff --git a/python/setup.cfg b/python/setup.cfg
index 6b6be8b03c..7f3c59d74e 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -50,6 +50,7 @@ console_scripts =
     qom-list = qemu.qmp.qom:QOMList.entry_point
     qom-tree = qemu.qmp.qom:QOMTree.entry_point
     qom-fuse = qemu.qmp.qom_fuse:QOMFuse.entry_point [fuse]
+    qemu-ga-client = qemu.qmp.qemu_ga_client:main
 
 [flake8]
 extend-ignore = E722  # Prefer pylint's bare-except checks to flake8's
-- 
2.31.1


