Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C771A6463
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Apr 2020 10:59:02 +0200 (CEST)
Received: from localhost ([::1]:41846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jNuvk-0008FT-N7
	for lists+qemu-devel@lfdr.de; Mon, 13 Apr 2020 04:59:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44537)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yuval.shaia.ml@gmail.com>) id 1jNuuZ-0007p0-B0
 for qemu-devel@nongnu.org; Mon, 13 Apr 2020 04:57:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yuval.shaia.ml@gmail.com>) id 1jNuuY-0001ad-A4
 for qemu-devel@nongnu.org; Mon, 13 Apr 2020 04:57:47 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:47093)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <yuval.shaia.ml@gmail.com>)
 id 1jNuuY-0001a2-4p
 for qemu-devel@nongnu.org; Mon, 13 Apr 2020 04:57:46 -0400
Received: by mail-wr1-x442.google.com with SMTP id f13so9390745wrm.13
 for <qemu-devel@nongnu.org>; Mon, 13 Apr 2020 01:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EDNm+19QYmmhPXS1tO04S7puEnX7M/TdzDrONjug0/c=;
 b=gg0EnlZOOnW4ncSM4zbYvkKkVTfftS385kIJvNEKnFVIux1ajbg92cBnSstecAnOWK
 nL88OYUHmqkYDOh2LbwTgKtv7uhv1Z3k1G4blwkl3lPzdIB8KX/b9YJAG6nHlZQM7Ppe
 HtZ8CGetX3r7fOh9eOQRWo5JQPohyUAQoRIW7UkkbK6An7nceWT2hY1jfoOKty+UtLgc
 afSbVEluJXtBPIKXXmcyryC+yBSyj1h9i5v0L55IoTgt3GUyp6x+fZppOg8eZc3V7w16
 f0UAuST2zkxdsFc99wbfN9k20GGmNHzF31ty3kFJTEDmyFlPx4GP2MJPVdGQss/yPTBJ
 uaIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EDNm+19QYmmhPXS1tO04S7puEnX7M/TdzDrONjug0/c=;
 b=SLbtYeMFOZo4e2+/0LxtzaeInWEnCG8hgn7XLwulwS66RE9DsxKSJYgnNr1FVPC3Ls
 5hZvgyZRGf3jvpgu8QEn8hsn1eYvucyGgqBtFMkX9rALRFMfvEd1e+uP6DqHgyBp1qzz
 zN4rpNInvYA0wIVGuHyCIEkQjtjK8nc27Z9kzNrMhxfPklxFzO5V4qbU6/SEb4Ye53Hy
 JYyJP8wOnHeEohHUgX/9Do32Z5wMz9sAURZnvANZ/COoNlGfOCINbuD3Oe7SlNashk8t
 8CDHNWJHY4tfhNgMK9o0PyJsSAqGbaCPd17lFPLWYn0RGD7aFJTdkoIMkYUlAFqrpqHg
 drGQ==
X-Gm-Message-State: AGi0PuY/oTAMjLPfdjkwx1TuGxk26MP57APqMqb21gyd61C0NXbfjd95
 r79fo5eU16eAcFb/AAVtkzxGAlh1
X-Google-Smtp-Source: APiQypJ0zMJ491T+Xmyv6ZktweQ51b5I4mgBwhfjgEO+qIoGwZovuUJSRcy+yowIv47lJf/dBvToVw==
X-Received: by 2002:a5d:410a:: with SMTP id l10mr17396774wrp.355.1586768264271; 
 Mon, 13 Apr 2020 01:57:44 -0700 (PDT)
Received: from localhost.localdomain ([2a00:a040:186:a1ad:5254:ff:fe84:1be0])
 by smtp.gmail.com with ESMTPSA id
 n6sm13981990wmn.10.2020.04.13.01.57.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Apr 2020 01:57:43 -0700 (PDT)
From: Yuval Shaia <yuval.shaia.ml@gmail.com>
To: qemu-devel@nongnu.org, yuval.shaia.ml@gmail.com, marcel.apfelbaum@gmail.com
Subject: [PATCH] hw/rdma: Destroy list mutex when list is destroyed
Date: Mon, 13 Apr 2020 11:57:38 +0300
Message-Id: <20200413085738.11145-1-yuval.shaia.ml@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

List mutex should be destroyed when gs list gets destroyed.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
---
 hw/rdma/rdma_utils.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/rdma/rdma_utils.c b/hw/rdma/rdma_utils.c
index 73f279104c..698ed4716c 100644
--- a/hw/rdma/rdma_utils.c
+++ b/hw/rdma/rdma_utils.c
@@ -100,6 +100,7 @@ void rdma_protected_gslist_destroy(RdmaProtectedGSList *list)
 {
     if (list->list) {
         g_slist_free(list->list);
+        qemu_mutex_destroy(&list->lock);
         list->list = NULL;
     }
 }
-- 
2.20.1


