Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B88784B749F
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 20:20:00 +0100 (CET)
Received: from localhost ([::1]:51946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK3Ml-0004Sw-II
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 14:19:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nK388-0000kv-Cx
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 14:04:52 -0500
Received: from [2607:f8b0:4864:20::82a] (port=42532
 helo=mail-qt1-x82a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nK385-0002kV-G1
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 14:04:52 -0500
Received: by mail-qt1-x82a.google.com with SMTP id s1so19502667qtw.9
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 11:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gIGVlFzwI+BOQT0G5tpy36kLec/z/FbtOyvz6GVCXtw=;
 b=iTSBifTbp2bHC0SIE9SHd5uKARuJ8+xzmO0rxatJrS3LEYAe8JJmnK/uniMOMtpItf
 nQbfLnO0T1KgZFye6prel28Hl13sOGIBBcCrnS3shroo6N1Ryw9OKv9R5N2l35xPPbj7
 yaB5dW+iy4Tn3AV6OFcPvM2IaVaXM6xs4y9qaCjk2rP61kLMp7DJMJildh+fJNflSLD4
 jAQVcKWhANsz+RVx+uzQKJtps7BpRiIZ7uGzq9p3ogsF3OrYV3LxSdJ6JddpGN7D/QEp
 8Ra5Y2E5H6f5Sow0vnNhU7M8wlm9lffST8GDNaxIVgPcp8fLz76UVRVTvYHdsxh1lLlo
 yJbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gIGVlFzwI+BOQT0G5tpy36kLec/z/FbtOyvz6GVCXtw=;
 b=fCSAWo5ZD4hfHwCvC+EUoDlrrTmMPUvr4fE33saJf5o9l8jTCA3vuzhgXcObFh/wpZ
 MWHM59cLOdn+c88MDfheFZpJr2nXOSV42NqrAjzwFtI07usY1Y0BoeqnmQ8cnWRS0OO/
 l8n9+AA2qTBKoHBaZJlw9CIDqqz07NmVG2ybBznqKoBXoU1jIxbTqAYzXKFtST8LW/xL
 +q0YwhWbx8hbXqeRlwOQDWHQAGPJajIomrrSw316FYTguMXsO6vKjNqhqsH0r+MPFT76
 kqGc1UkhKz+nDoqD6bAG+z6/F9xOlrIJUBGNJwnh5qLASI9jtcRRkJ6tkqXcA4FbPCF8
 7CDw==
X-Gm-Message-State: AOAM5330P3mK8jot/hzIFDwlluVEttiW9+5ME2Xtxp95D6PtyhRdWerY
 lwZJyCfOqLPcGzxKg4TbL8u2M48mRVqdmg==
X-Google-Smtp-Source: ABdhPJy8FlwBDx0uCdpO+/muvmFO4dBptvaISQQv7qIW19kO+f1VWIGwp8LKnkRC1a8IfGCVskS8og==
X-Received: by 2002:ac8:5fca:: with SMTP id k10mr383045qta.639.1644951887898; 
 Tue, 15 Feb 2022 11:04:47 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id w10sm21364527qtj.73.2022.02.15.11.04.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 11:04:47 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 05/11] 9p: darwin: Ignore O_{NOATIME, DIRECT}
Date: Tue, 15 Feb 2022 14:04:20 -0500
Message-Id: <20220215190426.56130-6-wwcohen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215190426.56130-1-wwcohen@gmail.com>
References: <20220215190426.56130-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::82a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=wwcohen@gmail.com; helo=mail-qt1-x82a.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Greg Kurz <groug@kaod.org>, hi@alyssa.is,
 Michael Roitzsch <reactorcontrol@icloud.com>, Will Cohen <wwcohen@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Keno Fischer <keno@juliacomputing.com>

Darwin doesn't have either of these flags. Darwin does have
F_NOCACHE, which is similar to O_DIRECT, but has different
enough semantics that other projects don't generally map
them automatically. In any case, we don't support O_DIRECT
on Linux at the moment either.

Signed-off-by: Keno Fischer <keno@juliacomputing.com>
[Michael Roitzsch: - Rebase for NixOS]
Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
[Will Cohen: - Adjust coding style]
Signed-off-by: Will Cohen <wwcohen@gmail.com>
---
 hw/9pfs/9p-util.h |  2 ++
 hw/9pfs/9p.c      | 13 ++++++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
index d41f37f085..0e445b5d52 100644
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
index caf3b240fe..14e84c3bcf 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -138,11 +138,20 @@ static int dotl_to_open_flags(int flags)
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
 
@@ -171,10 +180,12 @@ static int get_dotl_openflags(V9fsState *s, int oflags)
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
2.34.1


