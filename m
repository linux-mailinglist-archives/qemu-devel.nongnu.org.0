Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A005D4E8723
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Mar 2022 11:37:59 +0200 (CEST)
Received: from localhost ([::1]:51128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYPLS-0005U5-NZ
	for lists+qemu-devel@lfdr.de; Sun, 27 Mar 2022 05:37:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1nYPIm-0002kR-UH; Sun, 27 Mar 2022 05:35:17 -0400
Received: from [2a00:1450:4864:20::432] (port=43611
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1nYPIk-0002cA-5N; Sun, 27 Mar 2022 05:35:12 -0400
Received: by mail-wr1-x432.google.com with SMTP id a1so16302108wrh.10;
 Sun, 27 Mar 2022 02:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ABcxXaf3qNBOZkBqeTkKv0RGUyLEXj8LkCJhCdpicDw=;
 b=pSIXr/D60JHCWFbppP9W9FfpWA5WhalxobIpfIsok69jAR3A0Wf6VP4OVdZqaEGJ1Y
 jA7TnFFMOXOxoOulO3hTNSa1xrq7Y2GMIUnNviKJcjn7X5Ql8Aykl0SK4zzFEi/Ydzda
 WYRRm8LXIva2FsQKEc6ABIrMru+8ATRtdEHQBVgLgzwk6TCtCAm60ZNl3eytQF75hIgO
 8bTsSL3vwknf/6TljOdjpDtaPn0ZXma6sMi0QU0YnDSUb8DOGr9L2HX0hPgXMPogArn2
 1Hxxp8gndtJYc36X03iRjZc3DZBtaqoJloqnlTeOQ3d82LwMGk3tl1/omoN+nl2nm4sL
 IFyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ABcxXaf3qNBOZkBqeTkKv0RGUyLEXj8LkCJhCdpicDw=;
 b=auQNud8LtGgGh+4Vs0xTwzVePnF7Fdp1JxEmZgNM/U4P/talEiG7iKhjNaKWUc5q24
 CK0spEPWBezrIfcBJF5zGGI+nwoMT4NCD2mYk7uqQ7oXOMDrFV4ZFf5QTVWMOW6qn3Pb
 8PqQ+Mp9CXMSQho4mi70xLUFohd8jWaIzxgWEhI9NCPAz5nTlBa5dd8YQBrxIwbGIQEf
 5WMggjmDP7U/QHRgwbYzn137bOMrNGPCx0B5HiqzhvjApQJIuatbyUmcdWx5lCQlpqvG
 QoS5wefYPGYravulITQSBNSODOo5aQllAhJUpGCziftXH3QXIFMtaDBlu3qclp/qRDy7
 8D9g==
X-Gm-Message-State: AOAM531RIfW36zjp5iTXBHQnwUW/ss2rIC0Ui9V3tu8Td+je+qMdrg5j
 BZGA7wKAyL7zGBY15mBpBzpYs+94cwE=
X-Google-Smtp-Source: ABdhPJzZMogw56dekhv3mhaO4sfaMa/QLBDOAZgos1jSr6aERWCiCo2mWlUfmqickvvQjtjTj4DLBw==
X-Received: by 2002:adf:ee41:0:b0:203:de82:c2aa with SMTP id
 w1-20020adfee41000000b00203de82c2aamr16579584wro.390.1648373695801; 
 Sun, 27 Mar 2022 02:34:55 -0700 (PDT)
Received: from li-142ea8cc-3370-11b2-a85c-c55585c2aa0e.ibm.com.com
 (bzq-79-183-80-20.red.bezeqint.net. [79.183.80.20])
 by smtp.gmail.com with ESMTPSA id
 14-20020a056000154e00b00203f8adde0csm11892039wry.32.2022.03.27.02.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Mar 2022 02:34:55 -0700 (PDT)
From: Idan Horowitz <idan.horowitz@gmail.com>
To: qemu-arm@nongnu.org
Subject: [PATCH 1/3] target/arm: Check VSTCR.SW when assigning the stage 2
 output PA space
Date: Sun, 27 Mar 2022 12:34:26 +0300
Message-Id: <20220327093427.1548629-2-idan.horowitz@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220327093427.1548629-1-idan.horowitz@gmail.com>
References: <20220327093427.1548629-1-idan.horowitz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=idan.horowitz@gmail.com; helo=mail-wr1-x432.google.com
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
 Idan Horowitz <idan.horowitz@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As per the AArch64.SS2OutputPASpace() psuedo-code in the ARMv8 ARM when the
PA space of the IPA is non secure, the output PA space is secure if and only
if all of the bits VTCR.<NSW, NSA>, VSTCR.<SW, SA> are not set.

Signed-off-by: Idan Horowitz <idan.horowitz@gmail.com>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 812ca591f4..d0265b760f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -12697,7 +12697,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                 } else {
                     attrs->secure =
                         !((env->cp15.vtcr_el2.raw_tcr & (VTCR_NSA | VTCR_NSW))
-                        || (env->cp15.vstcr_el2.raw_tcr & VSTCR_SA));
+                        || (env->cp15.vstcr_el2.raw_tcr & (VSTCR_SA | VSTCR_SW)));
                 }
             }
             return 0;
-- 
2.35.1


