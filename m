Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0C92B5EF3
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 13:18:17 +0100 (CET)
Received: from localhost ([::1]:33548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kezw8-00043l-Sd
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 07:18:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kezuB-0002OZ-Ij
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 07:16:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kezuA-0002el-0D
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 07:16:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605615373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MsxXkIhF01+c5mYUNzcpRyzD+aT+05ACEJDrxdECM3w=;
 b=DWX8HFrz4yJm+R7NRka4kgQhFXdi5Yc9SjzbZCEHFjpK8GFWDzvWsP0PbOMPUI9uXp1Pm6
 RrglgEDWPUjQExMnsBL1egX1Ud4CtapScmAcFYd9Cnw9f45DltBVPcnaobTqOh+/zZKwKn
 0B4gLBrBixku7oSYtDXJOCsvRtGuz9Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-U0odU1Y0MKar5tuKauM71g-1; Tue, 17 Nov 2020 07:16:09 -0500
X-MC-Unique: U0odU1Y0MKar5tuKauM71g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 224F387951F;
 Tue, 17 Nov 2020 12:16:08 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-113.ams2.redhat.com [10.36.114.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 254AD10013D0;
 Tue, 17 Nov 2020 12:16:06 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 1/7] char-stdio: Fix QMP default for 'signal'
Date: Tue, 17 Nov 2020 13:15:52 +0100
Message-Id: <20201117121558.249585-2-kwolf@redhat.com>
In-Reply-To: <20201117121558.249585-1-kwolf@redhat.com>
References: <20201117121558.249585-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Commit 02c4bdf1 tried to make signal=on the default for stdio chardevs
except for '-serial mon:stdio', but it forgot about QMP and accidentally
switched the QMP default from true (except for -nographic) to false
(always). The documentation was kept unchanged and still describes the
opposite of the old behaviour (which is an even older documentation
bug).

Fix all of this by making signal=true the default in ChardevStdio and
documenting it as such.

Fixes: 02c4bdf1d2ca8c02a9bae16398f260b5c08d08bf
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20201023101222.250147-2-kwolf@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/char.json       | 3 +--
 chardev/char-stdio.c | 4 +---
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/qapi/char.json b/qapi/char.json
index b4d66ec90b..43486d1daa 100644
--- a/qapi/char.json
+++ b/qapi/char.json
@@ -321,8 +321,7 @@
 # Configuration info for stdio chardevs.
 #
 # @signal: Allow signals (such as SIGINT triggered by ^C)
-#          be delivered to qemu.  Default: true in -nographic mode,
-#          false otherwise.
+#          be delivered to qemu.  Default: true.
 #
 # Since: 1.5
 ##
diff --git a/chardev/char-stdio.c b/chardev/char-stdio.c
index 82eaebc1db..403da308c9 100644
--- a/chardev/char-stdio.c
+++ b/chardev/char-stdio.c
@@ -112,9 +112,7 @@ static void qemu_chr_open_stdio(Chardev *chr,
 
     qemu_chr_open_fd(chr, 0, 1);
 
-    if (opts->has_signal) {
-        stdio_allow_signal = opts->signal;
-    }
+    stdio_allow_signal = !opts->has_signal || opts->signal;
     qemu_chr_set_echo_stdio(chr, false);
 }
 #endif
-- 
2.28.0


