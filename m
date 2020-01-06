Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BED1317B4
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jan 2020 19:43:34 +0100 (CET)
Received: from localhost ([::1]:57950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioXLg-00009u-J4
	for lists+qemu-devel@lfdr.de; Mon, 06 Jan 2020 13:43:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45764)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <danielhb413@gmail.com>) id 1ioX4Q-0002TH-Pc
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 13:25:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <danielhb413@gmail.com>) id 1ioX4P-0004TI-NN
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 13:25:42 -0500
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:40866)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <danielhb413@gmail.com>)
 id 1ioX4P-0004Sr-Jq; Mon, 06 Jan 2020 13:25:41 -0500
Received: by mail-qk1-x735.google.com with SMTP id c17so40290906qkg.7;
 Mon, 06 Jan 2020 10:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5cBjVRTpORMTQVS8zXhW7QTuSicvsXs51ybQld+rw8U=;
 b=X1gKjg8PQhYPv5gcSNzBZPcGOjMWmJ4yS8Ffu/1zmXHxJcXeNGvb62g73d8cyJMzXk
 gUa1mznTs1qvuP6ot1jQ5iBQ1aTndK13gojoefCM/jLxSUeVjgLwzDruRIZClOfDlehW
 u0/sdxFTcfYqrD23E0BFIXcTRQDkfUz6jWXbDIRpJ4UBcJ4/9MbrAbaGmYHTjZ2ZtgHe
 a/9gSoghL4JsgW63lfIrqtPpe2uyZ9huUFjhiCcF2JLh+4F+xBcjwFh8L0YZDmWbieis
 ORXOhLxFO4tn/IGG5jOT+/QdTaOeG5WSxXvt1o2q1PBzViWW8mgt3WSjrkxMF+NseBjO
 EqfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5cBjVRTpORMTQVS8zXhW7QTuSicvsXs51ybQld+rw8U=;
 b=Nt3YxGW01+tnU0F4to7Bn8EqjGGXK/mzZd6z5L9KQq+1Y3i4DemWYcpykm81Mhup7G
 Ia0iLMyi86oPbxedVzEfRFBaps8Wt821UeUkJAbTqtnQU7ExSi0G5iHxdpgnqbRs901o
 2+IOqV3bITszc7yNW9IrMJH9vdvmjqJ9ZZyohHz45hOQNo95FMtOMv51DWcW4PuXMv33
 /+QyYx0dt8qJv2w4PfHhzl12rQUhCr/QgT51rGRUGOeLF0qaNHek5nRdr7chMzpu0fnO
 J+7HOaJnXJhh6xiIeej9Kncgfi8b2sd1i42tSwq6k58a9W9afsNQ5qRBzVzRnBNYbaoS
 1Ijg==
X-Gm-Message-State: APjAAAWBVcVo2f29mkyPUerAPN+8XzTjSOTBPa7J+yO/QEUb5GBxx26M
 kH3VGKG80pXTpwMErt6zhE+XD30M
X-Google-Smtp-Source: APXvYqxedHDi5UiIn6Ox/FRAahaP05DzZ24yJxrpBkoIXp/fo+o0u+VfbhhfxtEQK5ufObtyaj2sHw==
X-Received: by 2002:a05:620a:1eb:: with SMTP id
 x11mr85685346qkn.254.1578335140987; 
 Mon, 06 Jan 2020 10:25:40 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:655b:9e1c:e865:3705:e1df])
 by smtp.gmail.com with ESMTPSA id b81sm21026522qkc.135.2020.01.06.10.25.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2020 10:25:40 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 27/59] crypto/block-luks.c: remove unneeded label in
 qcrypto_block_luks_find_key
Date: Mon,  6 Jan 2020 15:23:53 -0300
Message-Id: <20200106182425.20312-28-danielhb413@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200106182425.20312-1-danielhb413@gmail.com>
References: <20200106182425.20312-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::735
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
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

'error' can be replaced by 'return -1' directly.

CC: Kevin Wolf <kwolf@redhat.com>
CC: Max Reitz <mreitz@redhat.com>
CC: qemu-block@nongnu.org
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 crypto/block-luks.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/crypto/block-luks.c b/crypto/block-luks.c
index 4861db810c..9742d4bdd9 100644
--- a/crypto/block-luks.c
+++ b/crypto/block-luks.c
@@ -1057,7 +1057,7 @@ qcrypto_block_luks_find_key(QCryptoBlock *block,
                                          opaque,
                                          errp);
         if (rv < 0) {
-            goto error;
+            return -1;
         }
         if (rv == 1) {
             return 0;
@@ -1065,7 +1065,6 @@ qcrypto_block_luks_find_key(QCryptoBlock *block,
     }
 
     error_setg(errp, "Invalid password, cannot unlock any keyslot");
- error:
     return -1;
 }
 
-- 
2.24.1


