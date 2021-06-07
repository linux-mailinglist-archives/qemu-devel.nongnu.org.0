Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9057239E87D
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 22:33:06 +0200 (CEST)
Received: from localhost ([::1]:37714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqLvl-00038U-MM
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 16:33:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lqLXS-00057A-K3
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 16:07:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lqLXF-0006cu-D4
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 16:07:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623096463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uj/+X9tEhB6PMDtkWS+mJ08uubEJsn5SGPuAtUv84EM=;
 b=DB+TuUXWMJxzY0OlF4F9oSLs8uvF88i4c6GREh7Xym8OI6o5tcHocGvUPPw0bFFus+Yqjz
 7ShssmZeVkFkJmfWkFiIMpfdw6HSw5Ne67ZZs0i0SBKw+l43tyMVI6A392gAeQ2KXtIGOE
 9Z5XG674GtlxEC3Cwal9pETmguPXTYg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-bsDLdlsvOumMrLF6XJ2T8g-1; Mon, 07 Jun 2021 16:07:36 -0400
X-MC-Unique: bsDLdlsvOumMrLF6XJ2T8g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 521D2107ACCA;
 Mon,  7 Jun 2021 20:07:35 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 96BE55C1C2;
 Mon,  7 Jun 2021 20:07:34 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 40/42] scripts/qmp-shell: move to python/qemu/qmp/qmp_shell.py
Date: Mon,  7 Jun 2021 16:06:47 -0400
Message-Id: <20210607200649.1840382-41-jsnow@redhat.com>
In-Reply-To: <20210607200649.1840382-1-jsnow@redhat.com>
References: <20210607200649.1840382-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: "Niteesh G . S ." <niteesh.gs@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The script will be unavailable for a commit or two, which will help
preserve development history attached to the new file. A forwarder will
be added shortly afterwards.

With qmp_shell in the python qemu.qmp package, now it is fully type
checked, linted, etc. via the Python CI. It will be quite a bit harder
to accidentally break it again in the future.

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


