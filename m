Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D0F4B13D6
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 18:06:25 +0100 (CET)
Received: from localhost ([::1]:55822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nICti-0001oR-Su
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 12:06:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nI9WY-00033X-9W
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 08:30:14 -0500
Received: from [2607:f8b0:4864:20::f35] (port=44806
 helo=mail-qv1-xf35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nI9WT-0004GQ-0q
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 08:30:13 -0500
Received: by mail-qv1-xf35.google.com with SMTP id p7so4900870qvk.11
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 05:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gIGVlFzwI+BOQT0G5tpy36kLec/z/FbtOyvz6GVCXtw=;
 b=cSKrX0oi9dpo5zP6HmrPMJxd79HcXSkLyDOdXzE8Rn+50TbYgtZVBH7hzkcQgE2nBv
 hJNSYrq7ArJ6WirNtdTqJ1m8s1xgYaAD5aIoYr/hzy29/B6LKwjH6XkO8beDDc0sf/Hh
 KIhfzbbPfJPFpgD92fBC2PNgRNNiWn/CNEbgHPhnFvDonEcRkuPESHCtnKSMXew3KDGj
 jRHv/Cm9AriZzT+nyJMvIkpsi8qkBtXiLixd0mLUIs0+3LAqI4UC1d9L/au1+uOc5o3S
 3GRjBkKW/VyLjzGJzuXA6tDA5/3TT21DddLTqZ/A7shyfGol4s5Yzi7v8S8JeT7q0Zcx
 eoCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gIGVlFzwI+BOQT0G5tpy36kLec/z/FbtOyvz6GVCXtw=;
 b=JxSWsm769LS/1Zd7LeUX5lMWPVLKPIwnqQwATfewim1ncg0Vh+rOQgCwPKw9phgV5o
 N/4D/Ot8nkKGynO45FzGLDuRNtS3x4Poi3DrJ6wvCxI83kM9CmR1zif/ynw0VIRrcKwl
 jJz5X0nsAxhXws6A5vwO2tRAM+etyqVBSieHVyE7YzxVRjFWuT7/e+KGZexnpGzsOAiT
 W79W1IE0UOGowJ4l75oHZsZq/Uyg4/AhEhl8L9zBCjpyT5Kgr9xHnumtJcCw+Ag6+TTM
 xT1PPmATXPY84suxGsrSZ+tY+YlumDTAdFVtBl6wboiF484CX+ceBUbHX/Lq1Q6m/MzF
 dF5w==
X-Gm-Message-State: AOAM5332XXlPDjUVx4HSQNXCaKWpREcoJq2Cz8LKSzScAUuNB9d1InPm
 SALQszTMoFmXOpbScd8zai1EEfrlbreK9Q==
X-Google-Smtp-Source: ABdhPJxkR6gU1tllXpr4V/nwilwujn7nL6yvL4QpDaHDUuKBBnDIOxO6OCpqSn2UkMMxtJ2tvKZC5w==
X-Received: by 2002:a05:6214:d82:: with SMTP id
 e2mr5056570qve.128.1644499807721; 
 Thu, 10 Feb 2022 05:30:07 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id t1sm11289616qtc.48.2022.02.10.05.30.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 05:30:07 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 05/11] 9p: darwin: Ignore O_{NOATIME, DIRECT}
Date: Thu, 10 Feb 2022 08:29:40 -0500
Message-Id: <20220210132946.2303-6-wwcohen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220210132946.2303-1-wwcohen@gmail.com>
References: <20220210132946.2303-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=wwcohen@gmail.com; helo=mail-qv1-xf35.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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


