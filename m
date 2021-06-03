Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A2639A258
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 15:39:06 +0200 (CEST)
Received: from localhost ([::1]:54032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lonYv-0005I6-D3
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 09:39:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lonXV-0002w2-1n; Thu, 03 Jun 2021 09:37:37 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:37711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lonXT-00005B-DD; Thu, 03 Jun 2021 09:37:36 -0400
Received: by mail-ej1-x62d.google.com with SMTP id ce15so9292370ejb.4;
 Thu, 03 Jun 2021 06:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ol7E5OOtSGud4DEQz+1bUjAViRDPBgiG2mSFKt001ck=;
 b=Gf25VDbzE1taoFRfi3VPPMtoGjW/wWKT+6/pdf2thxqHYKmNpTHDGSIU6cawiUJzCQ
 +/GkeE53cphJy0jXFbgfwzZMQ8iLde8UwDAF4kh5p2kW3oZIpSGm0L9WbWIjxP85CZot
 Bwgmq9UYAjEjV0r+87nURyzoJbuyGJ3TvC7qpFQ1hitiSU1n6gprOeWFfdAdV0xgJf9Q
 KXjVa33HKU90jVl5sCfn3JJI2sN9q/5Lbb1SnUrg8QcYIxww8gjoVRIloeJolUKwb+UA
 FpUQSwwLqF5u6A0iFB21xhNn9eAZNYccbE2snWTdI7czHmkSzCmLXhzX0C0xWFzhcreO
 oHiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ol7E5OOtSGud4DEQz+1bUjAViRDPBgiG2mSFKt001ck=;
 b=hIR5tEblDZkUChiJdr41ZtF3f1k/LSrUsl8cB1tZmj1d9Gog3h+ZP0Y0WOxzq1/g75
 OTOapfFSNV+h63/ppOFc9VYoviBYL+6CLyHTTHdLOhDPUf2j06k4zqzvERKN8XjazkHU
 nvBAp40QZttEyFcFBIxPnojBC2sXRYUksoimQeyKWxmVrppuCHLFsxI/VwDHaOHCiQrP
 4maboL5QiJUniPc+wrY76Xded7jCDC6AsWAAVn4BvbMRAZKa7JigsBDGRxgE8z8Yo09L
 hU+6RSRuOiglHhphHOs/OXfwZaKnfGGJL3tSEow9dXLUPfBqZjJggyPzSt3eJGtSrT1t
 gRMA==
X-Gm-Message-State: AOAM533bXPcJ6ducuNk3ogafvN8yyQ/bedQXuVRHq5ou1OtLLzDduumJ
 T9EZPJ035KiMlbP8fIaZPsycnjletoPTGA==
X-Google-Smtp-Source: ABdhPJx1by8TaukJ7G5L/DK4ADdY6m48LVDcidQytL1MA3cqf/YCsCd6XDwlm1P/FhhLt2Rwk8OKeg==
X-Received: by 2002:a17:906:b0c9:: with SMTP id
 bk9mr39107009ejb.517.1622727452276; 
 Thu, 03 Jun 2021 06:37:32 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id e24sm1555369ejb.52.2021.06.03.06.37.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 06:37:31 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/7] file-posix: fix max_iov for /dev/sg devices
Date: Thu,  3 Jun 2021 15:37:16 +0200
Message-Id: <20210603133722.218465-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603133722.218465-1-pbonzini@redhat.com>
References: <20210603133722.218465-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Even though it was only called for devices that have bs->sg set (which
must be character devices),
sg_get_max_segments looked at /sys/dev/block which only works for
block devices.

On Linux the sg driver has its own way to provide the maximum number of
iovecs in a scatter/gather list.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/file-posix.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/block/file-posix.c b/block/file-posix.c
index f37dfc10b3..58db526cc2 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1180,6 +1180,17 @@ static int sg_get_max_segments(int fd)
         goto out;
     }
 
+    if (S_ISCHR(st->st_mode)) {
+        if (ioctl(fd, SG_GET_SG_TABLESIZE, &ret) == 0) {
+            return ret;
+        }
+        return -EIO;
+    }
+
+    if (!S_ISBLK(st->st_mode)) {
+        return -ENOTSUP;
+    }
+
     sysfspath = g_strdup_printf("/sys/dev/block/%u:%u/queue/max_segments",
                                 major(st.st_rdev), minor(st.st_rdev));
     sysfd = open(sysfspath, O_RDONLY);
-- 
2.31.1



