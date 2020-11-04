Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E64F12A5B8F
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Nov 2020 02:12:17 +0100 (CET)
Received: from localhost ([::1]:39026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ka7LU-0006ng-VX
	for lists+qemu-devel@lfdr.de; Tue, 03 Nov 2020 20:12:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ka6nw-0007OD-2s
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 19:37:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ka6nr-0004xa-3p
 for qemu-devel@nongnu.org; Tue, 03 Nov 2020 19:37:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604450250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BjOVoF9IAQEpgMWUVUzthZy3hghyNPSDDg5CUOiAI4c=;
 b=KGBfX/Bqg6adGF0Xwmth6zbHEPl3J4IAkiUb5CbVFZwvFrpllepwda0yE/ABp6h3z0OG7h
 TsdZiHNSUbips5IHzw8gzmxrgdGJRaPXFYAmRhy4bxj1p1V1hkevQrlxyQKlZ+s+fSHPW8
 TXPESC7ZM7zQZFaluZUX2w2JYXkFSl4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-JKMZM7EgMEapCK6iTthzug-1; Tue, 03 Nov 2020 19:37:28 -0500
X-MC-Unique: JKMZM7EgMEapCK6iTthzug-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 894958030DF
 for <qemu-devel@nongnu.org>; Wed,  4 Nov 2020 00:37:27 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-97.rdu2.redhat.com [10.10.119.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 435D355766;
 Wed,  4 Nov 2020 00:37:25 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 60/72] python/qmp: return generic type from context manager
Date: Tue,  3 Nov 2020 19:35:50 -0500
Message-Id: <20201104003602.1293560-61-jsnow@redhat.com>
In-Reply-To: <20201104003602.1293560-1-jsnow@redhat.com>
References: <20201104003602.1293560-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 00:03:41
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
Cc: Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

__enter__ can be invoked from a subclass, so it needs a more specific
type.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/qmp/__init__.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/python/qemu/qmp/__init__.py b/python/qemu/qmp/__init__.py
index ba0d2281d678..376954cb6d27 100644
--- a/python/qemu/qmp/__init__.py
+++ b/python/qemu/qmp/__init__.py
@@ -30,6 +30,7 @@
     TextIO,
     Tuple,
     Type,
+    TypeVar,
     Union,
     cast,
 )
@@ -220,7 +221,9 @@ def __get_events(self, wait: Union[bool, float] = False) -> None:
             if ret is None:
                 raise QMPConnectError("Error while reading from socket")
 
-    def __enter__(self) -> 'QEMUMonitorProtocol':
+    T = TypeVar('T')
+
+    def __enter__(self: T) -> T:
         # Implement context manager enter function.
         return self
 
-- 
2.26.2


