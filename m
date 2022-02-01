Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FCC4A696D
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 01:57:11 +0100 (CET)
Received: from localhost ([::1]:46316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF3xP-0007Hz-0F
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 19:57:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nEytI-0001p4-6x
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 14:32:37 -0500
Received: from [2a00:1450:4864:20::431] (port=45612
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nEytC-0002Xx-70
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 14:32:35 -0500
Received: by mail-wr1-x431.google.com with SMTP id m14so33787015wrg.12
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 11:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PyoYFz0rNK5fksgWbnYb2wlrhqu+KYVYudh2oRoiZhU=;
 b=DRJO4rd5AVFypEImjA7KJFFGxfCuH6D6v8JACNPRmzBOEsGeMwFOmUmKEJU0UhV+Zq
 5jMSyUJM06eD/0WjLKttEfdnpxpnABPINsq/GYx+9BLXE1oQWLSD7azDdGj2JO13yeQQ
 dgQos0uFsG3ElJM6bXqnAxL4GjO0awqopx21nc8XI9Q1AM8bXoqWkswldPsxS25mnyK2
 Jorrc2DfcH7CAuK3eDCBgasnYMpZaHgUi+MWm2cHyri5s7UBWCJQZkgA3gEAUoYBUtPN
 CPaugd8AyiwJBvaVBWgLQb1YvxIlUBekGndKCLd2+qAgRAtuCpbEWL+gEGcSKBEWk/X0
 dUMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PyoYFz0rNK5fksgWbnYb2wlrhqu+KYVYudh2oRoiZhU=;
 b=hNn+5VOXdH96RisqupVNSdgjZ3myZL2ObUoIwekJjZHiBoLHRzw+rjH0FvMXp2MkfP
 PV0AhcQ3yig55jhNesFS3Cci7tQ9FSzcJAG8sFjfbjyXihT1yXNag6Op5HDvi0TdYWsp
 NSAAKkFyRbD6BstSdV1qrt8W+kUHJesX14o5CwE0DBHvBQ/0QlzKGEV6I1X4dBwWbMn1
 2JZqooid0b7LyHxmoSQzxkbuMHA7rmbGGaqMot81iuqIoCb3MXaJGgnIuGQyiDmJcQgU
 JwTq5D1OeU4MQTVChwxm2DuDPPaMZ7YnsXQE4klLutqM3cbd93wmCdKHIz3DS9h5zYvV
 oHjg==
X-Gm-Message-State: AOAM531FpwvlCRhkImEnHZhpjTFYYT9c2HgEZSvRdXaMgKux/0n205Ql
 UhtV0Dm/w78QCsDpOc9Dc9EV4A==
X-Google-Smtp-Source: ABdhPJygeBQuyX0J8zc2OlAfe+Y3XDaVTJShAHAQt+mmIOm0CG8UtQ2DcLiUlf7Sb1sXCrIY4wKqDw==
X-Received: by 2002:adf:fb10:: with SMTP id c16mr22693982wrr.200.1643743940023; 
 Tue, 01 Feb 2022 11:32:20 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id z5sm3491265wmp.10.2022.02.01.11.32.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 11:32:19 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 12/13] hw/intc/arm_gicv3_its: Don't allow intid 1023 in
 MAPI/MAPTI
Date: Tue,  1 Feb 2022 19:32:06 +0000
Message-Id: <20220201193207.2771604-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201193207.2771604-1-peter.maydell@linaro.org>
References: <20220201193207.2771604-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When handling MAPI/MAPTI, we allow the supplied interrupt ID to be
either 1023 or something in the valid LPI range.  This is a mistake:
only a real valid LPI is allowed.  (The general behaviour of the ITS
is that most interrupt ID fields require a value in the LPI range;
the exception is that fields specifying a doorbell value, which are
all in GICv4 commands, allow also 1023 to mean "no doorbell".)
Remove the condition that incorrectly allows 1023 here.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This one's my fault -- Shashi's original code did the right thing,
IIRC. The spec text and pseudocode disagree here, and in code review
I backed the wrong horse. Sorry.
---
 hw/intc/arm_gicv3_its.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 069991f7f36..8dade9440ac 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -406,8 +406,7 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, const uint64_t *cmdpkt,
 
     if ((icid >= s->ct.num_entries)
             || !dte.valid || (eventid >= num_eventids) ||
-            (((pIntid < GICV3_LPI_INTID_START) || (pIntid >= num_intids)) &&
-             (pIntid != INTID_SPURIOUS))) {
+            (((pIntid < GICV3_LPI_INTID_START) || (pIntid >= num_intids)))) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes "
                       "icid %d or eventid %d or pIntid %d or"
-- 
2.25.1


