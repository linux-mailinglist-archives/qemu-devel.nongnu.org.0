Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3227C4CA6AF
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 14:54:56 +0100 (CET)
Received: from localhost ([::1]:59066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPPRO-00065k-Sw
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 08:54:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ubzeme@gmail.com>) id 1nPOev-0003en-TD
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 08:04:51 -0500
Received: from [2607:f8b0:4864:20::52e] (port=35702
 helo=mail-pg1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ubzeme@gmail.com>) id 1nPOeu-000503-6l
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 08:04:49 -0500
Received: by mail-pg1-x52e.google.com with SMTP id e6so1588587pgn.2
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 05:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w6vJJZnIY85L3jAtHIirBP3LY7sd1XHw2yIyuchY+w0=;
 b=fYRPxodlkAoc0tMjCk+LMJ5U+vB0E4ZCSCW6UQptyLocpumLf0smMgX53GG3bgz8ev
 Vr58qG4dwJ5EuQD5uOb2hCTCoRYMsBPDVnf8zMnY0MoTlBMy6btpoPhgqxqalpbk3RME
 Q7iKOhK5105v/wty7oZxvaVN89jC0dgdm8rKrxtQrr82xbfp4HdQgAJfVn0X6jAv5O39
 69X1+foQumGaVUk2EdQIcWZivAN+8oBKyCMo+9sLdEuFLJhMWkWUPNIhzQ8LIJE+ms6c
 z+2pc2upnoCUbuJMDXU5YfDCjgkgIlWbvYpxhDyvhWaNlqLjhRl+VrRh7OE+jtBfcTSY
 wEpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w6vJJZnIY85L3jAtHIirBP3LY7sd1XHw2yIyuchY+w0=;
 b=IhNDtslVjXQ3RiYhzIpqxurWAUFNj1o55sMkzmoM0jFYA5Sn3t5r2Es93sMVOZq9Ve
 6GPDcHHCdSEPeh7k2ZKl32qJFnaOaVXLfBjd6+oOm7LqfX6hqnaSw8QpanPLonyREaky
 726iTQhNLUT3rNcotfKviUKxsP3g9ViNUm9OXzhgqNmNFSzcGx6QdlbUc9fDYR0dxkPS
 Nr9KjnaXWmLm9yRXVyCnWRi0QL6s3mwHsgPpMVxDCVYJoO3YS3RNvgfugdwYOofJs9ka
 BYj7T87knWAINrbaj1qVujHKWjoJxgTQ3L7gkyOcrc5leywWefFxHa80LVmF6A3Tzaxh
 MsEA==
X-Gm-Message-State: AOAM532c8k4fVZE2IJTdr0MX1J9NJMCNlkyw6u1WKSwazUVLSekCHlol
 kmk4zrGkzA4DZNYkK75DAk9Q34LeywxmHQ==
X-Google-Smtp-Source: ABdhPJzbAVbsLwKlHELq6e1aq/H8F1nximBK77026wR86Yh+YV/6DDXSM/8VeOleoNnW06u1kX3Vwg==
X-Received: by 2002:a05:6a00:140b:b0:4e1:2cbd:30ba with SMTP id
 l11-20020a056a00140b00b004e12cbd30bamr33012871pfu.46.1646226286584; 
 Wed, 02 Mar 2022 05:04:46 -0800 (PST)
Received: from localhost.localdomain
 (2001-b011-e000-59d7-a02b-4f1b-c415-11a0.dynamic-ip6.hinet.net.
 [2001:b011:e000:59d7:a02b:4f1b:c415:11a0])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a056a00140d00b004e13da93eaasm21947964pfu.62.2022.03.02.05.04.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 02 Mar 2022 05:04:46 -0800 (PST)
From: Yan-Jie Wang <ubzeme@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 8/9] hvf: only consider directly writeable memory regions
 for dirty-tracking
Date: Wed,  2 Mar 2022 21:04:16 +0800
Message-Id: <20220302130417.18551-9-ubzeme@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220302130417.18551-1-ubzeme@gmail.com>
References: <20220302130417.18551-1-ubzeme@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=ubzeme@gmail.com; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 Cameron Esfahani <dirty@apple.com>, Yan-Jie Wang <ubzeme@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It is no need to dirty-track MMIO regions or other readonly regions.

Before we start or stop to dirty-track a memory region, check the type of
the memory region. The region must be a writeable ram to be dirty-tracked.

Signed-off-by: Yan-Jie Wang <ubzeme@gmail.com>
---
 accel/hvf/hvf-mem.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/accel/hvf/hvf-mem.c b/accel/hvf/hvf-mem.c
index 2f70ceb307..60ece20eb4 100644
--- a/accel/hvf/hvf-mem.c
+++ b/accel/hvf/hvf-mem.c
@@ -180,6 +180,12 @@ static void hvf_set_dirty_tracking(MemoryRegionSection *section, bool on)
 {
     HVFSlot *slot;
 
+    if (!memory_region_is_ram(section->mr) ||
+        memory_region_is_rom(section->mr)) {
+        /* do not consider memory regions which are not directly writeable */
+        return;
+    }
+
     qemu_mutex_lock(&memlock);
 
     slot = hvf_find_overlap_slot(
-- 
2.32.0 (Apple Git-132)


