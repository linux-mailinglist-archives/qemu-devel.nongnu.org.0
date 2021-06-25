Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F413B48CB
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 20:30:45 +0200 (CEST)
Received: from localhost ([::1]:50978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwqbE-0005IJ-Kj
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 14:30:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lwqRo-000432-Gw
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 14:21:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lwqRY-0005mu-4S
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 14:21:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624645243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aAOB/E5CPaLjPwAcFGN/NLfEOV/TwQV7VnVyCc7I0nw=;
 b=SUhbVx1+GecB4j4nN2U5sYBSDRFx+d+4ImGsCk6z5MOh8dpdN7qF9yfRgZG7O3ssskqxXH
 YH4n5G6SLPNgFbWZu2BIUYIrOa/jPCqAS12oS9XbtP3RNn4ePWzqu182Wu+OYtVVq/hg/d
 pHPPTljHxt3qx+/2DGHoSyA8FkGcqiA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-whR5dDSdMoaOh6VInRICdQ-1; Fri, 25 Jun 2021 14:20:41 -0400
X-MC-Unique: whR5dDSdMoaOh6VInRICdQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF13510C1ADC;
 Fri, 25 Jun 2021 18:20:40 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D8A915D9C6;
 Fri, 25 Jun 2021 18:20:39 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/10] python: Add iotest linters to test suite
Date: Fri, 25 Jun 2021 14:20:21 -0400
Message-Id: <20210625182021.803227-11-jsnow@redhat.com>
In-Reply-To: <20210625182021.803227-1-jsnow@redhat.com>
References: <20210625182021.803227-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As a convenience, since iotests is an extremely prominent user of the
qemu.qmp and qemu.machine packages and already implements a linting
regime, run those tests as well so that it's very hard to miss
regressions caused by changes to the python library.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/tests/iotests.sh | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100755 python/tests/iotests.sh

diff --git a/python/tests/iotests.sh b/python/tests/iotests.sh
new file mode 100755
index 0000000000..ec2fc58066
--- /dev/null
+++ b/python/tests/iotests.sh
@@ -0,0 +1,2 @@
+#!/bin/sh -e
+PYTHONPATH=../tests/qemu-iotests/ python3 -m linters
-- 
2.31.1


