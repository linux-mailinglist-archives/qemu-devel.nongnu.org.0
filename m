Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2419E2B5366
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 22:06:08 +0100 (CET)
Received: from localhost ([::1]:46294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kelhP-0008WD-7A
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 16:06:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kelbT-0004H9-F9
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 16:00:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kelbN-0000KE-86
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 15:59:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605560389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V11KLkqw+wmdHrH3OZZvJC1E55fFJqwEQfjgvVj/53M=;
 b=LWUq6+ZFRpxbnMuQs+iaVfmJWD6P7IYnkv3pJgvZHK+3oM9qQCWx0pbl21JPFtQGC6gK+t
 UKgGWNfnGCY6hzKxcPpvnOskSUSbmAvXJYhbq6G1mAIu/04p78cGnmwj+Ie9IWVh3Zyc1I
 gbPuTq8r5Y7LNoH+hVFcuF6co4vHlYA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-KiHS0AK-O0WydrrY7Fx5oQ-1; Mon, 16 Nov 2020 15:59:46 -0500
X-MC-Unique: KiHS0AK-O0WydrrY7Fx5oQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F285A8015A3;
 Mon, 16 Nov 2020 20:59:44 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-36.phx2.redhat.com [10.3.113.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A369119C66;
 Mon, 16 Nov 2020 20:59:44 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/2] nbd: Silence Coverity false positive
Date: Mon, 16 Nov 2020 14:59:41 -0600
Message-Id: <20201116205942.109534-2-eblake@redhat.com>
In-Reply-To: <20201116205942.109534-1-eblake@redhat.com>
References: <20201116205942.109534-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 22:35:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Coverity noticed (CID 1436125) that we check the return value of
nbd_extent_array_add in most places, but not at the end of
bitmap_to_extents().  The return value exists to break loops before a
future iteration, so there is nothing to check if we are already done
iterating.  Adding a cast to void, plus a comment why, pacifies
Coverity.

Signed-off-by: Eric Blake <eblake@redhat.com>
Message-Id: <20201111163510.713855-1-eblake@redhat.com>
[eblake: Prefer cast to void over odd && usage]
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 nbd/server.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/nbd/server.c b/nbd/server.c
index d145e1a69083..613ed2634ada 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -2129,8 +2129,8 @@ static void bitmap_to_extents(BdrvDirtyBitmap *bitmap,
     }

     if (!full) {
-        /* last non dirty extent */
-        nbd_extent_array_add(es, end - start, 0);
+        /* last non dirty extent, nothing to do if array is now full */
+        (void) nbd_extent_array_add(es, end - start, 0);
     }

     bdrv_dirty_bitmap_unlock(bitmap);
-- 
2.28.0


