Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F6A610EA6
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 12:36:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooMi9-0006m8-4d; Fri, 28 Oct 2022 06:35:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ooMi6-0006lA-2h; Fri, 28 Oct 2022 06:35:34 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ooMi4-0001iE-KT; Fri, 28 Oct 2022 06:35:33 -0400
Received: by mail-ej1-x62e.google.com with SMTP id t25so11945618ejb.8;
 Fri, 28 Oct 2022 03:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8dkns/xOgo85WY2NG3Q19/5apWzD74CXMaLQmzMC8uI=;
 b=ByeFZ/WVsywk4AYNRDYSnEswnSL6269bdt+xOfm2nRK+8H5hCpjqp/hMDJ4l5IbAAj
 2q7caWUSOvfnoBC35FNH7B5dgJIUPRSL9QJa0pzk0ZbcnDz008IFMQsrciGqu1lMr3oU
 hiX1cIKnlZ2qNs0JS2DT2zMHiJG/pejJc64PzkvJkFhQfhPM6DwPW48glsNwzuf5/04w
 tJezIEzxLuBm3cXet3Trd+G2bNRi2WTtJrsil7vBp2g1xVZxyKDQsUQaQ/gg/PsXQt1i
 l+3R5t9Ljw9iPpnrPVSfJIWKSj5Hjh1e6pVnqG9wPvedM9Eu2tbDXSw2V/Q6tUgq54oP
 2NVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8dkns/xOgo85WY2NG3Q19/5apWzD74CXMaLQmzMC8uI=;
 b=OeA8TmfqtDQ6x5nPWcT8Lgof9IS01v+ZKLJGjQ0Bos9G1eApbIX1bJntUqw3sVDJMG
 AFNmmYARYG7wdtauy316uiqATCg71jUysD6+b/CUbfFFntA7Rg+EJW0m1euXR6d93jFU
 hLPDV0QVwv+KQ7ku/eardggdePPeE1zbzyz4p65Re3U9RGEoGtd6f5Dd75Jfw/KjB8eC
 hnYIwpw0AJU5lwxJ3ZGlU/JPb/30RcFP/FiQ5BqRgQSpq2Hbt8/UOOULbnL75XbpI6Rp
 KFdOJbivBbBd+Nj3pSneSNvr0B+90HLpzT0xDKLwoMWKWl2TQEmGAMvbx2l9gMzVp76O
 lnIQ==
X-Gm-Message-State: ACrzQf3Js4FZtSEvbRuatvgLkK2X1RiBOHBBRXuebVFCfgYk6tOM0nCC
 LVNftDO5SgUOKb5rpyFFpP/Wytlk5bs=
X-Google-Smtp-Source: AMsMyM5qwrG330k6NXZwiD/C6kPXC+sUjiNWIWs8mPUrQi+H8YxrP1N62eZHRkyM85RXEpnEHAFj4w==
X-Received: by 2002:a17:907:a0c6:b0:7ad:a030:7499 with SMTP id
 hw6-20020a170907a0c600b007ada0307499mr1810420ejc.552.1666953329437; 
 Fri, 28 Oct 2022 03:35:29 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a17090653c100b0078128c89439sm2050527ejo.6.2022.10.28.03.35.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 03:35:29 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-trivial@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 1/3] hw/i386/acpi-build: Remove unused struct
Date: Fri, 28 Oct 2022 12:34:17 +0200
Message-Id: <20221028103419.93398-2-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221028103419.93398-1-shentey@gmail.com>
References: <20221028103419.93398-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Ammends commit b23046abe78f48498a423b802d6d86ba0172d57f 'pc: acpi-build:
simplify PCI bus tree generation'.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221026133110.91828-2-shentey@gmail.com>
---
 hw/i386/acpi-build.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 960305462c..1ebf14b899 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -121,13 +121,6 @@ typedef struct AcpiMiscInfo {
     unsigned dsdt_size;
 } AcpiMiscInfo;
 
-typedef struct AcpiBuildPciBusHotplugState {
-    GArray *device_table;
-    GArray *notify_table;
-    struct AcpiBuildPciBusHotplugState *parent;
-    bool pcihp_bridge_en;
-} AcpiBuildPciBusHotplugState;
-
 typedef struct FwCfgTPMConfig {
     uint32_t tpmppi_address;
     uint8_t tpm_version;
-- 
2.38.1


