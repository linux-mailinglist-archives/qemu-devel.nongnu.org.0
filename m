Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4239265F27B
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 18:21:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDTN1-0001Rs-W3; Thu, 05 Jan 2023 11:45:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTMJ-0000pA-Ol
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:52 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTMH-0007Mj-OG
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:51 -0500
Received: by mail-wm1-x335.google.com with SMTP id g10so14661594wmo.1
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 08:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=33dG/KwajZrq9i+KPj0Q5eXpSM4wjc/WwsMuu9dKq4E=;
 b=VKNL61CwUWs3h9VqU/Dbd+x5sXmEWRnn7PJwWPHV4Z+Osgkau1oJBvTE5g7g0ZHIuO
 oXMCrmRImNZfmBh4Z5+ESDUKldnMmRg7MRgzUavAYoGovksBQlnuhE0jcBcmtO/kDrzP
 xdGw2+Jyd/xrt9yW3noSI4j+yvIJVL3Co4DvaoKVOxcgvVvXHT7togHQymyYVZE3LyPC
 5crSx+1Vj7xvZLHH92Mrycg6liUPRS7BcEK9Q7Ezow0BsXSxi0/OPK0jX/QQEDhmzZcf
 6QCtAQmAA8qbC74O6mXWn/2P9OsFSh6XuBZZL8Kc2/Po+wwvgHZTk7P/v2iRns5THcaY
 NSWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=33dG/KwajZrq9i+KPj0Q5eXpSM4wjc/WwsMuu9dKq4E=;
 b=f0JWadfNPN+1rET+9HXMOxV60ZGFFDzF7oRzfyKghNfPFUrOplLf0D0+T1h2uT4EEF
 mrpWe+6pzZRjrn5MCV/jLdd3DWAbsm4nWDR/xtoQvkZWzUpU/Ih1BidXm31quZTMhMqP
 OuWrFO0obJ0B9/YDegyC479xBO8EgBx/vi2uynaLNg5Q21uOXPeBUuuxH2P8Pt5DpYOx
 lWf/+5NFfsgugrZ1tK9V1KdSn53wfsuJ0y27DLBwroFIQPkOgWNXDVXCtECBHJ9dVumq
 yCs/neqWkwcWx+HvKjqMRAiq89DN+0oPf29NHJb6bFXTlAHptJRTpXxw+wOrUaR74dUy
 YztA==
X-Gm-Message-State: AFqh2kqxz2zqIMtJRzcCkCpAd7jenQ+TKMS1w11flve0B4hjLE/9AU2H
 C3gRO5EWtOr52eATnofeWxgRDFnbO9P4M01T
X-Google-Smtp-Source: AMrXdXuajnAFRWrCO3D7xXJ7q/yI1vKXZtSmsHmkruTdOq1niiD3diSaMZbQhsuLJBTv04ASwy0sxQ==
X-Received: by 2002:a05:600c:3d0e:b0:3d3:4aa6:4fd0 with SMTP id
 bh14-20020a05600c3d0e00b003d34aa64fd0mr36932398wmb.6.1672937087484; 
 Thu, 05 Jan 2023 08:44:47 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 hg9-20020a05600c538900b003cf71b1f66csm3055547wmb.0.2023.01.05.08.44.46
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 08:44:47 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 34/34] hw/net: Fix read of uninitialized memory in imx_fec.
Date: Thu,  5 Jan 2023 16:44:17 +0000
Message-Id: <20230105164417.3994639-35-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230105164417.3994639-1-peter.maydell@linaro.org>
References: <20230105164417.3994639-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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

From: Stephen Longfield <slongfield@google.com>

Size is used at lines 1088/1188 for the loop, which reads the last 4
bytes from the crc_ptr so it does need to get increased, however it
shouldn't be increased before the buffer is passed to CRC computation,
or the crc32 function will access uninitialized memory.

This was pointed out to me by clg@kaod.org during the code review of
a similar patch to hw/net/ftgmac100.c

Change-Id: Ib0464303b191af1e28abeb2f5105eb25aadb5e9b
Signed-off-by: Stephen Longfield <slongfield@google.com>
Reviewed-by: Patrick Venture <venture@google.com>
Message-id: 20221221183202.3788132-1-slongfield@google.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/net/imx_fec.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index 8c11b237de7..c862d965930 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -1068,9 +1068,9 @@ static ssize_t imx_fec_receive(NetClientState *nc, const uint8_t *buf,
         return 0;
     }
 
-    /* 4 bytes for the CRC.  */
-    size += 4;
     crc = cpu_to_be32(crc32(~0, buf, size));
+    /* Increase size by 4, loop below reads the last 4 bytes from crc_ptr. */
+    size += 4;
     crc_ptr = (uint8_t *) &crc;
 
     /* Huge frames are truncated.  */
@@ -1164,9 +1164,9 @@ static ssize_t imx_enet_receive(NetClientState *nc, const uint8_t *buf,
         return 0;
     }
 
-    /* 4 bytes for the CRC.  */
-    size += 4;
     crc = cpu_to_be32(crc32(~0, buf, size));
+    /* Increase size by 4, loop below reads the last 4 bytes from crc_ptr. */
+    size += 4;
     crc_ptr = (uint8_t *) &crc;
 
     if (shift16) {
-- 
2.25.1


