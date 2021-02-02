Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9615630C893
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 18:57:18 +0100 (CET)
Received: from localhost ([::1]:39390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6zvR-0005tO-KV
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 12:57:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l6zlX-0004ky-Ow
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:47:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1l6zlU-0008At-Ak
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:47:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612288019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vAvdidcxAG70q1T89fjw/Ce4mvUGyQrT1MKRfSG98VM=;
 b=c/mk9QPSYqxGZ0bT9TVmJkAVj+hQC+n7mDGXYp1T8tiuRvd+QFn0tUB2yXWAOjcdZyX3IK
 wsQZ60phzBZsBBOKomCzIYeTXrjz49nwVGlcFkLt1LGauoo/kr9qF64R8wHf7kCqk5WTR0
 W4eiD7qTzCqHedNk2h7pN0ra9ssmRng=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-MGjz74EMNHmtfuMZuOEhBA-1; Tue, 02 Feb 2021 12:46:57 -0500
X-MC-Unique: MGjz74EMNHmtfuMZuOEhBA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D515E1934100;
 Tue,  2 Feb 2021 17:46:56 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2328B5C22B;
 Tue,  2 Feb 2021 17:46:56 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v4 04/14] qapi/introspect.py: guard against ifcond/comment
 misuse
Date: Tue,  2 Feb 2021 12:46:41 -0500
Message-Id: <20210202174651.2274166-5-jsnow@redhat.com>
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

_tree_to_qlit is called recursively on dict values alone; at such a
point in generating output it is too late to apply an ifcond. Similarly,
comments do not necessarily have a "tidy" place they can be printed in
such a circumstance.

Forbid this usage.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/introspect.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
index 4749f65ea3c..ccdf4f1c0d0 100644
--- a/scripts/qapi/introspect.py
+++ b/scripts/qapi/introspect.py
@@ -43,6 +43,12 @@ def indent(level):
         ifobj, extra = obj
         ifcond = extra.get('if')
         comment = extra.get('comment')
+
+        # NB: _tree_to_qlit is called recursively on the values of a key:value
+        # pair; those values can't be decorated with comments or conditionals.
+        msg = "dict values cannot have attached comments or if-conditionals."
+        assert not suppress_first_indent, msg
+
         ret = ''
         if comment:
             ret += indent(level) + '/* %s */\n' % comment
-- 
2.29.2


