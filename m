Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2BD271E75
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Sep 2020 11:00:09 +0200 (CEST)
Received: from localhost ([::1]:34312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKHg8-0006Io-B8
	for lists+qemu-devel@lfdr.de; Mon, 21 Sep 2020 05:00:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kKHec-0005ND-I6
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 04:58:34 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:25040
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kKHeb-0005zP-1P
 for qemu-devel@nongnu.org; Mon, 21 Sep 2020 04:58:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600678712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xWsUvfVFBzHsjsgxZJFpVe855m8/H3AH+ACwWad4MV8=;
 b=OmEdQn0GThcB+3YwRt9vyeiQQRrB3/TkQuCKw2JSRjR1YbxXjG7dkP1EKvY1uzGdIckdiq
 WOdaug8pK6xobJuwaBWjlBJVBYk4cX+qEoaGnSSKUZzxakxSD8mFmhjPMqvz4OcW50E+s6
 LcBj5+3fzb0w+OVxZLId/TjgAYYLk7k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-1fX25yfPN8CXod2CZPtWQQ-1; Mon, 21 Sep 2020 04:58:29 -0400
X-MC-Unique: 1fX25yfPN8CXod2CZPtWQQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 520231084D67;
 Mon, 21 Sep 2020 08:58:28 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-85.ams2.redhat.com
 [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 186577366A;
 Mon, 21 Sep 2020 08:58:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 07A681750A; Mon, 21 Sep 2020 10:58:24 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/3] usb: fix u2f build
Date: Mon, 21 Sep 2020 10:58:21 +0200
Message-Id: <20200921085823.980-2-kraxel@redhat.com>
In-Reply-To: <20200921085823.980-1-kraxel@redhat.com>
References: <20200921085823.980-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/21 04:38:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.501,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?C=C3=A9sar=20Belley?= <cesar.belley@lse.epita.fr>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just use qemu_open_old() for a quick fix, switch
to better error handling left for another day.

Fixes: 448058aa99aa ("util: rename qemu_open() to qemu_open_old()")
Cc: César Belley <cesar.belley@lse.epita.fr>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-id: 20200918110122.9121-1-kraxel@redhat.com
---
 hw/usb/u2f-emulated.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/usb/u2f-emulated.c b/hw/usb/u2f-emulated.c
index 9e1b829f3d32..9151feb63d44 100644
--- a/hw/usb/u2f-emulated.c
+++ b/hw/usb/u2f-emulated.c
@@ -200,7 +200,7 @@ static ssize_t u2f_emulated_read(const char *path, char *buffer,
     int fd;
     ssize_t ret;
 
-    fd = qemu_open(path, O_RDONLY);
+    fd = qemu_open_old(path, O_RDONLY);
     if (fd < 0) {
         return -1;
     }
@@ -217,7 +217,7 @@ static bool u2f_emulated_setup_counter(const char *path,
     int fd, ret;
     FILE *fp;
 
-    fd = qemu_open(path, O_RDWR);
+    fd = qemu_open_old(path, O_RDWR);
     if (fd < 0) {
         return false;
     }
-- 
2.27.0


