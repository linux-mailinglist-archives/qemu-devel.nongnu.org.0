Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 245123AD606
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 01:37:43 +0200 (CEST)
Received: from localhost ([::1]:54866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luO3Q-0000Vu-No
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 19:37:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNYy-0008IJ-IN
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:06:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNYw-0006gQ-TR
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:06:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624057570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cz8CB0TltmvHhlpYmtMhNu6OlORqDnM6X73J/iEHoMY=;
 b=cm20seuQuEMxkjNqANZtgHa9WFyZQq2VN1UbxviDhn4KMZioOT1Nchl80a2WlEx+HFHekt
 f4IKKnOKdg2YxpI/zqYsgNulN3FHOgI5ZcQrglGTb1wa7h9ubFCrNnV521y9C8LWbXNm6e
 hm/QuR3Y5PttKhESspRYS/VsqR4n9Jk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-QBaHncE-M1C28iWbncWo_A-1; Fri, 18 Jun 2021 19:06:08 -0400
X-MC-Unique: QBaHncE-M1C28iWbncWo_A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B39F71084F53;
 Fri, 18 Jun 2021 23:06:07 +0000 (UTC)
Received: from scv.redhat.com (ovpn-113-126.rdu2.redhat.com [10.10.113.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F5981000358;
 Fri, 18 Jun 2021 23:06:06 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 54/72] scripts/qmp-shell: refactor QMPCompleter
Date: Fri, 18 Jun 2021 19:04:37 -0400
Message-Id: <20210618230455.2891199-55-jsnow@redhat.com>
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

list is a generic type, but we expect to use strings directly. We could
subclass list[str], but pylint does not presently understand that
invocation.

Change this class to envelop a list instead of *being* a list, for
simpler mypy typing.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-id: 20210607200649.1840382-25-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qmp/qmp-shell | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/scripts/qmp/qmp-shell b/scripts/qmp/qmp-shell
index 847d34890f..73694035b2 100755
--- a/scripts/qmp/qmp-shell
+++ b/scripts/qmp/qmp-shell
@@ -78,9 +78,17 @@ sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
 from qemu import qmp
 
 
-class QMPCompleter(list):
-    def complete(self, text, state):
-        for cmd in self:
+class QMPCompleter:
+    # NB: Python 3.9+ will probably allow us to subclass list[str] directly,
+    # but pylint as of today does not know that List[str] is simply 'list'.
+    def __init__(self) -> None:
+        self._matches: List[str] = []
+
+    def append(self, value: str) -> None:
+        return self._matches.append(value)
+
+    def complete(self, text: str, state: int) -> Optional[str]:
+        for cmd in self._matches:
             if cmd.startswith(text):
                 if state == 0:
                     return cmd
-- 
2.31.1


