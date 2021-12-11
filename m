Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4DE47158D
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Dec 2021 20:15:26 +0100 (CET)
Received: from localhost ([::1]:57642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mw7q9-0008RX-HN
	for lists+qemu-devel@lfdr.de; Sat, 11 Dec 2021 14:15:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mw7mY-0004lp-N5
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 14:11:42 -0500
Received: from [2a00:1450:4864:20::42c] (port=43552
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mw7mV-0006Ba-Pb
 for qemu-devel@nongnu.org; Sat, 11 Dec 2021 14:11:42 -0500
Received: by mail-wr1-x42c.google.com with SMTP id v11so20313979wrw.10
 for <qemu-devel@nongnu.org>; Sat, 11 Dec 2021 11:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ppVeav4mXzYSIyKy0Ag4TWya31OJHif0+sqVtDc4GRg=;
 b=SK6ZRS9XXt4tDvuCsNFDaVLjnt1IG8zeq52yOwR7oe7ppulb12b4Lh5Cy5aZbmgBEs
 7Z8H9p8DNFO83SKAc+VgE2DtZlANZNr3u8cC5k2UZKz0/eOM/goyqKKKe5k3DagYUfNY
 z7PP71qgjjIbj3iLZyMozT8oLC59D8JnmrLrIMCvSpwapyN9/zqthwxmV4/dK14PVcBV
 krK4IDQVZv9Q9DBPMArZswdu2qebVec9LnJV2m/4u6gJ+SxmeQV7NqtPGrQ7yWuM79ov
 ITZD35uW5+Z7u5VGtX2sRj5vOcXkEXnf2AtNhAVYVzjHQdeAQJofpWtZKwYi0vUnBxXl
 Q4LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ppVeav4mXzYSIyKy0Ag4TWya31OJHif0+sqVtDc4GRg=;
 b=m3Qn0wGxg/AjD56Z5H6oKE4z6UWL6KaZ0bIF2VYNIa5xdLzrgDEBbI1Zbn2bPWm/yZ
 zvLuCCr27xSlU5H60slHNF1rAkRKNOzY+DAJJaLgxJnbAjFNmtBB01yu0uad+3dYiDmW
 b+1l6YcAXs4ZBSlu9zo49jdrDbQ9l0XDbC3w+/luYBT0OVCzWxrujf0kUR3uXej0bhkb
 hwkJ7EkPrPVFAJcdXFX10BxwIatgEfUH/0ZQ725h9hHngwnpkKVZfrOYMZjEylFtLYh1
 /S2Sf2dp7WvHOK0jSMOSx2bBTGqThGYAhRzIyO7RJgP8Xs7p5EY6czZhAvV1q4Tq15ID
 kT6w==
X-Gm-Message-State: AOAM532Cfd8JGZyK+L1c68cqAdjghuz9qMfUyvcxNIP/zVwRkfH9jFcM
 SL98m1IqXc7xRlX7VJDNg7LJcPacyKq60Q==
X-Google-Smtp-Source: ABdhPJzQpQKmgNuw7Xu6mAtaDJfyZ71xps6ctMsy4OlaZqofgW+vQdd2jfmoYhWY6a7hGvgPvjjHgQ==
X-Received: by 2002:adf:facd:: with SMTP id a13mr1952851wrs.513.1639249898527; 
 Sat, 11 Dec 2021 11:11:38 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id m20sm2205300wmq.11.2021.12.11.11.11.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Dec 2021 11:11:38 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 02/26] hw/intc/arm_gicv3_its: Correct off-by-one bounds check
 on rdbase
Date: Sat, 11 Dec 2021 19:11:11 +0000
Message-Id: <20211211191135.1764649-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211191135.1764649-1-peter.maydell@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The checks in the ITS on the rdbase values in guest commands are
off-by-one: they permit the guest to pass us a value equal to
s->gicv3->num_cpu, but the valid values are 0...num_cpu-1.  This
meant the guest could cause us to index off the end of the
s->gicv3->cpu[] array when calling gicv3_redist_process_lpi(), and we
would probably crash.

Cc: qemu-stable@nongnu.org
Fixes: 17fb5e36aabd4b ("hw/intc: GICv3 redistributor ITS processing")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Not a security bug, because only usable with emulation.
---
 hw/intc/arm_gicv3_its.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index b99e63d58f7..677b96dfe23 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -311,7 +311,7 @@ static bool process_its_cmd(GICv3ITSState *s, uint64_t value, uint32_t offset,
          */
         rdbase = (cte & GITS_CTE_RDBASE_PROCNUM_MASK) >> 1U;
 
-        if (rdbase > s->gicv3->num_cpu) {
+        if (rdbase >= s->gicv3->num_cpu) {
             return result;
         }
 
@@ -505,7 +505,7 @@ static bool process_mapc(GICv3ITSState *s, uint32_t offset)
 
     valid = (value & CMD_FIELD_VALID_MASK);
 
-    if ((icid > s->ct.maxids.max_collids) || (rdbase > s->gicv3->num_cpu)) {
+    if ((icid > s->ct.maxids.max_collids) || (rdbase >= s->gicv3->num_cpu)) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "ITS MAPC: invalid collection table attributes "
                       "icid %d rdbase %" PRIu64 "\n",  icid, rdbase);
-- 
2.25.1


