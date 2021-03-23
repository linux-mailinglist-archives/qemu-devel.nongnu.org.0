Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9645346B92
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 23:01:58 +0100 (CET)
Received: from localhost ([::1]:60806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOp66-0005LJ-05
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 18:01:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOp1Q-0006vc-6z
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 17:57:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOp1N-0002ke-NH
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 17:57:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616536624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PH6SCMZh0TyLRIERQDlH7rc6cNAP4oOTF+bG7eADklE=;
 b=M9ObqJgW/mPyL7idXHtThB0Kaw00I9or7kZYaN3INzPf74BWz7KoPnIQHzMTPLR/oqAMge
 CAxH81OzwGXATK9LmVNEqpc4K8b6s0tBp1k9Ac3AGjs7baYfDBNK7873gdfi+bf+WJYavn
 2q3Nmbt1FLLmRRgllcLZRV5fiZmdN0o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-8YwTfyE9OjC3dsfyNwHSHQ-1; Tue, 23 Mar 2021 17:57:02 -0400
X-MC-Unique: 8YwTfyE9OjC3dsfyNwHSHQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC3F6100746C;
 Tue, 23 Mar 2021 21:57:01 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7FCC560877;
 Tue, 23 Mar 2021 21:57:01 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8FEA11132718; Tue, 23 Mar 2021 22:56:58 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/29] tests/qapi-schema: Tweak to demonstrate buggy member
 name check
Date: Tue, 23 Mar 2021 22:56:35 +0100
Message-Id: <20210323215658.3840228-7-armbru@redhat.com>
In-Reply-To: <20210323215658.3840228-1-armbru@redhat.com>
References: <20210323215658.3840228-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: peter.maydell@linaro.org, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Member name 'u' and names starting with 'has-' or 'has_' are reserved
for the generator.  check_type() enforces this, covered by tests
reserved-member-u and reserved-member-has.

These tests neglect to cover optional members, where the name starts
with '*'.  Tweak reserved-member-u to fix that.  Test
reserved-member-has still covers non-optional members.

This demonstrates the reserved member name check is broken for
optional members.  The next commit will fix it.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210323094025.3569441-7-armbru@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
[Commit message improved slightly]
---
 tests/qapi-schema/reserved-member-u.err  |  2 --
 tests/qapi-schema/reserved-member-u.json |  3 ++-
 tests/qapi-schema/reserved-member-u.out  | 14 ++++++++++++++
 3 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/tests/qapi-schema/reserved-member-u.err b/tests/qapi-schema/reserved-member-u.err
index 231d552494..e69de29bb2 100644
--- a/tests/qapi-schema/reserved-member-u.err
+++ b/tests/qapi-schema/reserved-member-u.err
@@ -1,2 +0,0 @@
-reserved-member-u.json: In struct 'Oops':
-reserved-member-u.json:7: 'data' member 'u' uses reserved name
diff --git a/tests/qapi-schema/reserved-member-u.json b/tests/qapi-schema/reserved-member-u.json
index 1eaf0f301c..15005abb09 100644
--- a/tests/qapi-schema/reserved-member-u.json
+++ b/tests/qapi-schema/reserved-member-u.json
@@ -4,4 +4,5 @@
 # This is true even for non-unions, because it is possible to convert a
 # struct to flat union while remaining backwards compatible in QMP.
 # TODO - we could munge the member name to 'q_u' to avoid the collision
-{ 'struct': 'Oops', 'data': { 'u': 'str' } }
+# BUG: not rejected
+{ 'struct': 'Oops', 'data': { '*u': 'str' } }
diff --git a/tests/qapi-schema/reserved-member-u.out b/tests/qapi-schema/reserved-member-u.out
index e69de29bb2..6a3705518b 100644
--- a/tests/qapi-schema/reserved-member-u.out
+++ b/tests/qapi-schema/reserved-member-u.out
@@ -0,0 +1,14 @@
+module ./builtin
+object q_empty
+enum QType
+    prefix QTYPE
+    member none
+    member qnull
+    member qnum
+    member qstring
+    member qdict
+    member qlist
+    member qbool
+module reserved-member-u.json
+object Oops
+    member u: str optional=True
-- 
2.26.3


