Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A360D64F3D2
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 23:15:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6Iq9-0008JX-VF; Fri, 16 Dec 2022 17:06:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Iq0-0008GP-Vf
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 17:05:53 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Ipy-0005fm-J9
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 17:05:52 -0500
Received: by mail-ej1-x634.google.com with SMTP id ud5so9299788ejc.4
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 14:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ubeWMUt19KgbmFwzvU0tT5JUAbGa8affkQwKmoJlyrU=;
 b=JV4Rwk7bz+jAETSgYcE+C5FYSNuTXPnkF2zsiVw+nzz1VshU2dhmJaQAUchUEl67oK
 tsoVrrsy1vlUQ7ffYvni6h6C28rzTLMThEC+4jXk2ymVAkRye/dZ/VCfIuoPjCFCqHaw
 V1AT8z6nfrApeYvGLskUfkL4ob27bHeOYOp0qgOND+ZO6Z5NeVDtWqIOinn3u9UVuDOK
 pywSgwm58MrBgcDT2oZm7Nme8kyMHdXpiNKCVWhcDmtTbMqq6+dgW7WmK08hcv3rlj0Z
 R4Rw2IErUMhKFPHDHJShE19KGfxXDayTVrsCEVPBitplpTtIpPpRINgwbn79uaIh500G
 UG5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ubeWMUt19KgbmFwzvU0tT5JUAbGa8affkQwKmoJlyrU=;
 b=hfi4Bgk2koZWxNysVNxHOgMy8pO5heDskrFWRTI1fYJqdTV1awleQpihXIhsRiIged
 iYOZ9qGxbAmBsCPAXgHnnXahWGE0jYwGzaZ0pFulW42+QlMmizWZioqRirEeYeAgKFjH
 mR8JtMmZmw+sgcAdu1fWy0qErsigIKtOUcija4wIn//68/S66j7smnw5BbLh4UIR81JY
 kqSM6X8DBvArKWFvVxz2gIuCEXeBrzdfoMEJKyqyZzDb9PisnINZxWaA3C0aKAr0BfFB
 8m263A0uAU50gkP66bDPSKt22g13S49EeP3cfTi6ciPDMY8PoL9fIhokqWVGTXqJn2vs
 xeAw==
X-Gm-Message-State: ANoB5pl9Ts7VaJncdvRFzsrz0erIijrq5/GCrTenVQUosWFl8aJqd/07
 5u4dP+U0OrHk4VosIqHO1eqKU6G3pLf/TJWhack=
X-Google-Smtp-Source: AA0mqf6M0eNy4EF5s2top9Bf+a/8UJa86gqSoidvScNb5B5QpX/PCUi2pGdCpbO1sDNXkEtc4eF4Xg==
X-Received: by 2002:a17:906:ecb7:b0:7c1:f6c:dd4e with SMTP id
 qh23-20020a170906ecb700b007c10f6cdd4emr32553198ejb.40.1671228349037; 
 Fri, 16 Dec 2022 14:05:49 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 cn12-20020a0564020cac00b00461aca1c7b6sm1338542edb.6.2022.12.16.14.05.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Dec 2022 14:05:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Song Gao <gaosong@loongson.cn>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Taylor Simpson <tsimpson@quicinc.com>, Greg Kurz <groug@kaod.org>,
 qemu-riscv@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 01/10] target/hppa/helper: Include missing "cpu.h" header
Date: Fri, 16 Dec 2022 23:05:30 +0100
Message-Id: <20221216220539.7065-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221216220539.7065-1-philmd@linaro.org>
References: <20221216220539.7065-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x634.google.com
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

'dh_ctype_tr' is defined as 'target_ureg', itself declared in "cpu.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/hppa/helper.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/hppa/helper.h b/target/hppa/helper.h
index c7e35ce8c7..621bc9738e 100644
--- a/target/hppa/helper.h
+++ b/target/hppa/helper.h
@@ -1,3 +1,5 @@
+#include "cpu.h"
+
 #if TARGET_REGISTER_BITS == 64
 # define dh_alias_tr     i64
 # define dh_typecode_tr  dh_typecode_i64
-- 
2.38.1


