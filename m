Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FD1285550
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Oct 2020 02:15:33 +0200 (CEST)
Received: from localhost ([::1]:60060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPx7D-000635-AV
	for lists+qemu-devel@lfdr.de; Tue, 06 Oct 2020 20:15:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kPwrK-00006K-1e
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 19:59:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kPwrH-0002Ni-QH
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 19:59:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602028742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r0wJ+GPmqvcUVkaYcV6Fcgm91lvZ/ywO2xaD2Z21vyA=;
 b=i9fqW2lhOuLB11VfROjfVsnUb1nHFZLKDkxfoVwqkRB/FOBqe19u4TdA4hOknD4ZiEHfLo
 +YzmofwEsNNAfxM6+9UCfhoyQCLxETqaoHsoXQGjnFKJRmzJr14KbGfod0IvUz4qfrtvZr
 So1ybp+/8t9YuahQ8C7PHg/CP+XpurI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-o1rsv0-ROFyLSBu7S_G8rg-1; Tue, 06 Oct 2020 19:59:01 -0400
X-MC-Unique: o1rsv0-ROFyLSBu7S_G8rg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB0B264144;
 Tue,  6 Oct 2020 23:58:59 +0000 (UTC)
Received: from scv.redhat.com (ovpn-120-38.rdu2.redhat.com [10.10.120.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 91E0A60BFA;
 Tue,  6 Oct 2020 23:58:42 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/20] python/qemu/console_socket.py: Correct type of recv()
Date: Tue,  6 Oct 2020 19:58:09 -0400
Message-Id: <20201006235817.3280413-13-jsnow@redhat.com>
In-Reply-To: <20201006235817.3280413-1-jsnow@redhat.com>
References: <20201006235817.3280413-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/06 01:55:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The type and parameter names of recv() should match socket.socket().

OK, easy enough, but in the cases we don't pass straight through to the
real socket implementation, we probably can't accept such flags. OK, for
now, assert that we don't receive flags in such cases.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/console_socket.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/python/qemu/console_socket.py b/python/qemu/console_socket.py
index 69f604c77fe..cb3400a0385 100644
--- a/python/qemu/console_socket.py
+++ b/python/qemu/console_socket.py
@@ -92,13 +92,14 @@ def _drain_socket(self):
         for c in string:
             self._buffer.extend(c)
 
-    def recv(self, bufsize=1):
+    def recv(self, bufsize: int = 1, flags: int = 0) -> bytes:
         """Return chars from in memory buffer.
            Maintains the same API as socket.socket.recv.
         """
         if self._drain_thread is None:
             # Not buffering the socket, pass thru to socket.
-            return socket.socket.recv(self, bufsize)
+            return socket.socket.recv(self, bufsize, flags)
+        assert not flags, "Cannot pass flags to recv() in drained mode"
         start_time = time.time()
         while len(self._buffer) < bufsize:
             time.sleep(self._sleep_time)
-- 
2.26.2


