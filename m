Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D77F61380D
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:29:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUqj-0002TC-JP; Mon, 31 Oct 2022 09:29:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1opUqh-0002Me-77
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:29:07 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1opUqf-0000b7-KU
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:29:06 -0400
Received: by mail-wr1-x432.google.com with SMTP id w14so15957830wru.8
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 06:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yuuYZlJ/V5Ve27LY21d8FcrV2Yd/AQIKFUrJI+yOj5U=;
 b=rlesVpx7TXhvj90rHUuz/P6Q2JKr/fX1pcClGW0GgOJ0zD/pNuW8Wz05vtJ/g97IDT
 sin7fCVU+BUYdz8ml/OgizNT4/1zDqdVTBYQOsCzlbUwrFaxWC+xiZ2iH+Z+a+WRCqmq
 TVgMuKYEkf80H5ruTqS+iIgrFhBvzCdJ17AUFztPovD0NXszwrcK6Ulrwx0/2GNv9tQV
 5S0SRcn6H+jiYlqV26ma9q1c6MqOSlQJCiXVnSyzwfIHajwipIxx0zMlAgFB5AV+P4Fy
 gF8MlFx8bAHiVM1UWGQbtRsqFHFsJsmsZzx+B0DM3fj+QRArJpDMIONglzan8+5LQBEs
 h/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yuuYZlJ/V5Ve27LY21d8FcrV2Yd/AQIKFUrJI+yOj5U=;
 b=X7yGhzqIdYDZXkIhIWf4CHFyNESOgRhb7Y6uigHZVPBXEp8AAgdffiuIMvXuNuNUNg
 xSVrX/8opRa/eeIVJ/NvgsI0wI+YhTgnT8zcwN1itXm7VmViCPbeparok7VtwC/7Wfzf
 rkp5+No7wWggJ8zsc75DYxx0P4lzk/YibDCooxZJ5G8bDMJrWfG+8x23rYUSl+QuWe/J
 1YRYL6C/mWCzAuKDXzolJEppKHzRSZvIq2YOFzvYoNSmkBvL8ltNqpC6BsN/YbrBKwn7
 jtzZX07uh4S3zAcoZtJm1TG/eKW6mPXklRcT8+CF4MePrqaTfH9YBqM0T/r0ec5tTlsm
 TMzQ==
X-Gm-Message-State: ACrzQf0ROajI++MJv2UfEAe1fj0yH/mhjDaFjNbocHvh+4clNuQFdsXV
 F6+ZpzKUPPT1bRQjNQIo4kNcck6YMg5gSA==
X-Google-Smtp-Source: AMsMyM4iotCaITmK7uE0rFRAW0reRLicP27by9CgVRxcvhy/JItttGRgjxTuOf4lq4QJ8AFf0A1AgQ==
X-Received: by 2002:adf:dbc5:0:b0:22c:c605:3b81 with SMTP id
 e5-20020adfdbc5000000b0022cc6053b81mr8056396wrj.218.1667222943976; 
 Mon, 31 Oct 2022 06:29:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 z18-20020a1c4c12000000b003cf75f56105sm1524628wmf.41.2022.10.31.06.29.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 06:29:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Si-Wei Liu <si-wei.liu@oracle.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH] net/vhost-vdpa.c: Fix clang compilation failure
Date: Mon, 31 Oct 2022 13:29:01 +0000
Message-Id: <20221031132901.1277150-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

Commit 8801ccd0500437 introduced a compilation failure with clang
version 10.0.0-4ubuntu1:

../../net/vhost-vdpa.c:654:16: error: variable 'vdpa_device_fd' is
used uninitialized whenever 'if' condition is false
[-Werror,-Wsometimes-uninitialized]
    } else if (opts->has_vhostfd) {
               ^~~~~~~~~~~~~~~~~
../../net/vhost-vdpa.c:662:33: note: uninitialized use occurs here
    r = vhost_vdpa_get_features(vdpa_device_fd, &features, errp);
                                ^~~~~~~~~~~~~~
../../net/vhost-vdpa.c:654:12: note: remove the 'if' if its condition
is always true
    } else if (opts->has_vhostfd) {
           ^~~~~~~~~~~~~~~~~~~~~~~
../../net/vhost-vdpa.c:629:23: note: initialize the variable
'vdpa_device_fd' to silence this warning
    int vdpa_device_fd;
                      ^
                       = 0
1 error generated.

It's a false positive -- the compiler doesn't manage to figure out
that the error checks further up mean that there's no code path where
vdpa_device_fd isn't initialized.  Put another way, the problem is
that we check "if (opts->has_vhostfd)" when in fact that condition
must always be true.  A cleverer static analyser would probably warn
that we were checking an always-true condition.

Fix the compilation failure by removing the unnecessary if().

Fixes: 8801ccd0500437 ("vhost-vdpa: allow passing opened vhostfd to vhost-vdpa")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Stefan, do you want to apply this directly as a build fix?
---
 net/vhost-vdpa.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 854ebd61ae6..e370ecb8ebd 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -651,7 +651,8 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
         if (vdpa_device_fd == -1) {
             return -errno;
         }
-    } else if (opts->has_vhostfd) {
+    } else {
+        /* has_vhostfd */
         vdpa_device_fd = monitor_fd_param(monitor_cur(), opts->vhostfd, errp);
         if (vdpa_device_fd == -1) {
             error_prepend(errp, "vhost-vdpa: unable to parse vhostfd: ");
-- 
2.25.1


