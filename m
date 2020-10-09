Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8907A288F2E
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Oct 2020 18:50:46 +0200 (CEST)
Received: from localhost ([::1]:53822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQvbR-0007Wm-KF
	for lists+qemu-devel@lfdr.de; Fri, 09 Oct 2020 12:50:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kQv4d-0004f1-Ux
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 12:16:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kQv4W-0003MF-9U
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 12:16:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602260199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gh01B+eg56jBQVpBi1Ly30SmFT5vOt+tVC7lOZ4m4M0=;
 b=NaNgH/FEacRdHge9/L3Z9JojrQw0bopATQs5Af8PhGbvFiZeE8TCwq/U8IckzECFjX3mC0
 gJVi1ix41SoAt2t4bAjDKVce88GgLbUPP1AnTfmCAC8WaDZbUbpab3XSbSMFyVCeXuj6l4
 42CBg68xb9q7DPy/GqR+sHcGIaN/Z2c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-sAL4McZPNOC4Lby6ozEA7g-1; Fri, 09 Oct 2020 12:16:38 -0400
X-MC-Unique: sAL4McZPNOC4Lby6ozEA7g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F405764082;
 Fri,  9 Oct 2020 16:16:36 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-203.rdu2.redhat.com [10.10.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4287019936;
 Fri,  9 Oct 2020 16:16:36 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 31/36] qapi/gen.py: delint with pylint
Date: Fri,  9 Oct 2020 12:15:53 -0400
Message-Id: <20201009161558.107041-32-jsnow@redhat.com>
In-Reply-To: <20201009161558.107041-1-jsnow@redhat.com>
References: <20201009161558.107041-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/09 02:34:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

'fp' and 'fd' are self-evident in context, add them to the list of OK
names.

_top and _bottom also need to stay standard methods because some users
override the method and need to use `self`. Tell pylint to shush.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
---
 scripts/qapi/gen.py   | 2 ++
 scripts/qapi/pylintrc | 5 +++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index 670c21e2109..b40f18eee3c 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -51,9 +51,11 @@ def get_content(self) -> str:
         return self._top() + self._preamble + self._body + self._bottom()
 
     def _top(self) -> str:
+        # pylint: disable=no-self-use
         return ''
 
     def _bottom(self) -> str:
+        # pylint: disable=no-self-use
         return ''
 
     def write(self, output_dir: str) -> None:
diff --git a/scripts/qapi/pylintrc b/scripts/qapi/pylintrc
index d840b150313..8badcb11cda 100644
--- a/scripts/qapi/pylintrc
+++ b/scripts/qapi/pylintrc
@@ -4,7 +4,6 @@
 # The regex matches against base names, not paths.
 ignore-patterns=error.py,
                 expr.py,
-                gen.py,
                 parser.py,
                 schema.py,
                 types.py,
@@ -45,7 +44,9 @@ good-names=i,
            k,
            ex,
            Run,
-           _
+           _,
+           fp,  # fp = open(...)
+           fd,  # fd = os.open(...)
 
 [VARIABLES]
 
-- 
2.26.2


