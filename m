Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6FD66474D
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 18:21:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFHje-0003qd-K2; Tue, 10 Jan 2023 11:44:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFHjb-0003qJ-FP
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:44:23 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFHja-000670-0r
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:44:23 -0500
Received: by mail-wr1-x435.google.com with SMTP id d17so12433562wrs.2
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 08:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RJ8wFlbkCuBgTPhkpS02wBqGPirVNf3PYtskAr/LCCE=;
 b=mRg3DM3pKklnsH/FYEFsfhVVICQlHUW70TjETQcvRMf14l/KNMtX+nvCCf8J7eVgyq
 hxDRPbdw587WEfdC5vU7DgooInRUJqkQNgJKCswMo6AFclMrjuTzCE9AnnFoTvyQsyxn
 RXSLszesIfnWOVSmXXu+qSARorP8wOcYs84JrrTmtvTGQonQgnXkKOoLPhRKpjpy2cSY
 sqhs3VWtPV9VNTlF63bapAv/ilt3KxELMgEJz1rWAvcPshNn91vJV5W0BkH/BWQO7OsL
 LKPAqSdMSz6IH6tjz45ioRRPWe0YfI0qiCqFNavBPxe+ZYCM62CKWhrPfcuZb7gjipYU
 DmcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RJ8wFlbkCuBgTPhkpS02wBqGPirVNf3PYtskAr/LCCE=;
 b=b9660JBO/RBy8APwnP5330XswhjtTY9nV+ixofs4fxUz5vfazJe9YANeEfbbDq7zv/
 eIYl+qlg80k3UvgYvqX/mKv8AtzIRh5M2sdVAUHTuSZjckoyJdFhS3RETgSDwZx25NEQ
 pJQTZf/uStOH4jo6FhwANoPdf8u3O8LMSRkFoe5jvBQbRedQBdxdS2k4+JuZZ247VRDc
 03DHUN9+KMWhL/5saKLTgAocEfg79GIhfkyhDTs8ntgh/3TDfAG0hXpgKok/anAhdwYz
 VvoSWgW9OWbwiNZHcBJI3xKJqOSXX5TG48TTf/BN5dpFOE1EqVP1FIx2LigHUJYrcrn2
 3r5A==
X-Gm-Message-State: AFqh2krRB3UaXYFS6QiIwvbs5+p27Yf+b3w/KWCUx0AOoOUapBoITDMv
 1XAA63lFKgYl/K1jALL5KMMeE8Uuh3rgmgWp
X-Google-Smtp-Source: AMrXdXsGhVoyxyt0kHlysxuBEsNqCPC8+G7cvksF6WPcgMowSJCh3kzFKBqfAf9irt5iIn1sDNPS7Q==
X-Received: by 2002:a5d:4b45:0:b0:2bb:ebc4:2f5c with SMTP id
 w5-20020a5d4b45000000b002bbebc42f5cmr6001855wrs.43.1673369061208; 
 Tue, 10 Jan 2023 08:44:21 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 e10-20020adfe38a000000b002bc7fcf08ddsm4280686wrm.103.2023.01.10.08.44.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Jan 2023 08:44:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Antonio Caggiano <antonio.caggiano@collabora.com>,
 Rob Herring <robh@kernel.org>, Antony Pavlov <antonynpavlov@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Beniamino Galvani <b.galvani@gmail.com>
Subject: [PATCH 02/18] hw/arm/boot: Include missing 'exec/cpu-all.h' header
Date: Tue, 10 Jan 2023 17:43:50 +0100
Message-Id: <20230110164406.94366-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110164406.94366-1-philmd@linaro.org>
References: <20230110164406.94366-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

default_reset_secondary() uses address_space_stl_notdirty(),
itself declared in "exec/cpu-all.h". Include this header in
order to avoid when refactoring headers:

  ../hw/arm/boot.c:281:5: error: implicit declaration of function 'address_space_stl_notdirty' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
    address_space_stl_notdirty(as, info->smp_bootreg_addr,
    ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/boot.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 3d7d11f782..f5bfb922b1 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -25,6 +25,7 @@
 #include "qemu/config-file.h"
 #include "qemu/option.h"
 #include "qemu/units.h"
+#include "exec/cpu-all.h"
 
 /* Kernel boot protocol is specified in the kernel docs
  * Documentation/arm/Booting and Documentation/arm64/booting.txt
-- 
2.38.1


