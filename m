Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B506E609631
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Oct 2022 22:36:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omgiL-0001nr-I5
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 15:32:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG4S-00070c-Ty; Sat, 22 Oct 2022 11:05:58 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG4R-00021c-Gw; Sat, 22 Oct 2022 11:05:56 -0400
Received: by mail-ed1-x52c.google.com with SMTP id l22so16101200edj.5;
 Sat, 22 Oct 2022 08:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qnV3W8Z9RH7b0qdMsOmMLVYIItfoiFpG/WHHVfc30eI=;
 b=JC6+UAnDWIkocwNkSfsljKYdufhv0IjDkUBiUjJ9cUIuO1Hszs1UFknGkKWv2I3LV/
 vhfZZ7PcsurbpLlu3U8wo7/xj9U7kStL993vTw9h2oEpcxO71+HtJJFLSc3LlCyOC62n
 uIs0a5WBhL2o2LdYF6lMf+IA3hnA5c2eR11Et+femXgMXauhc+0TJpX4k02sXiIx0GPg
 MW28Y9uLWr+7JhHklHytTcIsgFdfulJXmTJ2HoysBJ4qk60Tqoe6G5Op/CBY/5Xu7tvJ
 7vwJBXnESDyfKQyUH9gyFa0V+fAQ87WyjYYMN06sSRSZP0x1wlbpbGrqcBvkGRs/wvlv
 FKww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qnV3W8Z9RH7b0qdMsOmMLVYIItfoiFpG/WHHVfc30eI=;
 b=U18A4giYDLpRup72kwDD8O86qyTB9VSWyoFCQseUlYJh2aa6Ob36IJby/qnj02l3DR
 QQATtlWbuZUGKMKStxiu4MwOR6D/GhTMBZXPES/eEZuKP1ZonlJIMI8lsnRQyfKy0WuH
 Jyl/W05lEw9mby8F3T5gT1/NSntV0jzHKpj4HBop+S7OYL69HInQScyF538gMKOo4G6/
 ThoVCwS/4uft3mYPp83I9qFN+5wl5D1dRzRkiwgD/mDjdi3MLni5WUcm9ONwsYCvrFSi
 aqAB4YdmTw2HLceUQAlqB6PEOuz3oXG7dosayLVhi7IHABZkqS1UptMgcs4VCkDIuiOz
 wFMg==
X-Gm-Message-State: ACrzQf1JW2O3slxzxwHpfRLHk59S/y3/8myir9TOEG33LdN1EqMtxKl/
 ZBLRChX1wL5Psi3p9Pr83z+kmg4eqvA/MA==
X-Google-Smtp-Source: AMsMyM68bjcr4cUKMQ9+dOLbkPbqSjdEd7taJlqld7grhihDilE63c4ynWhanHQhuBNqpjwp78x4iw==
X-Received: by 2002:a17:907:c15:b0:78d:9c3c:fb8f with SMTP id
 ga21-20020a1709070c1500b0078d9c3cfb8fmr20980994ejc.347.1666451152158; 
 Sat, 22 Oct 2022 08:05:52 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-191-171-138.77.191.pool.telefonica.de. [77.191.171.138])
 by smtp.gmail.com with ESMTPSA id
 4-20020a170906310400b00780ab5a9116sm13021558ejx.211.2022.10.22.08.05.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 08:05:50 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 02/43] hw/i386/pc_piix: Allow for setting properties before
 realizing PIIX3 south bridge
Date: Sat, 22 Oct 2022 17:04:27 +0200
Message-Id: <20221022150508.26830-3-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221022150508.26830-1-shentey@gmail.com>
References: <20221022150508.26830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

The next patches will need to take advantage of it.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/i386/pc_piix.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 7a55b9ca8e..5caef9bfc9 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -217,7 +217,8 @@ static void pc_init1(MachineState *machine,
                               pci_memory, ram_memory);
         pcms->bus = pci_bus;
 
-        pci_dev = pci_create_simple_multifunction(pci_bus, -1, true, type);
+        pci_dev = pci_new_multifunction(-1, true, type);
+        pci_realize_and_unref(pci_dev, pci_bus, &error_fatal);
         piix3 = PIIX3_PCI_DEVICE(pci_dev);
         piix3->pic = x86ms->gsi;
         piix3_devfn = piix3->dev.devfn;
-- 
2.38.1


