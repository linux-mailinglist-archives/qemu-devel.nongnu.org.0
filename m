Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D31A37FBE0
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 18:57:28 +0200 (CEST)
Received: from localhost ([::1]:55194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhEeN-0003Rc-7T
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 12:57:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhEN8-0002Ts-L0
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:39:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhEMy-0000s5-P1
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:39:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620923967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y/ktmwgutY2Wn0xDD9O8rw5tOPYKtHCv9CNEw553h8k=;
 b=Qicf9NnolEU7QtOssgKbSh9CF/B+1G7nLi7yZ2BHLzYTsmK4yIVp7079mN660bEQTe/1M9
 SnHwvjFd4IefVh0QA00pb+HbmyB8JpJ1HjE+iZeLci3iVTTzJsqpFpOjzJCTYQKJy9MxPm
 xs6YxwGpVk3vuUI37tBLJZx7qBNqCTE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-3MelRioxMmq66hd4LF9i9g-1; Thu, 13 May 2021 12:39:25 -0400
X-MC-Unique: 3MelRioxMmq66hd4LF9i9g-1
Received: by mail-ed1-f70.google.com with SMTP id
 x3-20020a50ba830000b029038caed0dd2eso3817453ede.7
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 09:39:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y/ktmwgutY2Wn0xDD9O8rw5tOPYKtHCv9CNEw553h8k=;
 b=tOyjNtd4BUwPP/2qk8cSyLsicqiXEwO9OWnjGNpYCxAFLNTp++4oHFTZAmrh0L4zjE
 2UKRvwWhUo0Khsndm5TL/ZX7h70oTihMjFGI9skgA3gh/oIqwQCbJySeP3uXxhL8fC6L
 kajRrKfpWYq4Op6O1IJ0hI84gUPyKGRpUv2J/WjXkd2+W4ZGw5RC6/ZZoTebbRlaLT7O
 qY6pqajQd4eaXE/6h5BssArW7+QkBRvU6L+eWdvWTIicDJifeuU8h7FByE/wJeFa07d0
 wZAIpFP+u1n0bYD4LweENnJdCXwEKLTQbO1ceA1yA/+H8vAudkVtEqRnqzQuG5U8TvtZ
 0s6g==
X-Gm-Message-State: AOAM5333zcGCpfJ3pXx4k0VUQQkO2OT4gejn+TPiUmG8yXcJ3DQ4cdZ8
 kK06EAYwmGqOQHV6Rikqdy/nU5IBGbbqE43jZk3ncgABDOZ3VX+x72xcaSDYwwRmLbcgeS7HUp/
 7R/mu3M7jQPGvesSecK1WqKtMornnIr79DtrD6/cC+JxfeKlbnGqZnnxAHfgLhxDB
X-Received: by 2002:aa7:c150:: with SMTP id r16mr50496724edp.82.1620923964326; 
 Thu, 13 May 2021 09:39:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2oIMAwKi64pSyQ+/EOA7l5jS4AZ6eeIr0+GVabPzXT3cRYsU1kb1XZCruo5g3CWbSvuKTcQ==
X-Received: by 2002:aa7:c150:: with SMTP id r16mr50496711edp.82.1620923964198; 
 Thu, 13 May 2021 09:39:24 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id x13sm1511947ejs.93.2021.05.13.09.39.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 09:39:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/10] hw/arm/Kconfig: Add missing SDHCI symbol to FSL_IMX25
Date: Thu, 13 May 2021 18:38:53 +0200
Message-Id: <20210513163858.3928976-6-philmd@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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
 Guenter Roeck <linux@roeck-us.net>, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit bfae1772c43 ("hw/arm/fsl-imx25: Wire up eSDHC controllers")
added a dependency on the TYPE_IMX_USDHC model, but forgot to add
the Kconfig selector. Fix that to solve when built stand-alone:

  $ qemu-system-arm -M imx25-pdk
  qemu-system-arm: missing object type 'imx-usdhc'
  Aborted (core dumped)

Fixes: bfae1772c43 ("hw/arm/fsl-imx25: Wire up eSDHC controllers")
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Cc: Guenter Roeck <linux@roeck-us.net>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 5827c092b28..6bb34926bb5 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -386,6 +386,7 @@ config FSL_IMX25
     select IMX_FEC
     select IMX_I2C
     select WDT_IMX2
+    select SDHCI
 
 config FSL_IMX31
     bool
-- 
2.26.3


