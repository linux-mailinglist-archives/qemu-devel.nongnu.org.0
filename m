Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC65733D38F
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 13:12:47 +0100 (CET)
Received: from localhost ([::1]:55740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM8Z4-00018Z-VO
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 08:12:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lM8RK-0002iV-9r
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 08:04:46 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:54114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lM8RH-0003oY-Dn
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 08:04:45 -0400
Received: by mail-pj1-x102f.google.com with SMTP id t18so10497670pjs.3
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 05:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eObphcBqxSpSO7OGp8OS0zOxW+vIFNobRqmgIn159yQ=;
 b=sCB5aGXfbD5aFoRL14sT9xxBXGXbF2Mlr1Rn4WpYRvCevct99oGLnnILrDoiWbBq25
 cFKWrwOLJgoc8Hjd4oClqrlKxyMMmoJ2BJl7ed+88zdRHjgohglj12+/9+O0xy2S45aH
 uHyLuXxPnNZg/RtVAzA/R7TyQGEaozJLBTlOWN87KNYP1ZJI57FBSuabdWTmOLWfIvTq
 2OgAtb1xzIOcV/WANYfD8R6npFPbuQDwJKFjw2mYBTosWZ5vTlA1Omkv9H0CQ0SlDah8
 cIr/OBcNdfPUVT21OAmNhlv+K+ETJnfMBn/r6ZLqfHK9UwD5GUtcRKMjCtPznueTOXyI
 joGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eObphcBqxSpSO7OGp8OS0zOxW+vIFNobRqmgIn159yQ=;
 b=YteNunRJ5292RgVUDckZUsHZQbQ91dPWE26orumhwEdtMWJkUoXH2Oc8OWTZPvq64O
 Xn5CEEch0ksbXW6tilLMh742fNc6ojhtFLNHgpksmg5P06R9+i1M4wtv07crBl4oy+pk
 q01snxLoZrx1GPOlNvAXoLT0lM3G+xx3NiEu3hCM6G06LGRLaazupTSwgak8Qwez8Lj+
 pUJrCS/DNl+I3cKvbgqYhY3WzBDxdpGQ40iJfK+t5DkewyqCDXTV3kr34Dmnuc7ss01O
 PYiQjJ8aLgwQO1oAAehFS9LW7YlIQvSVy1l4iOl2iQf9ytlCjLGi6W9SjDxCMz0ScHFn
 A7DQ==
X-Gm-Message-State: AOAM533ZcUnoRefa2L6s1pu8w0Q3uYPNLuRVd4mRHX/EISv+WIVU8Qmn
 Tz29gP0FCMJTnuBiVGhZ0WU=
X-Google-Smtp-Source: ABdhPJxcjl1f1BalyOCrmCGnR9ajVvXNnvihqhY+IZLn8HZQYHaHZ3Gk1jEhrxK5Oeb4DSzb31REWQ==
X-Received: by 2002:a17:903:31ca:b029:e6:65f:ca87 with SMTP id
 v10-20020a17090331cab02900e6065fca87mr16130402ple.85.1615896281725; 
 Tue, 16 Mar 2021 05:04:41 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id d5sm2722166pjo.12.2021.03.16.05.04.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 05:04:41 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v4 05/12] hw/net: e1000: Remove the logic of padding short
 frames in the receive path
Date: Tue, 16 Mar 2021 20:04:13 +0800
Message-Id: <20210316120420.19658-6-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210316120420.19658-1-bmeng.cn@gmail.com>
References: <20210316120420.19658-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we have implemented unified short frames padding in the
QEMU networking codes, remove the same logic in the NIC codes.

This actually reverts commit 78aeb23eded2d0b765bf9145c71f80025b568acd.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

(no changes since v1)

 hw/net/e1000.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/hw/net/e1000.c b/hw/net/e1000.c
index d8da2f6528..a53ba9052b 100644
--- a/hw/net/e1000.c
+++ b/hw/net/e1000.c
@@ -882,7 +882,6 @@ e1000_receive_iov(NetClientState *nc, const struct iovec *iov, int iovcnt)
     uint16_t vlan_special = 0;
     uint8_t vlan_status = 0;
     uint8_t min_buf[MIN_BUF_SIZE];
-    struct iovec min_iov;
     uint8_t *filter_buf = iov->iov_base;
     size_t size = iov_size(iov, iovcnt);
     size_t iov_ofs = 0;
@@ -898,15 +897,7 @@ e1000_receive_iov(NetClientState *nc, const struct iovec *iov, int iovcnt)
         return 0;
     }
 
-    /* Pad to minimum Ethernet frame length */
-    if (size < sizeof(min_buf)) {
-        iov_to_buf(iov, iovcnt, 0, min_buf, size);
-        memset(&min_buf[size], 0, sizeof(min_buf) - size);
-        min_iov.iov_base = filter_buf = min_buf;
-        min_iov.iov_len = size = sizeof(min_buf);
-        iovcnt = 1;
-        iov = &min_iov;
-    } else if (iov->iov_len < MAXIMUM_ETHERNET_HDR_LEN) {
+    if (iov->iov_len < MAXIMUM_ETHERNET_HDR_LEN) {
         /* This is very unlikely, but may happen. */
         iov_to_buf(iov, iovcnt, 0, min_buf, MAXIMUM_ETHERNET_HDR_LEN);
         filter_buf = min_buf;
-- 
2.25.1


