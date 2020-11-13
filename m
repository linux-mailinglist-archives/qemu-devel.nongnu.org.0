Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D66E2B18BF
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 11:07:18 +0100 (CET)
Received: from localhost ([::1]:36628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdVzB-0001pm-Ak
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 05:07:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdVyO-0001KN-71
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 05:06:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdVyH-0008ML-Ig
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 05:06:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605261979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=w3yOvpl50DICaERouT3cgBPe25GX8F3vNl4csJj8v5I=;
 b=MRWBLOp7ax9ypbgUypIuCJE55lzkWxaFc9tE9bohtLwHQv6WIcLTzeElQGuHfOJDBc85H2
 HyiPkRUSMLRO76QVU4xXjjLQYC83yNXicel47hUJmedZYlENLIaMEeR5qk5RpeYenvxY9c
 EWsGvKHr1UWnIwxle9kq8UxIc8gM40s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-eLqLVKUlN722zhQBkx7eRA-1; Fri, 13 Nov 2020 05:06:17 -0500
X-MC-Unique: eLqLVKUlN722zhQBkx7eRA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 707F96408A;
 Fri, 13 Nov 2020 10:06:16 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-99.ams2.redhat.com [10.36.114.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9C2896266E;
 Fri, 13 Nov 2020 10:06:15 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH for-5.2] iotests: Replace deprecated ConfigParser.readfp()
Date: Fri, 13 Nov 2020 11:06:02 +0100
Message-Id: <20201113100602.15936-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

iotest 277 fails on Fedora 33 (Python 3.9) because a deprecation warning
changes the output:

    nbd-fault-injector.py:230: DeprecationWarning: This method will be
    removed in future versions.  Use 'parser.read_file()' instead.

In fact, readfp() has already been deprecated in Python 3.2 and the
replacement has existed since the same version, so we can now
unconditionally switch to read_file().

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/nbd-fault-injector.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/nbd-fault-injector.py b/tests/qemu-iotests/nbd-fault-injector.py
index 78f42c4214..6e11ef89b8 100755
--- a/tests/qemu-iotests/nbd-fault-injector.py
+++ b/tests/qemu-iotests/nbd-fault-injector.py
@@ -227,7 +227,7 @@ def parse_config(config):
 def load_rules(filename):
     config = configparser.RawConfigParser()
     with open(filename, 'rt') as f:
-        config.readfp(f, filename)
+        config.read_file(f, filename)
     return parse_config(config)
 
 def open_socket(path):
-- 
2.28.0


