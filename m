Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDFB29990B
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 22:49:12 +0100 (CET)
Received: from localhost ([::1]:32964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXAMZ-0000ZT-3h
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 17:49:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kXAAc-00043U-9t
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 17:36:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kXAAa-0001VO-Kd
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 17:36:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603748207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cbUKR6b9mvrjVlK20WDv1InAUJLku0Kl9L49zrV3Jeo=;
 b=Q6BpIDvhPXysF73Pa8rANvYOfdenp7H0n/cx0rAIqd/3dRve+b250nMRYRlKurREjkFIQF
 UEUqfYbyBwRHPtSWrhfPLScRvjzF/LBIXzKtvucC0V95SFWiEy9k+redSd8ZLATcXhtoZA
 i7jtKqxUFYTVWWsmikrk4olZzmhfbRM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-iWW5IeSMO3aOI8CUizTXAQ-1; Mon, 26 Oct 2020 17:36:45 -0400
X-MC-Unique: iWW5IeSMO3aOI8CUizTXAQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DAB306408A
 for <qemu-devel@nongnu.org>; Mon, 26 Oct 2020 21:36:44 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-238.rdu2.redhat.com [10.10.118.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A80619728;
 Mon, 26 Oct 2020 21:36:44 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v2 06/16] qapi/expr.py: Check type of 'data' member
Date: Mon, 26 Oct 2020 17:36:27 -0400
Message-Id: <20201026213637.47087-7-jsnow@redhat.com>
In-Reply-To: <20201026213637.47087-1-jsnow@redhat.com>
References: <20201026213637.47087-1-jsnow@redhat.com>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/25 21:03:19
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
Cc: John Snow <jsnow@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Iterating over the members of data isn't going to work if it's not some
form of dict anyway, but for type safety, formalize it.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
---
 scripts/qapi/expr.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 864363881682..2654a72e8333 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -254,6 +254,9 @@ def check_union(expr, info):
             raise QAPISemError(info, "'discriminator' requires 'base'")
         check_name_is_str(discriminator, info, "'discriminator'")
 
+    if not isinstance(members, dict):
+        raise QAPISemError(info, "'data' must be an object")
+
     for (key, value) in members.items():
         source = "'data' member '%s'" % key
         check_name_str(key, info, source)
@@ -267,6 +270,10 @@ def check_alternate(expr, info):
 
     if not members:
         raise QAPISemError(info, "'data' must not be empty")
+
+    if not isinstance(members, dict):
+        raise QAPISemError(info, "'data' must be an object")
+
     for (key, value) in members.items():
         source = "'data' member '%s'" % key
         check_name_str(key, info, source)
-- 
2.26.2


