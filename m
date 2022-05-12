Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B4F5258BF
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 01:53:14 +0200 (CEST)
Received: from localhost ([::1]:54114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npIcL-000170-JY
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 19:53:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1npIaR-0007Db-PB
 for qemu-devel@nongnu.org; Thu, 12 May 2022 19:51:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1npIaO-0005hD-Ko
 for qemu-devel@nongnu.org; Thu, 12 May 2022 19:51:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652399471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R50B4D9e4LU1l+ZBd6FIpWVVtqdYSRIaWclScqEgXO8=;
 b=P/IJPbRovNg2oVjzzdAL9e0FZwkuUtsDhDbG/1fHdXYqjR/GLqvrbSsI3b7jXK1NfCh4GD
 KoDFB/29P4PbDPfPi26WG0Ji2qFHEfTgnSpryViYDd+aFgyviKT+g556unnSmbWkJWPXob
 9MazNlbvINBs3WTRpSf6vFHV8fj9w2w=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-caRKUYtQPK6DgWBglqUtQQ-1; Thu, 12 May 2022 19:51:10 -0400
X-MC-Unique: caRKUYtQPK6DgWBglqUtQQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 j27-20020adfb31b000000b0020c4ca11566so2493000wrd.14
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 16:51:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R50B4D9e4LU1l+ZBd6FIpWVVtqdYSRIaWclScqEgXO8=;
 b=omoBXy6Fnk4mukgRXIB2/MmZ1Qxb8AI+cM7uLfL2H/SQZg5u0VtYgvbDRG50a48+VJ
 IkqIqzBhNdb4PP8LjrdJsz9btFP6gl79TY3VSajLLiAVmqY54vSrJbdebCDGj0W6wPTX
 3fRudROBqQWN9iJpCLHaZn57NzqDE+VedHE7MH/2KKD/fBjVKHE7YD1nqpwh3SiDdOIj
 uLrCw932MjxktReUDsnPJWZj1eM5S+H+VIEc28y0dkBMhrXE/++w07mX9wMcxiwN0fkX
 OUe9E9y83T/Fq8UXAoi/iKEeFyXuD4+7It52jQ9GYMBzWJ1j+cy4KIA8KivwzWw7Db6t
 f9sA==
X-Gm-Message-State: AOAM530IfKQNG9IgiZhsdbkug8aNwaMWQRxxuK2RmLmM+2DUaWGmVS91
 cmFthUPpOXINdQVIOFwmZNSYZXFtej/SOmXPlaC1+KRUqTASLsxcRF0vGfHtmK1IqoVCLaC/pmr
 f30GK5XoiGLCesbszJfdQHxcaxOaD6Tn2BCBcYXi37w6e5/BABX0vVTakFrBDb9lp
X-Received: by 2002:a5d:5966:0:b0:20a:e810:5e9d with SMTP id
 e38-20020a5d5966000000b0020ae8105e9dmr1614326wri.240.1652399469340; 
 Thu, 12 May 2022 16:51:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhIwQt23qNOwHZxMZe9Qbbx/KXAPzFAF3MdWnFcVhkhPsnHTcCjNndTkEx739ZDnMRrM6lvA==
X-Received: by 2002:a5d:5966:0:b0:20a:e810:5e9d with SMTP id
 e38-20020a5d5966000000b0020ae8105e9dmr1614310wri.240.1652399469063; 
 Thu, 12 May 2022 16:51:09 -0700 (PDT)
Received: from DESKTOP-E7ACR7D.lan ([2001:8a0:f4d9:2101:a4fa:5f93:755f:6249])
 by smtp.gmail.com with ESMTPSA id
 a25-20020adfb519000000b0020c5253d90asm678577wrd.86.2022.05.12.16.51.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 16:51:08 -0700 (PDT)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Alberto Faria <afaria@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH 6/7] block: Implement bdrv_{pread, pwrite,
 pwrite_zeroes}() using generated_co_wrapper
