Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D1C285567
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Oct 2020 02:23:25 +0200 (CEST)
Received: from localhost ([::1]:49058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPxEq-0004rn-SX
	for lists+qemu-devel@lfdr.de; Tue, 06 Oct 2020 20:23:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kPwrV-0000Fe-8u
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 19:59:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kPwrR-0002PC-Tp
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 19:59:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602028753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kFgYvql5sJB1bYpkJkbqDkyXzJ0+XhJ85dMfvV7KaaE=;
 b=LqCB5LjA6NQOkv8YGCNSc/KbU1p2BTKOfjupFqVNAWPPzppkiuZYRXW7tjVSHoSpHFE7kT
 ZSirjfdWkK9S9QzhxzD/nMIyAcYoJo/zZrAF3YyP4AoduisKilUnOW+vP+SFONI/Ertk7l
 cRa/opzSO09UGy/sN4B3KYOHmHPnKQU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-IuNynBxrNSGaY8LpEgmCuA-1; Tue, 06 Oct 2020 19:59:10 -0400
X-MC-Unique: IuNynBxrNSGaY8LpEgmCuA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7311F64144;
 Tue,  6 Oct 2020 23:59:09 +0000 (UTC)
Received: from scv.redhat.com (ovpn-120-38.rdu2.redhat.com [10.10.120.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD1E160BFA;
 Tue,  6 Oct 2020 23:59:08 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/20] python/qemu/qmp.py: re-raise OSError when encountered
Date: Tue,  6 Oct 2020 19:58:15 -0400
Message-Id: <20201006235817.3280413-19-jsnow@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Nested if conditions don't change when the exception block fires; we
need to explicitly re-raise the error if we didn't intend to capture and
suppress it.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/qmp.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/python/qemu/qmp.py b/python/qemu/qmp.py
index d911999da1f..bdbd1e9bdbb 100644
--- a/python/qemu/qmp.py
+++ b/python/qemu/qmp.py
@@ -169,9 +169,9 @@ def __get_events(self, wait: Union[bool, float] = False) -> None:
         try:
             self.__json_read()
         except OSError as err:
-            if err.errno == errno.EAGAIN:
-                # No data available
-                pass
+            # EAGAIN: No data available; not critical
+            if err.errno != errno.EAGAIN:
+                raise
         self.__sock.setblocking(True)
 
         # Wait for new events, if needed.
-- 
2.26.2


