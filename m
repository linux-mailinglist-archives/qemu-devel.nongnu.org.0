Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E5D3609B0
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 14:45:17 +0200 (CEST)
Received: from localhost ([::1]:34322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX1My-0001Zw-OR
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 08:45:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lX1L1-0008Jk-2A; Thu, 15 Apr 2021 08:43:15 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:34353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lX1Kz-0006Tp-J1; Thu, 15 Apr 2021 08:43:14 -0400
Received: by mail-ej1-x630.google.com with SMTP id x12so15871066ejc.1;
 Thu, 15 Apr 2021 05:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WD7MCmHJ/D46aRVbFpWL4Rq/RVjBhO+w4A8zwh3SmEg=;
 b=H7y52BUTZKL/zlY4ydQLe+mtwv09pdJ9RzcvjSeog2KMSCcMonbmCQHcLPwajP/okO
 eqs+aQIaztamMNbzFAnpsOhn0+QCe0FUgnC0C5W6J93Iaka8Gk5FWa4EH4Xm81ai0zJ0
 UbL/arf0dL/ZVqifl2Vgw/+JwnMpwU0HpJySWeqvFkZ3D+Wb8+SWJvLvNuIIwjDPJfEP
 0zjVz/v0QnciXP1dhAl9M77tn7UEQ2GM2tMB8eRkIHx/pa0ngSxtLgqhjGVjdLfbjcno
 LxO87e/4LRC72DWwUuaQZMtpJEOpkN4bczPxZiEYSrJ4U7D73CZDmsUHyZpYMUaFqrGF
 /KVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=WD7MCmHJ/D46aRVbFpWL4Rq/RVjBhO+w4A8zwh3SmEg=;
 b=NKuhxOPAtGrY7/XlAjiwxQh1Z16ERrgaDSfeexTppSekfY2AirqJ+WRBAHHyt0lqlb
 4Jo/W6OFcD18afa9PsNNoaDdYzYsJ5xBBIMpd4H1rAIvt0r5W1Br0ApCank7YTcPnxcV
 lAdelZRGynpnNVNG3kGtyVYX55L/8FWTMAZ0qsHSuykvPrli3iZG1KK86KSfEwlpRkJi
 bi1siQnBI7OAhX1BcatwQdNsSiAgy6CLtr9KtwkSRqwiIenXY8jTv6Spg4HL74h3VOdS
 d8H/iaeJgNB258cgbnBZrPbU7d328lXdlMqFpe3wh6dCPcTYnKyXpA8/zxEeUdhtk+sz
 p7kw==
X-Gm-Message-State: AOAM533TBYvmxyW6O6NUee++IXybZJkrBDYzRGj67tfeT4cxsjYZtwZC
 vmGFf6AsNMeqDgq3Ydv1tH06bcwVZKY=
X-Google-Smtp-Source: ABdhPJyC9R3+JmR9ukPRLN1IMXrvulEkKEZYc2I0Fwlaw3f4OZBQ1S1rMiP/9aZtjeR6Dg7ST0PSbQ==
X-Received: by 2002:a17:906:814d:: with SMTP id
 z13mr3145652ejw.479.1618490591778; 
 Thu, 15 Apr 2021 05:43:11 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id r10sm1862585ejd.112.2021.04.15.05.43.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 05:43:11 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] file-posix: fix max_iov for /dev/sg devices
Date: Thu, 15 Apr 2021 14:43:07 +0200
Message-Id: <20210415124307.428203-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210415124307.428203-1-pbonzini@redhat.com>
References: <20210415124307.428203-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: fam@euphon.net, qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Even though it was only called for devices that have bs->sg set (which
must be character devices),
sg_get_max_segments looked at /sys/dev/block which only works for
block devices.

On Linux the sg driver has its own way to provide the maximum number of
iovecs in a scatter/gather list.
---
 block/file-posix.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/block/file-posix.c b/block/file-posix.c
index e37a6bb8de..b348b37ccb 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1198,6 +1198,17 @@ static int sg_get_max_segments(int fd, struct stat *st)
     int sysfd = -1;
     long max_segments;
 
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
                                 major(st->st_rdev), minor(st->st_rdev));
     sysfd = open(sysfspath, O_RDONLY);
-- 
2.30.1


