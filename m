Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B008137FBE2
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 18:58:11 +0200 (CEST)
Received: from localhost ([::1]:57044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhEf4-0004fs-PG
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 12:58:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhEN7-0002T0-WB
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:39:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhEMu-0000qU-1U
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:39:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620923963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6C7WWutrNcOZs1K+Kika/F95HGC7AnV8YKzuCNwKf5Q=;
 b=JJwjmOOtW0cYKp43iLeiMNtMYd5h9tYiSKM2KJIl72MJCwvmgbwU0l9Wa1XsDCWTwEw8C2
 mLBhEAMNaBideGbbW2r3icPFH2/y42lxGULXLCkbxV9BO65bcGEgJk7yYvw/XX8+Q5X3KZ
 lI/7ZkrSJkE6H4SO8ByNyC+YRVQNoiQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-c7EWng4DOmOwnH8n0JMv4w-1; Thu, 13 May 2021 12:39:21 -0400
X-MC-Unique: c7EWng4DOmOwnH8n0JMv4w-1
Received: by mail-ej1-f71.google.com with SMTP id
 x20-20020a1709061354b02903cff4894505so1989410ejb.14
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 09:39:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6C7WWutrNcOZs1K+Kika/F95HGC7AnV8YKzuCNwKf5Q=;
 b=To3I1M99xJI7ypfEZUqoMVYkRwIo27h3IpTaxDHs12L24Wx4CzCfPI9JGGSyozyLZV
 v4g9WMs0agLhji6gpYWyLjq9tzgceo8cSeTSoWbfoPWRZW10x3PMus+JgyYkWZJ4ZDeY
 +0F9+GnAhAAAqp2IFOlda6KbZbzGMUBUdvuIutgS7KUJX9ZBX0336XGnKs9HeIllZ8t8
 HXpHk3cIHbhXFNj9K8/nXlgByUCA/EbD3rRrbzNqynCUSefvn0OcQV8ZSX9RVQewPWJC
 l2tIhbvH7UTYKMANHs8kp3BenBLL9KGQQWR50/DnacrTs+uxyp8Cm7YgPaZMvqLk1GVI
 9v3Q==
X-Gm-Message-State: AOAM533G55GRMtzTjS3XED+TxcbcG4UUMft1Z0L4GLXtK8+ibFXQ4d7y
 EQ531JRobhnuvVpFdVjrj+dcJg7ExXLx99C28qBM9qEen/xJSqf8qxrkdZsw94b/b8dkbjORlX0
 907nBQXIjHMcmYmDWp5AZu8Hi1QtddgCQsyqcNxaB+hfxuMk4K7rspOt21pFqqpPF
X-Received: by 2002:a17:906:c14c:: with SMTP id
 dp12mr44642612ejc.312.1620923959658; 
 Thu, 13 May 2021 09:39:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9XaXQidoNghPAg+0dwQ1tb5c/B6aem8zKmtpGmOCyf9a7Lfrws4EmmpEpaGgvsrxIOpWzsQ==
X-Received: by 2002:a17:906:c14c:: with SMTP id
 dp12mr44642592ejc.312.1620923959396; 
 Thu, 13 May 2021 09:39:19 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id cr21sm2011294ejc.2.2021.05.13.09.39.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 09:39:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/10] hw/arm/Kconfig: Remove unused DS1338 symbol from i.MX25
 PDK Board
Date: Thu, 13 May 2021 18:38:52 +0200
Message-Id: <20210513163858.3928976-5-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210513163858.3928976-1-philmd@redhat.com>
References: <20210513163858.3928976-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In commit c4f00daa5b3 ("imx25-pdk: create ds1338 for qtest inside
the test") we removed the DS1338 device from the i.MX25 machine
but forgot to remove it in the machine Kconfig definitions, do
it now.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/arm/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 85c6a1a088c..5827c092b28 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -386,7 +386,6 @@ config FSL_IMX25
     select IMX_FEC
     select IMX_I2C
     select WDT_IMX2
-    select DS1338
 
 config FSL_IMX31
     bool
-- 
2.26.3


