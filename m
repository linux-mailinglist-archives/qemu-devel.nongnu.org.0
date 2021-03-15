Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FEC33ACF7
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 09:03:45 +0100 (CET)
Received: from localhost ([::1]:52240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLiCW-0007P6-36
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 04:03:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lLi6l-00086i-Dh
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 03:57:47 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:33838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lLi6c-0004IL-Ge
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 03:57:47 -0400
Received: by mail-pg1-x535.google.com with SMTP id l2so19986670pgb.1
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 00:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AOJ2QdUoacEyYTIHcov1wUhULbukkNRfEybRpgNWhoE=;
 b=EtPXKG2PbSVfiwicmC+il8DenH+Ynj5kD0dUIpWG5yUk4wYkmETJxpwNjABuH4siq8
 B7EftfzKZsyeqFzPSAt+wHBrCKymX9obI+5Ut2wae1zCavifbEZ320MM/Y3sr80koLSA
 QncOtLix3IaKcRIL5I/f8VSifNUfeRXTEMVpOayo78AqvlGxJteIjZFnU8EKAOBnwMuf
 ddY8D5AvdCUYDxGwzYSugJNDP+dRilZlgnQfKzCD+lde703SvRwsVxFezk2Fc2Llb+Oa
 wHUXq+73fy2tP4lvPjRClF4YFidPDX809SpnOGEP5vZPpFtHOojgH4i5v0LYx5tRtkP7
 Hr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AOJ2QdUoacEyYTIHcov1wUhULbukkNRfEybRpgNWhoE=;
 b=ftVUH1lshP6Cn+zs4uoWtiuZRM4JtBDdlwXhI5hK0vpr5+YQEFbvNJhVkhV2Z/CXNv
 /tnEjLudvkvFdAIyoj++BHmIr3CpnXpvQPwr84/+/hyFWAYvtXshYsW9NTxEeNbax9pH
 Aw6lUuKM0990MdI0cJHHHWStKRVI74bHFHJl83BGtuRpyHC4LJbYp6YGtnmbpoqYH/d6
 VrvUdoykVilT77ZcC8GWnNW4cGlc6IkJYm/LgrocjmAY88zrEw9hI7/LBdJ40HoR0vUl
 w4xaoxjCHDqVcAlirI+DvNmLT54Ohi09MnAYroVs7GomZ+QlC3x37ZZF0JkMQl5fYmBW
 X5fQ==
X-Gm-Message-State: AOAM533MM7PGt8gd7qmn5VCFMWYwRjGf2Ujx4co65gcU2q6FwjaoRonO
 avMOy6DeX36phG9TIR5QTYQ=
X-Google-Smtp-Source: ABdhPJwf7rUIOXyrANOJifngxEig1ZeyawsyrfXWsfK1ReHgA3lGahM9y1AfTHPxQwKqCfyQXD9/ng==
X-Received: by 2002:a62:bd05:0:b029:1ab:6d2:5edf with SMTP id
 a5-20020a62bd050000b02901ab06d25edfmr9149114pff.32.1615795056897; 
 Mon, 15 Mar 2021 00:57:36 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id y9sm10166745pja.50.2021.03.15.00.57.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 00:57:36 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v2 03/13] net: slirp: Pad short frames to minimum size before
 send
Date: Mon, 15 Mar 2021 15:57:08 +0800
Message-Id: <20210315075718.5402-4-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210315075718.5402-1-bmeng.cn@gmail.com>
References: <20210315075718.5402-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x535.google.com
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

The minimum Ethernet frame length is 60 bytes. For short frames with
smaller length like ARP packets (only 42 bytes), on a real world NIC
it can choose either padding its length to the minimum required 60
bytes, or sending it out directly to the wire. Such behavior can be
hardcoded or controled by a register bit. Similarly on the receive
path, NICs can choose either dropping such short frames directly or
handing them over to software to handle.

On the other hand, for the network backends like SLiRP/TAP, they
don't expose a way to control the short frame behavior. As of today
they just send/receive data from/to the other end connected to them,
which means any sized packet is acceptable. So they can send and
receive short frames without any problem. It is observed that ARP
packets sent from SLiRP/TAP are 42 bytes, and SLiRP/TAP just send
these ARP packets to the other end which might be a NIC model that
does not allow short frames to pass through.

To provide better compatibility, for packets sent from QEMU network
backends, we change to pad short frames before sending it out to the
other end. This ensures a backend as an Ethernet sender does not
violate the spec. But with this change, the behavior of dropping
short frames in the NIC model cannot be emulated because it always
receives a packet that is spec complaint. The capability of sending
short frames from NIC models cannot be supported as well.

This commit should be able to fix the issue as reported with some
NIC models before, that ARP requests get dropped, preventing the
guest from becoming visible on the network. It was workarounded in
these NIC models on the receive path, that when a short frame is
received, it is padded up to 60 bytes.

The following 2 commits seem to be the one to workaround this issue
in e1000 and vmxenet3 before, and should probably be reverted.

  commit 78aeb23eded2 ("e1000: Pad short frames to minimum size (60 bytes)")
  commit 40a87c6c9b11 ("vmxnet3: Pad short frames to minimum size (60 bytes)")

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 net/slirp.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/net/slirp.c b/net/slirp.c
index be914c0be0..ad2db03182 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -31,6 +31,7 @@
 #include <pwd.h>
 #include <sys/wait.h>
 #endif
+#include "net/eth.h"
 #include "net/net.h"
 #include "clients.h"
 #include "hub.h"
@@ -115,6 +116,17 @@ static ssize_t net_slirp_send_packet(const void *pkt, size_t pkt_len,
                                      void *opaque)
 {
     SlirpState *s = opaque;
+    uint8_t min_buf[ETH_ZLEN];
+
+    if (!s->nc.peer->do_not_pad) {
+        /* Pad to minimum Ethernet frame length */
+        if (pkt_len < ETH_ZLEN) {
+            memcpy(min_buf, pkt, pkt_len);
+            memset(&min_buf[pkt_len], 0, ETH_ZLEN - pkt_len);
+            pkt = min_buf;
+            pkt_len = ETH_ZLEN;
+        }
+    }
 
     return qemu_send_packet(&s->nc, pkt, pkt_len);
 }
-- 
2.25.1


