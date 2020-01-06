Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 438DA131795
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jan 2020 19:37:25 +0100 (CET)
Received: from localhost ([::1]:57844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioXFj-0007xF-Oo
	for lists+qemu-devel@lfdr.de; Mon, 06 Jan 2020 13:37:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45265)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <danielhb413@gmail.com>) id 1ioX3z-0001rK-Cu
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 13:25:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <danielhb413@gmail.com>) id 1ioX3y-00041B-AV
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 13:25:15 -0500
Received: from mail-qv1-xf42.google.com ([2607:f8b0:4864:20::f42]:42440)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <danielhb413@gmail.com>)
 id 1ioX3y-00040c-6Y; Mon, 06 Jan 2020 13:25:14 -0500
Received: by mail-qv1-xf42.google.com with SMTP id dc14so19417067qvb.9;
 Mon, 06 Jan 2020 10:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2sphsqeXWmt2nxo4pNzgWsK8+C0EHag/7k5lhcriuzg=;
 b=Av4AJcvtOUy0CPFhaBCz5ZiTaJBTugY4UUMcxbFchMXiPFODV4/+bNN9oek01Hr/mm
 a+/YWlQVlxaYId52fmeEyF/wjVdQuaEwy99GiNaewgcGiIa3Nv3loeoxiCUZ2s6MKPrT
 BiLcFeXvdMBLWJdGlch/A64fEP1Ukve/Pdv3iu8pS0KKCP7j/LoySaaEWLYU4tmUUUr9
 3ffW3i+21mwvqfyC5jabllUT9zp/qIx3GWzKRIAhyNmhkILZBp0eg4nNBWfyHSL9XG3Z
 gvCPOWw/UbeyXTMnxAR9eNtVIIZ5OnEVgjg5cPpspNheg3OYOPNdwvH2K+V8ilyvTxEg
 /UMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2sphsqeXWmt2nxo4pNzgWsK8+C0EHag/7k5lhcriuzg=;
 b=SnwP7x/kyX8olKKXOUPJ7WLKZEzrSqSINF0BtW1ZT2G5hrc4pvpQV95edIVSBxfiwx
 Mq5E0azDCotqmm7WaLS2B7hE7iHgp4rd4WTGIAUmyM2DpZ9OFn5qzoMpe//wHevrcSfk
 diY9cVEsRoJIih5Kbdc4eZTR8VgtfzBsDBxat9idszbsqXokLS48o7Y8ZzVzDJ1nBG/z
 EI1oejSGXctA/Hx8E3v74IGfhpkFdxhAYqiPin+3kbLTgNT7VxbxCMt8GJdFwyqTjLcX
 w2s3uND5RxmYM6pMkh6mqWJVQQbAwMy3A8fJZvqmNKVfL3PW3FToyVfVhcmczhVGjHey
 tw5g==
X-Gm-Message-State: APjAAAW7CdJD1EXF7wOoCGjAxr7/dxWmpzOT5Cfv2kBDiaeHKnN05NkO
 8vJetJ1FJTp0rWuXVWN1bYG7juu0
X-Google-Smtp-Source: APXvYqxbEPLQoXbbC7smuVlCk3eHBMp7zY0FXnL4X+Wuae99p+OfYQTKcEB/oFd0Z+KlU3OEqpDJrw==
X-Received: by 2002:ad4:4e68:: with SMTP id ec8mr80760104qvb.203.1578335113486; 
 Mon, 06 Jan 2020 10:25:13 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:655b:9e1c:e865:3705:e1df])
 by smtp.gmail.com with ESMTPSA id b81sm21026522qkc.135.2020.01.06.10.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2020 10:25:12 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 12/59] virtfs-proxy-helper.c: remove 'err_out' label in
 setugid()
Date: Mon,  6 Jan 2020 15:23:38 -0300
Message-Id: <20200106182425.20312-13-danielhb413@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200106182425.20312-1-danielhb413@gmail.com>
References: <20200106182425.20312-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::f42
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
Cc: qemu-trivial@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

'err_out' can be removed and be replaced by 'return -errno'
in its only instance in the function.

CC: Greg Kurz <groug@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 fsdev/virtfs-proxy-helper.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
index 0d4de49dcf..aa1ab2590d 100644
--- a/fsdev/virtfs-proxy-helper.c
+++ b/fsdev/virtfs-proxy-helper.c
@@ -287,8 +287,7 @@ static int setugid(int uid, int gid, int *suid, int *sgid)
     *sgid = getegid();
 
     if (setresgid(-1, gid, *sgid) == -1) {
-        retval = -errno;
-        goto err_out;
+        return -errno;
     }
 
     if (setresuid(-1, uid, *suid) == -1) {
@@ -322,7 +321,6 @@ err_sgid:
     if (setresgid(-1, *sgid, *sgid) == -1) {
         abort();
     }
-err_out:
     return retval;
 }
 
-- 
2.24.1


