Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D56ED25CF4E
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Sep 2020 04:11:06 +0200 (CEST)
Received: from localhost ([::1]:57742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kE1Bx-0006p5-VF
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 22:11:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tom.ty89@gmail.com>)
 id 1kE1AI-0005Qf-1p; Thu, 03 Sep 2020 22:09:22 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:34226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tom.ty89@gmail.com>)
 id 1kE1AG-0002cp-KG; Thu, 03 Sep 2020 22:09:21 -0400
Received: by mail-pj1-x1042.google.com with SMTP id n3so4513248pjq.1;
 Thu, 03 Sep 2020 19:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wwJlpHbGqD6yuQffmEe6pHXUpY2gNY6RxukEHADyMls=;
 b=sxTL1221iQ0izLkA4qRYFJwMdEgyruNyoxF/WWqwN36w3TxBK4g9GZCb7HoUuZW0H/
 g/p/9m71w5SUvKImfOQfmmAFREWyeuQlP0d3TTfm07SLdNOfbGyB8pxElRDAwTuTpD/S
 IUGhX6F4FqBsVJD+E9+QxNYso2TPCNhXO+9t3NIHlItOQkfZ1hCUdr48SDUoVmf5Z4uL
 kaHcNkYVHPyPxS7xoy3TuXXl6c1wso3DiXocxRsY/VvKWLf93IdIt72TCq6Jm+MAybOd
 5aRX2HMGmmGZmlwwRpslGTrVyq4B/NwFfIotIYgnM0E0GVAxinvVHjpAqz1NEN/arlQu
 sVxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wwJlpHbGqD6yuQffmEe6pHXUpY2gNY6RxukEHADyMls=;
 b=PCnar7+Dz3GLlx8s8HYBPVN4LcR93uC+xuVFz8AISItvYn18WsyK3SEWO5RWB+H85n
 ekDgoPv9U3TwKnNp3+tXzLOJo8QFMacaaqehdevncWTiddZYPU+B0siw/IEs32tYdwWx
 K5svRih2vcxvNaBWGJvDxGunR2BfGyvXYxYoCoqcVjbFvNfnIrgmjuLbR+A3iH4BLlNQ
 XNVqbSrOJ+c3g9Gf3b/SpPt+Qoe92FEAIOrItMQ0rAejApzi/97wETVY73+UlKfClUDA
 ME2wffKfXPXZOEc5ZiAb9FYmh4WpWU1AbEVnLgekZpRgS+1D+HDhTv0TUe57wa1rMaj5
 LqMg==
X-Gm-Message-State: AOAM531M5nNV5nqhDNtFdFHeAT8PVDCiutqvv3foJCOdTB7al/bmZa6K
 Nxvc1c8L3s6aFxq+BbebPoqbHxD8GwU=
X-Google-Smtp-Source: ABdhPJwu4B+FOu3m8jKtnikiZn4GvH3fE0Tj3jgN7ulW5sVUhPsYdGhptK9LfuTbtiOxDA6j5LijTQ==
X-Received: by 2002:a17:90b:1256:: with SMTP id
 gx22mr6083420pjb.47.1599185358494; 
 Thu, 03 Sep 2020 19:09:18 -0700 (PDT)
Received: from localhost.localdomain ([161.81.62.213])
 by smtp.gmail.com with ESMTPSA id n11sm4047178pgd.2.2020.09.03.19.09.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 19:09:17 -0700 (PDT)
From: Tom Yan <tom.ty89@gmail.com>
To: qemu-block@nongnu.org, kwolf@redhat.com, mreitz@redhat.com,
 qemu-devel@nongnu.org
Subject: [PATCH v4 2/2] file-posix: add sg_get_max_segments that actually
 works with sg
Date: Fri,  4 Sep 2020 10:09:07 +0800
Message-Id: <20200904020907.241550-2-tom.ty89@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200904020907.241550-1-tom.ty89@gmail.com>
References: <20200904020907.241550-1-tom.ty89@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=tom.ty89@gmail.com; helo=mail-pj1-x1042.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Tom Yan <tom.ty89@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

sg devices have different major/minor than their corresponding
block devices. Using sysfs to get max segments never really worked
for them.

Fortunately the sg driver provides an ioctl to get sg_tablesize,
which is apparently equivalent to max segments.

Signed-off-by: Tom Yan <tom.ty89@gmail.com>
---
 block/file-posix.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index 411a23cf99..9e37594145 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1178,6 +1178,21 @@ static int sg_get_max_transfer_length(int fd)
 #endif
 }
 
+static int sg_get_max_segments(int fd)
+{
+#ifdef SG_GET_SG_TABLESIZE
+    long max_segments = 0;
+
+    if (ioctl(fd, SG_GET_SG_TABLESIZE, &max_segments) == 0) {
+        return max_segments;
+    } else {
+        return -errno;
+    }
+#else
+    return -ENOSYS;
+#endif
+}
+
 static int get_max_transfer_length(int fd)
 {
 #if defined(BLKSECTGET) && defined(BLKSSZGET)
@@ -1268,7 +1283,7 @@ static void hdev_refresh_limits(BlockDriverState *bs, Error **errp)
         bs->bl.max_transfer = pow2floor(ret);
     }
 
-    ret = get_max_segments(s->fd);
+    ret = bs->sg ? sg_get_max_segments(s->fd) : get_max_segments(s->fd);
     if (ret > 0) {
         bs->bl.max_transfer = MIN_NON_ZERO(bs->bl.max_transfer,
                                            ret * qemu_real_host_page_size);
-- 
2.28.0


