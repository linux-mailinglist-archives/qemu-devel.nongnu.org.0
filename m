Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 596BE4B303F
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 23:18:08 +0100 (CET)
Received: from localhost ([::1]:38690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIeEx-0007T7-5V
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 17:18:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1nIeBc-0004vH-SG
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 17:14:41 -0500
Received: from [2607:f8b0:4864:20::431] (port=45780
 helo=mail-pf1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1nIeBZ-0002jo-Sq
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 17:14:40 -0500
Received: by mail-pf1-x431.google.com with SMTP id 9so15699517pfx.12
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 14:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z6mFlDGTgPsJEQXWuiVCXDYnPz09iAqdu7okAUnbemg=;
 b=g2RIH+PaGzV0sjzZOmCLf9DOQnakpk0DN+yx33j0cPBwn4TVI1R7CJgPI3NDJCR3J5
 AeyPeXV0Ruaubu8i4XbsclCTnTQWNHDhdxPlEmRcmNG8cxnwoFVonoa7I4SNpFxNzuS+
 mFNsVThp+v1v8cQXrYAUdpI4UZ8ppxfhOkJE+wsGgrQkelNPfbDC062AZgN7pXqZ5QwQ
 1IqZxGHwJkggxjA5Jflm628W3JYG2TpzH/vIZnzQnkIXwslD1k7M+WlzYXMD6+Vuhn2v
 LnoEkNbxBw3cs//N4uvdjUoCbZhmUTtYNd7ir9/2Kz4zqCmxad0c3gSvBC8EXwFXjM/y
 uIrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z6mFlDGTgPsJEQXWuiVCXDYnPz09iAqdu7okAUnbemg=;
 b=4Zo1lXov0+5bUtNKxoOLOevHU3cTFW6ESrvsTmINNHdYSmfT04Qy1tLxBCc6boEV7W
 PNS8Cu+3rd0DBwaa9RTbmAxUuSiOVNThmdfs4OWCaYTCmUlKqTUkKCpMo2BTJmMXvfe4
 YO2eFC+Vk77tGIcIg4a5EN5vw+v5fRBrhraZcIPO1r8xY4BGXnNPKbCIn3Fqyftb/Rcs
 3J3DOC0Gj8kQErHGDqjPevUcALeR2pgPQMgn6JNyduSRvJKykXY/za8C1zNk8NJkkegg
 YHzdcw021VuUQkSAgHUomfGwRmtlANG0yiyJfkywWngPoBVa6oVaSJdvBfHrP+bP8a5E
 AREg==
X-Gm-Message-State: AOAM531iGmdRf5gpwPmmL2F4R4nLTqp+TsZDjGR3nkOElTU65sQwUC7z
 PtB3bJL2c51tYflx9D+yS48=
X-Google-Smtp-Source: ABdhPJya5kVVkhEioIHX9107eDxfTS7TKbzFRfGi15N5udlV2OhkoJiHQLZ9C/TUF3R5u4BT3P4lxQ==
X-Received: by 2002:aa7:88c7:: with SMTP id k7mr3575777pff.38.1644617676616;
 Fri, 11 Feb 2022 14:14:36 -0800 (PST)
Received: from fedora.. ([2405:201:6008:6f15:d26f:133e:cd11:90dd])
 by smtp.googlemail.com with ESMTPSA id j23sm20623576pgb.75.2022.02.11.14.14.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 14:14:36 -0800 (PST)
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
To: kraxel@redhat.com,
	mst@redhat.com,
	laurent@vivier.eu
Subject: [RFC PATCH 02/25] virtio-snd: Add jack control structures
Date: Sat, 12 Feb 2022 03:42:56 +0530
Message-Id: <20220211221319.193404-3-chouhan.shreyansh2702@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
References: <20210429120445.694420-1-chouhan.shreyansh2702@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::431
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Added structures for handling jack control requests
to the header file.

Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
---
 include/hw/virtio/virtio-snd.h | 40 ++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/include/hw/virtio/virtio-snd.h b/include/hw/virtio/virtio-snd.h
index bbbf174c51..f58b06a949 100644
--- a/include/hw/virtio/virtio-snd.h
+++ b/include/hw/virtio/virtio-snd.h
@@ -94,4 +94,44 @@ typedef struct virtio_snd_info {
     uint32_t hda_fn_nid;
 } virtio_snd_info;
 
+/* JACK CONTROL MESSAGES */
+
+typedef struct virtio_snd_jack_hdr {
+    /* VIRTIO_SND_R_JACK_* */
+    virtio_snd_hdr hdr;
+    /* 0 to (virtio_snd_config.jacks - 1) */
+    uint32_t jack_id;
+} virtio_snd_jack_hdr;
+
+/* Supported jack features */
+enum {
+    VIRTIO_SND_F_JACK_REMAP = 0
+};
+
+/* jack information structure */
+typedef struct virtio_snd_jack_info {
+    /* common header */
+    virtio_snd_info hdr;
+    /* 1 << VIRTIO_SND_JACK_F_* */
+    uint32_t features;
+    /* pin default configuration from HDA spec */
+    uint32_t hda_reg_defconf;
+    /* pin capabilities from HDA spec */
+    uint32_t hda_reg_caps;
+    /* connection status (0: disconnected, 1: connected) */
+    uint8_t connected;
+
+    uint8_t padding[7];
+} virtio_snd_jack_info;
+
+/* jack remapping control request */
+typedef struct virtio_snd_jack_remap {
+    /* .code = VIRTIO_SND_R_JACK_REMAP */
+    virtio_snd_jack_hdr hdr;
+    /* selected association number */
+    uint32_t association;
+    /* selected sequence number */
+    uint32_t sequence;
+} virtio_snd_jack_remap;
+
 #endif
-- 
2.31.1


