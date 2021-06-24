Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5743B3563
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 20:13:51 +0200 (CEST)
Received: from localhost ([::1]:36494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwTrK-0006W8-2r
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 14:13:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwTiT-00081b-Df; Thu, 24 Jun 2021 14:04:41 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:34420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwTiQ-0001Uj-Bh; Thu, 24 Jun 2021 14:04:41 -0400
Received: by mail-ed1-x529.google.com with SMTP id i5so9849710eds.1;
 Thu, 24 Jun 2021 11:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wJvWsUqGOQTva1vOWOjj4YQ10DwGdZUCbC7uWnekL7s=;
 b=VDexv85f/KxfmkV+D3FzBX/Q6qs0DzStLWOMaKTpnI/Y+trWcyeHZeS2NxkwL9xvmb
 Xl6qcLa4AgPIgTb2CWHQNfTNbu8tM1wbGSWQe26LkP/dU17SzZHqTvSkt7laorndZc/u
 RbVZIuCnQm7dtsJMJJYb+Mf5Rbxslc0hCSqP13qFN0hdtCXJd//lcfSX6q3N4hAK/R/r
 Qqwfp45jDPiFfLmtHwM0EbmtyIPmAhc/UpvYphzJjYJlo8pZRkD7Mhio38uIA6QlHvix
 B8TNACQZJRsUsqB+oK30rn0TdldeAOYyl3ZOC/fiCrBKiF4alkjE3F1v01NMxmpxnX4c
 rrEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wJvWsUqGOQTva1vOWOjj4YQ10DwGdZUCbC7uWnekL7s=;
 b=hRbXI6AB52ba8mTsOcgFcm7O5gT5Mr8/gcLiDWFmuXXPfMp1tIx+ktvEyJiCHCblIk
 vuSeiPnYknw2JZNd2QXVFIQt8XCi7gRXsP/XCene4jtbgj5KCmWW+RI3+1qezDwdIGTG
 qaBeOy9fufOUwRcACbeifJPzOmpZgB4qPKGbU1PAqj1aHpREBQzwjwGbbM9ovqQ+DovC
 7XA09ylHlltTHXyRt2a2q01Tqki4wGoq283iVFAXWd+s1d9yK763W7u3m0PIeoviQuPl
 E8BXWXNS1RYPjmtOTIijFILcpXVY4TJXqJOK04BkUMkv12m97Lo35V4uwlhcEBzFWa+o
 mxIw==
X-Gm-Message-State: AOAM531rMck0XAk8iOwDB7BiBywyyUEMW58vzqssxIEWjm4iobSpqnJb
 uEvnucW+uPf37vyMKtvB5/hs8ysBg98=
X-Google-Smtp-Source: ABdhPJxNAoJkHoFI/N6ikIg6xr4dOQ5I2hqDxbsumuw8zSgdC4cyCXTDzkEMgDPIJqWgE/Z82QlCYg==
X-Received: by 2002:aa7:c3d6:: with SMTP id l22mr9003804edr.245.1624557875158; 
 Thu, 24 Jun 2021 11:04:35 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id a1sm2436466edt.16.2021.06.24.11.04.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 11:04:34 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/11] file-posix: handle EINTR during ioctl
Date: Thu, 24 Jun 2021 20:04:23 +0200
Message-Id: <20210624180423.1322165-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210624180423.1322165-1-pbonzini@redhat.com>
References: <20210624180423.1322165-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: mreitz@redhat.com, Gordon Watson <gwatson@redhat.com>,
 qemu-block@nongnu.org, mlevitsk@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Similar to other handle_aiocb_* functions, handle_aiocb_ioctl needs to cater
for the possibility that ioctl is interrupted by a signal.  Otherwise, the
I/O is incorrectly reported as a failure to the guest.

Reported-by: Gordon Watson <gwatson@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/file-posix.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 74b8216077..a26eab0ac3 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1347,7 +1347,9 @@ static int handle_aiocb_ioctl(void *opaque)
     RawPosixAIOData *aiocb = opaque;
     int ret;
 
-    ret = ioctl(aiocb->aio_fildes, aiocb->ioctl.cmd, aiocb->ioctl.buf);
+    do {
+        ret = ioctl(aiocb->aio_fildes, aiocb->ioctl.cmd, aiocb->ioctl.buf);
+    } while (ret == -1 && errno == EINTR);
     if (ret == -1) {
         return -errno;
     }
-- 
2.31.1


