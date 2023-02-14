Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76050696460
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 14:17:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRv9a-0007X9-Fk; Tue, 14 Feb 2023 08:15:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pRv9Q-0007Ts-Mq
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 08:15:21 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pRv9O-0003tv-MI
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 08:15:16 -0500
Received: by mail-ej1-x636.google.com with SMTP id qw12so39976496ejc.2
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 05:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6kbCDEpc2tGrryia0PoHlKlYaPwtvfa3bwOP0TWhkDg=;
 b=OqujgExxciLWQAD/lrIfFPm4EBg7Zsc9i/VDjutPiwMMDmZWFIoCaWOkmA+P0eb0Au
 ojzCgILSlCxLIes6ADzB1TfSK5IzwrZeC8vEm2NZIOMt91wKRTF9EIh5aHocrQt/nHlJ
 aqOi0vAB6iNqTIcVApz7s8XhSYDKFWSYzRKA9c9Ad+yVG+u6qc3P+ws8VrqF0FGifCEz
 LKIsLoMP8aJyY9DF5mqWKs3h4FZAwizl9ZdFKxGNrwQQWKx3EiSSSkVlRwL8o0EBYiMV
 95rM5fwdd3ePGLbBJ1PbZf4/CH7vk4qJkLTPnSsn8HozMFuqDQdNqkelwn3uMuJpQqzT
 3rcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6kbCDEpc2tGrryia0PoHlKlYaPwtvfa3bwOP0TWhkDg=;
 b=H4TV++7ZHUIyVaHIt7GBfD1GoLJJLpW0M1IQLh32KvvKSKRH0qynXyuSflGLPPRRV0
 NWr95ejR9q8eCJb+u5JBnO2+YzXdw3I2WLiPFBn384WIdYFQgT5gU5QbNk0vpJYT//gz
 UeLyxaI/C4HgITJMZoRYEHY+CwC50+aOXQQ8hBhVMWeE0DlOMSA/V/mtqStnIbchyjWK
 1oBui7VEs9DT4NCMBuyCxSKXmdqAmrqaJAgKuNvMH57m4TeAQUxhrIViPsOhIzJYD1TE
 pnOTbMMFjImSOGi2I+cXRckRSqdDbuWndtTCU6b743JY6KuCOFW3Gy1J+nnqZPrsyOuV
 /uSA==
X-Gm-Message-State: AO0yUKXG5rH07y3nr86NDHmHEC88isLvhzU55Dh2yKfKlEwsK0DXCDvy
 qfKQBfbzstDJURhx51H2bF/wlN9x/0M=
X-Google-Smtp-Source: AK7set9JyZZnMJh7gF0QFtq6A9aGCCwaUJTCNMCb96kZj/rGAO1hmoRfZMHUeFfuwHAGOm8ufSwSJg==
X-Received: by 2002:a17:906:9be6:b0:878:7ef1:4a20 with SMTP id
 de38-20020a1709069be600b008787ef14a20mr2924975ejc.4.1676380512996; 
 Tue, 14 Feb 2023 05:15:12 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-092-224-101-237.92.224.pool.telefonica.de. [92.224.101.237])
 by smtp.gmail.com with ESMTPSA id
 hz17-20020a1709072cf100b008b13836801bsm220153ejc.183.2023.02.14.05.15.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 05:15:12 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 02/12] hw/pci-host/q35: Fix contradicting .endianness
 assignment
Date: Tue, 14 Feb 2023 14:14:31 +0100
Message-Id: <20230214131441.101760-3-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214131441.101760-1-shentey@gmail.com>
References: <20230214131441.101760-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x636.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Settle on little endian which is consistent with using
pci_host_conf_le_ops.

Fixes: bafc90bdc594 'q35: implement TSEG'
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/pci-host/q35.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index 83f2a98c71..3124cad60f 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -289,7 +289,6 @@ static void blackhole_write(void *opaque, hwaddr addr, uint64_t val,
 static const MemoryRegionOps blackhole_ops = {
     .read = blackhole_read,
     .write = blackhole_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
     .valid.min_access_size = 1,
     .valid.max_access_size = 4,
     .impl.min_access_size = 4,
-- 
2.39.1


