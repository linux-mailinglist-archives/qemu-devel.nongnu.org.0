Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 879FF3AD5DD
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 01:27:57 +0200 (CEST)
Received: from localhost ([::1]:49424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luNu0-0002aN-GI
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 19:27:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNYi-0007ew-Jg
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:05:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNYf-0006SC-Cb
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:05:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624057552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5bOsND7FOC6+IqrDxXYZouvTnlfno8Ypzuo2ntlFyDk=;
 b=Bv7Hlm9Er6UVWW9UBDxhcVhE9aSZKizGc0qIFBo3WnmFkqke1jSTDnL1btqO3AbyOGluUQ
 LKHfAWMMZh5nh0x5ilW9OgS/+3HjPWvlX9sCpV8LbkCvVMIx+piOpEQK/lJrnJnuUoa/73
 dUoeKLO1+9zo+llaiDzXohsMRNKLnnc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-9PNoAsMQOmGknCEXaPgrFw-1; Fri, 18 Jun 2021 19:05:51 -0400
X-MC-Unique: 9PNoAsMQOmGknCEXaPgrFw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F00D801B0A;
 Fri, 18 Jun 2021 23:05:50 +0000 (UTC)
Received: from scv.redhat.com (ovpn-113-126.rdu2.redhat.com [10.10.113.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 729911000358;
 Fri, 18 Jun 2021 23:05:49 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 46/72] scripts/qmp-shell: use isinstance() instead of type()
Date: Fri, 18 Jun 2021 19:04:29 -0400
Message-Id: <20210618230455.2891199-47-jsnow@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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

A bit more idiomatic, and quiets some linter warnings.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-id: 20210607200649.1840382-17-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qmp/qmp-shell | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/qmp/qmp-shell b/scripts/qmp/qmp-shell
index bf7a49dfc1..970f43dd00 100755
--- a/scripts/qmp/qmp-shell
+++ b/scripts/qmp/qmp-shell
@@ -195,13 +195,13 @@ class QMPShell(qmp.QEMUMonitorProtocol):
             for path in optpath[:-1]:
                 curpath.append(path)
                 obj = parent.get(path, {})
-                if type(obj) is not dict:
+                if not isinstance(obj, dict):
                     msg = 'Cannot use "{:s}" as both leaf and non-leaf key'
                     raise QMPShellError(msg.format('.'.join(curpath)))
                 parent[path] = obj
                 parent = obj
             if optpath[-1] in parent:
-                if type(parent[optpath[-1]]) is dict:
+                if isinstance(parent[optpath[-1]], dict):
                     msg = 'Cannot use "{:s}" as both leaf and non-leaf key'
                     raise QMPShellError(msg.format('.'.join(curpath)))
                 raise QMPShellError(f'Cannot set "{key}" multiple times')
-- 
2.31.1


