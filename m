Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C94462997BB
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 21:13:12 +0100 (CET)
Received: from localhost ([::1]:47630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kX8rf-0006Vd-R4
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 16:13:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kX8Ot-0006qE-EF
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 15:43:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kX8Or-0003Ae-Op
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 15:43:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603741405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nmL49+J4OR+6hssCRsu/KikhOrorn3ewX7oqAGz7W/A=;
 b=G+CG5mPNPZylfLJQVfmqbUuYIUVQqz7CHq8ya5trhCkGii1zE33zXaSq4NOJEjBK3uOi2C
 Gbuu8eRyXeeAHspcL79xkAEOuu4wMjuRVf2N4zoO15BG7T4KnZ2gwzSHElDhn2cf/rAC8a
 VBNq08rJAoGyi1nmeoAxI4CwFA7Azac=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-N7s848nxNL-pAwy2vOYJOQ-1; Mon, 26 Oct 2020 15:43:22 -0400
X-MC-Unique: N7s848nxNL-pAwy2vOYJOQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C83D0879539
 for <qemu-devel@nongnu.org>; Mon, 26 Oct 2020 19:43:11 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-238.rdu2.redhat.com [10.10.118.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E7E0C5B4AE;
 Mon, 26 Oct 2020 19:43:10 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v2 04/11] qapi/introspect.py: add assertions and casts
Date: Mon, 26 Oct 2020 15:42:44 -0400
Message-Id: <20201026194251.11075-5-jsnow@redhat.com>
In-Reply-To: <20201026194251.11075-1-jsnow@redhat.com>
References: <20201026194251.11075-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/26 02:39:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

This is necessary to keep mypy passing in the next patch when we add
preliminary type hints. It will be removed shortly.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/introspect.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
index fafec94e022..63f721ebfb6 100644
--- a/scripts/qapi/introspect.py
+++ b/scripts/qapi/introspect.py
@@ -10,6 +10,8 @@
 See the COPYING file in the top-level directory.
 """
 
+from typing import Optional, Sequence, cast
+
 from .common import (
     c_name,
     gen_endif,
@@ -30,6 +32,7 @@ def _make_tree(obj, ifcond, features, extra=None):
     if ifcond:
         extra['if'] = ifcond
     if features:
+        assert isinstance(obj, dict)
         obj['features'] = [(f.name, {'if': f.ifcond}) for f in features]
     if extra:
         return (obj, extra)
@@ -43,7 +46,7 @@ def indent(level):
 
     if isinstance(obj, tuple):
         ifobj, extra = obj
-        ifcond = extra.get('if')
+        ifcond = cast(Optional[Sequence[str]], extra.get('if'))
         comment = extra.get('comment')
         ret = ''
         if comment:
-- 
2.26.2


