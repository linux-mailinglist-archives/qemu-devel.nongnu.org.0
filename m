Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB072B5361
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 22:04:21 +0100 (CET)
Received: from localhost ([::1]:42844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kelfg-00071f-Dw
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 16:04:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kelbZ-0004LB-B5
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 16:00:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kelbQ-0000KP-E1
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 16:00:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605560390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f220quIdy0E+EGLlKKHj7SxQ8yzPLXoku/apdxR++nw=;
 b=EIcWpItfMUS6/daT3RV62Jkqen4JV0JqJdgqtf/u/QIs1Xqx6f9bJVSudq3Dqs3as8P9Wo
 OddT4zJpbUPK65l/SIgHJIfHLJ2hqIjypy6fDf+honU89VCTsKT4II6nT5z+rb9ziRZ4ro
 m26zkMqFKmV6mQh8XBTD1chXe39VIZ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-pgVmFDCoNA2p4kJcC-QyUA-1; Mon, 16 Nov 2020 15:59:46 -0500
X-MC-Unique: pgVmFDCoNA2p4kJcC-QyUA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96B57100855D;
 Mon, 16 Nov 2020 20:59:45 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-36.phx2.redhat.com [10.3.113.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 265AA19C66;
 Mon, 16 Nov 2020 20:59:45 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/2] iotests: Replace deprecated ConfigParser.readfp()
Date: Mon, 16 Nov 2020 14:59:42 -0600
Message-Id: <20201116205942.109534-3-eblake@redhat.com>
In-Reply-To: <20201116205942.109534-1-eblake@redhat.com>
References: <20201116205942.109534-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 04:46:27
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kevin Wolf <kwolf@redhat.com>

iotest 277 fails on Fedora 33 (Python 3.9) because a deprecation warning
changes the output:

    nbd-fault-injector.py:230: DeprecationWarning: This method will be
    removed in future versions.  Use 'parser.read_file()' instead.

In fact, readfp() has already been deprecated in Python 3.2 and the
replacement has existed since the same version, so we can now
unconditionally switch to read_file().

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20201113100602.15936-1-kwolf@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 tests/qemu-iotests/nbd-fault-injector.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/nbd-fault-injector.py b/tests/qemu-iotests/nbd-fault-injector.py
index 78f42c421432..6e11ef89b8b3 100755
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


