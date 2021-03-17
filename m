Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB52F33EA01
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 07:44:30 +0100 (CET)
Received: from localhost ([::1]:33310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMPuw-0001TV-1m
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 02:44:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lMPeX-00044q-58
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 02:27:33 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:47032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lMPeV-0000Gv-JG
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 02:27:32 -0400
Received: by mail-ed1-x534.google.com with SMTP id h10so818198edt.13
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 23:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=SddBPwredzwocA1Fr7ONOu1Dbgzb8rE0mV84rYBDhV4=;
 b=KXl2g7x6sC788HqUCgPRLDVL3Wd95qQsejF1ivAaA6t6Qb+vlnbPbDddmKZtHDjzuJ
 at/v2DnTTdwxMuZrPJ4IQvtHFWWtCjl6lzRNx67fy+F1RtheVaus3+kU7mvaPDJ6/u5Y
 L3wJpYag66RyAqWcKBsbzBiW0cpQUDxGrn5fInKPDUhUzJqo5iNTcCZxtX5uOx13l+gJ
 MJjSEXmLdDZsbBoMy/HAak3aMecfa+VFYyDBOVZZuQrBPo4lxRWMI2lmtiHEe8GmpHzY
 nzRFC9OZ7Rr3iOCDEv4CKYYiiumDRT8hwYxRuva0nfM1LW45fpQcOx2IAEq90cgyKQ9R
 iSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=SddBPwredzwocA1Fr7ONOu1Dbgzb8rE0mV84rYBDhV4=;
 b=oNfRq3ceezVNeaTnJbSgHS7wHcm6v2WGiNzGxmbO+BRUa1/NVmegAagPAwDptx/S1p
 j+5hzwiRyOjbanRCX8IDIyTr7nECNoDPjdQnPlp4RYBk8s1jJ6Up15CKC3Zx0Fs2q+lJ
 7lFGnBeoD4yJyK1L2slmBNM8D9xKFUSj5S4J0dYXm/i50FRA+fD2JBuNL+5a7HMjo4Yl
 zdtPGg/FpsKWrdHPZXFrGqu3wTM3qShJvz+HsrBLrk2tgIjzdmHgfZZif6TVmgOefBJJ
 wEiasG1yoHvznYseC7ZVihOKOlrVnKnIWAUM3G0IGccp5KiaeuECKuYV97olyucRJwK8
 I2Hw==
X-Gm-Message-State: AOAM530jARObLOPpArh2/xU/tti7QdZ9xF8HZoL6IBt8eTbQTOOJwK94
 GMaEbZilgZkbSOUt01OodmU=
X-Google-Smtp-Source: ABdhPJxuTpDYyUIghQV1glaANvX3stuJQCatSLkKHYA4BHtkNQZtG6Gaatecj82rJEpiaS8yFsfG1A==
X-Received: by 2002:a05:6402:408:: with SMTP id
 q8mr39352872edv.201.1615962450321; 
 Tue, 16 Mar 2021 23:27:30 -0700 (PDT)
Received: from pek-vx-bsp9.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id d1sm10751349eje.26.2021.03.16.23.27.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 23:27:29 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v5 10/12] hw/net: rtl8139: Remove the logic of padding short
 frames in the receive path
Date: Wed, 17 Mar 2021 14:26:36 +0800
Message-Id: <20210317062638.72626-11-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210317062638.72626-1-bmeng.cn@gmail.com>
References: <20210317062638.72626-1-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x534.google.com
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

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

(no changes since v1)

 hw/net/rtl8139.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
index 90b4fc63ce..ae4c756924 100644
--- a/hw/net/rtl8139.c
+++ b/hw/net/rtl8139.c
@@ -827,7 +827,6 @@ static ssize_t rtl8139_do_receive(NetClientState *nc, const uint8_t *buf, size_t
 
     uint32_t packet_header = 0;
 
-    uint8_t buf1[MIN_BUF_SIZE + VLAN_HLEN];
     static const uint8_t broadcast_macaddr[6] =
         { 0xff, 0xff, 0xff, 0xff, 0xff, 0xff };
 
@@ -939,17 +938,6 @@ static ssize_t rtl8139_do_receive(NetClientState *nc, const uint8_t *buf, size_t
         }
     }
 
-    /* if too small buffer, then expand it
-     * Include some tailroom in case a vlan tag is later removed. */
-    if (size < MIN_BUF_SIZE + VLAN_HLEN) {
-        memcpy(buf1, buf, size);
-        memset(buf1 + size, 0, MIN_BUF_SIZE + VLAN_HLEN - size);
-        buf = buf1;
-        if (size < MIN_BUF_SIZE) {
-            size = MIN_BUF_SIZE;
-        }
-    }
-
     if (rtl8139_cp_receiver_enabled(s))
     {
         if (!rtl8139_cp_rx_valid(s)) {
-- 
2.17.1


