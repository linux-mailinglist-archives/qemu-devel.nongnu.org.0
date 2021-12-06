Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9160046991E
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 15:36:55 +0100 (CET)
Received: from localhost ([::1]:49290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muF6s-0001CP-G3
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 09:36:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1muF4M-0006Xa-FK
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 09:34:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1muF4J-0004Ki-Sn
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 09:34:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638801251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Zwiq5QDNnfAUxOEgGhzWjSBwEN9X1B0M9kLanmp7gME=;
 b=agXrIvrxobUQQOAjM/B3A/80iwSJCpJ24ALzkFJ+ZUvDnrt7/g02AUncMLvsVrxsSRoUYx
 PW6kyyaClEZrV2MXwbAC1HEduzdQNkunlHa/JlvL42yaZwc69KLBCfVt4zLuWRunEXLsL7
 cuZSMLlVePcnZdD+2P2o7hVG1oB4YA8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-421-2OqSbFBPNV6cdVhvcmtQLg-1; Mon, 06 Dec 2021 09:34:10 -0500
X-MC-Unique: 2OqSbFBPNV6cdVhvcmtQLg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC7511023F79;
 Mon,  6 Dec 2021 14:34:08 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 785DE5F4E1;
 Mon,  6 Dec 2021 14:34:07 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel@nongnu.org
Subject: [PATCH for-7.0] tests/qemu-iotests: Fix 051 for binaries without
 'lsi53c895a'
Date: Mon,  6 Dec 2021 15:34:04 +0100
Message-Id: <20211206143404.247032-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The lsi53c895a SCSI adaptor might not be enabled in each and every
x86 QEMU binary, e.g. it's disabled in the RHEL/CentOS build.
Thus let's add a check to the 051 test so that it does not fail if
this device is not available.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qemu-iotests/051 | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/qemu-iotests/051 b/tests/qemu-iotests/051
index 1d2fa93a11..e9042a6214 100755
--- a/tests/qemu-iotests/051
+++ b/tests/qemu-iotests/051
@@ -45,6 +45,10 @@ _supported_proto file
 _unsupported_imgopts 'refcount_bits=\([^1]\|.\([^6]\|$\)\)' data_file
 _require_drivers nbd
 
+if [ "$QEMU_DEFAULT_MACHINE" = "pc" ]; then
+    _require_devices lsi53c895a
+fi
+
 do_run_qemu()
 {
     echo Testing: "$@"
-- 
2.27.0


