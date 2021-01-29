Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B25F0308853
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:35:39 +0100 (CET)
Received: from localhost ([::1]:58948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5S3u-0000N7-Qo
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:35:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RWR-0005Bm-Pe
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:01:03 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:34989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RWL-0007Ba-Jf
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:01:03 -0500
Received: by mail-wr1-x432.google.com with SMTP id l12so8406851wry.2
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ZoznrQk5rWNMNVC35EjX7ZEcNiC7xyz+q93KkX/Abcg=;
 b=Sggzt45AuDaAW9REnwrfat1tSzN7jlNwL2U89Qn3h085ghiRtCOqjNFNOZn0+XbJDF
 cZJSJQ/msJ+Ky+AQ0kY8QjNXn6AlSWvQ/kHyBMJy3R/H2mG/CfryJYgZ2qNucd44EHFx
 ZlWkmOOKaG0VD0FImYC2VheLlEnkW47POpK0x9SL3QNA7CwpFqeAWsC1BXN3iJ925Jwq
 XLV7boKKfqOaZMjpID2px18TXO+YAMPebpUXLldma3VwyFCLKYhR2Tadxv8jKdjWVXeJ
 ZJrMSO7AMKU/6EZPOoTpwxWbvrlAjUdApDTiEqIeUctV6kFVRSvcD86pT4GDp7Qo9RPg
 K0TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZoznrQk5rWNMNVC35EjX7ZEcNiC7xyz+q93KkX/Abcg=;
 b=IhvA/Pe2MuBMtNXEShSq27MvstgwrGKYEwI86WRV8cYDPwlM3QU8zSSfPf7qqm1eZN
 7I4ymgUO2ruKDOX9OO1DCea2pGb8HHnP5IXJsmX23NvxNIjaFig73ZSBs0W7C1xMCd6J
 jxAG9VBdVLPW9qGW7Wzu5ENDnX0tNapC4yNc6m26HKHSEePU84hl3O9/VRbsdqkPkDDv
 y38lWEoljN2at/iQSCDW/lCh9tqNhkyPdMPy+XajyvYBuQ/F9yDBJtRrIZtuDnmc6M1r
 uW/EA+okN7lWl/1To8Nx4faajjHeqGbnMPtzJpsFHWzguoh4qKHX6MOo9bajjTea7nOH
 151g==
X-Gm-Message-State: AOAM532Bfrhf/78v3VREoYXXWroOxRm7d1sF4bWUokbFbvxQeUFg3Tge
 iXLl8cZqvU18gNX2nZ9yoJMAAF0BGV8a5A==
X-Google-Smtp-Source: ABdhPJygicnIb47yvZc1+RHpExp4VoGlmqPk6BwqxAzowOhjcBHa4k0cohps09v45C8oYE3K7+HtkQ==
X-Received: by 2002:a5d:524a:: with SMTP id k10mr3909390wrc.394.1611918056287; 
 Fri, 29 Jan 2021 03:00:56 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w20sm9268761wmm.12.2021.01.29.03.00.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:00:55 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 46/46] hw/arm/stellaris: Remove board-creation reset of
 STELLARIS_SYS
Date: Fri, 29 Jan 2021 11:00:12 +0000
Message-Id: <20210129110012.8660-47-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210129110012.8660-1-peter.maydell@linaro.org>
References: <20210129110012.8660-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Now that the watchdog device uses its Clock input rather than being
passed the value of system_clock_scale at creation time, we can
remove the hack where we reset the STELLARIS_SYS at board creation
time to force it to set system_clock_scale.  Instead it will be reset
at the usual point in startup and will inform the watchdog of the
clock frequency at that point.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210128114145.20536-26-peter.maydell@linaro.org
Message-id: 20210121190622.22000-26-peter.maydell@linaro.org
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/stellaris.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index 5acb043a07e..ad72c0959f1 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -780,16 +780,6 @@ static DeviceState *stellaris_sys_init(uint32_t base, qemu_irq irq,
     sysbus_mmio_map(sbd, 0, base);
     sysbus_connect_irq(sbd, 0, irq);
 
-    /*
-     * Normally we should not be resetting devices like this during
-     * board creation. For the moment we need to do so, because
-     * system_clock_scale will only get set when the STELLARIS_SYS
-     * device is reset, and we need its initial value to pass to
-     * the watchdog device. This hack can be removed once the
-     * watchdog has been converted to use a Clock input instead.
-     */
-    device_cold_reset(dev);
-
     return dev;
 }
 
-- 
2.20.1


