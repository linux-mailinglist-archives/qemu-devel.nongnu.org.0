Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5747619CDB
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 17:17:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqzMg-00081U-9w; Fri, 04 Nov 2022 12:16:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oqzLq-0006RA-FU
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 12:15:32 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oqzLl-0000fq-4d
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 12:15:24 -0400
Received: by mail-wr1-x435.google.com with SMTP id w14so7717890wru.8
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 09:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dP2Tld0oNVBqsOOhbGZ6H70b01wO4+uA3tggm2gFq8o=;
 b=g0JePzDP7ePUMgHMcQADAmT2lwBB3O+X39g6Elncs0SaVE0inkoKthPLhYCg5VmHLN
 eD4T5/0t/VWUB2I+J2cqFwBXQeoEZ+Z5qAdtk9hWFGpNylkutoS1HdDdTQJaDoBQJlMo
 J5Vl5VAhB9aZZF6bTmepAXidn5P9ln8W23SEMBMawkg2/gDceJhEOt5WqDnjEp+Grj99
 vNQ3C9uav20AY6B0a/OeEtrd6IUZke1zRtJi7zdHH3+V54oTpVvW2GEq6WVUK7vEWuS8
 AdEWtgEv6GNc66IOQXqKTKerXiMGkKygTdN/ILzgXwpOWfVj5KoclyQQFWiNxED2+VBU
 XTMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dP2Tld0oNVBqsOOhbGZ6H70b01wO4+uA3tggm2gFq8o=;
 b=LnjoYI0CFyuMldUEK1TE/jMJmB6fnhO0DY+kgInesdLPQ0RNzSorpm7GRElyI8td3M
 RfidrtMT00J7GP1/7fcTTy0Ioc9HO7si30o+MWfd/md1YskuuEH9aZTvFKXqUOYIn1IT
 bk/Abco2VbndDelS+lgoL3yTqaNJcrCsoKpfqinUlS84ti5iu2UKqklS1QwTcTM3h4YN
 QBhHMM7sfEBcCmH8u7tCASOrZ/AU+KhLt2BgosAwaisqzhQ/vRb2hEPmetOWg+pK1V6i
 3GYlIF1jzr22uhMG0COP/HY7B5sPppUqteXxYfkdtusenNdqIOt4nwyfcqYgzqrvs+WQ
 LO8g==
X-Gm-Message-State: ACrzQf0DG6A9+UJnr77Oh+xZG17xJdqN/YDjIKUEHuaQDw7bM9Wt7cZr
 4Lq44yrkNXlJaqlaopEppChSFCztZO6aZQ==
X-Google-Smtp-Source: AMsMyM7dd8SyllvLxmNFgNe4VICrvz7hbE9pa5h1nNU8yDgOAL/rbkC6KnI/aS6dk04TdmxksZpYBg==
X-Received: by 2002:a5d:4484:0:b0:236:574f:2536 with SMTP id
 j4-20020a5d4484000000b00236574f2536mr23839778wrq.7.1667578518947; 
 Fri, 04 Nov 2022 09:15:18 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ay5-20020a5d6f05000000b0022e57e66824sm4649645wrb.99.2022.11.04.09.15.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 09:15:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH for-8.0 2/9] hw/audio/intel-hda: don't reset codecs twice
Date: Fri,  4 Nov 2022 16:15:06 +0000
Message-Id: <20221104161513.2455862-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104161513.2455862-1-peter.maydell@linaro.org>
References: <20221104161513.2455862-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Currently the intel-hda device has a reset method which manually
resets all the codecs by calling device_legacy_reset() on them.  This
means they get reset twice, once because child devices on a qbus get
reset before the parent device's reset method is called, and then
again because we're manually resetting them.

Drop the manual reset call, and ensure that codecs are still reset
when the guest does a reset via ICH6_GCTL_RESET by using
device_cold_reset() (which resets all the devices on the qbus as well
as the device itself) instead of a direct call to the reset function.

This is a slight ordering change because the (only) codec reset now
happens before the controller registers etc are reset, rather than
once before and then once after, but the codec reset function
hda_audio_reset() doesn't care.

This lets us drop a use of device_legacy_reset(), which is
deprecated.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/audio/intel-hda.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
index f38117057b9..38cfa20262e 100644
--- a/hw/audio/intel-hda.c
+++ b/hw/audio/intel-hda.c
@@ -516,7 +516,7 @@ static void intel_hda_notify_codecs(IntelHDAState *d, uint32_t stream, bool runn
 static void intel_hda_set_g_ctl(IntelHDAState *d, const IntelHDAReg *reg, uint32_t old)
 {
     if ((d->g_ctl & ICH6_GCTL_RESET) == 0) {
-        intel_hda_reset(DEVICE(d));
+        device_cold_reset(DEVICE(d));
     }
 }
 
@@ -1083,11 +1083,9 @@ static void intel_hda_reset(DeviceState *dev)
     intel_hda_regs_reset(d);
     d->wall_base_ns = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
 
-    /* reset codecs */
     QTAILQ_FOREACH(kid, &d->codecs.qbus.children, sibling) {
         DeviceState *qdev = kid->child;
         cdev = HDA_CODEC_DEVICE(qdev);
-        device_legacy_reset(DEVICE(cdev));
         d->state_sts |= (1 << cdev->cad);
     }
     intel_hda_update_irq(d);
-- 
2.25.1


