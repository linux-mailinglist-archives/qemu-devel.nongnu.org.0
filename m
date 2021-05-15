Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 638DC381A4D
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 19:52:04 +0200 (CEST)
Received: from localhost ([::1]:35090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhySJ-0006yt-GM
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 13:52:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyEo-0001B8-5v
 for qemu-devel@nongnu.org; Sat, 15 May 2021 13:38:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyEi-0006Nj-RZ
 for qemu-devel@nongnu.org; Sat, 15 May 2021 13:38:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621100279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RV1lQVu+Z0RzwUnAORV2pR221f9eeMJn1YWrVW88UbY=;
 b=C3GBXCuxpWwHmssnoWLq6LuWU7mX8xYuIxp5eFYzM+9Ub7op1QAQScjRb5zTjqRzyecU+D
 cqDaoorifsK5p2JuFJ/MGhj9k12Ruco7aV1fVSd0hrwjcogagsLDouBK6ZkC6y6GPNxaFH
 dUrlFK/XzfMHjK6QfcKZSbkqJk6gc70=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-Jv5SMg2gPXyDNXpW5NDF4Q-1; Sat, 15 May 2021 13:37:58 -0400
X-MC-Unique: Jv5SMg2gPXyDNXpW5NDF4Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 l185-20020a1c25c20000b029014b0624775eso1651875wml.6
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 10:37:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RV1lQVu+Z0RzwUnAORV2pR221f9eeMJn1YWrVW88UbY=;
 b=fRO4hrlC/7DiH0Y3kvdF6LnXhnOtXFzzbbmjPovUzJM8ImJaGJMLzSRodWqt8E6pXV
 QqM5luGVSsIu/2w06iwUCSSX7Z8pyxCeG93trm03KFvgzsThxE1PpgQEm2KNYOMmlh4t
 KE3HVdzfu8R2ryFJBIrn6IPgi3Er58W7nduvteGzR8jGQmBNc1tmqNI/K0Z4B2N+FTlk
 1sb7hKnnPrYFI69mCXM7lSdqRHjiXssJ9VYVXJHv6AO74exJ7skb1wAP8DEpdaU3okyW
 Ryj+rqTwy7doWPFkvzJjPgG9fbp8RqLLcin4vpdCOTE/K89UL+/ZAw2blG+GlfN8J2mA
 OKkA==
X-Gm-Message-State: AOAM532ql//hqJHLa7hWd0TlRXLrOsV+AercUPiZJaAgXGaQXsVgp882
 /kbPQ4ADPZs0NMH++Gq65tw65r1CYRcWp040jBUaik7WiQVAh24vRiNchWYBC7KTMqxg7hakuHM
 Mr00VrZucsEF3uUoYxb3IU1Sk4jxaKOWIu/tw7RX4+sh6Tk71G8Qytk8BhIJQSg56
X-Received: by 2002:a5d:4cce:: with SMTP id c14mr67329391wrt.29.1621100277360; 
 Sat, 15 May 2021 10:37:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZ5d81gqNTqrDXPeRo6Xnm+gpF+7UbrE+plkceXU1QyAbiT09oDT/OoiwpyrXTKJOCVC29lg==
X-Received: by 2002:a5d:4cce:: with SMTP id c14mr67329371wrt.29.1621100277148; 
 Sat, 15 May 2021 10:37:57 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id c206sm3495060wmf.12.2021.05.15.10.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 10:37:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/12] hw/ppc/Kconfig: Add missing dependency E500 ->
 DS1338 RTC
Date: Sat, 15 May 2021 19:37:12 +0200
Message-Id: <20210515173716.358295-9-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210515173716.358295-1-philmd@redhat.com>
References: <20210515173716.358295-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>,
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
---
 default-configs/devices/ppc-softmmu.mak | 1 -
 hw/ppc/Kconfig                          | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/default-configs/devices/ppc-softmmu.mak b/default-configs/devices/ppc-softmmu.mak
index c2d41198cde..5a7f99d1e45 100644
--- a/default-configs/devices/ppc-softmmu.mak
+++ b/default-configs/devices/ppc-softmmu.mak
@@ -1,7 +1,6 @@
 # Default configuration for ppc-softmmu
 
 # For embedded PPCs:
-CONFIG_DS1338=y
 CONFIG_E500=y
 CONFIG_PPC405=y
 CONFIG_PPC440=y
diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index 66e0b15d9ef..2e4c56eb770 100644
--- a/hw/ppc/Kconfig
+++ b/hw/ppc/Kconfig
@@ -128,6 +128,7 @@ config E500
     select SERIAL
     select MPC_I2C
     select FDT_PPC
+    select DS1338
 
 config VIRTEX
     bool
-- 
2.26.3


