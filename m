Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E470B2FD3F6
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 16:29:23 +0100 (CET)
Received: from localhost ([::1]:44072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2FQA-0005l7-Vi
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 10:29:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l2FFc-0000IL-Od
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 10:18:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l2FFM-0007jX-GF
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 10:18:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611155891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8KhCgIw6Q36UfCR4Z3i9ErZUXbeOerQGuMqLNgS0TD0=;
 b=Yc7kYiRtSabxyKKvcHKZ1Dm1EUYDSLq2L3KMCewK7G2egz6G/OBNHKkVgBVt0gjxnFtVq9
 ojWhEedD7X+FqVvyQKBoTASgMgOrr7isx7Ah3UC6MGoafbWz4fblqs3cdvUwABF5d3A0bc
 WMwXcf7sHZ3ILCdMXIgvfuBR0Pk4sDo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-HFaVlx8XOr-fIKd3yq9hqw-1; Wed, 20 Jan 2021 10:18:09 -0500
X-MC-Unique: HFaVlx8XOr-fIKd3yq9hqw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A6D5E8145EC;
 Wed, 20 Jan 2021 15:18:08 +0000 (UTC)
Received: from thuth.com (ovpn-114-135.ams2.redhat.com [10.36.114.135])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 62F9160C6A;
 Wed, 20 Jan 2021 15:18:07 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 09/14] tests/check-block.sh: Refuse to run the iotests with
 BusyBox' sed
Date: Wed, 20 Jan 2021 16:17:46 +0100
Message-Id: <20210120151751.520597-10-thuth@redhat.com>
In-Reply-To: <20210120151751.520597-1-thuth@redhat.com>
References: <20210120151751.520597-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

BusyBox' sed reports itself as "This is not GNU sed version 4.0"
when being run with the --version parameter. However, the iotests
really need GNU sed, they do not work with the BusyBox version.
So let's make sure that we really have GNU sed and refuse to run
the tests with BusyBox' sed.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210119134749.401311-1-thuth@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/check-block.sh | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/check-block.sh b/tests/check-block.sh
index fb4c1baae9..e4f37905be 100755
--- a/tests/check-block.sh
+++ b/tests/check-block.sh
@@ -60,6 +60,13 @@ if ! (sed --version | grep 'GNU sed') > /dev/null 2>&1 ; then
         echo "GNU sed not available ==> Not running the qemu-iotests."
         exit 0
     fi
+else
+    # Double-check that we're not using BusyBox' sed which says
+    # that "This is not GNU sed version 4.0" ...
+    if sed --version | grep -q 'not GNU sed' ; then
+        echo "BusyBox sed not supported ==> Not running the qemu-iotests."
+        exit 0
+    fi
 fi
 
 cd tests/qemu-iotests
-- 
2.27.0


