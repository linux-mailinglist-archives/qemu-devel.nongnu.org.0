Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F854AB1FF
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 21:18:36 +0100 (CET)
Received: from localhost ([::1]:47244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGnzY-0006Mp-3o
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 15:18:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nGnp3-00010A-Qb
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 15:07:46 -0500
Received: from [2607:f8b0:4864:20::835] (port=41728
 helo=mail-qt1-x835.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nGnp2-0001Pk-1i
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 15:07:45 -0500
Received: by mail-qt1-x835.google.com with SMTP id y8so10404901qtn.8
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 12:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TjA/RsdUTSLR+v+0XwAk5IVoTXujYprMjK0qceiu15c=;
 b=nKDEo/ad/k5W3w1KAJm5dsOk+/FvuHA0xeolhFjfHCxeI124KSwyDSKTt000MXuZsz
 nyvTxiBCguJuztLilYdmUuUS5Ih4HJGyuXmN56gipSwgtaq/0GoP1mk5/4BljrlLZ//y
 nwVSHejcmhWUepYutEWLai+xNM5ESXebWjfLFkQF1eD2fiEKybPrB8992CEFshuhMf3+
 2zx6pwgZDsEFdYk7rfyTo81QJUnHRTltJXZLHVa+kFsZ1tu9EpToqaCIrsjTsmMso6S0
 LOYW6Wt3QvyCCADtGcmB0JOmIteyYYHTtOfqIweV3dffYGQ5+8+uWEzovqiBl/+9Udnv
 +hIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TjA/RsdUTSLR+v+0XwAk5IVoTXujYprMjK0qceiu15c=;
 b=7d79qr0uGRxncbD7hCtyRg0/g0aDOnhLhwJV6Zxd5d1QEkx0gTAAGFj98/O2j4/sSI
 fyJe0avh6pcrBryIuhJymi+NEjuPLydn6Pd5AeO/tLK9jtAq1qy0JqnwaXVxLhFkBCXg
 80/yitQ3MXPUnEs0uexlPgni2gI6ih5r/83GEzzXlzUuCRHfk8G0U/C2Ml5icwI8hhiO
 ifDvjkrBn4VbKJj3MIDHv4CwoQh0Xv8NvdzUDLIQrjmmiDBQ0NvcdpqCR8IUNfF76TzZ
 JteXpWl1IDU0trrD+UHuBfLP9KxKHykHwhWbQub9ZAFLy+V4NXLfKat220mGx8JZtK8s
 LHmw==
X-Gm-Message-State: AOAM531lIrTo+uolkzsrPnw9tJMbjPQtmqMMllclAlh9QiQ8G2Q5fksx
 THE/b99uQCqiNvPSjWy2fapPSQbW9SXIwg==
X-Google-Smtp-Source: ABdhPJzfbDshIEtEwU/hxIfHwr2kUlv3do0Zocn56YYeChdgeU5d7L3NonBjrusB36jIIIhU5Pf02g==
X-Received: by 2002:a05:622a:1786:: with SMTP id
 s6mr6007530qtk.386.1644178062996; 
 Sun, 06 Feb 2022 12:07:42 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id j11sm4625999qtj.74.2022.02.06.12.07.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 12:07:42 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 05/11] 9p: darwin: Ignore O_{NOATIME, DIRECT}
Date: Sun,  6 Feb 2022 15:07:13 -0500
Message-Id: <20220206200719.74464-6-wwcohen@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220206200719.74464-1-wwcohen@gmail.com>
References: <20220206200719.74464-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::835
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=wwcohen@gmail.com; helo=mail-qt1-x835.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 hi@alyssa.is, Michael Roitzsch <reactorcontrol@icloud.com>,
 Will Cohen <wwcohen@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Keno Fischer <keno@juliacomputing.com>
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
index accbec9987..3b9c485414 100644
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
index cf694da354..f3b00d20a2 100644
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
2.32.0 (Apple Git-132)


