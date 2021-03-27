Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF1E34B3AF
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Mar 2021 03:12:45 +0100 (CET)
Received: from localhost ([::1]:54566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPyRQ-0006oo-2Z
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 22:12:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zachr@google.com>) id 1lPyQK-0006Pk-Cy
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 22:11:36 -0400
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134]:45014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zachr@google.com>) id 1lPyQI-0005Rj-TM
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 22:11:36 -0400
Received: by mail-il1-x134.google.com with SMTP id t6so6580604ilp.11
 for <qemu-devel@nongnu.org>; Fri, 26 Mar 2021 19:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=OYrqYVdzc32IvKcljuu1ZRbBtOX9g/8hiUl5rwHloFs=;
 b=nEM01qKTTeQ6KwMOwDJQmV4dWRS/rIEchD9+vVgXhSTe8u7Ajx8McG11gn8aUBmtyc
 PY11loMVQgnwUYbBEb6jwm1qNNxR69aXcuBL7KTYS0hdb3T9Xmsf1t80+0M1e7lF9bfK
 mgX+5obbhEq4DaxatmaZy2pUDTfYVTKqaVfcKkyMlZSufvNQvRE0I6hAgotvBqHljwhp
 gZQCD+jazkBi9Gv1xCmqVF/6SfnQODDz1ORmC8Jk2mA/W7Ruu0ZH/QdPQtiWF6FyOzS0
 jsPwwoCxdrTHud4EwPa+g+dXqLy3jID3SOEVMFYdadstQkx/9iLqx7PgBm6/743cY2yK
 JxIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=OYrqYVdzc32IvKcljuu1ZRbBtOX9g/8hiUl5rwHloFs=;
 b=NNZ57p9Tjl/Cp3BAe1fF35N7MTcj6lsFS8Kfj6lrQRsuEJkmIuqw7jmp4wG77Ei0dX
 tZ1uSOgADa+K+A6zVSV6ip6HyxawTeyRY1BBw0laF6kXBgWzfHaCQH5lBitwMppXVYi8
 geqxYTzeaxXAUI9qX88VhaQ08vzQmK3xQXm5BGYz/Kf+mefQoiBoJG/mPUM4Ty203VN1
 OuSxx985GSzBKWMNqIG8Zz2AlCyeCe6A6q7nPCErNuYXHLCYNnskzYyri/EjGSV22/87
 pS/fKQO5/k4cZ1dq1GcGOrAphZkwWU+NBTU7jr1D5z4Gp71my7CARFM0deOR1T8voUhW
 GL2g==
X-Gm-Message-State: AOAM530oSdgWXR3VHdqhS90+MglYcryBGz9pfKpD+9mdw/wX+WgLlxRp
 CmsTDTAz34CCVkugdiTGQjh/YQKcqVap90PQMguSlwhUccYk1w==
X-Google-Smtp-Source: ABdhPJx997yxSIl3E/LzB/8mCKIh2fN6RdVEgUUV/IhtOXpbd1XJFmwIgkHnajk8pGNDTpt0wMdTO28QR6z0ifkyeSQ=
X-Received: by 2002:a05:6e02:1348:: with SMTP id
 k8mr13639117ilr.277.1616811093498; 
 Fri, 26 Mar 2021 19:11:33 -0700 (PDT)
MIME-Version: 1.0
From: Zach Reizner <zachr@google.com>
Date: Fri, 26 Mar 2021 22:11:16 -0400
Message-ID: <CAFNex=DvFCq=AQf+=19fTfw-T8eZZT=3NnFFm2JMFvVr5QgQyA@mail.gmail.com>
Subject: [PATCH v2] linux-user: allow NULL msg in recvfrom
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::134;
 envelope-from=zachr@google.com; helo=mail-il1-x134.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The kernel allows a NULL msg in recvfrom so that he size of the next
message may be queried before allocating a correctly sized buffer. This
change allows the syscall translator to pass along the NULL msg pointer
instead of returning early with EFAULT.

Signed-off-by: Zach Reizner <zachr@google.com>
---
v2:
 - return -TARGET_EFAULT on non-null invalid msg pointer

 linux-user/syscall.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 1e508576c7..294779c86f 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -3679,9 +3679,14 @@ static abi_long do_recvfrom(int fd, abi_ulong
msg, size_t len, int flags,
     void *host_msg;
     abi_long ret;

-    host_msg = lock_user(VERIFY_WRITE, msg, len, 0);
-    if (!host_msg)
-        return -TARGET_EFAULT;
+    if (!msg) {
+        host_msg = NULL;
+    } else {
+        host_msg = lock_user(VERIFY_WRITE, msg, len, 0);
+        if (!host_msg) {
+            return -TARGET_EFAULT;
+        }
+    }
     if (target_addr) {
         if (get_user_u32(addrlen, target_addrlen)) {
             ret = -TARGET_EFAULT;
-- 
2.31.0.291.g576ba9dcdaf-goog

