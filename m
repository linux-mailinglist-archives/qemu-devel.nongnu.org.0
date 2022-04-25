Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0668850DBEB
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 11:02:59 +0200 (CEST)
Received: from localhost ([::1]:36552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niucU-0007TW-4O
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 05:02:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1niu0C-0006cu-IC
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 04:23:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1niu04-0002hH-ML
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 04:23:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650874995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bwBj2TaBRASZZSGjsc9HqXLMt7MyjxjnAoNllDw6MNM=;
 b=ivDUtsSj4RGYuO5Jr2+pwV45Ad6aeEGWZrHVmMdm/hN3cOJKuuaphJjV9pPUM9ncaZ8GAo
 U/nOxGN1Hpuqpf/EpeU5hWc5eqcjmbB95lKxMld5I1EVq6ahdcXMwpvn+5zqF471a3VzJq
 7RuBmLNwS+CK1MI6FBK+exmPipkc7zg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-230-4xOGewTgNxSelzXytBFgYQ-1; Mon, 25 Apr 2022 04:22:07 -0400
X-MC-Unique: 4xOGewTgNxSelzXytBFgYQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 p18-20020adf9592000000b00207bc12decbso3072211wrp.21
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 01:22:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bwBj2TaBRASZZSGjsc9HqXLMt7MyjxjnAoNllDw6MNM=;
 b=0DJSR5sNsfzAVpW7G6E6H2REufVbLdOAf0Wo5Q38YF+aH4YffbgqhBt+zqg4r9q+bb
 qBGZd9uLyAjy8PgWYXpWwMHvy0D06e6FTHrDRe9mCS5Nvl3iHCzjE2FXZyHSwBvveSc2
 1msMSsJC/9rBRg/ZELgocPj8XOdRv8uX1IxN16WvkBNhJEB4aylTAkRiAqcxF0dQKDa6
 ZoHXgKcQ1pUcdmqiMnkybh3Z8i9W2+7IkZx+zJ5FWmKobhAJhixE8PrPFZwPjJU9KJjy
 xvDzZ18jUAI6a3btp29VeL2f1K4phZ4vAKKhnfQCq2o38AiqoSq+3KnhihpNhl8VogV7
 wfIA==
X-Gm-Message-State: AOAM533wBmwQPdOV+OnSwCZBaAQJuVpATreZ7PcOlQKOEMTAc9oo43F7
 b26LRHknP3R6dTuveRdneFs+pMLuNaTTLyDaUSQSO+DIx7oSGOb/EijwAptjAYqi6Jq0kE2UOGK
 ocL/pelMmKRR3qOI=
X-Received: by 2002:a05:6000:1686:b0:20a:96e0:9bbe with SMTP id
 y6-20020a056000168600b0020a96e09bbemr13086396wrd.635.1650874926176; 
 Mon, 25 Apr 2022 01:22:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw86C2gO2mMfKjeVrOKrDA/Qz/F6XRAJwprg6q1Fd+mFJa4HUgm+acUIsw2U/W4vncKhcrY0w==
X-Received: by 2002:a05:6000:1686:b0:20a:96e0:9bbe with SMTP id
 y6-20020a056000168600b0020a96e09bbemr13086362wrd.635.1650874925990; 
 Mon, 25 Apr 2022 01:22:05 -0700 (PDT)
Received: from wheatley.localdomain (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 v6-20020a056000144600b0020a9a1627e2sm8374495wrx.15.2022.04.25.01.22.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 01:22:05 -0700 (PDT)
Received: from wheatley.redhat.com (wheatley.k8r.cz [127.0.0.1])
 by wheatley.localdomain (Postfix) with ESMTP id 6890067B1B61;
 Mon, 25 Apr 2022 10:22:02 +0200 (CEST)
From: Martin Kletzander <mkletzan@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/18] hw/ppc: Support machine-default audiodev with fallback
Date: Mon, 25 Apr 2022 10:21:55 +0200
Message-Id: <9e9864dfe1cea988e7fdca14a1425d80e5895094.1650874791.git.mkletzan@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1650874791.git.mkletzan@redhat.com>
References: <cover.1650874791.git.mkletzan@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mkletzan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, libvir-list@redhat.com,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Yanan Wang <wangyanan55@huawei.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Thomas Huth <huth@tuxfamily.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
---
 hw/ppc/prep.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
index bf622aa38fab..52d801afb307 100644
--- a/hw/ppc/prep.c
+++ b/hw/ppc/prep.c
@@ -46,6 +46,7 @@
 #include "elf.h"
 #include "qemu/units.h"
 #include "kvm_ppc.h"
+#include "audio/audio.h"
 
 /* SMP is not enabled, for now */
 #define MAX_CPUS 1
@@ -304,6 +305,9 @@ static void ibm_40p_init(MachineState *machine)
         dev = DEVICE(isa_dev);
         qdev_prop_set_uint32(dev, "iobase", 0x830);
         qdev_prop_set_uint32(dev, "irq", 10);
+
+        qdev_prop_set_string(dev, "audiodev",
+                             audio_maybe_init_dummy("ppc.defaudio"));
         isa_realize_and_unref(isa_dev, isa_bus, &error_fatal);
 
         isa_dev = isa_new("pc87312");
-- 
2.35.1


