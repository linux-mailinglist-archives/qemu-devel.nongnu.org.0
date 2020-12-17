Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5B72DD48B
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 16:49:05 +0100 (CET)
Received: from localhost ([::1]:60212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpvWZ-0006zT-TR
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 10:49:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kpvM9-0003Zd-8j
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 10:38:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kpvM6-00077x-86
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 10:38:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608219493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pcrS/r3YLtgO7D7X2mXR2kcPMjW0+SBUVTIE2lh2asw=;
 b=Avij9ZfS4DYEo/81X8mf68JBYiTzt0HsSHkW7JdK4ZUettYMXq6HQqORpMUWGEQzq8eavM
 I5KTzUaV6ZbqB4KXFzwd+dpc34OlSxiAoQ1fuXhPfdwK70V9/mSnN/XUTSYd9OYGyiM29V
 f4mpjiDz//+E2eyj2VWbJcfDRQn/ncA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-S7GhXX93PpC7KiJaX4ya2Q-1; Thu, 17 Dec 2020 10:38:09 -0500
X-MC-Unique: S7GhXX93PpC7KiJaX4ya2Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFC5D80F04F;
 Thu, 17 Dec 2020 15:38:08 +0000 (UTC)
Received: from localhost (ovpn-112-159.ams2.redhat.com [10.36.112.159])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4784B1B47C;
 Thu, 17 Dec 2020 15:38:08 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 1/2] iotests/102: Pass $QEMU_HANDLE to _send_qemu_cmd
Date: Thu, 17 Dec 2020 16:38:02 +0100
Message-Id: <20201217153803.101231-2-mreitz@redhat.com>
In-Reply-To: <20201217153803.101231-1-mreitz@redhat.com>
References: <20201217153803.101231-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The first parameter passed to _send_qemu_cmd is supposed to be the
$QEMU_HANDLE.  102 does not do so here, fix it.

As a result, the output changes: Now we see the prompt this command is
supposedly waiting for before the resize message - as it should be.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/102     | 2 +-
 tests/qemu-iotests/102.out | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/102 b/tests/qemu-iotests/102
index 2cc3efd1ed..9d747c7bbf 100755
--- a/tests/qemu-iotests/102
+++ b/tests/qemu-iotests/102
@@ -68,7 +68,7 @@ $QEMU_IO -c 'write 0 64k' "$TEST_IMG" | _filter_qemu_io
 qemu_comm_method=monitor _launch_qemu -drive if=none,file="$TEST_IMG",id=drv0
 
 # Wait for a prompt to appear (so we know qemu has opened the image)
-_send_qemu_cmd '' '(qemu)'
+_send_qemu_cmd $QEMU_HANDLE '' '(qemu)'
 
 $QEMU_IMG resize --shrink --image-opts \
     "driver=raw,file.driver=file,file.filename=$TEST_IMG,file.locking=off" \
diff --git a/tests/qemu-iotests/102.out b/tests/qemu-iotests/102.out
index cd2fdc7f96..320ed5a52b 100644
--- a/tests/qemu-iotests/102.out
+++ b/tests/qemu-iotests/102.out
@@ -16,8 +16,8 @@ Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=65536
 wrote 65536/65536 bytes at offset 0
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 QEMU X.Y.Z monitor - type 'help' for more information
-Image resized.
 (qemu)
+Image resized.
 (qemu) qemu-io drv0 map
 64 KiB (0x10000) bytes     allocated at offset 0 bytes (0x0)
 *** done
-- 
2.29.2


