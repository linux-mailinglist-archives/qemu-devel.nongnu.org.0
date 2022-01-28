Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA9249FD04
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 16:43:42 +0100 (CET)
Received: from localhost ([::1]:45186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDTPZ-00030T-9O
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 10:43:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTD5-0002Ab-OP
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:30:52 -0500
Received: from [2a00:1450:4864:20::42e] (port=33707
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTCz-0006Qb-Kf
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:30:44 -0500
Received: by mail-wr1-x42e.google.com with SMTP id e8so11670425wrc.0
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 07:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=O5lPl9HHeRUVqRwf9Wefbbxm14diARdL3uA5T3Sfq8w=;
 b=UKwb3Ljm+gTCUJ9tSQRgOLY83/6Xb+gsMsU5adLszouQnfejMytpJEl4nc0vYLO1no
 q7dBiHgCpoMxmyhjWMAXiahDQeW6wm1k4uH8E2OY0C16RDi6EJOjQqfyKWSTTHeRessN
 5nBpxaEOfAge239gNn6ZIff61G72uQ7sWrSaT46Yeu0AVR41QJUi+uwmRB3ma9N5Ognm
 tSCRhESR929gVFj4I05LdPG1FLGVEDfQRxdU+SWBwgYT4g4djE6ZdzP1LrwtedvTgMTM
 GiX4hfvZ/q9doZvpzBRPCanQ8GMEEQ2GoYROuxJFtlWPoHZNkldkikskLwEtoa87+azT
 Zc/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O5lPl9HHeRUVqRwf9Wefbbxm14diARdL3uA5T3Sfq8w=;
 b=ZIqH/ewQXdXWhQx6BnZBrhyEyDKhWfQdpIs90VMIHV83cxrtT5UFZPOuvevmTQqBf8
 kNzbYEuhPc8pivTaiODAvMl3Mxrf+VmyO/2v15FeC/vR0lwjr1uFdut49A8dDi6LZ6A1
 Bu9gmHpZuk0xq0zx9tAlbTK7E7eXU8X+KhO2uD+ehpIwDxDjpo1Id1ygbSsTLp4ueq7q
 7Eg7VUM8MnvKznJ+PD+6Ebid0jDAg5olRXnqzEhi0C1pMzPbTeE7LMy/X7uVBsfDS93j
 SwRCa+zbIRg9gZZ5neJdPDYoTAXdUuPI/A1yUIZKdYrUKVGK9+JZQRbHLpG9bfLVRoqR
 +6sQ==
X-Gm-Message-State: AOAM532P3vTOpu+G/ZQfk2TryYJv3LhYWxfIWWgqCB/xAk0sutHeopUE
 x4+clZuoA4lnLDmHicr/PQgEsq+m9NC8Pg==
X-Google-Smtp-Source: ABdhPJx+ftAxw2Y3Yw0yQ8BLQSTRsgGjfKsNwHghyuVVcmEiwNvLk99A5SBoGWDkLiqbMYqbmpdP8w==
X-Received: by 2002:a5d:4709:: with SMTP id y9mr7534164wrq.613.1643383838113; 
 Fri, 28 Jan 2022 07:30:38 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id j3sm4749485wrb.57.2022.01.28.07.30.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 07:30:37 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/32] hw/intc/arm_gicv3: Set GICR_CTLR.CES if LPIs are
 supported
Date: Fri, 28 Jan 2022 15:30:02 +0000
Message-Id: <20220128153009.2467560-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220128153009.2467560-1-peter.maydell@linaro.org>
References: <20220128153009.2467560-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The GICR_CTLR.CES bit is a read-only bit which is set to 1 to indicate
that the GICR_CTLR.EnableLPIs bit can be written to 0 to disable
LPIs (as opposed to allowing LPIs to be enabled but not subsequently
disabled). Our implementation permits this, so advertise it
by setting CES to 1.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220122182444.724087-10-peter.maydell@linaro.org
---
 hw/intc/gicv3_internal.h   | 1 +
 hw/intc/arm_gicv3_common.c | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index 5394266aaf4..a316f6c58a5 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -110,6 +110,7 @@
 #define GICR_NSACR            (GICR_SGI_OFFSET + 0x0E00)
 
 #define GICR_CTLR_ENABLE_LPIS        (1U << 0)
+#define GICR_CTLR_CES                (1U << 1)
 #define GICR_CTLR_RWP                (1U << 3)
 #define GICR_CTLR_DPG0               (1U << 24)
 #define GICR_CTLR_DPG1NS             (1U << 25)
diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 579aa0cb9ed..4ca5ae9bc56 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -429,6 +429,10 @@ static void arm_gicv3_common_reset(DeviceState *dev)
 
         cs->level = 0;
         cs->gicr_ctlr = 0;
+        if (s->lpi_enable) {
+            /* Our implementation supports clearing GICR_CTLR.EnableLPIs */
+            cs->gicr_ctlr |= GICR_CTLR_CES;
+        }
         cs->gicr_statusr[GICV3_S] = 0;
         cs->gicr_statusr[GICV3_NS] = 0;
         cs->gicr_waker = GICR_WAKER_ProcessorSleep | GICR_WAKER_ChildrenAsleep;
-- 
2.25.1


