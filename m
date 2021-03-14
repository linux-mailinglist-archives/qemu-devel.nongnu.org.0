Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E792933A282
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 04:29:26 +0100 (CET)
Received: from localhost ([::1]:51686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLHRV-0004Ha-VE
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 22:29:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lLHMK-0006XP-Vt
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 22:24:06 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:35664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lLHMI-0004Sx-Tm
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 22:24:04 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 c76-20020a1c9a4f0000b029010c94499aedso18133291wme.0
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 19:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FBWETjBx7yR8JhCne1xrs11sERKEjTujz/IcxswUR6c=;
 b=PeQlarZHA8Q8SVrhCYuFtqbkvRlPrf7SMWwPYTOJ5qrLNlJiREAVqglAgKh4BGLLke
 mDnMmofpYYpzJi2WIf640C8ZW+gLZjuga6n4422KlQ+HC1R8Q+bPfYPJCMTmIqS2K6A6
 F6TlLkRQ2ROJQp1Dya54MF44IL6J428c/SNG+shu0v3omt/WLB/K/Ube9w4Wq4qYbk5J
 MwD3tU4Mv+EitCFRI+ZyiFT+yMQF73L/LJw19HmMOWIbSypRiD9Mfgs7XyKtpZvCtMCp
 quDMD8pQXWGKMpS4AL5NIg3OvRD4eYsc1opn/UyBkhG/gYxXcsQVOWZCxB+R5eCoDd0S
 4gxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FBWETjBx7yR8JhCne1xrs11sERKEjTujz/IcxswUR6c=;
 b=PxBuSz+rHvvXFmOGL9ccsTbYdE3cj7BGgEzy7Z8etFz2l06lvL38xzVsorc9cieetS
 QrzStqG9IRWAgb1mV7Nq0hsK8NdjjIqw7hMN7kEwd71GZpgxybeEjy1fqOLluSexStNr
 oZs55nd07AahvdkTzyjjhwrL7eR1VUHU740FtNcyKKVbEymyOShw+vkQ4U+WwthHrsCl
 ocqrSDq2mXd5IUZ0GmC8Xm4MnlpJwZvPthnfENPtkOgna4lXmSd62nlk9zOv+zZuozI+
 jSw9H4iHNxwz5+/qOgBH0uivHAyxf8fjWMZ0E+WZ9u/YcEK1FA1klK+s/Xiwkbo3V3+Y
 sc1A==
X-Gm-Message-State: AOAM531asKALMpTD/nxNXcEkiSDjcinBoh9JEheTaQBmfAIgdvc7yocW
 W50vyEXYmM57Ee+748oQpEuOGXwFQkw=
X-Google-Smtp-Source: ABdhPJxdIXS+YrhlhQAMGO2tdAUOEpd7VE+G4qViNr/uNDCzhPVD9kOL0KJCgnN8zxSi5wP0E0eOpg==
X-Received: by 2002:a05:600c:2282:: with SMTP id
 2mr20082767wmf.93.1615692241253; 
 Sat, 13 Mar 2021 19:24:01 -0800 (PST)
Received: from localhost.localdomain ([197.61.164.30])
 by smtp.googlemail.com with ESMTPSA id e1sm14922249wrd.44.2021.03.13.19.24.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 19:24:00 -0800 (PST)
From: Mahmoud Mandour <ma.mandourr@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/8] tools/virtiofsd/buffer.c: replaced a calloc call with
 GLib's g_try_new0
Date: Sun, 14 Mar 2021 05:23:22 +0200
Message-Id: <20210314032324.45142-7-ma.mandourr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210314032324.45142-1-ma.mandourr@gmail.com>
References: <20210314032324.45142-1-ma.mandourr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=ma.mandourr@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replaced a call to calloc() and its respective free() call
with GLib's g_try_new0() and g_free() calls.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
---
 tools/virtiofsd/buffer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/virtiofsd/buffer.c b/tools/virtiofsd/buffer.c
index 874f01c488..b5f04be356 100644
--- a/tools/virtiofsd/buffer.c
+++ b/tools/virtiofsd/buffer.c
@@ -37,7 +37,7 @@ static ssize_t fuse_buf_writev(struct fuse_buf *out_buf,
     struct iovec *iov;
     int fd = out_buf->fd;
 
-    iov = calloc(iovcnt, sizeof(struct iovec));
+    iov = g_try_new0(struct iovec, iovcnt);
     if (!iov) {
         return -ENOMEM;
     }
@@ -61,7 +61,7 @@ static ssize_t fuse_buf_writev(struct fuse_buf *out_buf,
         res = -errno;
     }
 
-    free(iov);
+    g_free(iov);
     return res;
 }
 
-- 
2.25.1


