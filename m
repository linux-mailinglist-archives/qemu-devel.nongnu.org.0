Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBDE33D386
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 13:07:10 +0100 (CET)
Received: from localhost ([::1]:43570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM8Tc-0004LQ-Rd
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 08:07:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lM8RA-0002P9-RL
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 08:04:36 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:51947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lM8R9-0003kS-DO
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 08:04:36 -0400
Received: by mail-pj1-x102e.google.com with SMTP id s21so10500908pjq.1
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 05:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SUVnzLTZo8cDNw3kuYw8/iZ4P4ckVc4s55CpMIGoa1Y=;
 b=SbE4Q2dPreAuICJdcIzakjPcGzitkj0JQE9qbty5+dLDcNWhH6EttxcleMtNCAWabK
 q9iHTVtUBhfwe5iHX5Z2n1Ed5Mwp9FlvooFK1fzLBWLDaxjGNTTIUzUTxu9FKdb/cseK
 Zb3gvG+9uGPqNQ19qN5MKVYAOgbuFMMjD7odYbirUykcroMbkB3S7/b4A44Z2vHTuSjv
 +GkTftDr5Q8No3jLwOMjeme4Zr5NFWU2zFYDBYHf9uU7Mi80PSmcK1yMg02McdUYWgjv
 O8iOzKqGjWqvjwEsfa2Yk2YxJI2bMzkxP1aOn1QgcIwpvktJzV7slEPQ+Uwsme7JbBPN
 b2SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SUVnzLTZo8cDNw3kuYw8/iZ4P4ckVc4s55CpMIGoa1Y=;
 b=XkqPeI+vGbWgKNGMomGeN2u0KK6/cTL7OvHvAkAv7EOLFo9MeZkr/cG2lg5k74S5qA
 E+w/FIXpnimewhCrlmoASPv7bY9dnOw/lR+w1NgaWRYaXqlKTsuclg2Z6MeP72AqUL9h
 H/oZIrk46w4IdXL7DKBHhshnj9j737c5eYkywwRZMyeuZdqUMNE5pWWwLATTz1d8VH8P
 Du6R61YKCGUJeV8xypRdiLZShEmjnn6xZY99EccaRy22oG2S9toh86dnXS/+wYCLPLjD
 KKwVB+KvHn/ZHp4iP810lunZ7D+3immMCub83cWZtS1WkeE/QuV5z68bjArflzK8ThVC
 Xx9w==
X-Gm-Message-State: AOAM53138wR2FgvqQcTVPTF25ZI2WIcXaiziEKsXRWThdYjjJyRgT2Gl
 RRdQr8dDjreh8TdfB2Qo924=
X-Google-Smtp-Source: ABdhPJxf5gapI5aCBn0k4VmvhCZXpTG85dVk67lQwF7/nYZDp4GNDj66jGpkjFvLHneAohxqB60/ew==
X-Received: by 2002:a17:902:8bcb:b029:e6:a4a1:9d7e with SMTP id
 r11-20020a1709028bcbb02900e6a4a19d7emr13258102plo.25.1615896274186; 
 Tue, 16 Mar 2021 05:04:34 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id d5sm2722166pjo.12.2021.03.16.05.04.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 05:04:33 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v4 02/12] net: Add a 'do_not_pad" to NetClientState
Date: Tue, 16 Mar 2021 20:04:10 +0800
Message-Id: <20210316120420.19658-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210316120420.19658-1-bmeng.cn@gmail.com>
References: <20210316120420.19658-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x102e.google.com
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

This adds a flag in NetClientState, so that a net client can tell
its peer that the packets do not need to be padded to the minimum
size of an Ethernet frame (60 bytes) before sending to it.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

---

(no changes since v3)

Changes in v3:
- add a comment to 'do_not_pad'

 include/net/net.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/net/net.h b/include/net/net.h
index 919facaad2..f944731c18 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -100,6 +100,7 @@ struct NetClientState {
     int vring_enable;
     int vnet_hdr_len;
     bool is_netdev;
+    bool do_not_pad; /* do not pad to the minimum ethernet frame length */
     QTAILQ_HEAD(, NetFilterState) filters;
 };
 
-- 
2.25.1


