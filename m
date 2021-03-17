Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E4E33E9C5
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 07:35:04 +0100 (CET)
Received: from localhost ([::1]:39578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMPln-0000iC-LH
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 02:35:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lMPeH-0003qN-FZ
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 02:27:18 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:41675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lMPeB-0000AN-F0
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 02:27:17 -0400
Received: by mail-ed1-x529.google.com with SMTP id z1so840408edb.8
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 23:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=iPwxQg/lwVJvMXW1l0nau/UtyXDrLqEwDqu+e37f5Nw=;
 b=FnfDC8DW6JIpKCSKbe5X+czGwIq0LfVuj76pfgkSvil1AQr2cGXWnY9F3SnO0tSGwg
 xe0VDRpr6JjTlMOkr75DerTtmYwAJTuTj54U4BT2S/dfHOIZeDustW44HZisVa0WmO4F
 eYnpAFjY8T/UgwSYCM6D6NNrbs8mv04roNC/2j3kail5I7N1kBD5lHoHQkLVt4N9w4Li
 p0vYoOYMVO+aKcxqwsZvRDDkGwoARy8u2BbforNPncAsBKcEPaaxlK89zu+oRy3wRpEg
 U3XeMFNb3V5AsSBacEeJq2cRcdTvqllTmTSIxej9ieNCy1feDt3fal0K18CR6mHfRmNK
 f2yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=iPwxQg/lwVJvMXW1l0nau/UtyXDrLqEwDqu+e37f5Nw=;
 b=siD3PmyNVU9Oq68DQpL9o6ic35F/OUFSem8+LzA+Nq5YdzpmS09PndeY2eUHLLFwYo
 sYZJdARaMy2rYaM4NZy9LBOUWsxWbpa5+gKr95XFpF1Qp2UR85ZYE70p7JsGXPU8kuEg
 6jBgOZaZMk9nYMiG9TBOmsxrRAlxJsUPMpomyfygC3tRPMBL/5xwFRw4U0B4270eWMIU
 njY7g96JoS4vg6xcRsZkW8lojnEYrdncAAcdec+eJDK2/Cjz8yN6kLZ18UBC5mOI7GEK
 ecZqTq3RJwtTLZEKlS4Eim0nxQ7UG9p+YMuqzdtv336pSyv7sJh3SAMDVx0G4BFABqu9
 HZ9w==
X-Gm-Message-State: AOAM530QV1wq5g3gLAzWtcoZvdrp/HAkbVMiAtGglybrKxwNSbZpjtK/
 d+XyYOCofxygSUBti1i+cRo=
X-Google-Smtp-Source: ABdhPJw4LqXUE8gN9sxTapAIkTdycuLxwZ76mbSxjykZFUkYLwBo/EXmdFcN/nHgEsXCRoWOP6dDhw==
X-Received: by 2002:a05:6402:46:: with SMTP id
 f6mr40222341edu.252.1615962430232; 
 Tue, 16 Mar 2021 23:27:10 -0700 (PDT)
Received: from pek-vx-bsp9.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id d1sm10751349eje.26.2021.03.16.23.27.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 23:27:09 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v5 05/12] hw/net: e1000: Remove the logic of padding short
 frames in the receive path
Date: Wed, 17 Mar 2021 14:26:31 +0800
Message-Id: <20210317062638.72626-6-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210317062638.72626-1-bmeng.cn@gmail.com>
References: <20210317062638.72626-1-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x529.google.com
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
index 4f75b44cfc..4587b28176 100644
--- a/hw/net/e1000.c
+++ b/hw/net/e1000.c
@@ -886,7 +886,6 @@ e1000_receive_iov(NetClientState *nc, const struct iovec *iov, int iovcnt)
     uint16_t vlan_special = 0;
     uint8_t vlan_status = 0;
     uint8_t min_buf[MIN_BUF_SIZE];
-    struct iovec min_iov;
     uint8_t *filter_buf = iov->iov_base;
     size_t size = iov_size(iov, iovcnt);
     size_t iov_ofs = 0;
@@ -902,15 +901,7 @@ e1000_receive_iov(NetClientState *nc, const struct iovec *iov, int iovcnt)
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
2.17.1


