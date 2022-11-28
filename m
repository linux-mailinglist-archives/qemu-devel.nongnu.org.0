Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC9063AABA
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Nov 2022 15:18:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozewA-0008Nv-EX; Mon, 28 Nov 2022 09:16:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1ozevY-0008EQ-SH
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 09:16:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1ozevW-0005SN-Iq
 for qemu-devel@nongnu.org; Mon, 28 Nov 2022 09:16:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669644961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r8BwCjwIv56ryutNz6xJ/e48LVbcViq+vpSmW1/ifRI=;
 b=ga0gChLt2UJiOLcsVJ23x2a+S74s5xZlM7cHvP/85Mz1nofHBROU0r4t29Ym2RvlMh/z7b
 z1vug+2+QthzBhiU3MNx3qKiX91wiADpgNQqbe93bAVrNbcsptrZlpVaY1bAcFuqJLv6Rt
 WR1l8JOx35kYqv1ns6UHUsz1MIvdQpw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-490-l9YqmRm0MYuYH6b3mID9qw-1; Mon, 28 Nov 2022 09:15:58 -0500
X-MC-Unique: l9YqmRm0MYuYH6b3mID9qw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 408BF3C3C130;
 Mon, 28 Nov 2022 14:15:19 +0000 (UTC)
Received: from loop.redhat.com (unknown [10.35.206.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 522362166B4B;
 Mon, 28 Nov 2022 14:15:17 +0000 (UTC)
From: Nir Soffer <nsoffer@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Nir Soffer <nsoffer@redhat.com>
Subject: [PATCH v2 1/5] qemu-img.c: Move IO_BUF_SIZE to the top of the file
Date: Mon, 28 Nov 2022 16:15:10 +0200
Message-Id: <20221128141514.388724-2-nsoffer@redhat.com>
In-Reply-To: <20221128141514.388724-1-nsoffer@redhat.com>
References: <20221128141514.388724-1-nsoffer@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=nsoffer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This macro is used by various commands (compare, convert, rebase) but it
is defined somewhere in the middle of the file. I'm going to use it in
the new checksum command so lets clean up a bit before that.
---
 qemu-img.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/qemu-img.c b/qemu-img.c
index a9b3a8103c..c03d6b4b31 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -49,20 +49,21 @@
 #include "block/block_int.h"
 #include "block/blockjob.h"
 #include "block/qapi.h"
 #include "crypto/init.h"
 #include "trace/control.h"
 #include "qemu/throttle.h"
 #include "block/throttle-groups.h"
 
 #define QEMU_IMG_VERSION "qemu-img version " QEMU_FULL_VERSION \
                           "\n" QEMU_COPYRIGHT "\n"
+#define IO_BUF_SIZE (2 * MiB)
 
 typedef struct img_cmd_t {
     const char *name;
     int (*handler)(int argc, char **argv);
 } img_cmd_t;
 
 enum {
     OPTION_OUTPUT = 256,
     OPTION_BACKING_CHAIN = 257,
     OPTION_OBJECT = 258,
@@ -1281,22 +1282,20 @@ static int compare_buffers(const uint8_t *buf1, const uint8_t *buf2,
         if (!!memcmp(buf1 + i, buf2 + i, len) != res) {
             break;
         }
         i += len;
     }
 
     *pnum = i;
     return res;
 }
 
-#define IO_BUF_SIZE (2 * MiB)
-
 /*
  * Check if passed sectors are empty (not allocated or contain only 0 bytes)
  *
  * Intended for use by 'qemu-img compare': Returns 0 in case sectors are
  * filled with 0, 1 if sectors contain non-zero data (this is a comparison
  * failure), and 4 on error (the exit status for read errors), after emitting
  * an error message.
  *
  * @param blk:  BlockBackend for the image
  * @param offset: Starting offset to check
-- 
2.38.1


