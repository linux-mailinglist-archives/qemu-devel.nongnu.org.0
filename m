Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DD533ACEF
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 09:02:31 +0100 (CET)
Received: from localhost ([::1]:46058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLiBK-0004oe-Hu
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 04:02:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lLi6g-00085e-EO
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 03:57:45 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:41340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lLi6Z-0004H0-Tp
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 03:57:40 -0400
Received: by mail-pf1-x436.google.com with SMTP id b23so6042467pfo.8
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 00:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OKTHLFi22LXM/7VUUb7EdSe3lm6adEWJ+rwT4TdzOTA=;
 b=lTE5ZKpuaSXpWdSIDiAuaqa+0ygee2Mr+fzqJZLu0jzbONDrs/GmexsF4bRbqO44Dr
 US4qCy5msngcwkkI5YuJwKRXDCDq890eI5WscanAD7lvJs6hxbfQvwcgUTs/iDMP0VVH
 LAlpOvTxpETLVxHymWkkXuPQNYAKSAK66eY5uF+FVfmLoDpQLeXpDHVpMSow7bSvE1qu
 cTMy9qOTvqYf+3wIUIxDmjrHKyIDOC9fllabiHRp+hVOaZaSaU8C1zxJIeRvniHeRj8z
 EwUK+5jQhu2RfNQLn6hPRYXWl8JA9Aj/tA6lBrjCHmUoY5tQzJInsvtLVzbLNMizJcFQ
 VOfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OKTHLFi22LXM/7VUUb7EdSe3lm6adEWJ+rwT4TdzOTA=;
 b=lSBHGo1jS+GajTfA3X+I6OnhxZyxjiflrJTxwanW+oS2u2JUh/4eEioWa16g8F/1w9
 P01cyU4hjInact0bANFM9wX3s1IOXp/G+GTNMITZ2vWA+7wox/8Gap7dVE4IBj3H4CRh
 FW5QolrkpmuNzBRbNwTHyk7g6FCbBCx5MpoZfmVBqm9X/vDSSQ970XYXgPs9YtYJ+dHv
 uiX625Co8OEmC5CUIFEfEqz8YN157bisdTcvesC06jJOJc/c9YiooysJO9yjHEqqPje8
 HvGMLZq+jCLljGy4ybaN55l3LOS9nEqMC3t/w0eSKV4SrzAd7uWiHvKnl0VDfp7tysFS
 RCTw==
X-Gm-Message-State: AOAM531kYWZm7RzrWNFnsp8mMUbEcpHs6xtISmDBzF8XDxy6mtjqXlt0
 fYpbIVCukRUwybXXjxjqoag=
X-Google-Smtp-Source: ABdhPJwP6d6mhCd/Ng10KTfgiz7Py6IRtjcEzBMUtfeFiAPColST+3fz2W4tXTR7c51q6iI6kVdc0w==
X-Received: by 2002:a63:2165:: with SMTP id s37mr22186963pgm.145.1615795054649; 
 Mon, 15 Mar 2021 00:57:34 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id y9sm10166745pja.50.2021.03.15.00.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 00:57:34 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v2 02/13] net: Add a 'do_not_pad" to NetClientState
Date: Mon, 15 Mar 2021 15:57:07 +0800
Message-Id: <20210315075718.5402-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210315075718.5402-1-bmeng.cn@gmail.com>
References: <20210315075718.5402-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x436.google.com
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
---

 include/net/net.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/net/net.h b/include/net/net.h
index 919facaad2..6fab1f83f5 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -100,6 +100,7 @@ struct NetClientState {
     int vring_enable;
     int vnet_hdr_len;
     bool is_netdev;
+    bool do_not_pad;
     QTAILQ_HEAD(, NetFilterState) filters;
 };
 
-- 
2.25.1


