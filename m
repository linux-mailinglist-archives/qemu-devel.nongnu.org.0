Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 536FF131796
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jan 2020 19:37:58 +0100 (CET)
Received: from localhost ([::1]:57846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioXGG-0000MG-T8
	for lists+qemu-devel@lfdr.de; Mon, 06 Jan 2020 13:37:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45615)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <danielhb413@gmail.com>) id 1ioX4K-0002JJ-BQ
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 13:25:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <danielhb413@gmail.com>) id 1ioX4J-0004MJ-7S
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 13:25:36 -0500
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843]:39824)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <danielhb413@gmail.com>)
 id 1ioX4I-0004L2-9O; Mon, 06 Jan 2020 13:25:34 -0500
Received: by mail-qt1-x843.google.com with SMTP id e5so43198338qtm.6;
 Mon, 06 Jan 2020 10:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y47zerruHLKnazd5IMxKseByHsW/6i/5CiO+7Hn42cc=;
 b=N8rxMvdHf4A/3o5xqX4MyRD1wroOF4aAuhBB9UIwOm8VXaGINh8qjaBdNp1INFvW2r
 yGP6D15XY0i+DiNbgLmSvQyy9d3KYt/2OxFG1IPmYy1tTMjHAv+tv2+Wn5v5Hwt6vKg1
 lr8s5/OnNPsOdj+vEEQgQ+jsjdZ0mJvAkdYbu3jOBRZiR0jOVvLB+0BSKDyH4lMFHznQ
 8gAI101vjjslILxFIuztIHU1A0zk7GK2z74u9S8MXHqZMxPsXBMTCRpoyOEss2nZq1LO
 /T2EfUe8qW0Bl4GFlFY7iYPgDDJXp23Z8XlHC21Y2+rB9BDgV1P3O8IYidxPUZjxdnSB
 ly7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y47zerruHLKnazd5IMxKseByHsW/6i/5CiO+7Hn42cc=;
 b=mZZnGzHp4A5pdNJshH0i81NOtibZ4YutejOt62Zw1GCMK18jRpDxxbgG2mGDEpg+21
 MIz3sxNPRHDIjF2Hip5X5zqDy2Bjpysh431HWS0gESRntwoCnBlM6CKzM+6GMJlRFCAa
 nfQf5welkjVRC6L5Nsra9DvSef6UUv0rJufs+OSFlgYBLM8tfLhTCcQTQTaIL9qyu1Xf
 6qFDjOzOZgRs7zplJaqNtkq0OZlYpWeNtn1o0PjsQdHxZeMuO9pet1ZsBk1cTJG3LZOY
 4/f5ESglv0sSPEYcsqpxNoi0etFmyCgVOL3aIto2XHfkv16/xu5ozeHZSdnClt79J/iJ
 Sb+g==
X-Gm-Message-State: APjAAAXioV5bpUgsyz7iTZx+wrNVq9AkQbWaQaOEj6CUXz3Qh2ZS3dfa
 HKvUGgjHidkdoRAee9vG3Ja/b0Gv
X-Google-Smtp-Source: APXvYqxOJvAIFe2aON1mojikbvIS4MLMgIN8ozVRuscfhAULtmFMGA9/PLVL5pjm5WirxAR4821FrQ==
X-Received: by 2002:ac8:490f:: with SMTP id e15mr72868547qtq.32.1578335133194; 
 Mon, 06 Jan 2020 10:25:33 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:655b:9e1c:e865:3705:e1df])
 by smtp.gmail.com with ESMTPSA id b81sm21026522qkc.135.2020.01.06.10.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2020 10:25:32 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 23/59] block/vxhs.c: remove unneeded 'out' label in
 vxhs_iio_callback()
Date: Mon,  6 Jan 2020 15:23:49 -0300
Message-Id: <20200106182425.20312-24-danielhb413@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200106182425.20312-1-danielhb413@gmail.com>
References: <20200106182425.20312-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::843
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
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

'out' is just a 'return' call.

CC: Kevin Wolf <kwolf@redhat.com>
CC: qemu-block@nongnu.org
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 block/vxhs.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/block/vxhs.c b/block/vxhs.c
index d79fc97df6..e3db367918 100644
--- a/block/vxhs.c
+++ b/block/vxhs.c
@@ -96,7 +96,7 @@ static void vxhs_iio_callback(void *ctx, uint32_t opcode, uint32_t error)
             acb = ctx;
         } else {
             trace_vxhs_iio_callback(error);
-            goto out;
+            return;
         }
 
         if (error) {
@@ -122,8 +122,6 @@ static void vxhs_iio_callback(void *ctx, uint32_t opcode, uint32_t error)
         }
         break;
     }
-out:
-    return;
 }
 
 static QemuOptsList runtime_opts = {
-- 
2.24.1


