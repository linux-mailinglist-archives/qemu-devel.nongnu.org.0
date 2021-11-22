Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65303458789
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 01:54:48 +0100 (CET)
Received: from localhost ([::1]:34296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moxbb-0000Db-He
	for lists+qemu-devel@lfdr.de; Sun, 21 Nov 2021 19:54:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1moxWi-0004hG-V9
 for qemu-devel@nongnu.org; Sun, 21 Nov 2021 19:49:44 -0500
Received: from [2607:f8b0:4864:20::835] (port=43864
 helo=mail-qt1-x835.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1moxWT-0000xG-SR
 for qemu-devel@nongnu.org; Sun, 21 Nov 2021 19:49:44 -0500
Received: by mail-qt1-x835.google.com with SMTP id q14so15060167qtx.10
 for <qemu-devel@nongnu.org>; Sun, 21 Nov 2021 16:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UVU8u0+3eX0ac/dq4jOrxKpAcQS3bi3Tumsmx/2i3VE=;
 b=C97AEHaT0qXCq+5Y6ZV8m97iIlP2CoBT2u6fzKZZG5DUx8tTVRL7n3weYSei83ojHy
 WSy+QvgRH15VUdDiP3NNAofv5xkCJkg4o+afsNxXl0Q0HJlcVpHuA29H4GBHl6litlBs
 bY3f9OgDkag7k2wGRtGLsS+qAD4+URgEmm1IVga5CyshkCyqzpbKkrSPa6EOekuMsRcN
 Ki7dquh90NcH/zIIAR0EnupJCu9w6X9CF1SMgMwLBNiY5BCmj+7xO8Di2WYZpAPo4n5U
 UCfSJHOE2ywWygTN7nRAvKfot2LQmWcKZSAkyyqc5rBYoc0/kOwGrR4J073OzcVT2jTX
 4r/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UVU8u0+3eX0ac/dq4jOrxKpAcQS3bi3Tumsmx/2i3VE=;
 b=LrJISdpUcsJHL/nMw1otkwSbpapixqrHj98HEAp3eYqqgn6jZVUDQMUas8FU08+mrw
 H2CBwO+3lGMLZvKutKUnuPTGc9JAA4TUjWpJkkOlt3ekMy704tVobWOrqnnnA1LCpgXk
 92Qru6Vnri6LjktKO+T9IzumWlOFv4SCNNimwDaCb7goF40YspT/VYEZyNNyeCB1Mb1k
 XV/8ld8+N6uwYALnydSENFaw9n6eWzxjmh7UtXYREfnFfGh7t+XbVidbCV4zgcH0laD+
 e/JbYoHzEYMTbUd6yBG9sVorg9XfmJy7hTnwnqY6wAekGtnBffMuRo8iHLtqDaDLR0yp
 IjMw==
X-Gm-Message-State: AOAM531rT55tTpxCI2+YfNa2E3q6LLM/QhvHfnkSahW9rWyNNBMbrDYS
 zLxs95u5OglgE0zuR6JhaMYm6bsKwl1VJg==
X-Google-Smtp-Source: ABdhPJxTKhyEj8rhl6dB+LaUgCGvJ3O/BJ7LyQlEHU0jbhGqJQaUQye1YbB0CXcut4vkJcxkq/NHTA==
X-Received: by 2002:a05:622a:391:: with SMTP id
 j17mr27322449qtx.228.1637542168804; 
 Sun, 21 Nov 2021 16:49:28 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id x17sm3651745qta.66.2021.11.21.16.49.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 21 Nov 2021 16:49:28 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/11] 9p: darwin: Ignore O_{NOATIME, DIRECT}
Date: Sun, 21 Nov 2021 19:49:07 -0500
Message-Id: <20211122004913.20052-6-wwcohen@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211122004913.20052-1-wwcohen@gmail.com>
References: <20211122004913.20052-1-wwcohen@gmail.com>
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
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Keno Fischer <keno@juliacomputing.com>, Greg Kurz <groug@kaod.org>,
 hi@alyssa.is, Michael Roitzsch <reactorcontrol@icloud.com>,
 Will Cohen <wwcohen@gmail.com>
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
index c06e8a85a0..c941b46f60 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -137,11 +137,20 @@ static int dotl_to_open_flags(int flags)
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
 
@@ -170,10 +179,12 @@ static int get_dotl_openflags(V9fsState *s, int oflags)
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
2.34.0


