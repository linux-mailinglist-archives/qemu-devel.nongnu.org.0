Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4731C2DCAB6
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 02:57:21 +0100 (CET)
Received: from localhost ([::1]:60266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpiXg-0006b7-7G
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 20:57:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kpiUL-0003su-Nr
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 20:53:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kpiUI-0006ID-IP
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 20:53:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608170030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xGFmdJ3x6IPQiTvgIjvXL530rozPOQdchBURc2F7S3A=;
 b=SMlKtprFZCPYPchHhyctsE8Z1XwLctq4KSCE5sqbWAF4YJcfFe1bjBTwoRqVnF9AzpLutj
 qdM1vvhfay0jm7vLHtK5DflVssn5AKNAfAA0QBP6gZMUs739ifC3svDehR6c5Z4SeJtxah
 BvjvWeGe5JomnmoU6jhiid5n7ZUfuTk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-JT_rHQ0ANpiXLky__8K1Pg-1; Wed, 16 Dec 2020 20:53:47 -0500
X-MC-Unique: JT_rHQ0ANpiXLky__8K1Pg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B416801FC4
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 01:53:46 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-131.rdu2.redhat.com [10.10.112.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DDECB60CC4;
 Thu, 17 Dec 2020 01:53:45 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v3 02/13] qapi/introspect.py: use _make_tree for features nodes
Date: Wed, 16 Dec 2020 20:53:32 -0500
Message-Id: <20201217015343.196279-3-jsnow@redhat.com>
In-Reply-To: <20201217015343.196279-1-jsnow@redhat.com>
References: <20201217015343.196279-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: John Snow <jsnow@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

At present, we open-code this in _make_tree itself; but if the structure
of the tree changes, this is brittle. Use an explicit recursive call to
_make_tree when appropriate to help keep the interior node typing
consistent.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/introspect.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
index 43ab4be1f77..3295a15c98e 100644
--- a/scripts/qapi/introspect.py
+++ b/scripts/qapi/introspect.py
@@ -30,7 +30,9 @@ def _make_tree(obj, ifcond, features, extra=None):
     if ifcond:
         extra['if'] = ifcond
     if features:
-        obj['features'] = [(f.name, {'if': f.ifcond}) for f in features]
+        obj['features'] = [
+            _make_tree(f.name, f.ifcond, None) for f in features
+        ]
     if extra:
         return (obj, extra)
     return obj
-- 
2.26.2


