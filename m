Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6FC54A8A4
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 07:20:12 +0200 (CEST)
Received: from localhost ([::1]:59292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0yyI-0003a8-KU
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 01:20:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1o0yvJ-0000sG-H6
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 01:17:06 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:42604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1o0yvI-0000zx-3Z
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 01:17:05 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 o33-20020a17090a0a2400b001ea806e48c6so8048534pjo.1
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 22:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YKRxELDYmUMfhugMV5DcbLSb/amLG/qPOQgkHQTfT7g=;
 b=E032+evQdRH2NuNgLiwG89CYUpUPj39VDFk33O/nudPj9/X10TSUXKJ337cTmbvlGJ
 RuObnfYSpq557vuPMVunbGdRRJXOigi0SUTaNijlbyYEjOkiLlQ4jTviDG9ne+ZnUQvi
 EI1GyiXWY4duJ/TioIG02Fott+tnJaMsAOkhkZyTUJ0U1eMaKVZVMQPTaMOCsUKpOZhc
 AxLJ4t45Cg/AGWUFYiSnk0X3/nYvR8IVstXFPgcMSJC5j5y7XEc4+wLjrW4jD+gMjrw0
 hGT+mHK8+OzuVTTIBdO8iCn6U3wSCL1mw72T/x1+8+pPMU5aGCPLFrw/jg+i88XB0Joa
 iJvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YKRxELDYmUMfhugMV5DcbLSb/amLG/qPOQgkHQTfT7g=;
 b=BdDGmVwW52lUAjYlyciqxImslD+9EcrW13ytp3sPT1OAqI6taotoI6PgcqVB2zlI7u
 lD05I/piUVwfZbwVXAEHlxe/66ogOPmiDAppE98W/plVdqwPg9Tn11oCQAk7q/QC/0xm
 Mb4+xJp9QDT/N4lq4R1a5bbUZcdZ9dMnQ0Qx2H1NZiL8VC+g6jazU6TYCmeknF4VK36S
 YSp6jhbU9VaBrEtPNBXPxpX1e4RRvWo9PWVhe0t4DEjBguqrx/sYLB3F0tC01GmgNf6V
 rfLlAwW1J/suA3o0Xpysomt9c4tknCsXJsHhel2AzuC2ilnwwUdJw1sLX/6UPz/HjoXW
 W3IQ==
X-Gm-Message-State: AJIora+4X6GnkfpqKwpIWegYyqlXM3dpVQ48TG3Bp8z9td/zj/EbXIoo
 HcY4BP4JnkWeT39lPuN0YyTR
X-Google-Smtp-Source: AGRyM1uJhJEjat560HfZEGzTJUMGmik8LAiUn0GvK5DbccYRfN2b5SnSNf4dVsBYbkyYyXriRQ8+Ew==
X-Received: by 2002:a17:90b:368b:b0:1e6:67a0:1c17 with SMTP id
 mj11-20020a17090b368b00b001e667a01c17mr2546599pjb.203.1655183822845; 
 Mon, 13 Jun 2022 22:17:02 -0700 (PDT)
Received: from localhost ([139.177.225.237]) by smtp.gmail.com with ESMTPSA id
 l4-20020a170903120400b0016511314b94sm6103301plh.159.2022.06.13.22.17.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 22:17:02 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: kwolf@redhat.com,
	stefanha@redhat.com
Cc: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 2/6] libvduse: Fix resources leak in vduse_dev_destroy()
Date: Tue, 14 Jun 2022 13:15:28 +0800
Message-Id: <20220614051532.92-3-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220614051532.92-1-xieyongji@bytedance.com>
References: <20220614051532.92-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=xieyongji@bytedance.com; helo=mail-pj1-x1029.google.com
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
index dd1faffe66..9a2bcec282 100644
--- a/subprojects/libvduse/libvduse.c
+++ b/subprojects/libvduse/libvduse.c
@@ -1357,11 +1357,11 @@ int vduse_dev_destroy(VduseDev *dev)
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


