Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64ED63B3540
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 20:07:52 +0200 (CEST)
Received: from localhost ([::1]:48598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwTlX-0003zL-CP
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 14:07:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwTiI-0007yu-9J; Thu, 24 Jun 2021 14:04:30 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:43735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwTiG-0001Pc-2U; Thu, 24 Jun 2021 14:04:29 -0400
Received: by mail-ej1-x630.google.com with SMTP id nb6so10866467ejc.10;
 Thu, 24 Jun 2021 11:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GjCZXEAAw7qiNbzDIiyL4DTYii0HnblTscfX7SsNJa4=;
 b=CLo44oXfCpxjTO9eQY21X4tlCjvR1v4CWVGgvxHeobLD39YoqtGm1hU3fh1SSyn1EP
 1J6Rm5UC+k8dHqCzglZMkMp7Kr+e9uuhlxbxI1kGJx73uUHS1QHdt8ukUiOddrRvFzYQ
 4RQ2KFm/ERXOPxiJ5rZ4I25QstlXDTuaM1qn4vcGkOdViK2VVkDFsByLnATM1AvdtrfE
 4+8vy1UAK1EPqwvWRqQGHuu728pHuM4OHHpjKEDV1+erS5C7u41LDdsczqg3gw98fw3U
 q3ayjvQW0lBh61LGj9AJjCm8u6vIcXiWcQOzWp+J/61RKwHxgZbKR5uR0tKiZ4XNstBy
 j/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=GjCZXEAAw7qiNbzDIiyL4DTYii0HnblTscfX7SsNJa4=;
 b=PrhHq6uRkcrqC3gVc81105Pe3JRDR+d5ADiif3tpwH4A7dPrByDL/dK9LakxR0XVSc
 nPF3Hx6JO3wBhWbD0s5q/wra0hVpT1v22AbLTxflQbSyZb3EvbXg9YmQdR1S9dW54rQR
 4F6ov9iN6K1Um1SEI+QeqJo22dtB02t1cfPKcCvRTxcredo46e0A4ODavxuOXlOTdng5
 lsvKDWcVp8jVrpp8XjgP2ztED0zkXS2s1kqoKMweGYEtUl5Qv8d2D56qh3lf4Byu2/3d
 4v9w8qfPYLQ0dKm0M2Ig+UNdL5bQ7MHGOUA6FpUN9Ts3OQ0twFrheStc24Qt3+1l754L
 dF6g==
X-Gm-Message-State: AOAM531ehV20tfBo6dMwRX9BJ2axzXkUCfoYOM7fYAOu8xdJ+UN5ZnbE
 EY//GoSHP2G+AvnKj9ZW5aXwdyVQI4U=
X-Google-Smtp-Source: ABdhPJwY+3/JUcFK4Fg4N7CKc5XVn9W28GrIFMd0qwwiwk6YL4CIXNj7GN3GrjSA1MlGgStEB/0pPg==
X-Received: by 2002:a17:907:7662:: with SMTP id
 kk2mr6448352ejc.218.1624557866300; 
 Thu, 24 Jun 2021 11:04:26 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id a1sm2436466edt.16.2021.06.24.11.04.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 11:04:25 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/11] file-posix: fix max_iov for /dev/sg devices
Date: Thu, 24 Jun 2021 20:04:13 +0200
Message-Id: <20210624180423.1322165-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210624180423.1322165-1-pbonzini@redhat.com>
References: <20210624180423.1322165-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: mreitz@redhat.com, qemu-block@nongnu.org, mlevitsk@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Even though it was only called for devices that have bs->sg set (which
must be character devices), sg_get_max_segments looked at /sys/dev/block
which only works for block devices.

On Linux the sg driver has its own way to provide the maximum number of
iovecs in a scatter/gather list, so add support for it.  The block device
path is kept because it will be reinstated in the next patches.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/file-posix.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/block/file-posix.c b/block/file-posix.c
index b3fbb9bd63..b8dc19ce1a 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -1178,6 +1178,17 @@ static int sg_get_max_segments(int fd)
         goto out;
     }
 
+    if (S_ISCHR(st.st_mode)) {
+        if (ioctl(fd, SG_GET_SG_TABLESIZE, &ret) == 0) {
+            return ret;
+        }
+        return -ENOTSUP;
+    }
+
+    if (!S_ISBLK(st.st_mode)) {
+        return -ENOTSUP;
+    }
+
     sysfspath = g_strdup_printf("/sys/dev/block/%u:%u/queue/max_segments",
                                 major(st.st_rdev), minor(st.st_rdev));
     sysfd = open(sysfspath, O_RDONLY);
-- 
2.31.1



