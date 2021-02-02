Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F5030C868
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 18:53:27 +0100 (CET)
Received: from localhost ([::1]:59586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6zri-0001uu-B9
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 12:53:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l6zlc-0004vx-O7
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:47:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l6zlY-0008Cy-Hx
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:47:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612288023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JIIHBaH5jer7KgMFZCSjC6Gf07YQuTK0ZAzFHouzS0s=;
 b=DcIVq7NiNKwcs+yYW1CiLBURD6lHik2YoWKWIkzGQW9Vg5TJRriJ40gAOh5hbNPAahyJvP
 FEbNAihk01vI81PTLWwuDXY6AeThWMn4ZLVfhR6P4F/t4zh030/n1mXsU9oxlxuOL2x+p+
 09b4cqcEaqbG1f4nSiK9Ae7YZ4deyPo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-KhTk3VFsNLiENT5k7n7aGw-1; Tue, 02 Feb 2021 12:47:02 -0500
X-MC-Unique: KhTk3VFsNLiENT5k7n7aGw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A8E31800D50;
 Tue,  2 Feb 2021 17:47:01 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F30F5C1CF;
 Tue,  2 Feb 2021 17:47:00 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v4 09/14] qapi/introspect.py: improve _tree_to_qlit error
 message
Date: Tue,  2 Feb 2021 12:46:46 -0500
Message-Id: <20210202174651.2274166-10-jsnow@redhat.com>
In-Reply-To: <20210202174651.2274166-1-jsnow@redhat.com>
References: <20210202174651.2274166-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
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
Cc: Michael Roth <michael.roth@amd.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Trivial; make the error message just a pinch more explicit in case we
trip this by accident in the future.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/introspect.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
index 2b90a52f016..c72beeeed27 100644
--- a/scripts/qapi/introspect.py
+++ b/scripts/qapi/introspect.py
@@ -124,7 +124,9 @@ def indent(level):
     elif isinstance(obj, bool):
         ret += 'QLIT_QBOOL(%s)' % ('true' if obj else 'false')
     else:
-        assert False                # not implemented
+        raise NotImplementedError(
+            f"type '{type(obj).__name__}' not implemented"
+        )
     if level > 0:
         ret += ','
     return ret
-- 
2.29.2


