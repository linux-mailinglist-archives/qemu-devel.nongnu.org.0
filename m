Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC873488D3
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 07:15:48 +0100 (CET)
Received: from localhost ([::1]:46688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPJHX-0000kP-LJ
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 02:15:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lPJ6R-0002Le-NR
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 02:04:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lPJ6P-0008TI-BJ
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 02:04:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616652256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=58vMjUiEmXKmPmO0gjjkRE8fcgGQ+DRkcI0Sp3kmdeE=;
 b=BtNhvLBZ+CaCpSqIfk12qqiL6Rex4SHI5rz2+8ENLqwedsAKF42b9SsDeWonXJnGLx0p+W
 sHbUnau38txE8LoH+noTq2WPz3o8JSXdJWPj1XjrZDTb/mEIGbQEkHqpLUBQPb0qRuLQ58
 FvhxeIKsqzIi3l/FRz1nlL7fPPXIuK4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-sQPEB-XCM1yqVA1FG06NUA-1; Thu, 25 Mar 2021 02:04:14 -0400
X-MC-Unique: sQPEB-XCM1yqVA1FG06NUA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 031FD80D6A8;
 Thu, 25 Mar 2021 06:04:14 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-181.rdu2.redhat.com [10.10.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5CBD7866C7;
 Thu, 25 Mar 2021 06:04:13 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v4 11/19] qapi/expr.py: Modify check_keys to accept any
 Collection
Date: Thu, 25 Mar 2021 02:03:48 -0400
Message-Id: <20210325060356.4040114-12-jsnow@redhat.com>
In-Reply-To: <20210325060356.4040114-1-jsnow@redhat.com>
References: <20210325060356.4040114-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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
Cc: Michael Roth <michael.roth@amd.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a minor adjustment that allows the 'required' and 'optional'
keys fields to take a default value of an empty, immutable sequence (the
empty tuple).

This reveals a quirk of this function, which is that "a + b" is
list-specific behavior. We can accept a wider variety of types if we
avoid that behavior. Using Collection allows us to accept things like
lists, tuples, sets, and so on.

(Iterable would also have worked, but Iterable also includes things like
generator expressions which are consumed upon iteration, which would
require a rewrite to make sure that each input was only traversed once.)

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/expr.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 505e67bd21..7e22723b50 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -100,7 +100,7 @@ def pprint(elems):
             "%s misses key%s %s"
             % (source, 's' if len(missing) > 1 else '',
                pprint(missing)))
-    allowed = set(required + optional)
+    allowed = set(required) | set(optional)
     unknown = set(value) - allowed
     if unknown:
         raise QAPISemError(
-- 
2.30.2


