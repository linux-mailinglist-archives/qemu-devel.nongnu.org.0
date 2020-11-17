Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A0A2B5F08
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 13:23:12 +0100 (CET)
Received: from localhost ([::1]:47440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf00t-0001Kf-P3
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 07:23:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kezuW-0002Z7-9O
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 07:16:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kezuK-0002jl-5N
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 07:16:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605615381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OoC4a8OqMJX1aI5Tz3lxbHtdObVtnsjOt2I+cEEbfqU=;
 b=JAtc4IH6kcILHh4jIl8kGsZYJa6XdptZx5RZKTxeg/VDRbrcX4OHUzuBIe2ShJeMoKKiCR
 E4YbzSyps7oTGUF49TItvcG6R4Hj3F1p29wAJxjzq1Qo/sbUw75qnyOjZUAaE7Z/NOT5TR
 +I8/I/Q2dE7ZCklj0onsLa/GjRK9R6c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-7rB7MRHMMkSiyvmVDLfmcg-1; Tue, 17 Nov 2020 07:16:15 -0500
X-MC-Unique: 7rB7MRHMMkSiyvmVDLfmcg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F3D764144;
 Tue, 17 Nov 2020 12:16:14 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-113.ams2.redhat.com [10.36.114.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 880BE10013D0;
 Tue, 17 Nov 2020 12:16:13 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 6/7] iotests/081: Filter image format after testdir
Date: Tue, 17 Nov 2020 13:15:57 +0100
Message-Id: <20201117121558.249585-7-kwolf@redhat.com>
In-Reply-To: <20201117121558.249585-1-kwolf@redhat.com>
References: <20201117121558.249585-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 01:18:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Max Reitz <mreitz@redhat.com>

Otherwise, this breaks whenever the test directory contains the image
format (e.g. "/tmp/test-raw-file" is filtered to "/tmp/test-IMGFMT-file"
instead of "TEST_DIR").

Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20201113211718.261671-3-mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/081 | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/081 b/tests/qemu-iotests/081
index 537d40dfd5..253b7576be 100755
--- a/tests/qemu-iotests/081
+++ b/tests/qemu-iotests/081
@@ -45,15 +45,16 @@ _require_drivers quorum
 
 do_run_qemu()
 {
-    echo Testing: "$@" | _filter_imgfmt
+    echo Testing: "$@"
     $QEMU -nographic -qmp stdio -serial none "$@"
     echo
 }
 
 run_qemu()
 {
-    do_run_qemu "$@" 2>&1 | _filter_testdir | _filter_qemu | _filter_qmp\
-                          | _filter_qemu_io | _filter_generated_node_ids
+    do_run_qemu "$@" 2>&1 | _filter_testdir | _filter_imgfmt | _filter_qemu \
+                          | _filter_qmp | _filter_qemu_io \
+                          | _filter_generated_node_ids
 }
 
 quorum="driver=raw,file.driver=quorum,file.vote-threshold=2"
-- 
2.28.0


