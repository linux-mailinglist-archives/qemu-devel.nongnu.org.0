Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C690177E7A
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Mar 2020 19:34:10 +0100 (CET)
Received: from localhost ([::1]:51632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9CMr-0003x7-4A
	for lists+qemu-devel@lfdr.de; Tue, 03 Mar 2020 13:34:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43875)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrew@daynix.com>) id 1j9Bt1-0008Gv-4l
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 13:03:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrew@daynix.com>) id 1j9Bsz-0005Du-P8
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 13:03:19 -0500
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:38118)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <andrew@daynix.com>) id 1j9Bsz-0005Cz-6Q
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 13:03:17 -0500
Received: by mail-lf1-x142.google.com with SMTP id x22so2520887lff.5
 for <qemu-devel@nongnu.org>; Tue, 03 Mar 2020 10:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kyh53JczQ540B6ROGldcn//ND2e8k3HqYjeQ0Xz6uts=;
 b=RJyc1LixzgMuCad9/rMsQrtqzRUxqfPsIBPKFumd1J6PSUmiHVCOW6OS9Kr/He0dBV
 mS8zm8vlwzB41KuIiAqrEgcWcmlLOsIS/3GxH7icPllZzTES2NJuTPouwS1CGUAuJZzh
 N4yaAOHcMPjzTfQmnowZlnLkQMoVmHxTVmYU8cJjbh+mj26YJAuyXMg63XkNa6tNGO4J
 cHza++fxTxEL+QfvZuEgssXF6kSf7JicAA8t2NMbqxL1jKAC3rCDtd89+WlP2L7gcHwp
 /MdMBxXxUQy5VBchhsCoDw3yYomgTBqpqZpufcdCYdhU2sZ50REq9wWsXkOukR6if2Jh
 SBxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kyh53JczQ540B6ROGldcn//ND2e8k3HqYjeQ0Xz6uts=;
 b=J26G4qpWe4BI+AXHLU1miqB1lqxmTH3z3qxZkTOnm9HEdBcZnmAQZT5qHg0CNh66jz
 kxPsKNniisG7WhNWCbUxgndbgABDHCmbpQlXgMC5p8XS3XJMWHjKqffsI7tdzrnqBN+p
 g/f9spapRrUpnlIoBRHN1lptI9rRMqMbo17xrMsQ2aCKoAkLHeAEDTVPW5/7Ejxqh8CH
 9rabEyWDTtbj0QFhMsHMu9o0iyzKysYXgEn6WWjaCfSzpNOPr/kHgHwWGxlWl3FlYvx5
 NhXcMJctIWsy5dN3zUOHFc8id0Szup3RbJFj0b3q+IgcrrSpkMw4reUWj61i2wfpApoA
 g+6A==
X-Gm-Message-State: ANhLgQ2016k67UYDpc6O0WFEkG6NLKZxE3UxWqY/XAdOVrTYs4DuCPlt
 NuzEhjpW/VjozHJ/XHJ5OpOv7si9+Nw=
X-Google-Smtp-Source: ADFU+vs2ZYZCZk6hqWh1zCcW4xn3kM2YdgG7tCCeNe7mwL6++Zez7i5ZPylSOd3T673bkDurBTfN4w==
X-Received: by 2002:a19:ee0a:: with SMTP id g10mr3528408lfb.182.1583258594771; 
 Tue, 03 Mar 2020 10:03:14 -0800 (PST)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id k11sm1389872lfd.17.2020.03.03.10.03.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2020 10:03:14 -0800 (PST)
From: andrew@daynix.com
To: qemu-devel@nongnu.org
Subject: [PATCH] Fixed integer overflow in e1000e
Date: Tue,  3 Mar 2020 20:29:25 +0200
Message-Id: <20200303182925.39419-1-andrew@daynix.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::142
X-Mailman-Approved-At: Tue, 03 Mar 2020 13:32:50 -0500
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
Cc: dmitry.fleytman@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrew Melnychenko <andrew@daynix.com>

https://bugzilla.redhat.com/show_bug.cgi?id=1737400
Fixed setting max_queue_num if there are no peers in NICConf. qemu_new_nic() creates NICState with 1 NetClientState(index 0) without peers, set max_queue_num to 0 - It prevents undefined behavior and possible crashes, especially during pcie hotplug.

Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
---
 hw/net/e1000e.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/e1000e.c b/hw/net/e1000e.c
index a91dbdca3c..f2cc1552c5 100644
--- a/hw/net/e1000e.c
+++ b/hw/net/e1000e.c
@@ -328,7 +328,7 @@ e1000e_init_net_peer(E1000EState *s, PCIDevice *pci_dev, uint8_t *macaddr)
     s->nic = qemu_new_nic(&net_e1000e_info, &s->conf,
         object_get_typename(OBJECT(s)), dev->id, s);
 
-    s->core.max_queue_num = s->conf.peers.queues - 1;
+    s->core.max_queue_num = s->conf.peers.queues ? s->conf.peers.queues - 1 : 0;
 
     trace_e1000e_mac_set_permanent(MAC_ARG(macaddr));
     memcpy(s->core.permanent_mac, macaddr, sizeof(s->core.permanent_mac));
-- 
2.24.1


