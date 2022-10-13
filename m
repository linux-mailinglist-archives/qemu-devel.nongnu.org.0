Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3945FDE33
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 18:21:59 +0200 (CEST)
Received: from localhost ([::1]:44196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj0y6-00037K-D2
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 12:21:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oj0jC-0001x3-SE
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 12:06:35 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:44759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oj0j9-0001dQ-5D
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 12:06:34 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 bg9-20020a05600c3c8900b003bf249616b0so1789659wmb.3
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 09:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/F3jjKAvJ3qDIMnXa9+7zQrGXCzXqsolcdSC4WnXfXc=;
 b=gi2Qw5jhIgHEAcK7aLG+WGJ+IJ31/JfQx/oAxoidkWkTOUnFzBAvuOfufMrBV8gnup
 80zi4jEo3as7JTsJW+wexsDHZ5K13J33nuNJ97HQlAjmf3FQABXqnX7P4SKQo4K0jibw
 b6Sa9Sg6ZRz+GBBUDaYDA+AbQUuKJArbXlRzivjHd7BmFicDxqpFldS8GYICMbUKA+Qg
 sr8IrcF2TQ3i99ahmpVosNO521badAA08aA8qMhFTLs3JMDpzqErIr/SAvDK9umXn9N0
 czIxkr04yUCNQiZxXrl59JrJ9P0Ni6QeLzs3cQVYJsOABPaFSfcf48JfWr4Vpn2gfCV7
 eHVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/F3jjKAvJ3qDIMnXa9+7zQrGXCzXqsolcdSC4WnXfXc=;
 b=u86wQxO8NFzO4EtSOcGPHCfgJQT/4auZuAZSvtlDpgD3kE3/YitfeP8vxfjsb5qqB0
 vIe30IW91tEjSlRlTnEytfJFzFsyWfWNJhRW/aKD+2PySsST6uzY7Vrlyw06RvD3bEFd
 N1EExpxgZS0GiOB/lscAv3VwGXPFlaDGINs46nxYPodLtcs/TECsKY5w6Tp9j1hpNqYX
 Ibl2Y7mRjSOZ+4UWaPpO8r4o/uV5IeDm80HdFADgeqvXGsYQPJFY2Xj+wnkMHMxLowDE
 2YF4Gn2tpJYiOLS0EZs+6O4ZaeiM66STtxrHa73XAEyPNQH/B2y3c/AdABPRyCrQ6mfv
 wcJw==
X-Gm-Message-State: ACrzQf1fQMpxct4o3yRX6/UCgyOcma/Rxz4ZI+/1+ff0L/xBMZgVA94D
 EhA6fN9ffgdS+9KAtmn00JbtAoux9LqF5A==
X-Google-Smtp-Source: AMsMyM4/J9ZRwI0LDia5Wym9nkeYc9q9lerxf9XFV8kXP788uHkqNidxJJ97Y96tm6/0gPk9dMnNgg==
X-Received: by 2002:a05:600c:230d:b0:3c4:2975:321a with SMTP id
 13-20020a05600c230d00b003c42975321amr7125540wmo.155.1665677189669; 
 Thu, 13 Oct 2022 09:06:29 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 o14-20020a05600c4fce00b003c6b67426b0sm5125617wmq.12.2022.10.13.09.06.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 09:06:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Hannes Reinecke <hare@suse.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Greg Kurz <groug@kaod.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, qemu-block@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 2/2] hw/scsi/vmw_pvscsi.c: Use device_cold_reset() to reset
 SCSI devices
Date: Thu, 13 Oct 2022 17:06:23 +0100
Message-Id: <20221013160623.1296109-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221013160623.1296109-1-peter.maydell@linaro.org>
References: <20221013160623.1296109-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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

Currently the vwm_pvscsi controller resets individual SCSI devices
with the device_legacy_reset() function.  The only difference between
this and device_cold_reset() is that device_legacy_reset() resets the
device but not any child qbuses it might have.

In this case, no SCSI device has a child qbus, so the functions have
the same behaviour.  Switch to device_cold_reset() to move away from
using the deprecated function, and bring this SCSI controller in to
line with what all the others do.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/scsi/vmw_pvscsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/scsi/vmw_pvscsi.c b/hw/scsi/vmw_pvscsi.c
index 3ea2c8c9f23..fa766968550 100644
--- a/hw/scsi/vmw_pvscsi.c
+++ b/hw/scsi/vmw_pvscsi.c
@@ -880,7 +880,7 @@ pvscsi_on_cmd_reset_device(PVSCSIState *s)
 
     if (sdev != NULL) {
         s->resetting++;
-        device_legacy_reset(&sdev->qdev);
+        device_cold_reset(&sdev->qdev);
         s->resetting--;
         return PVSCSI_COMMAND_PROCESSING_SUCCEEDED;
     }
-- 
2.25.1


