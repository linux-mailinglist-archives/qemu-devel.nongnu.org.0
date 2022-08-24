Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1661D59F7A0
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 12:27:06 +0200 (CEST)
Received: from localhost ([::1]:55478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQnbF-0006Wl-6S
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 06:27:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmux-0004Rh-2S
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:43:24 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:34755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmut-0001mg-Mr
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:43:21 -0400
Received: by mail-pg1-x52e.google.com with SMTP id 12so14559970pga.1
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 02:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=paTY5YEP1jsreKma1QR+zPm4bWzf2LxlFPbO3yVctjg=;
 b=Tfd0/b2IXE9rDdRsV2eAJrgw/Z7ZClGxrdyqYWfsTtUJv2/Luw7dCdEsidgAb12sFO
 6PvwjO3hPjix1ZA/2PnK43cE8ClL88t6uKu1aUxIkIuWYDZko/QOyUrispBSNOvsxUn0
 fIg949JaNCA204JUfKbppItwJWdBa4LQNVQLpt+HYuEOJx50yWDfhuvugL+p3wOhpwgR
 bVUeUkrYGzOtu6DWc31mCXQS0Cgi+Ex1sQ28fuHyP9y3HOpjbn2HyKNODYtlBKTw+OLp
 kmAh1V6Oi0ed4FvuQdxggIn5iCDfCLqTWlHiVONyJ5qMXfNnEwn6xDCIVoJYGa4LT3X+
 i1iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=paTY5YEP1jsreKma1QR+zPm4bWzf2LxlFPbO3yVctjg=;
 b=iuKfZ+17byTuKqF1/A+QqqiK/HE4yOFNWXxn2X+DEhDvn9wDQi4KYbmBL5pXks0cVM
 FaC8Oiow2B7J4xQBI5gqVrkMsD0LN7f6wRqfnDq32jxletdX5kaXkth+SI8JRzOHK6JF
 /IWHmmeDkWo+Tj0LfbnDtMj45+tT5PBo5RTTs4qxjvo9Vr6QEafwbF7xKrtxgdJtaDAF
 mpy5twDaSUAddxSjKcisRmOO09A9O70nrXeXEt3K89w/l5qKMW5fx+OVjOTbgWuiGTjl
 dD0XAZr+EYC8S0UEpF77QwnsrkfJpBj6FNmeGXgiHiFcxm6hKHwDtAL/Mbzpli17bB80
 leNQ==
X-Gm-Message-State: ACgBeo0GP92JTq8C6v/MqFKgvXnRDuSw6xaLbAFkT9U8yBLJdfMjYu8U
 Vz19F4w9/aZwallLQpkhv2aTDF6WnK4=
X-Google-Smtp-Source: AA6agR7SAPzNS16io4sRXRVvDvfVpzFuYgcjDArHoCPwHchiIlN8E9IFExstYkptRzQ8OpcRb+fo3Q==
X-Received: by 2002:a62:38d4:0:b0:536:3cde:4d07 with SMTP id
 f203-20020a6238d4000000b005363cde4d07mr21804166pfa.66.1661334197213; 
 Wed, 24 Aug 2022 02:43:17 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a170903228e00b001728eb339e2sm12165972plh.286.2022.08.24.02.43.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 02:43:16 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 40/51] chardev/char-file: Add FILE_SHARE_WRITE when openning
 the file for win32
Date: Wed, 24 Aug 2022 17:40:18 +0800
Message-Id: <20220824094029.1634519-41-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824094029.1634519-1-bmeng.cn@gmail.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

The combination of GENERIC_WRITE and FILE_SHARE_READ options does
not allow the same file to be opened again by CreateFile() from
another QEMU process with the same options when the previous QEMU
process still holds the file handle openned.

As per [1] we should add FILE_SHARE_WRITE to the share mode to allow
such use case. This change makes the behavior be consisten with the
POSIX platforms.

[1] https://docs.microsoft.com/en-us/windows/win32/fileio/creating-and-opening-files

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 chardev/char-file.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/chardev/char-file.c b/chardev/char-file.c
index 2fd80707e5..66385211eb 100644
--- a/chardev/char-file.c
+++ b/chardev/char-file.c
@@ -60,8 +60,8 @@ static void qmp_chardev_open_file(Chardev *chr,
         flags = CREATE_ALWAYS;
     }
 
-    out = CreateFile(file->out, accessmode, FILE_SHARE_READ, NULL, flags,
-                     FILE_ATTRIBUTE_NORMAL, NULL);
+    out = CreateFile(file->out, accessmode, FILE_SHARE_READ | FILE_SHARE_WRITE,
+                     NULL, flags, FILE_ATTRIBUTE_NORMAL, NULL);
     if (out == INVALID_HANDLE_VALUE) {
         error_setg(errp, "open %s failed", file->out);
         return;
-- 
2.34.1


