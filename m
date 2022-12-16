Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 592DD64F3F5
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 23:18:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6IgK-0003ih-Oq; Fri, 16 Dec 2022 16:55:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Ig3-0003gH-UC
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:55:37 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Ifz-00039Y-Fi
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:55:34 -0500
Received: by mail-ej1-x62e.google.com with SMTP id t17so9288939eju.1
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 13:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xssmHoWXJ6SK5gCkViO69Q35oM9uqfLm45e7wmSAEiQ=;
 b=OpENGvV9zNK1kW2Y7ktPT/UEMrwhPfBX9OCoT6BvQzow6Z8RdawcCPkv1jvvW5UZNN
 BkJLBj2jT5SzemHxcvMn5J0HBpDDJw/3EstPP2YSFB65vnD729EA3ms0Ldpw13TdUYSq
 ApjgAWsRedsCev6ZI3O3XLVMI029rL/+Sn3bY83RmMuBsNMCkT0xTE8tAVBSwR6dbjd0
 H+8RBAE1UCkHKwZGjrlsH1rgpGDJIpwefc/J+tYBcuHKjOgTFE+MO+69ye9fcnaTsQH7
 DJsocgUOkRXsyoILarEzNMbhawurjJ9oJZOiv3jTOU/igoYaYIYIWwj5kTMMXS1kMDM5
 D5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xssmHoWXJ6SK5gCkViO69Q35oM9uqfLm45e7wmSAEiQ=;
 b=7l495X915wTICDjR1W/TFUpQi8bF+1ZaXeF1yTn2Ff0S8pcoqi90qx4s7rnuiqVRK6
 /pK8NX3XeaSfNgg/bBSVQKoc85ez1L7MoK2BTwnPMw+6Ac7DxRkOhBeDzcLYfsHdxQb4
 QPdZR9xyrvoGCcYd3p++zqPCQX67sSWhtHoGEmgBfQZsE9hSxlerCuMmSCBZfS7VS1yN
 TrSiQJzGuUWW5vSI4OErA0Azo15w0ISz/xncwqDQvJBiRqgmwJ+UcYgzHVwF8V7aZ5W2
 iBkIFOsqc9u1/BYAa/p8IOBST+eVo/DDVwB07/KQV7MD/ZW9X25mqOxmfnvqraO+/UDG
 Yp9Q==
X-Gm-Message-State: ANoB5pkMas0HkCgcgyTP/KmuopldZ12zN0ssw8EYi4G5MeZUG9DAnEHc
 dc5nPy4Xh4Z2/lQ/0qAa+sQeBDriB1SMbkTiUeY=
X-Google-Smtp-Source: AA0mqf6xT41BcyZh02Z2thOeHZOU9KTDZSfsSUSOjRb6fHLKc0deeuEgfS6otC9br60FYAiYkf59nQ==
X-Received: by 2002:a17:906:4c4b:b0:7c1:1ada:5e1e with SMTP id
 d11-20020a1709064c4b00b007c11ada5e1emr28189213ejw.26.1671227729771; 
 Fri, 16 Dec 2022 13:55:29 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 r20-20020a1709064d1400b007c0cd272a06sm1276141eju.225.2022.12.16.13.55.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Dec 2022 13:55:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Marek Vasut <marex@denx.de>,
 Bin Meng <bin.meng@windriver.com>, Eduardo Habkost <eduardo@habkost.net>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 qemu-riscv@nongnu.org, kvm@vger.kernel.org,
 Stafford Horne <shorne@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Chris Wulff <crwulff@gmail.com>
Subject: [PATCH v3 1/5] dump: Include missing "cpu.h" header for
 tswap32/tswap64() declarations
Date: Fri, 16 Dec 2022 22:55:15 +0100
Message-Id: <20221216215519.5522-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221216215519.5522-1-philmd@linaro.org>
References: <20221216215519.5522-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62e.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 dump/dump.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/dump/dump.c b/dump/dump.c
index 279b07f09b..c62dc94213 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -29,6 +29,7 @@
 #include "qemu/main-loop.h"
 #include "hw/misc/vmcoreinfo.h"
 #include "migration/blocker.h"
+#include "cpu.h"
 
 #ifdef TARGET_X86_64
 #include "win_dump.h"
-- 
2.38.1


