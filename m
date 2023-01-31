Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C57EC682BEC
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 12:54:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMpD3-00065f-LG; Tue, 31 Jan 2023 06:53:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pMpD1-000616-Mw; Tue, 31 Jan 2023 06:53:55 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pMpD0-0002LF-8p; Tue, 31 Jan 2023 06:53:55 -0500
Received: by mail-ed1-x52e.google.com with SMTP id cw4so9003683edb.13;
 Tue, 31 Jan 2023 03:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P7kVESaQNShpQPsRNC9Brnvan+iBx6TlgfEej59IhxY=;
 b=EvTAn7SlwPfJOKjNQ6MSEg5z8JIP3VQMLJGgxnVHMT9MhtnDDypLCc451j5f9z6wFU
 Zr44/DKVsi6inZx1rzpkmJP5idOgtkWFojgX4MSyOeckhKV8rqDZH8VeecWy7lPlSf2J
 e+lrZsS6358lrQd/0QbE0ur+RSW9tX7g/3uOUL/JT3UemshUshqQjkKCK5Ze9ZEk6Dl/
 oAAMBBc9EyYHd4v+nkEgMAUsm79zUq6mbAQfInANb2spVDqpbIjKIPO2O3mJwmTMIjPr
 s4/rLYj7hzmwwa46IJ9DpMsXs77XcoCWhk6YGPlyC8DNLIBx4acTltbSTa+WAYCX4nf6
 v7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P7kVESaQNShpQPsRNC9Brnvan+iBx6TlgfEej59IhxY=;
 b=vygCayUlOsLyXcjshvBbXW+EdL+b4jJRDn1u4RF0zVN3UCy6CxnetOnaEGkQbh1sAK
 iRtD6X72fwCEHbSL1xl9FfesGqM2E8JSpPXR3165pPLzXZuXw9IUCMEQEDdQzjlumywl
 auOb9MgnDSXa/TIBrNV8SpA5/YTqkxkvmMLtVGTDWFeTX3OuXyEuqYIO9u1QAM6cDtFr
 wkxBwxespb4vzEoDe0aTPaszfrSfk0ScDrliHv/bfl712k4v91JvlJwyKQeW/sRdCJlX
 rtmUooN9+8cyUm40tMhTBIBs4mDFrYKaN86eUJqpKiOuH5W7Q3emS9YAky8Gee8Ec3sk
 kDzg==
X-Gm-Message-State: AFqh2kpukFFn2e7Qn2L/PpLhJgJWLH+dx0R0VAejvURc8CxvxShKuMYC
 qqEAck6bbtKMAdW1aditWEvvN5kxzMU=
X-Google-Smtp-Source: AMrXdXt2uZhGrzz2/SvFp3GyQhX8ANN4eAnGmDAF4fvwIQ8JDl92k5yA/MAbBNDSV/6x4OFORmuBXg==
X-Received: by 2002:a05:6402:28c6:b0:49b:98be:c38 with SMTP id
 ef6-20020a05640228c600b0049b98be0c38mr58059296edb.11.1675166032329; 
 Tue, 31 Jan 2023 03:53:52 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-013-082-236.77.13.pool.telefonica.de. [77.13.82.236])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a056402100a00b00483dd234ac6sm8178318edu.96.2023.01.31.03.53.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 03:53:52 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Thomas Huth <thuth@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Laurent Vivier <lvivier@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, qemu-trivial@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 03/20] hw/i386/pc_q35: Reuse machine parameter
Date: Tue, 31 Jan 2023 12:53:09 +0100
Message-Id: <20230131115326.12454-4-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230131115326.12454-1-shentey@gmail.com>
References: <20230131115326.12454-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52e.google.com
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

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/pc_q35.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 83c57c6eb1..351ef25f69 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -218,7 +218,7 @@ static void pc_q35_init(MachineState *machine)
     pc_memory_init(pcms, get_system_memory(), rom_memory, &ram_memory,
                    pci_hole64_size);
 
-    object_property_add_child(qdev_get_machine(), "q35", OBJECT(q35_host));
+    object_property_add_child(OBJECT(machine), "q35", OBJECT(q35_host));
     object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_RAM_MEM,
                              OBJECT(ram_memory), NULL);
     object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_PCI_MEM,
-- 
2.39.1


