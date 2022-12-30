Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 741F06597C3
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 12:36:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBDgF-0006oF-7M; Fri, 30 Dec 2022 06:36:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBDgD-0006mX-PH
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 06:36:05 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBDgB-0003wq-Bw
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 06:36:05 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 m26-20020a05600c3b1a00b003d9811fcaafso8483969wms.5
 for <qemu-devel@nongnu.org>; Fri, 30 Dec 2022 03:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3bccAPU5/myOuHMuyAoVz6uc/DAhbE8HLrAA8sKeF+E=;
 b=WYROTInB6jOcIpu8X0uTQZZh4POFcA+YoD4qP2gMn4UJJwJcXRKGVJIXFry6LtnZ0L
 FKrGvKg0lAQGAsG5H6SpBn7SfAu1lsYOVB++MwNzTb4szqJ7IaDJucfEJguP0y1li6of
 1bEI0YATmQMYCdDHX7HJCxb82tY+TVTPNFSLjOGfHak9f9hKILarmrPHzCcDkUKeQVgD
 6mK0qkh39cGmmwxYePN7HxamQFwR5sRPOciYPz49nDijjSlqSMJ95WeU7eB9UdH7cSyu
 CUQTLxZKHDUnam7YBULwAXBiC7Z8UlR5slxmQuvLJ7tolAEpncfTJzqKnzFmTirD2Til
 TXSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3bccAPU5/myOuHMuyAoVz6uc/DAhbE8HLrAA8sKeF+E=;
 b=w/pLu76v8/XKzxqfoTYYr6Uxp/etmiN8sIfz2F/HDmeaTIAKJm/KRvkkzYSQIjVnDk
 veQ8ftMxZ0+ARve5Yrak9Sm0NzHOX4scTThSu+gBmPMub1az6CWAhN5QHc55lvXu2/or
 r/cyFZt+OqQui8m+Lh+dyfvmqROBQ+m6UciXFCFe9LrFeQhR+pmEkATYj666pz88RjQ5
 AkNmkZe/YL7SXaIZMG7YNC+FR63fV1znZnr73m9qGQWUdKCsGAp38NS/f3nuEadYTSUP
 sR5yIPmzK/p72A+LTpnlknIWIPiBZUCGJkxDHMwwrlp+5QVKucUwHduTYd2cfKuw5Oje
 liQg==
X-Gm-Message-State: AFqh2krnMvF+gOKss41f/VosQ1cbaBheo249M+v5IpA3A8rgBw+GUhfw
 7xyF4uDA/mNB1rE+S5L4i51NRDhv62Gg5006
X-Google-Smtp-Source: AMrXdXv1AJDEAt2eUojYM7xrmzoUiIdZPoiC5kOLzk9GOmfRDVEGOP28w/CF1IrVMd7cicw0MGNTUg==
X-Received: by 2002:a05:600c:510b:b0:3d2:392e:905f with SMTP id
 o11-20020a05600c510b00b003d2392e905fmr22768876wms.24.1672400161853; 
 Fri, 30 Dec 2022 03:36:01 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 r17-20020a05600c425100b003cffd3c3d6csm26414700wmm.12.2022.12.30.03.36.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 30 Dec 2022 03:36:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Troy Lee <troy_lee@aspeedtech.com>,
 Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 Peter Delevoryas <peter@pjd.dev>, Steven Lee <steven_lee@aspeedtech.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Peter Delevoryas <pdel@fb.com>,
 Peter Delevoryas <pdel@meta.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>
Subject: [PATCH v2 10/11] hw/arm/aspeed_ast10x0: Add TODO comment to use
 Cortex-M4F
Date: Fri, 30 Dec 2022 12:35:03 +0100
Message-Id: <20221230113504.37032-11-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221230113504.37032-1-philmd@linaro.org>
References: <20221230113504.37032-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

This SoC uses a Cortex-M4F. QEMU only implements a M4,
which is good enough. Add a TODO note in case the M4F
is added.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Delevoryas <peter@pjd.dev>
---
 hw/arm/aspeed_ast10x0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index 7a7443a95b..a3bcbef24a 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -421,7 +421,7 @@ static void aspeed_soc_ast1030_class_init(ObjectClass *klass, void *data)
     dc->realize = aspeed_soc_ast1030_realize;
 
     sc->name = "ast1030-a1";
-    sc->cpu_type = ARM_CPU_TYPE_NAME("cortex-m4");
+    sc->cpu_type = ARM_CPU_TYPE_NAME("cortex-m4"); /* TODO cortex-m4f */
     sc->silicon_rev = AST1030_A1_SILICON_REV;
     sc->sram_size = 768 * KiB;
     sc->secsram_size = 9 * KiB;
-- 
2.38.1


