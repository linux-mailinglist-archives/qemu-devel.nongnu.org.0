Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF8050B4B9
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 12:11:40 +0200 (CEST)
Received: from localhost ([::1]:35754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhqGJ-0001Bc-KB
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 06:11:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq9Y-0004De-LW
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:04:42 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:40516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhq9V-0002ZP-T6
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 06:04:39 -0400
Received: by mail-wr1-x434.google.com with SMTP id e2so4041138wrh.7
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 03:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=lVHlaskVehb1HPwJaP5NZWEzj3D8wAIUBCqaFD2xjB0=;
 b=WOE0K6wa8inglJFkch3bXsI7gZYHZ5ieCvIXBhWxauBhny7WR+0jIrxYuvfGc+Qeei
 DF4CY18apaBeTpxkCRLSSnoZvO0tY/bxFzwIWqO84xeE4KoWE7MKky+vgMO0WYaEy8h+
 xOpKyqH/5bV69S+XgRCi8gwzSSC11kbkdZHgD4TeIFkmEAhAKKrQPtU4T4MryU/qj3TW
 fKGOtrlfdsl76fh4d6p7mWK1VOmiqAtLqJ9xhIFdRfmsm2hkW7lp4LYrwsExkNAHrL1x
 Pxp8JTYlzjsxEYEcynn5WdhJEgHCQcs+NM/aCFIVAbg3HJx59yTUud86TiYAjqB9SI92
 o8XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lVHlaskVehb1HPwJaP5NZWEzj3D8wAIUBCqaFD2xjB0=;
 b=p+vwKcJRuMY4cTaqdwzBvHOrk85BgP21wYqBmsdcJMQXbKzj5v3PWV4O2q2VFkU13X
 5+jcaND1UIk6/X78XHVVZD3FOUTvB/YjTo++oVIhqu+cCd2QwDsEdltKIHhbog+gjWPz
 cDsWM9PMznsuFpbxLDpU+J2/sf6unQLaHKfvqBmXsJtmJpiQwtE62jdabY4nCF5Vn/Qy
 X2yqqJlgT7ZyUsscTvm95+8MwRXtt4l9sLLBRcMt03s9w6ywXHnBBEsrZ8wA7pt/LUFh
 9C0nTD/QBp/fWoGGiDdDnYmOuH3SMD8GjXaGHc36/TTKjVSVE5tt72lmW23nMYmKW0DJ
 GnwQ==
X-Gm-Message-State: AOAM532TW7dW9vc20Lv3WHKwSuI59n+TmVpy/8wRlU+cTIuQ2oELWsUp
 HrjESWLM1z0RdVC8ys0yS4hf38EdV6Pn2w==
X-Google-Smtp-Source: ABdhPJzlOc5iJxVA2Up8XmgprdZ+fM1MUm7cMsnzHBncwdrVkfkhlo46x6JiebAfYlZt5c6Vq30xBg==
X-Received: by 2002:a5d:4b45:0:b0:207:ab91:edd8 with SMTP id
 w5-20020a5d4b45000000b00207ab91edd8mr3098656wrs.168.1650621876389; 
 Fri, 22 Apr 2022 03:04:36 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a05600c2dd000b0038ed449cbdbsm4312148wmh.3.2022.04.22.03.04.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 03:04:36 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/61] hw/intc/arm_gicv3_its: Add missing blank line
Date: Fri, 22 Apr 2022 11:03:32 +0100
Message-Id: <20220422100432.2288247-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422100432.2288247-1-peter.maydell@linaro.org>
References: <20220422100432.2288247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In commit b6f96009acc we split do_process_its_cmd() from
process_its_cmd(), but forgot the usual blank line between function
definitions.  Add it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220408141550.1271295-2-peter.maydell@linaro.org
---
 hw/intc/arm_gicv3_its.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 87466732139..44914f25780 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -380,6 +380,7 @@ static ItsCmdResult do_process_its_cmd(GICv3ITSState *s, uint32_t devid,
     }
     return CMD_CONTINUE;
 }
+
 static ItsCmdResult process_its_cmd(GICv3ITSState *s, const uint64_t *cmdpkt,
                                     ItsCmdType cmd)
 {
-- 
2.25.1


