Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2ABC2C5320
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 12:36:18 +0100 (CET)
Received: from localhost ([::1]:39954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiFZR-0000aG-Nc
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 06:36:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kiFTh-0003NO-E6
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 06:30:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kiFTf-0006Qg-Hl
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 06:30:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606390218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iHYSa9kEpwoKzIqL0kHciIz6Aw/ueVjJb1/YiLOQ2lU=;
 b=P6hV7tyW1K0RJBDxk+z2UCc/9Ka7AD5iUv9vjFUTlKTldlDcLp+ahL2YaKfJCd8B/tV7lb
 MJsox2+wC7U6kJnc573GOeFyNJ/U9fx5EmMX86ry9YVJ7eHOgvZr2WqpptGVz+ZV9X5EHF
 A+d6HvY0AEJ6avE+0bUlrD3ARBXv5do=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-coOtc-lROBCOtl73WNzlYA-1; Thu, 26 Nov 2020 06:30:14 -0500
X-MC-Unique: coOtc-lROBCOtl73WNzlYA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 962B78049C1;
 Thu, 26 Nov 2020 11:30:13 +0000 (UTC)
Received: from localhost (unknown [10.36.110.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8A33560C6A;
 Thu, 26 Nov 2020 11:30:08 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/13] virtiofsd: replace _Static_assert with
 QEMU_BUILD_BUG_ON
Date: Thu, 26 Nov 2020 15:29:09 +0400
Message-Id: <20201126112915.525285-8-marcandre.lureau@redhat.com>
In-Reply-To: <20201126112915.525285-1-marcandre.lureau@redhat.com>
References: <20201126112915.525285-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, philmd@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

This allows to get rid of a check for older GCC version (which was a bit
bogus too since it was falling back on c++ version..)

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 tools/virtiofsd/fuse_common.h | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/tools/virtiofsd/fuse_common.h b/tools/virtiofsd/fuse_common.h
index 5aee5193eb..a2484060b6 100644
--- a/tools/virtiofsd/fuse_common.h
+++ b/tools/virtiofsd/fuse_common.h
@@ -809,15 +809,6 @@ void fuse_remove_signal_handlers(struct fuse_session *se);
  *
  * On 32bit systems please add -D_FILE_OFFSET_BITS=64 to your compile flags!
  */
-
-#if defined(__GNUC__) &&                                      \
-    (__GNUC__ > 4 || __GNUC__ == 4 && __GNUC_MINOR__ >= 6) && \
-    !defined __cplusplus
-_Static_assert(sizeof(off_t) == 8, "fuse: off_t must be 64bit");
-#else
-struct _fuse_off_t_must_be_64bit_dummy_struct {
-    unsigned _fuse_off_t_must_be_64bit:((sizeof(off_t) == 8) ? 1 : -1);
-};
-#endif
+QEMU_BUILD_BUG_ON(sizeof(off_t) != 8);
 
 #endif /* FUSE_COMMON_H_ */
-- 
2.29.0


