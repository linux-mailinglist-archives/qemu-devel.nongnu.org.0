Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D42A9303D28
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 13:40:12 +0100 (CET)
Received: from localhost ([::1]:38004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Ndj-0001Gb-UI
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 07:40:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4NcK-0000a3-24
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 07:38:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4NcG-0002gq-Ln
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 07:38:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611664719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=P7bmdWeRAU+NAQMSszAxhi2oLgaLxbf3kSkjeJaPPN0=;
 b=LzCYsQr/9oYeti+22eoBgtwKS+79sePw2IH8aWMFR99WrudRi7d7FFOE8z12WlCGfJhDzO
 QdvHwCKE11qwpsnuAYxP5SJpj6E6w8JmDT/lwk+wiBIQ+XgzxQrLTEP6XMe7Gg+6WGoC+N
 Cm0q2/Z3wgr1t8Ds8+d/RlvDe5zg03I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-cwKOeqh4Oq-hoNw_uCx5Mw-1; Tue, 26 Jan 2021 07:38:37 -0500
X-MC-Unique: cwKOeqh4Oq-hoNw_uCx5Mw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4758359;
 Tue, 26 Jan 2021 12:38:36 +0000 (UTC)
Received: from localhost (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B1A3F60871;
 Tue, 26 Jan 2021 12:38:35 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH] iotests/178: Pass value to invalid option
Date: Tue, 26 Jan 2021 13:38:34 +0100
Message-Id: <20210126123834.115915-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ccd3b3b8112 has deprecated short-hand boolean options (i.e., options
with values).  All options without values are interpreted as boolean
options, so this includes the invalid option "snapshot.foo" used in
iotest 178.

So after ccd3b3b8112, 178 fails with:

  +qemu-img: warning: short-form boolean option 'snapshot.foo' deprecated
  +Please use snapshot.foo=on instead

Suppress that deprecation warning by passing some value to it (it does
not matter which, because the option is invalid anyway).

Fixes: ccd3b3b8112b670fdccf8a392b8419b173ffccb4
       ("qemu-option: warn for short-form boolean options")
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/178           | 2 +-
 tests/qemu-iotests/178.out.qcow2 | 2 +-
 tests/qemu-iotests/178.out.raw   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/178 b/tests/qemu-iotests/178
index 3b1a7adce4..8df241ead8 100755
--- a/tests/qemu-iotests/178
+++ b/tests/qemu-iotests/178
@@ -57,7 +57,7 @@ $QEMU_IMG measure --image-opts # missing filename
 $QEMU_IMG measure -f qcow2 # missing filename
 $QEMU_IMG measure -l snap1 # missing filename
 $QEMU_IMG measure -o , # invalid option list
-$QEMU_IMG measure -l snapshot.foo # invalid snapshot option
+$QEMU_IMG measure -l snapshot.foo=bar # invalid snapshot option
 $QEMU_IMG measure --output foo # invalid output format
 $QEMU_IMG measure --size -1 # invalid image size
 $QEMU_IMG measure -O foo "$TEST_IMG" # unknown image file format
diff --git a/tests/qemu-iotests/178.out.qcow2 b/tests/qemu-iotests/178.out.qcow2
index c7997760fd..fe193fd5f4 100644
--- a/tests/qemu-iotests/178.out.qcow2
+++ b/tests/qemu-iotests/178.out.qcow2
@@ -11,7 +11,7 @@ qemu-img: --image-opts, -f, and -l require a filename argument.
 qemu-img: --image-opts, -f, and -l require a filename argument.
 qemu-img: Invalid option list: ,
 qemu-img: Invalid parameter 'snapshot.foo'
-qemu-img: Failed in parsing snapshot param 'snapshot.foo'
+qemu-img: Failed in parsing snapshot param 'snapshot.foo=bar'
 qemu-img: --output must be used with human or json as argument.
 qemu-img: Invalid image size specified. Must be between 0 and 9223372036854775807.
 qemu-img: Unknown file format 'foo'
diff --git a/tests/qemu-iotests/178.out.raw b/tests/qemu-iotests/178.out.raw
index 20e17da115..445e460fad 100644
--- a/tests/qemu-iotests/178.out.raw
+++ b/tests/qemu-iotests/178.out.raw
@@ -11,7 +11,7 @@ qemu-img: --image-opts, -f, and -l require a filename argument.
 qemu-img: --image-opts, -f, and -l require a filename argument.
 qemu-img: Invalid option list: ,
 qemu-img: Invalid parameter 'snapshot.foo'
-qemu-img: Failed in parsing snapshot param 'snapshot.foo'
+qemu-img: Failed in parsing snapshot param 'snapshot.foo=bar'
 qemu-img: --output must be used with human or json as argument.
 qemu-img: Invalid image size specified. Must be between 0 and 9223372036854775807.
 qemu-img: Unknown file format 'foo'
-- 
2.29.2


