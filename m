Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B5130E888
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 01:34:25 +0100 (CET)
Received: from localhost ([::1]:36844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7SbH-00030j-RS
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 19:34:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l7SZN-0001Cv-7Y
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 19:32:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l7SZB-0000ao-VI
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 19:32:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612398733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N9yGGI4O27oKx7dXUhjSvY4iw/NC5t2MvhJDwQcUe9I=;
 b=CAu3R7Iou1UGLe4ScbFJI86POjnOt0gJcDd7s538j6uZpzF8rHQtCWlVsH92ZJPtPXmQRZ
 MQDchW5nnDFwX5jQ0d0fHKtvIM6P/s55Jq5d4faFcXXoUl1cUBjZJbZNkYHe4T3BD/r7FX
 tce3hVsJ7MoGqZ64a5qkbMzUNqj1fVc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-FNaUV5YjMMGb4Id_1qcClg-1; Wed, 03 Feb 2021 19:32:10 -0500
X-MC-Unique: FNaUV5YjMMGb4Id_1qcClg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC3B9108C282
 for <qemu-devel@nongnu.org>; Thu,  4 Feb 2021 00:32:09 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1A3171007622;
 Thu,  4 Feb 2021 00:32:09 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v5 02/15] qapi/introspect.py: use _make_tree for features nodes
Date: Wed,  3 Feb 2021 19:31:54 -0500
Message-Id: <20210204003207.2856909-3-jsnow@redhat.com>
In-Reply-To: <20210204003207.2856909-1-jsnow@redhat.com>
References: <20210204003207.2856909-1-jsnow@redhat.com>
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
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

A consequence of doing this is that the 'ifcond' key of the features
dict will be omitted when ifcond is false-ish, just like it is omitted
in top-level calls to _make_tree. This also increases consistency in our
handling of this property.

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
2.29.2


