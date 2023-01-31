Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C6F683520
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 19:24:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMvIX-0005Ql-MC; Tue, 31 Jan 2023 13:24:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vlaomao@gmail.com>)
 id 1pMvIV-0005J6-B7; Tue, 31 Jan 2023 13:23:59 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vlaomao@gmail.com>)
 id 1pMvIT-00050y-Sj; Tue, 31 Jan 2023 13:23:59 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 ha3-20020a17090af3c300b00230222051a6so1618418pjb.2; 
 Tue, 31 Jan 2023 10:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6cIpJ4gpd6TFREbsruT2XVU6Jcq/2UIIj9+nypPblTE=;
 b=bTMPjqcwSEOtSqSRwYBnmEjSTVrLqgufVZ+fP3DwvyAksxrbnfpUxWBWms0MZVCcUI
 5a+wIVKfj2jNIIuQkJJNsHeDu8aFefMXow0CK6ibaOPiBfmyQ9q+Rkh3e7+YgpD01oWm
 748han0Bv6yFbM+7XKT5Xxgbnrbeq0X6XF3cKe/MP61l9zwFGjzgqAq3WF98begZILER
 HPWg9wWRj9gl2/N2K6Nwoghz6Phypt2JaN/IqG/lIwJnStUKsKUVJR23O8KiDmQWl5r2
 nsbkbwKeuHRkS4ZyQ13XezF2EBCVzGWys6HjCzrYymA1hrIoZffORIoCenNUGxwCQv1T
 Yk/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6cIpJ4gpd6TFREbsruT2XVU6Jcq/2UIIj9+nypPblTE=;
 b=HWiNwDFzCZDlrAdOyvbuN8LU3Y7uQyQsjx3iaszCHBeR9jx0hFzlvrJfbYROzgjJf6
 ov7+6bt055XPIshJEwMQ0qh/VE3DztXXfuZdRFFx3wlVV2fi2GGN1A40JW66In5cbCxx
 Jypbwvw5m8i3WtGdZekWjvx1pJ4NpcfBd8sJLTZCqgfpG7PWY7w6sDVuWJcN8qGO2cGy
 rvZ6Byzdr3ERgg9k83J5oXm70LFt8QNGvYWefo2a2Ig7sSvNS199IWrQlZ6tXt4uUX4T
 V9tGFC3oACTjSB7OF4gvuJckTI2SZoAl9YfM+LlcdMPG+2rsrBrReCMGw6O5cGSmVkqj
 GsZw==
X-Gm-Message-State: AO0yUKWK5NvZb9nceYlfGt9a9lFmLYlBJ2OEsSz0YkeyfbXmdxPKKHXj
 CviD8RdR5rk4bwLlwyN85yKy86TbNQsAZrB7
X-Google-Smtp-Source: AK7set/nVxvtlX0eqxGQX9uAHJ7x0Z8qxiuc9VgaZfI5DCm4GpU6pW9pNP/PrrZGwF/uDlnr5oScqQ==
X-Received: by 2002:a17:90b:38c7:b0:230:efe:69c3 with SMTP id
 nn7-20020a17090b38c700b002300efe69c3mr4208910pjb.25.1675189436063; 
 Tue, 31 Jan 2023 10:23:56 -0800 (PST)
Received: from localhost.localdomain ([94.181.144.4])
 by smtp.googlemail.com with ESMTPSA id
 h18-20020a17090adb9200b001ef8ab65052sm9134313pjv.11.2023.01.31.10.23.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 10:23:55 -0800 (PST)
From: Vlao Mao <vlaomao@gmail.com>
To: dmitry@daynix.com
Cc: jasowang@redhat.com, qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 laurent@vivier.eu
Subject: [PATCH qemu 1/1] vmxnet3: add mac address restore upon reset
Date: Tue, 31 Jan 2023 21:23:37 +0300
Message-Id: <20230131182337.15645-2-vlaomao@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230131182337.15645-1-vlaomao@gmail.com>
References: <20230131182337.15645-1-vlaomao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=vlaomao@gmail.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Changing the address with a subsequent reboot makes this address permanent until the vm is turned off

Signed-off-by: Vlao Mao <vlaomao@gmail.com>
---
 hw/net/vmxnet3.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
index 04159c8222..695ca2f923 100644
--- a/hw/net/vmxnet3.c
+++ b/hw/net/vmxnet3.c
@@ -1206,6 +1206,8 @@ static void vmxnet3_reset(VMXNET3State *s)
     s->drv_shmem = 0;
     s->tx_sop = true;
     s->skip_current_tx_pkt = false;
+
+    vmxnet3_reset_mac(s);
 }
 
 static void vmxnet3_update_rx_mode(VMXNET3State *s)
-- 
2.35.1


