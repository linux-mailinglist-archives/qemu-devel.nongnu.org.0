Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CE343E4B1
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 17:12:37 +0200 (CEST)
Received: from localhost ([::1]:37878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg753-0005kV-1S
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 11:12:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mg6yG-0006gV-2i
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:05:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mg6yD-00078L-33
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:05:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635433532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=64kbEvhgsvTtmcrJ2XOWOXD5KZT50cBaqVp/eA5mjE8=;
 b=hXE+leyqyK3Q5y3UBVdp/XtoUIbT+AH5OzNTyMGeZKDzqWTtcMzK3L7h9TzGWNolDIVWwM
 MYj8+pTJFD3hxZwP6+D8K1+9vIplH8N86p9uZMmQDhpf7fzgIo8xVX+Zs/IKEhbRIj2bcE
 HCz1J1gzdNRUdMl1sxY1hLan4uFr+oc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-NLPHQToXMcSiu57vTXtbJQ-1; Thu, 28 Oct 2021 11:05:31 -0400
X-MC-Unique: NLPHQToXMcSiu57vTXtbJQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 c4-20020a056000184400b0016e0cc310b3so2243399wri.3
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 08:05:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=64kbEvhgsvTtmcrJ2XOWOXD5KZT50cBaqVp/eA5mjE8=;
 b=gQxHv18MWvfoCwjjyGA2RlpUGDTW5ZEOlBJ4mpg1MF+h54YLaCQWiLITd9W+kTnOVT
 yuISX8d3+Kl1Mc6ZKDxjFXnVQePDhph0cZsdRwMA8O0RIXVTbwFLfYhF8GsYMdmWt2Cr
 0Of9gp2OQUwBwgOn9uA2J/rqEuGjFPQUoi++09EmYahI8ZA2Q2vGKmvY6gin9+DopSHV
 H+5tyVLhpahdpduS5IxGWARe/f0gY+ALEnyxB3GxyaSM9umkvlXmx6jph75/fuTKi43e
 EcNJxNViBy/Z8YqDpB8Y2JTU4k53aqP9/g8D/l/rG8z04QoynfTj/iSCIWK37fb+TT/g
 xWfg==
X-Gm-Message-State: AOAM532dmy9I0xzNh2yHQt27bSPrPqm2T2SgOuYjJDrbPlPYNe4kwdtW
 kCTP9j/4pNNtJnqlZh5oiYs6028vYxAa1UT8wAr5BJEf2lzrujfFGm8NUMV0xZa00X0mNN0Thiq
 WpMvf6THfDL+bM6jBwxJ1jX65qGvZaVBpIagQzMTO2pnMDRPIi7lLBdFTpvDaxtou
X-Received: by 2002:a05:600c:3581:: with SMTP id
 p1mr12883779wmq.34.1635433529429; 
 Thu, 28 Oct 2021 08:05:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9cNv+UTrZZcL1WQuz+EcitzSKpMp9UvkyFxL9PUhH9XTloF6Tsz5tBixL62aVHvKKaiXXmQ==
X-Received: by 2002:a05:600c:3581:: with SMTP id
 p1mr12883730wmq.34.1635433529134; 
 Thu, 28 Oct 2021 08:05:29 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id j10sm3176917wrx.94.2021.10.28.08.05.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 08:05:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] hw/core: Restrict sysemu specific files
Date: Thu, 28 Oct 2021 17:05:18 +0200
Message-Id: <20211028150521.1973821-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211028150521.1973821-1-philmd@redhat.com>
References: <20211028150521.1973821-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All these files don't make sense for tools and user emulation,
restrict them to system emulation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/core/meson.build | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/core/meson.build b/hw/core/meson.build
index 18f44fb7c24..a829cc4245b 100644
--- a/hw/core/meson.build
+++ b/hw/core/meson.build
@@ -14,15 +14,15 @@
 )
 
 common_ss.add(files('cpu-common.c'))
-common_ss.add(when: 'CONFIG_FITLOADER', if_true: files('loader-fit.c'))
-common_ss.add(when: 'CONFIG_GENERIC_LOADER', if_true: files('generic-loader.c'))
-common_ss.add(when: ['CONFIG_GUEST_LOADER', fdt], if_true: files('guest-loader.c'))
-common_ss.add(when: 'CONFIG_OR_IRQ', if_true: files('or-irq.c'))
-common_ss.add(when: 'CONFIG_PLATFORM_BUS', if_true: files('platform-bus.c'))
-common_ss.add(when: 'CONFIG_PTIMER', if_true: files('ptimer.c'))
-common_ss.add(when: 'CONFIG_REGISTER', if_true: files('register.c'))
-common_ss.add(when: 'CONFIG_SPLIT_IRQ', if_true: files('split-irq.c'))
-common_ss.add(when: 'CONFIG_XILINX_AXI', if_true: files('stream.c'))
+softmmu_ss.add(when: 'CONFIG_FITLOADER', if_true: files('loader-fit.c'))
+softmmu_ss.add(when: 'CONFIG_GENERIC_LOADER', if_true: files('generic-loader.c'))
+softmmu_ss.add(when: ['CONFIG_GUEST_LOADER', fdt], if_true: files('guest-loader.c'))
+softmmu_ss.add(when: 'CONFIG_OR_IRQ', if_true: files('or-irq.c'))
+softmmu_ss.add(when: 'CONFIG_PLATFORM_BUS', if_true: files('platform-bus.c'))
+softmmu_ss.add(when: 'CONFIG_PTIMER', if_true: files('ptimer.c'))
+softmmu_ss.add(when: 'CONFIG_REGISTER', if_true: files('register.c'))
+softmmu_ss.add(when: 'CONFIG_SPLIT_IRQ', if_true: files('split-irq.c'))
+softmmu_ss.add(when: 'CONFIG_XILINX_AXI', if_true: files('stream.c'))
 
 softmmu_ss.add(files(
   'cpu-sysemu.c',
-- 
2.31.1


