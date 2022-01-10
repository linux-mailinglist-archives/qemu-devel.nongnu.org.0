Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 763DC48A3EA
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 00:49:07 +0100 (CET)
Received: from localhost ([::1]:56280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n74PS-0006qv-Jg
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 18:49:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n748x-0004hn-Fh
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 18:32:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n748u-0000Jv-4M
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 18:32:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641857517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cN//P8Qy75ycCLA04A+FinwrhfJje8e0FQvGeIYqQC4=;
 b=DijAO5FcNfh9Rj2iQR9eBh26GwYrX7xR10YoLpzI1P1MxrBznvv6YbcwQGA13jISXaAPT7
 Sew/FDA62Zg8ctgPZlRi1Dz9HSF3t2rm5YXpdx9Ur5oR0s27y0imeemdvcQzYzplCiAeDl
 I0jOMSDOc+v+Mm/wKV7UgLtusrQbLc8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-61-GkxM5MK5OsKBFpKDJFScrA-1; Mon, 10 Jan 2022 18:31:56 -0500
X-MC-Unique: GkxM5MK5OsKBFpKDJFScrA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F07E760C4;
 Mon, 10 Jan 2022 23:31:55 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.219])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 89E987B035;
 Mon, 10 Jan 2022 23:31:53 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 18/31] scripts/cpu-x86-uarch-abi: fix CLI parsing
Date: Mon, 10 Jan 2022 18:28:57 -0500
Message-Id: <20220110232910.1923864-19-jsnow@redhat.com>
In-Reply-To: <20220110232910.1923864-1-jsnow@redhat.com>
References: <20220110232910.1923864-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Wainer Moschetta <wainersm@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 scripts/cpu-x86-uarch-abi.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/cpu-x86-uarch-abi.py b/scripts/cpu-x86-uarch-abi.py
index 08acc52a81..8963d90f0b 100644
--- a/scripts/cpu-x86-uarch-abi.py
+++ b/scripts/cpu-x86-uarch-abi.py
@@ -9,7 +9,7 @@
 from qemu import qmp
 import sys
 
-if len(sys.argv) != 1:
+if len(sys.argv) != 2:
     print("syntax: %s QMP-SOCK\n\n" % __file__ +
           "Where QMP-SOCK points to a QEMU process such as\n\n" +
           " # qemu-system-x86_64 -qmp unix:/tmp/qmp,server,nowait " +
@@ -66,7 +66,6 @@
 
 
 sock = sys.argv[1]
-cmd = sys.argv[2]
 shell = qmp.QEMUMonitorProtocol(sock)
 shell.connect()
 
-- 
2.31.1


