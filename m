Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E2B42CFCC
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 03:03:57 +0200 (CEST)
Received: from localhost ([::1]:54898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mapA4-0006Fx-6i
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 21:03:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1manIk-00048l-IC
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 19:04:47 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:38731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1manIc-0004U3-SW
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 19:04:44 -0400
Received: by mail-qt1-x829.google.com with SMTP id t16so4190636qto.5
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 16:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hLvo/Ohp80+sBHkJWP+s69vvT0EaEBpeY5AiAd1sZVw=;
 b=QcM75KtIPIN875cB7KJcYVOVuHyp/VzKq/eUbwx9jTuKSWfoWt5i66+QP7ZWvuTUZo
 d+RdX71WEdKIL5RyMXvS3vT55Ln7OWKy2NYTIAXbUEpbzrHYSLylmz7GXef4mK1uMtuD
 zfP3BCiobhvFnhdn29w2JdpX8ge8bQhxzVoFS2eZWOvczQ21G/6bGgLu3dl3ba+ubz8E
 Ai4vTSiufrRMLeB6FSuvfdpOEBCW/6adwsaRGxUmZEnO0zfLsXdLM8B8TcubbKXPz78o
 /8N3EDaT3f0UdpYJB2fUDmin1GU96+qM91mWk+PtO65YcyRlKYgKT4XRu6rrr0LwI4v5
 RCgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hLvo/Ohp80+sBHkJWP+s69vvT0EaEBpeY5AiAd1sZVw=;
 b=5tF5QmqibCvhifH1rMk/ooKLTohn4Oug+vwMnKjkBM1XNpp5luKaI/M5nw7VV0wIXc
 qplIRB4EpJPF03UtNFZ+o4NzZezAPzuv7E47ht28MPXfVDR3jYmJAhARZqAhXn/7YE2O
 icha26I5QZNr7t+3ITDspwVPvzdqQbMrJ5UPvTn4teSvYnFQalDYhO0td0ziyzYwO4ym
 tkTRNMai6UPkYiAZ6OFxiDXXgF6CdIBIoKxAcJZVKubx31X/MTLfjC7vZRYEIp5dKNm2
 gTwNeDjY89n/wZ1BLfRkCN5XySNZPs7JDX2pxrULht76A09TzJslhIf8LjJ305FcN5eV
 o/Uw==
X-Gm-Message-State: AOAM530bdw4YJG3tgEaWYA8rVx35cQVcCOS430qf+ON3QE+ssBmvcGZY
 P8aU3V8Ds2/l5ZZypDETVsTGpQQXfjH5fQ==
X-Google-Smtp-Source: ABdhPJwo5mJBLAehqaAfknsbz0eZJfKwUpmP+J1vOfn7Kr0yiHD6MfYUEWxIBAd+ClX1gECt80JS6g==
X-Received: by 2002:a05:622a:290:: with SMTP id
 z16mr2525330qtw.358.1634166276535; 
 Wed, 13 Oct 2021 16:04:36 -0700 (PDT)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id w11sm778680qta.50.2021.10.13.16.04.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 13 Oct 2021 16:04:36 -0700 (PDT)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/11] 9p: darwin: Ignore O_{NOATIME, DIRECT}
Date: Wed, 13 Oct 2021 19:03:59 -0400
Message-Id: <20211013230405.32170-6-wwcohen@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211013230405.32170-1-wwcohen@gmail.com>
References: <20211013230405.32170-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=wwcohen@gmail.com; helo=mail-qt1-x829.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 13 Oct 2021 20:55:22 -0400
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
Cc: Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>, Will Cohen <wwcohen@gmail.com>,
 Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Keno Fischer <keno@juliacomputing.com>

Darwin doesn't have either of these flags. Darwin does have
F_NOCACHE, which is similar to O_DIRECT, but has different
enough semantics that other projects don't generally map
them automatically. In any case, we don't support O_DIRECT
on Linux at the moment either.

Signed-off-by: Keno Fischer <keno@juliacomputing.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
Signed-off-by: Will Cohen <wwcohen@gmail.com>
---
 hw/9pfs/9p-util.h |  2 ++
 hw/9pfs/9p.c      | 13 ++++++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
index 546f46dc7d..627baebaba 100644
--- a/hw/9pfs/9p-util.h
+++ b/hw/9pfs/9p-util.h
@@ -41,6 +41,7 @@ again:
     fd = openat(dirfd, name, flags | O_NOFOLLOW | O_NOCTTY | O_NONBLOCK,
                 mode);
     if (fd == -1) {
+#ifndef CONFIG_DARWIN
         if (errno == EPERM && (flags & O_NOATIME)) {
             /*
              * The client passed O_NOATIME but we lack permissions to honor it.
@@ -53,6 +54,7 @@ again:
             flags &= ~O_NOATIME;
             goto again;
         }
+#endif
         return -1;
     }
 
diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 2464ffeb94..97dc8b246f 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -131,11 +131,20 @@ static int dotl_to_open_flags(int flags)
         { P9_DOTL_NONBLOCK, O_NONBLOCK } ,
         { P9_DOTL_DSYNC, O_DSYNC },
         { P9_DOTL_FASYNC, FASYNC },
+#ifndef CONFIG_DARWIN
+        { P9_DOTL_NOATIME, O_NOATIME },
+        /*
+         *  On Darwin, we could map to F_NOCACHE, which is
+         *  similar, but doesn't quite have the same
+         *  semantics. However, we don't support O_DIRECT
+         *  even on linux at the moment, so we just ignore
+         *  it here.
+         */
         { P9_DOTL_DIRECT, O_DIRECT },
+#endif
         { P9_DOTL_LARGEFILE, O_LARGEFILE },
         { P9_DOTL_DIRECTORY, O_DIRECTORY },
         { P9_DOTL_NOFOLLOW, O_NOFOLLOW },
-        { P9_DOTL_NOATIME, O_NOATIME },
         { P9_DOTL_SYNC, O_SYNC },
     };
 
@@ -164,10 +173,12 @@ static int get_dotl_openflags(V9fsState *s, int oflags)
      */
     flags = dotl_to_open_flags(oflags);
     flags &= ~(O_NOCTTY | O_ASYNC | O_CREAT);
+#ifndef CONFIG_DARWIN
     /*
      * Ignore direct disk access hint until the server supports it.
      */
     flags &= ~O_DIRECT;
+#endif
     return flags;
 }
 
-- 
2.33.0


