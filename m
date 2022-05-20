Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5DE52F200
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 20:05:07 +0200 (CEST)
Received: from localhost ([::1]:59062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ns6zp-0008Cy-QR
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 14:05:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ns6wZ-0003uU-Jr; Fri, 20 May 2022 14:01:43 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:45880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ns6wX-0004FL-QJ; Fri, 20 May 2022 14:01:43 -0400
Received: by mail-ej1-x633.google.com with SMTP id jx22so3546763ejb.12;
 Fri, 20 May 2022 11:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N+TZy6cwDLZ0W5+ZsmiQT5X+1/OysDgnSgLOs65PewU=;
 b=d7Jnv7UHRd14Umu1RL0OZv6I+x4H8W4Bur+KLwbLvUoKeBl3Eifyn0Ow1p4GlnTevs
 uuzz+4HFVbtGLU9RtTcjdqyKRZRKBQO6PtIeV513NW+jqYRS5kWBLVSGve9mGK6QXaMK
 /0jlnSxYYGIn9vBW3avN+pql5LoveOnalfwufRzsS3pmlMi0VUTbDj+c/AJod9slaG0y
 bQOFI8CHduIIs34SoSUisnc5moN+VgG7BgKvnuCaNubO4P6ARGwNfEQR0mcbkNvJ9zoT
 gDEeudaFzhRSqy74B7F+ZElOTur0mhprg52GsJrGJhrcgC7X6PQyeMypfYLeAAMUSqzV
 bnhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N+TZy6cwDLZ0W5+ZsmiQT5X+1/OysDgnSgLOs65PewU=;
 b=vITvo3JQEj1MZzRJx+QKNNaiaZZ2iSa0Z5eqfj88stHTgPwK43ULRbPABKCBNVN3V9
 JJNTkglgaBtdScsDKo1ujNoY7rVC7RpvrZ8Y/DCEIDip9AfcspwgkS8EpQHXvCHXnDp3
 CXm3obFSHya4l2N9vR42e690H9F07MkvGquAy7c2SydidIaIPoNhccLJswdhpSmBCiw8
 ARhFtra0TgKsdC+aS1/LLK6gwtCjbjWjtZf0YBOBVd980BruM/jPszXzFVVmtzy0IIil
 8gxX3FGKorJQbnkD59WN8nAMNI/Qx1CQ+tZom19AkHbaZNDFdgVTDTbafpCEYtnjfLny
 8A1A==
X-Gm-Message-State: AOAM533A+87oHShaRMgKnq4t3II2YEEd0lMGo1vefwFV7zV22IvmuMTD
 gtBQd9r7Za++CZJPZSFnSI/GH1BaUXc=
X-Google-Smtp-Source: ABdhPJw77nI3S/cFQpHPboGsZZVYFvKCqEe7eQw2YiVrb7sF3TwDgNPbjCFax1n3mZtq7RmVWOR6kw==
X-Received: by 2002:a17:907:e92:b0:6fa:8125:c92a with SMTP id
 ho18-20020a1709070e9200b006fa8125c92amr10147571ejc.45.1653069700693; 
 Fri, 20 May 2022 11:01:40 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-089-014-209-236.89.14.pool.telefonica.de. [89.14.209.236])
 by smtp.gmail.com with ESMTPSA id
 w5-20020aa7cb45000000b0042aa7e0f892sm4622029edt.15.2022.05.20.11.01.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 11:01:40 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v2 05/10] hw/i386/pc: Remove orphan declarations
Date: Fri, 20 May 2022 20:01:04 +0200
Message-Id: <20220520180109.8224-6-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220520180109.8224-1-shentey@gmail.com>
References: <20220520180109.8224-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/i386/pc.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index cb491fc43b..9c1d1c0a7c 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -170,9 +170,6 @@ void pc_cmos_init(PCMachineState *pcms,
                   BusState *ide0, BusState *ide1,
                   ISADevice *s);
 void pc_nic_init(PCMachineClass *pcmc, ISABus *isa_bus, PCIBus *pci_bus);
-void pc_pci_device_init(PCIBus *pci_bus);
-
-typedef void (*cpu_set_smm_t)(int smm, void *arg);
 
 void pc_i8259_create(ISABus *isa_bus, qemu_irq *i8259_irqs);
 
-- 
2.36.1


