Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EFE367298
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 20:32:36 +0200 (CEST)
Received: from localhost ([::1]:34892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZHeN-0002lO-Mn
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 14:32:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZHTE-0002f5-6m
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 14:21:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZHT2-0003j2-5D
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 14:21:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619029250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5XJh95ts/tV7zfy7Q8Do3iORtw+Im2IBI/o1BDGjseM=;
 b=PzX3LXXJCnFz7a1qNDDTFS0RGJO188Dt3CytoECNrTRM/35ceNPYmi56VquIVyU46uUqEp
 hY2slO6g4pfiJMGSuUGnhlqF+bCHYOT7RVMj2baXOxaXh96DkAAfy6wD2lLDdgblUi0HSD
 FjE+Rkt0jlcKL359afNybKzYJYKEk9c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-rw05Z7qiPCK4t5nV8FRDwA-1; Wed, 21 Apr 2021 14:20:48 -0400
X-MC-Unique: rw05Z7qiPCK4t5nV8FRDwA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0596C18B613D;
 Wed, 21 Apr 2021 18:20:48 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-152.rdu2.redhat.com [10.10.118.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 339EE19701;
 Wed, 21 Apr 2021 18:20:47 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v5 09/17] qapi/expr.py: Modify check_keys to accept any
 Collection
Date: Wed, 21 Apr 2021 14:20:24 -0400
Message-Id: <20210421182032.3521476-10-jsnow@redhat.com>
In-Reply-To: <20210421182032.3521476-1-jsnow@redhat.com>
References: <20210421182032.3521476-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

This is a minor adjustment that lets parameters @required and
@optional take tuple arguments, in particular ().  Later patches will
make use of that.

(Iterable would also have worked, but Iterable also includes things like
generator expressions which are consumed upon iteration, which would
require a rewrite to make sure that each input was only traversed
once. Collection implies the "can re-iterate" property.)

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/expr.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index f3a4a8536e8..396c8126d6a 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -102,7 +102,7 @@ def pprint(elems):
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


