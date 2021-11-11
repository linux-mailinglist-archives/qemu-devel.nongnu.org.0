Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB36C44D9D5
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 17:06:49 +0100 (CET)
Received: from localhost ([::1]:58562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlCbA-0006F7-Ru
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 11:06:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mlCH6-0000ew-3h
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 10:46:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mlCH4-0006JX-22
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 10:46:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636645561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ufp9/KuAUrGSuDryICkcm/rvLOo65pXuj1/Jiaem2tU=;
 b=WovfbtQFX9iAIgj/itU/mV1UQDA2FPpWF7paDdivyNESy/0W9N6j7dfqlDNPtFxzYuiqwF
 wqT3ctzDzuRKUEafM/sFocj1CTyaLKmJCbr3H+KWBSBhwASP8eadTIomEchLkyFsdffgKd
 c8zdQc0pfkmMgC/dHU9/MH11k17HxA8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-p0qTb2Q2MFiMw-cAHZm8mA-1; Thu, 11 Nov 2021 10:46:00 -0500
X-MC-Unique: p0qTb2Q2MFiMw-cAHZm8mA-1
Received: by mail-wm1-f72.google.com with SMTP id
 l187-20020a1c25c4000000b0030da46b76daso4955077wml.9
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 07:46:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ufp9/KuAUrGSuDryICkcm/rvLOo65pXuj1/Jiaem2tU=;
 b=BNAG/L2HsvsoFES5s4WNgxSI2BbiLIeeoEHonLBaHwx0LdbH3YHAbjv8wO2l3dr2rw
 vjCWRQOwETd0Q63TYvEZ+Ex0q9Xdnz5S6Xvvq/1rnblzs0b/DqOzrwc1M2ZsfQEhZ6C6
 e2tf2y4fCm/AxZVbl4MWIAK4ATbh0Y7jDg311yGnen1Jd7wy8JWULtFasg4q5o8Hifrq
 So0tgW520ebUHtcYobmM6MWesHgXMJknjRkE5FUhGRdEzCziusK0F0p3MFeyzFxUW4km
 bSC1CzVQTnlxp9oAf/Jsejdrv2WFbZygw/Xj2lLW8L1U4XMvTqpkLs+K9IJVEUfSSgTF
 D9og==
X-Gm-Message-State: AOAM531hvC2WElGQrMchsSgkx9DWGdVCX085iRhfXBFAJHXvvK9uXTXI
 Hw+QwnPn1tteERQvCoIuypxsl2Ckw+rUY5L7TRpBCrQvLrzkKJfPtsXSSPvQaVMGnn3fEICZTTJ
 WOj/Urv+2Y0vPTHhcW8Say/GMBVHSROGfiDXvGQdEIPovxiI4YMXat96dmvjgUhQ6
X-Received: by 2002:adf:dec9:: with SMTP id i9mr10023633wrn.18.1636645559199; 
 Thu, 11 Nov 2021 07:45:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwlucSH3XNcTexDTWhwwNeLQC0LqJjzbGZFLLEsb9uLdk/G9V/NSaSaAjAfZmXbkOjO44bFQw==
X-Received: by 2002:adf:dec9:: with SMTP id i9mr10023593wrn.18.1636645558909; 
 Thu, 11 Nov 2021 07:45:58 -0800 (PST)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id z6sm4216155wmp.1.2021.11.11.07.45.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 07:45:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-7.0 1/2] hw/nvme/ctrl: Have nvme_addr_write() take const
 buffer
Date: Thu, 11 Nov 2021 16:45:51 +0100
Message-Id: <20211111154552.2263410-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211111154552.2263410-1-philmd@redhat.com>
References: <20211111154552.2263410-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 'buf' argument is not modified, so better pass it as const type.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/nvme/ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 634b290e069..c7cce63372a 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -377,7 +377,7 @@ static int nvme_addr_read(NvmeCtrl *n, hwaddr addr, void *buf, int size)
     return pci_dma_read(&n->parent_obj, addr, buf, size);
 }
 
-static int nvme_addr_write(NvmeCtrl *n, hwaddr addr, void *buf, int size)
+static int nvme_addr_write(NvmeCtrl *n, hwaddr addr, const void *buf, int size)
 {
     hwaddr hi = addr + size - 1;
     if (hi < addr) {
-- 
2.31.1


