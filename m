Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 660F8548546
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 14:48:45 +0200 (CEST)
Received: from localhost ([::1]:53914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0jUp-0005df-V8
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 08:48:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1o0jRR-00030G-Dg
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 08:45:14 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:38735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1o0jRL-0005uq-Qg
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 08:45:10 -0400
Received: by mail-pl1-x636.google.com with SMTP id n18so5007418plg.5
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 05:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hzDd+xOOmP7Hcut1ZZgj5ewS4q2+QDOC60lzlhKXxHQ=;
 b=UCF1kNdjUKjlva684bc8w6mH95K41eN1EMqVAJv7+OBD9hqsx7PyJ9JMsa5D7YJ3o1
 wUaaZFDScY9d8eIggMwz919LIX6SbiSZevsxYJYlCQme3150DVnfXjLlNwSIi1C+hQg9
 XmsaTwKKzB13W+RVQykOD2F6vbAs7Ms9UPhXY4revKgy6luWxXk0H4Y9BpuOW8IYEPd4
 AsSHl/EcDiyGtGpqrrCZ9qkALqdaFb5u/BKhB2wLgl0y5aesepspLA/VdVMvtP6lulGS
 TUOxqGiSBE6Bf2p4jafhjLjsc9s7RpRd4xBYbjaW8yvpkRtpPrTPpXHjtr8vineIPl22
 l5Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hzDd+xOOmP7Hcut1ZZgj5ewS4q2+QDOC60lzlhKXxHQ=;
 b=D57++0WVTqf3EJnYYjzIuIuu7MogDMAjAid3/cASHUzTw7gGT+jlTzasrAX0Tnfp6R
 F3TuiPoo6zJCRtjEHohKuMDZccl3W8RVxiCEA+JakpGF43Wgym89ArSSU1xKzV2tzr2f
 wXIFtMI0pJ2HhG37fzRNSpjjmg7jNYq0chQ/xuFYkjwhxtNRiNmvnvbNp4DtaB+4VP5h
 Kngp1hJEtiFWIQ6+ZiajpeLyLbYFLSOGj0cdkB3ss/LzO2Z56DUE95YUFFZYh7wGZpS4
 74OvQfpQGjUHEY0iCmc0Vmrm+zegZSbvLHI7Eb2zVSXkMgxuInzyzHtz+Tn+uxPfpeNO
 5n/w==
X-Gm-Message-State: AOAM532GmAhxI22FtmxNuGQ9qolL8NomRY83hu2N9XIS3LzwxjWQnaEr
 eiTYQSOj3AZMBfN2HBteJQu6
X-Google-Smtp-Source: ABdhPJwFVVFPeSreawM0gmRDtEu+DtzdAnp1pFBk/Z4u9afvhQXN/asDwf4YLIIyRiP49cTZRzEfSg==
X-Received: by 2002:a17:90b:4d8b:b0:1e3:30bd:5a35 with SMTP id
 oj11-20020a17090b4d8b00b001e330bd5a35mr15831201pjb.152.1655124306014; 
 Mon, 13 Jun 2022 05:45:06 -0700 (PDT)
Received: from localhost ([139.177.225.252]) by smtp.gmail.com with ESMTPSA id
 t22-20020aa79396000000b0051c4ecb0e3dsm5250050pfe.193.2022.06.13.05.45.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 05:45:05 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: kwolf@redhat.com,
	stefanha@redhat.com
Cc: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/5] libvduse: Fix resources leak in vduse_dev_destroy()
Date: Mon, 13 Jun 2022 20:44:59 +0800
Message-Id: <20220613124503.156-2-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220613124503.156-1-xieyongji@bytedance.com>
References: <20220613124503.156-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=xieyongji@bytedance.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This fixes resource leak when the fd is zero in
vduse_dev_destroy().

Fixes: 8dbd281c1675 ("libvduse: Add VDUSE (vDPA Device in Userspace) library")
Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
---
 subprojects/libvduse/libvduse.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/subprojects/libvduse/libvduse.c b/subprojects/libvduse/libvduse.c
index 78bb777402..e781bfa907 100644
--- a/subprojects/libvduse/libvduse.c
+++ b/subprojects/libvduse/libvduse.c
@@ -1374,11 +1374,11 @@ int vduse_dev_destroy(VduseDev *dev)
         free(dev->vqs[i].resubmit_list);
     }
     free(dev->vqs);
-    if (dev->fd > 0) {
+    if (dev->fd >= 0) {
         close(dev->fd);
         dev->fd = -1;
     }
-    if (dev->ctrl_fd > 0) {
+    if (dev->ctrl_fd >= 0) {
         if (ioctl(dev->ctrl_fd, VDUSE_DESTROY_DEV, dev->name)) {
             ret = -errno;
         }
-- 
2.20.1


