Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAAE333A4A
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 11:42:52 +0100 (CET)
Received: from localhost ([::1]:34410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJwIl-0006yr-Ri
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 05:42:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lJvpf-0001Wz-Bz
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:12:47 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:33180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lJvpc-00075f-BQ
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 05:12:47 -0500
Received: by mail-ed1-x532.google.com with SMTP id x9so27140248edd.0
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 02:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=0iiOMnMZhhPH5hS1v6PwOOCna3BJGccVCrXKXmjrMKc=;
 b=mJbv9EQC5huEQ13sJ0YQHlnIBRtKheDs5CLCySrMPFtkj3n11t2zF6mjyX7QfkmtR7
 fSe/hvUccQUHpUOv9APF0YM1TySTDLkEai4/oa10ck/ayDAkvgHSmlNeNHAI8G8vdu/U
 kRpqcz0wIrKPZ3JToCYV8l7rG4d1QxVvsTgNCZM7qPl8IS6kU678Cw85n1iYcr8IrRju
 yThqy4zRhTvq4HHNUYCqeOQZDN15HTF8BRZqEMqqVpGs4jBbUYLYM034BGRTqo3PTVi+
 APFGDOn0ZTeIaJm4KtpRKm7MaLvlOGWVd8brR+ydVdBXPoEYmg6sZqLT6C/foQLjpVtM
 v7PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0iiOMnMZhhPH5hS1v6PwOOCna3BJGccVCrXKXmjrMKc=;
 b=ky3NJGQuMA0eBzxgUL1xnNnDICSqz6P4DnuW1+DPtqVHntfekz92xYNqF2RJfmtfmk
 YUZe08uxVlLkyMv0VJH0BVdw/iw+EFsKflnl9XKxA1yHWZbcMlQZ+GMTgWO1Ohs52oeY
 s0SSa4eJbj4xguljQ6KP+dEW84TR3PosPZz5q87EAENqGIGG6wvuakl5BuR3Y0YQAjUM
 oMIfgoVHvZyiLeqaBmutQGxMQ+iDeptbYGXEXBuCti5+LgWmVQjzuTj58GmyqNUU2fl+
 c0GWal17jgzFFnl3c+spmy7B+2bwK+/AmsPvEV3n1IoZYY8xa6ss8sqGrN9sf6bkjH5A
 Ej7g==
X-Gm-Message-State: AOAM5321dH1VuOm/JikWFacUy316RQul1APSWMvnju9UjbX0yDQdAQ0R
 J5yY3UVncuXnwlhphh+a560=
X-Google-Smtp-Source: ABdhPJyy/E8Yt9W3PqtRntwuOAmEWlUGwdabiZFSXC5ntg1OuS/9rAPTpMB8eN6gC6Pya8EzR8hHnA==
X-Received: by 2002:a05:6402:34c8:: with SMTP id
 w8mr2453600edc.235.1615371162951; 
 Wed, 10 Mar 2021 02:12:42 -0800 (PST)
Received: from pek-vx-bsp9.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id n26sm5966864eds.22.2021.03.10.02.12.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 02:12:42 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH 10/10] hw/net: sunhme: Remove the logic of padding short
 frames in the receive path
Date: Wed, 10 Mar 2021 18:11:57 +0800
Message-Id: <20210310101157.15136-11-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210310101157.15136-1-bmeng.cn@gmail.com>
References: <20210310101157.15136-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x532.google.com
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

 hw/net/sunhme.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/hw/net/sunhme.c b/hw/net/sunhme.c
index fc34905f87..6971796e57 100644
--- a/hw/net/sunhme.c
+++ b/hw/net/sunhme.c
@@ -714,8 +714,6 @@ static inline void sunhme_set_rx_ring_nr(SunHMEState *s, int i)
     s->erxregs[HME_ERXI_RING >> 2] = ring;
 }
 
-#define MIN_BUF_SIZE 60
-
 static ssize_t sunhme_receive(NetClientState *nc, const uint8_t *buf,
                               size_t size)
 {
@@ -724,7 +722,6 @@ static ssize_t sunhme_receive(NetClientState *nc, const uint8_t *buf,
     dma_addr_t rb, addr;
     uint32_t intstatus, status, buffer, buffersize, sum;
     uint16_t csum;
-    uint8_t buf1[60];
     int nr, cr, len, rxoffset, csum_offset;
 
     trace_sunhme_rx_incoming(size);
@@ -775,14 +772,6 @@ static ssize_t sunhme_receive(NetClientState *nc, const uint8_t *buf,
 
     trace_sunhme_rx_filter_accept();
 
-    /* If too small buffer, then expand it */
-    if (size < MIN_BUF_SIZE) {
-        memcpy(buf1, buf, size);
-        memset(buf1 + size, 0, MIN_BUF_SIZE - size);
-        buf = buf1;
-        size = MIN_BUF_SIZE;
-    }
-
     rb = s->erxregs[HME_ERXI_RING >> 2] & HME_ERXI_RING_ADDR;
     nr = sunhme_get_rx_ring_count(s);
     cr = sunhme_get_rx_ring_nr(s);
-- 
2.17.1


