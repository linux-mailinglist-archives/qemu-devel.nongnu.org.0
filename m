Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99768274B57
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Sep 2020 23:45:10 +0200 (CEST)
Received: from localhost ([::1]:48218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKq61-0008Fu-IV
	for lists+qemu-devel@lfdr.de; Tue, 22 Sep 2020 17:45:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kKpbV-0001J8-T8
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 17:13:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kKpbS-00064M-T0
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 17:13:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600809214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=otO27sep0nJ6bA9EFn+q7sPXFbyUG38myhQs4Z2myn0=;
 b=W87Hwlnogy3uFwIJZAZR6JoawH3YrS4kpbzHY0SovrKTO279Jn9YbE2R64lUHCGFFihLyx
 HaUD6orRW/XZLvbAnAEqESUFkhTQOH3It0GlYiJhYf4DkMU5Wf5af2u77WeKKgpgHyyOrU
 nO1eIT/dgZy6oQHVZOumVxMnnkoLWtM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-iyCikDqyO3K0c0TFUimbZg-1; Tue, 22 Sep 2020 17:13:32 -0400
X-MC-Unique: iyCikDqyO3K0c0TFUimbZg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E78C81CBE9;
 Tue, 22 Sep 2020 21:13:31 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-140.rdu2.redhat.com [10.10.119.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 64FC173682;
 Tue, 22 Sep 2020 21:13:30 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: [PATCH 13/16] qapi/expr.py: Modify check_keys to accept any Iterable
Date: Tue, 22 Sep 2020 17:13:10 -0400
Message-Id: <20200922211313.4082880-14-jsnow@redhat.com>
In-Reply-To: <20200922211313.4082880-1-jsnow@redhat.com>
References: <20200922211313.4082880-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 02:07:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
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
Cc: Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a very minor adjustment.

a + b is list-specific behavior, but we can accept a wider variety of
types in a more pythonic fashion if we avoid that behavior.

Typing it this way allows callers to use things like dict.keys() and
other iterables that are not their own discrete lists.

Including it just as a statement of practice if nothing else: It's nice
to use the least-specific type possible as function input and use the
most-specific type for returns.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/expr.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 4bba09f6e5..2a1f37ca88 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -132,8 +132,8 @@ def check_defn_name_str(name: str, info: QAPISourceInfo, meta: str) -> None:
 def check_keys(value: _JSObject,
                info: QAPISourceInfo,
                source: str,
-               required: List[str],
-               optional: List[str]) -> None:
+               required: Iterable[str] = (),
+               optional: Iterable[str] = ()) -> None:
     """
     Ensures an object has a specific set of keys. [Const]
 
@@ -154,7 +154,7 @@ def pprint(elems: Iterable[str]) -> str:
             "%s misses key%s %s"
             % (source, 's' if len(missing) > 1 else '',
                pprint(missing)))
-    allowed = set(required + optional)
+    allowed = set(required) | set(optional)
     unknown = set(value) - allowed
     if unknown:
         raise QAPISemError(
-- 
2.26.2


