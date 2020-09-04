Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AF525CEDE
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Sep 2020 02:52:37 +0200 (CEST)
Received: from localhost ([::1]:47242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDzy0-00084z-Fr
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 20:52:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tom.ty89@gmail.com>)
 id 1kDzwx-0007DP-Mf
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 20:51:31 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:40065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tom.ty89@gmail.com>)
 id 1kDzww-0001VK-41
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 20:51:31 -0400
Received: by mail-pg1-x543.google.com with SMTP id h12so3438734pgm.7
 for <qemu-devel@nongnu.org>; Thu, 03 Sep 2020 17:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=haFiIuZcpa2HR7b3wPU26vJsTkZCNX1fBT9PCrfxrgI=;
 b=GIhDo6TBVE2vxM0EEF5gA5TnYYd/xjef9BN0fw+iBsgiP21UZ7FKiifXh7eyLNKT/N
 ZIOIKIK/LQhVOHRR5F/us6nLCWmSt7Fvv9btQ/ua1w023hXKyRG658iZhgZgVaOg9ztA
 CZUHVTgyczgRjRfQ04lZPbrzghFIOFK5TtLEjca54nRXopBg5iAu07CZDeYJH5u3tn3w
 jWrE4GiKGH8MELX4x2D0zrZGTJBs+ar8JOzvg777A882N8CEKXx492sIiDM/N05jLrjl
 yqAESk+zEJCYRj7/vXhzDA+l8Qb2zQR1ALBL+9PpZPpDFdRZpY/tgRKO/vpyrshMKAyl
 ix4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=haFiIuZcpa2HR7b3wPU26vJsTkZCNX1fBT9PCrfxrgI=;
 b=cPyF9Rq4wZF+zPmGel/MFCgOSp52f8VvC4UXB+Bje9YZo6fuzeAlsv+RTU74PcMd0Q
 oFKKqvoR7HZD6Ziunkr923N0u3G3RHyM39C03QGOo09984KMc41xjffhXkPUGBAnpMTo
 /kPZmAGXJmxpo2z8VQAJQQKvpz6GL6IEGncsiCqctpQLFHUrgnbaPkIZTaEtVzrvrTSc
 WMOJvqWV9KtMY9EX04yxemle84pI3r3leMP9oiGhGbY0UG1nxsqDeOrgQXjX92gM3kdN
 URCPjvw9ptmY474QgM46ekZsT0Qq6EMdH6zNfrc7/nwqLW/bzx1JJgJtNzhIBzAXFZ4a
 LayA==
X-Gm-Message-State: AOAM530Bd4dAvbIg5rC0oTZQrOyMyjxeJPuNTlg8o4tUFg4qnTQb4T9s
 mG5uDr24mVSmQjCXLpARofqebz0uLD0=
X-Google-Smtp-Source: ABdhPJytus4rZifRSdNduHuFag0ThASWhmbPg5iU81SMQjKgVX+Td716CWtMulit7xvlTpcv/Sq6BA==
X-Received: by 2002:aa7:8645:0:b029:13c:de96:6fde with SMTP id
 a5-20020aa786450000b029013cde966fdemr3492120pfo.14.1599180688260; 
 Thu, 03 Sep 2020 17:51:28 -0700 (PDT)
Received: from localhost.localdomain ([161.81.62.213])
 by smtp.gmail.com with ESMTPSA id u22sm3685652pgi.85.2020.09.03.17.51.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 17:51:27 -0700 (PDT)
From: Tom Yan <tom.ty89@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] file-posix: add sg_get_max_segments that actually
 works with sg
Date: Fri,  4 Sep 2020 08:51:18 +0800
Message-Id: <20200904005118.151296-2-tom.ty89@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200904005118.151296-1-tom.ty89@gmail.com>
References: <CAGnHSEnK_xPv_=kUBcLcPDw-UMh9XST_c=TLAo=NV2cMk9sHJw@mail.gmail.com>
 <20200904005118.151296-1-tom.ty89@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=tom.ty89@gmail.com; helo=mail-pg1-x543.google.com
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
index 0c9124c8aa..d2cd9a3362 100644
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
@@ -1267,7 +1282,7 @@ static void hdev_refresh_limits(BlockDriverState *bs, Error **errp)
         bs->bl.max_transfer = pow2floor(ret);
     }
 
-    ret = get_max_segments(s->fd);
+    ret = bs->sg ? sg_get_max_segments(s->fd) : get_max_segments(s->fd);
     if (ret > 0) {
         bs->bl.max_transfer = MIN_NON_ZERO(bs->bl.max_transfer,
                                            ret * qemu_real_host_page_size);
-- 
2.28.0


