Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C3A5FF062
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 16:33:00 +0200 (CEST)
Received: from localhost ([::1]:40584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojLkB-0004JS-MW
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 10:32:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ojLe4-0005oa-QJ
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 10:26:42 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:45790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ojLe2-0008TV-Of
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 10:26:40 -0400
Received: by mail-wr1-x436.google.com with SMTP id a10so7784649wrm.12
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 07:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Flm8+S+i6iH5FMi/IsYCFIcRXsXEtN9MK+hXjFDVzjc=;
 b=a3z825ZscBkyUPs3juGztKd2x1iDqztR3FGi01CpjZeg/SnQsNIt5dBB8NnhoYJKgY
 GlrDqyGcuD2usvvt9q0RgY2iCip++oMG15TYJjDRzk+Q4blsDuXxhZqSlLbyIjA2mFHx
 ff9JjcTkSUDihOZef8AygfWqWShVRG04644RIlJaSdtHvRlInNcMFAquOVyX58aYaugo
 TACGmjMJHpggnCd48cXJGLrsujD4Bw3vUPjcaR9LE+OAzUa0bcyNs2+2g8MawsYow97m
 klfF30RuyDLGeVu/mN0MuizB5Bo96yp3MhOYFd28R407V/vWl7YPkpHZ35X8hTgcIINa
 8+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Flm8+S+i6iH5FMi/IsYCFIcRXsXEtN9MK+hXjFDVzjc=;
 b=OtAaD/I1+7CIbrZ3YhUxPfclCSPZUPlEr1NqnSOkSzHpfk5hDKd/5UfdvLwkAdHI8N
 6KpvjXQ3Gf0tlvVSavzCHtyaxaQBthTECSLfh45Z2rrzeaWXIAvIfCuFCypXQH+wVviK
 Jzp6iRHfpQAdrojEcOFI4UA0dQJ+h75HKigr+QgNtrCpVr9JAT2U0F3EtE7CIHo1RlVf
 yAiD8AMDoQVIMaAy/hW1UIx1lw2RZZQDwcrYHiECP51u3J3uGcxQuX6X9kGAhTvjBx71
 QIpTTiNGDjGW0d0uRK4HnONV2ADdy0tWfpVpX6Fpzpc5qPSqJE2/M3cgSC/xhZX58jla
 SS5g==
X-Gm-Message-State: ACrzQf1htGtd8gwXXidnoU1A5EcGbZctg+vulGDubdP9K1IeCfJYn5kJ
 4hIznKmwraro4vh6VLT9BrKtzNzCDwp2TA==
X-Google-Smtp-Source: AMsMyM7eWl3nPmKvs+CNea23kFaENf933ldlutMIdo/tKGdlE2knY8KDvhtqwqPXG5ErvH7DqHP/Og==
X-Received: by 2002:a5d:452b:0:b0:22e:3d4a:2ea3 with SMTP id
 j11-20020a5d452b000000b0022e3d4a2ea3mr3506626wra.309.1665757597249; 
 Fri, 14 Oct 2022 07:26:37 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adfaac3000000b0022e62529888sm2183530wrc.67.2022.10.14.07.26.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 07:26:36 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 2/2] hw/audio/intel-hda: Drop unnecessary prototype
Date: Fri, 14 Oct 2022 15:26:32 +0100
Message-Id: <20221014142632.2092404-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221014142632.2092404-1-peter.maydell@linaro.org>
References: <20221014142632.2092404-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The only use of intel_hda_reset() is after its definition, so we
don't need to separately declare its prototype at the top of the
file; drop the unnecessary line.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/audio/intel-hda.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
index 38cfa20262e..b9ed231fe84 100644
--- a/hw/audio/intel-hda.c
+++ b/hw/audio/intel-hda.c
@@ -220,8 +220,6 @@ struct IntelHDAReg {
     void       (*rhandler)(IntelHDAState *d, const IntelHDAReg *reg);
 };
 
-static void intel_hda_reset(DeviceState *dev);
-
 /* --------------------------------------------------------------------- */
 
 static hwaddr intel_hda_addr(uint32_t lbase, uint32_t ubase)
-- 
2.25.1