Date: Fri, 13 May 2022 00:51:02 +0100
Message-Id: <20220512235103.2224817-3-afaria@redhat.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220512233849.2219275-1-afaria@redhat.com>
References: <20220512233849.2219275-1-afaria@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alberto Faria <afaria@redhat.com>
---
 block/io.c               | 41 ----------------------------------------
 include/block/block-io.h | 15 +++++++++------
 2 files changed, 9 insertions(+), 47 deletions(-)

diff --git a/block/io.c b/block/io.c
index 78a289192e..ecd1c2a53c 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1061,14 +1061,6 @@ static int bdrv_check_request32(int64_t offset, int64_t bytes,
     return 0;
 }
 
-int bdrv_pwrite_zeroes(BdrvChild *child, int64_t offset,
-                       int64_t bytes, BdrvRequestFlags flags)
-{
-    IO_CODE();
-    return bdrv_pwritev(child, offset, bytes, NULL,
-                        BDRV_REQ_ZERO_WRITE | flags);
-}
-
 /*
  * Completely zero out a block device with the help of bdrv_pwrite_zeroes.
  * The operation is sped up by checking the block status and only writing
@@ -1111,39 +1103,6 @@ int bdrv_make_zero(BdrvChild *child, BdrvRequestFlags flags)
     }
 }
 
-/* See bdrv_pwrite() for the return codes */
-int bdrv_pread(BdrvChild *child, int64_t offset, int64_t bytes, void *buf,
-               BdrvRequestFlags flags)
-{
-    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
-    IO_CODE();
-
-    if (bytes < 0) {
-        return -EINVAL;
-    }
-
-    return bdrv_preadv(child, offset, bytes, &qiov, flags);
-}
-
-/* Return no. of bytes on success or < 0 on error. Important errors are:
-  -EIO         generic I/O error (may happen for all errors)
-  -ENOMEDIUM   No media inserted.
-  -EINVAL      Invalid offset or number of bytes
-  -EACCES      Trying to write a read-only device
-*/
-int bdrv_pwrite(BdrvChild *child, int64_t offset, int64_t bytes,
-                const void *buf, BdrvRequestFlags flags)
-{
-    QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
-    IO_CODE();
-
-    if (bytes < 0) {
-        return -EINVAL;
-    }
-
-    return bdrv_pwritev(child, offset, bytes, &qiov, flags);
-}
-
 /*
  * Writes to the file and ensures that no writes are reordered across this
  * request (acts as a barrier)
diff --git a/include/block/block-io.h b/include/block/block-io.h
index 879221cebe..c81739ad16 100644
--- a/include/block/block-io.h
+++ b/include/block/block-io.h
@@ -39,13 +39,16 @@
  * to catch when they are accidentally called by the wrong API.
  */
 
-int bdrv_pwrite_zeroes(BdrvChild *child, int64_t offset,
-                       int64_t bytes, BdrvRequestFlags flags);
+int generated_co_wrapper bdrv_pwrite_zeroes(BdrvChild *child, int64_t offset,
+                                            int64_t bytes,
+                                            BdrvRequestFlags flags);
 int bdrv_make_zero(BdrvChild *child, BdrvRequestFlags flags);
-int bdrv_pread(BdrvChild *child, int64_t offset, int64_t bytes, void *buf,
-               BdrvRequestFlags flags);
-int bdrv_pwrite(BdrvChild *child, int64_t offset, int64_t bytes,
-                const void *buf, BdrvRequestFlags flags);
+int generated_co_wrapper bdrv_pread(BdrvChild *child, int64_t offset,
+                                    int64_t bytes, void *buf,
+                                    BdrvRequestFlags flags);
+int generated_co_wrapper bdrv_pwrite(BdrvChild *child, int64_t offset,
+                                     int64_t bytes, const void *buf,
+                                     BdrvRequestFlags flags);
 int bdrv_pwrite_sync(BdrvChild *child, int64_t offset, int64_t bytes,
                      const void *buf, BdrvRequestFlags flags);
 /*
-- 
2.35.3


