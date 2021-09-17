Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FD240F1C0
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 07:49:04 +0200 (CEST)
Received: from localhost ([::1]:43696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR6kB-0005Ay-PT
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 01:49:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mR6cv-0005Go-OE
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 01:41:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mR6cp-0003dS-Fe
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 01:41:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631857284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qkwvaqgYVXKJ52bAFsA3LmVzXWBREOn5KcDadOq0Zmo=;
 b=QkO8ey3hBw9zHuDXw9Xue/RZjiJ9UbbQIag1WG7HxZw0clYPX/jenCjxbbGmBmj/EzAlTC
 fXKVs6CPQMUOmSuhCFLqxPNP0etgwGQDIuIgCBAsLK+lerZdd40RMaeXbjfNLXLb3aFXhT
 Ru6wNCi4UXKf8bHm1cTSimen3Xo+xO0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-91-WuHlwuG3MiWDP8NnrBkYIg-1; Fri, 17 Sep 2021 01:41:23 -0400
X-MC-Unique: WuHlwuG3MiWDP8NnrBkYIg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A2271084681;
 Fri, 17 Sep 2021 05:41:22 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C365F77F3C;
 Fri, 17 Sep 2021 05:41:20 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/15] iotests: Disable AQMP logging under non-debug modes
Date: Fri, 17 Sep 2021 01:40:44 -0400
Message-Id: <20210917054047.2042843-13-jsnow@redhat.com>
In-Reply-To: <20210917054047.2042843-1-jsnow@redhat.com>
References: <20210917054047.2042843-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Disable the aqmp logger, which likes to (at the moment) print out
intermediate warnings and errors that cause session termination; disable
them so they don't interfere with the job output.

Leave any "CRITICAL" warnings enabled though, those are ones that we
should never see, no matter what.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/iotests.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 273d2777ae..47e5f9738b 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -1383,6 +1383,8 @@ def execute_setup_common(supported_fmts: Sequence[str] = (),
     if debug:
         sys.argv.remove('-d')
     logging.basicConfig(level=(logging.DEBUG if debug else logging.WARN))
+    if not debug:
+        logging.getLogger("qemu.aqmp.qmp_client").setLevel(logging.CRITICAL)
 
     _verify_image_format(supported_fmts, unsupported_fmts)
     _verify_protocol(supported_protocols, unsupported_protocols)
-- 
2.31.1


