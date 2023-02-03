Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6111F689BF2
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 15:36:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNx4V-0006g1-Sl; Fri, 03 Feb 2023 09:29:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4L-0006dI-1x
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:29:37 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4I-00054B-0a
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:29:35 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 d4-20020a05600c3ac400b003db1de2aef0so4002293wms.2
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 06:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=yxaajrT8hw/p9R5XVhSvXLClGevo4qVUStBee60tFvg=;
 b=J8I6OgG4yK64MYUVV3p0iaHxs/3GpP91jZfikVKcQBZn3XTtvbyiGpGPIF/GuHqozn
 bxzoz00vjXlc2g/yTmEcfwnCt3Wk1wu8qYevABdr+o3ryKyoU/7P/rqO0Krgc4081hdK
 L5/noIUY97aaduO/u39v0BQjpG0KbSqE5dGdUPIgR3eOQocTz7j/GFYV6GLmc5BtKeZw
 Gu6RhOND6QJeC703/+MXq9nGFi7TP9Lz8YYtMHlm5+jPTwnHSaMl/so0HtQ1MrByBMrE
 1q6xKalw5yb9bC7OUhJZIqN/es/qm9t0HUtDdUX6FZ3ttMHwN2INT7ZOte9O9NnPNsJp
 YErQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yxaajrT8hw/p9R5XVhSvXLClGevo4qVUStBee60tFvg=;
 b=Mj7PEMPzgh8VcFgJzNv9LFGFfCQ1/5F3VmwwDnjTeF7pX5lcAuK37hJN4ssxLq8ove
 Bsn0pzqgzn2d2/8h+BsAD5oEnu5D9ebLcf/0zGMgJQSkpLfRnh8Hf0hnM4nt177bD49d
 TCKRHPJFPGskE8J0QJrlxqhLLNfNHVEwbdQEgP7WybtcoQT5jbvLPqwdbZ9Et04kNy5p
 jD/+RfvAwXr+5Sj0OeerMMjYvrEoTwpRhmW3kwmqen+fWiVPv6yRGfPoFbw/yu6UDmSX
 kQl/qZk69DRlDp+Hkefdu47FXIRhYEr2gc/KWS8hCHiojKam79RmDZb34J8tyFJimOnV
 nnmw==
X-Gm-Message-State: AO0yUKWa8Ln12ZgMxzJjwdbU8Qm6JhjPVaVMO4ZugmPiRzJ3K2mvT8qD
 Ya+zXmEarWynwUqcS+QOpnXUj+qhjbrk8/3U
X-Google-Smtp-Source: AK7set/7egwm7XJz8uEoFGVH+93YcCtT7DrnsfgoTamJjPoiqn14WZozrG+4Ln4cQ2kpRJA/wPc2gg==
X-Received: by 2002:a7b:c85a:0:b0:3d2:392e:905f with SMTP id
 c26-20020a7bc85a000000b003d2392e905fmr9589877wml.24.1675434572659; 
 Fri, 03 Feb 2023 06:29:32 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a05600c130e00b003df241f52e8sm2578492wmf.42.2023.02.03.06.29.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 06:29:32 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/33] hw/char/pl011: add post_load hook for
 backwards-compatibility
Date: Fri,  3 Feb 2023 14:28:58 +0000
Message-Id: <20230203142927.834793-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230203142927.834793-1-peter.maydell@linaro.org>
References: <20230203142927.834793-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>

Previous change slightly modified the way we handle data writes when
FIFO is disabled. Previously we kept incrementing read_pos and were
storing data at that position, although we only have a
single-register-deep FIFO now. Then we changed it to always store data
at pos 0.

If guest disables FIFO and the proceeds to read data, it will work out
fine, because we still read from current read_pos before setting it to
0.

However, to make code less fragile, introduce a post_load hook for
PL011State and move fixup read FIFO state when FIFO is disabled. Since
we are introducing a post_load hook, also do some sanity checking on
untrusted incoming input state.

Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
Message-id: 20230123162304.26254-3-eiakovlev@linux.microsoft.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/char/pl011.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 3fa3b75d042..05e8bdc050e 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -352,10 +352,35 @@ static const VMStateDescription vmstate_pl011_clock = {
     }
 };
 
+static int pl011_post_load(void *opaque, int version_id)
+{
+    PL011State* s = opaque;
+
+    /* Sanity-check input state */
+    if (s->read_pos >= ARRAY_SIZE(s->read_fifo) ||
+        s->read_count > ARRAY_SIZE(s->read_fifo)) {
+        return -1;
+    }
+
+    if (!pl011_is_fifo_enabled(s) && s->read_count > 0 && s->read_pos > 0) {
+        /*
+         * Older versions of PL011 didn't ensure that the single
+         * character in the FIFO in FIFO-disabled mode is in
+         * element 0 of the array; convert to follow the current
+         * code's assumptions.
+         */
+        s->read_fifo[0] = s->read_fifo[s->read_pos];
+        s->read_pos = 0;
+    }
+
+    return 0;
+}
+
 static const VMStateDescription vmstate_pl011 = {
     .name = "pl011",
     .version_id = 2,
     .minimum_version_id = 2,
+    .post_load = pl011_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(readbuff, PL011State),
         VMSTATE_UINT32(flags, PL011State),
-- 
2.34.1


