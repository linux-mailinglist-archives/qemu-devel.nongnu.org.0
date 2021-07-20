Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 991513CFE25
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 17:48:29 +0200 (CEST)
Received: from localhost ([::1]:33450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5ryu-0002vb-MX
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 11:48:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5rtK-0000RA-P2
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:42:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5rtJ-0005GA-3W
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:42:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626795757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GzDQgdGV/hfvQP6GwfosBu6lb8Nm+mns6f7nRKorcs0=;
 b=DoM5j1H1BBkxVKnVzguF9VK68DkbTqsoSoW2t54hjzSqQBXBg+eScZYWYUvIVi+5Lx6Re/
 DP9Q7T8MfyPXfOMWTa3rcapZQPNTmD/n6aiOR+QakV9EwgrOY9vZIbtcTZV55FgvWN98yq
 hsIr93rpf00ftU6qrBho8JlswgPIKZ8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-igZlSN9YPXCM1WjQCeK_WQ-1; Tue, 20 Jul 2021 11:42:36 -0400
X-MC-Unique: igZlSN9YPXCM1WjQCeK_WQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 1-20020a05600c0201b029022095f349f3so946142wmi.0
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 08:42:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GzDQgdGV/hfvQP6GwfosBu6lb8Nm+mns6f7nRKorcs0=;
 b=sFa6pczZryRhJZnvWTla2PsJLIFroMJvqg9AmmJkmWvdTFszXBApvJz8mKjpCsrHE4
 EZ4pkSgmL8dCZNEpmNiiokFgXKkOPFZ1BLj+CzECyNu4xnXR1ihxt9ivUZUlga7OTk0c
 f69onVf07U+Jx0shutKtMEJwZO2fa1nF5loEwpZYBv9aZuXQGDGAYgKMHPIoalV1dVEn
 rfBO2pzsUu1I2e+t+k/4O83bQpMY+66P26ZJoWV/6/bEn4o3L5CY9rgqZqzdjaQSBihN
 DqMQyyuZUiNmYSYe+PiELswX8AHrd+H4OPyshjPoehg1DDQl41EHn72F1djITa5nx8mH
 ovIg==
X-Gm-Message-State: AOAM5310vYZCZxObCO/E536KTWYVhXzAIyAdX44NMbv1bJoIjaowUzrZ
 wZ7fGu4bxqbBL7K4x61qOeuiB9cMj6shOWLTsnbosVUeU5wiMP/YiLdtsflA++cAwlDEBj9ANas
 RG/zUGC7+7XHZc8Q/53l6pTr1P8SoZoAhWOcXeJSikOA4oH83xM89fO4avpMH6TyI
X-Received: by 2002:a1c:1c7:: with SMTP id 190mr31917267wmb.170.1626795755372; 
 Tue, 20 Jul 2021 08:42:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBzaB3BJia38L3FVAqToQixpO9qEad8p3gYH6AAanfD9ToVvQPnzaWz5TGy/ucGnZtEgkE0g==
X-Received: by 2002:a1c:1c7:: with SMTP id 190mr31917251wmb.170.1626795755119; 
 Tue, 20 Jul 2021 08:42:35 -0700 (PDT)
Received: from x1w.. (122.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id
 139sm3026875wma.32.2021.07.20.08.42.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 08:42:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/17] hw/ppc/Kconfig: Add missing dependency E500 -> DS1338 RTC
Date: Tue, 20 Jul 2021 17:41:36 +0200
Message-Id: <20210720154141.3919817-13-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210720154141.3919817-1-philmd@redhat.com>
References: <20210720154141.3919817-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 7abb479c7ab ("PPC: E500: Add FSL I2C controller and integrate
RTC with it") added a global dependency on the DS1338 model, instead
of a machine one (via Kconfig). This gives trouble when building
standalone machines not exposing I2C bus:

  The following clauses were found for DS1338

      CONFIG_DS1338=y
      config DS1338 depends on I2C

Fix by selecting the DS1338 symbol in the single machine requiring
it, the E500.

Fixes: 7abb479c7ab ("PPC: E500: Add FSL I2C controller and integrate RTC with it")
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210513163858.3928976-9-philmd@redhat.com>
---
 configs/devices/ppc-softmmu/default.mak | 1 -
 hw/ppc/Kconfig                          | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/devices/ppc-softmmu/default.mak b/configs/devices/ppc-softmmu/default.mak
index 4535993d8d5..658a454426e 100644
--- a/configs/devices/ppc-softmmu/default.mak
+++ b/configs/devices/ppc-softmmu/default.mak
@@ -1,7 +1,6 @@
 # Default configuration for ppc-softmmu
 
 # For embedded PPCs:
-CONFIG_DS1338=y
 CONFIG_E500=y
 CONFIG_PPC405=y
 CONFIG_PPC440=y
diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index 322a7eb031e..85b9c93f02e 100644
--- a/hw/ppc/Kconfig
+++ b/hw/ppc/Kconfig
@@ -130,6 +130,7 @@ config E500
     select SERIAL
     select MPC_I2C
     select FDT_PPC
+    select DS1338
 
 config VIRTEX
     bool
-- 
2.31.1


