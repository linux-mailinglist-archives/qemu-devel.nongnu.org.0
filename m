Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA4C2DE6EA
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 16:47:55 +0100 (CET)
Received: from localhost ([::1]:44892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqHz0-0006wI-SS
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 10:47:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqHSG-00039c-OX
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:14:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqHSE-0005d1-FV
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:14:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608304441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qn7Q59EnGP1ZPTEhjI1jJerEcE7RQ8xV8wemuoF33kQ=;
 b=hHmxia1Cr0Ei0ItomqNLtiWxBa/+g44ZTukJC5pKm3nL1WcN7z0bYuKK+nSx080uLVuhuV
 s5oWflx0ReIjKI2BkmHqv9Bp0w6TIuHNxEzlTT2KekbjtSfk9oMlK/JfEs4jyf6O3v13El
 ExO+kgbs6mUNdOD0iE0qGXuEXf45Xa8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-v64iocrRMOiMotChjmXD5g-1; Fri, 18 Dec 2020 10:13:58 -0500
X-MC-Unique: v64iocrRMOiMotChjmXD5g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C7E5800D62;
 Fri, 18 Dec 2020 15:13:57 +0000 (UTC)
Received: from localhost (ovpn-114-84.ams2.redhat.com [10.36.114.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A76555D769;
 Fri, 18 Dec 2020 15:13:56 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 29/30] iotests/102: Pass $QEMU_HANDLE to _send_qemu_cmd
Date: Fri, 18 Dec 2020 16:12:48 +0100
Message-Id: <20201218151249.715731-30-mreitz@redhat.com>
In-Reply-To: <20201218151249.715731-1-mreitz@redhat.com>
References: <20201218151249.715731-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The first parameter passed to _send_qemu_cmd is supposed to be the
$QEMU_HANDLE.  102 does not do so here, fix it.

As a result, the output changes: Now we see the prompt this command is
supposedly waiting for before the resize message - as it should be.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20201217153803.101231-2-mreitz@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
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


