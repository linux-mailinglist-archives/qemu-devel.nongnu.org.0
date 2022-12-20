Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F49652343
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 15:58:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7e2v-0006hb-GK; Tue, 20 Dec 2022 09:56:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7e2t-0006gI-Ux
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:56:43 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7e2r-0004ie-Ve
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:56:43 -0500
Received: by mail-wr1-x42d.google.com with SMTP id bx10so12037428wrb.0
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 06:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+t/6/U4dDtWFou9lNwrmgxL5oJxAfHUoXJOlrPFl4Zg=;
 b=nwDkckVmD/YA+j56y9O39Fz2zj1rWbTrGEBLH1RkjSbaQpjmGdQ+A2wKaOTyzhVnPK
 pYhA1Me7ltB797WF4FGEXvYxTVrtRywUXkvUfsULBqncuzVrh0sAovaz2YIctjvgDlWU
 lFohIeEaTqXOrtQ8xMGgjiAm8jLJsLPmOEU/n/vicVuMboHdqX9z7SwPL+DnyFKZoq7W
 z7+oxG92lXyemCLp85AX1n2T8kVd5N/1ys54JLUVobhOuqoRC1vsSMoMa6o5F/MHhLmo
 JmwTHExg550b90Nu/X9UfT8Mx1vnvAmQCFs80A3tqyU2d/29oG3PJzqNm7MOWGahDshB
 g8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+t/6/U4dDtWFou9lNwrmgxL5oJxAfHUoXJOlrPFl4Zg=;
 b=gF13gOU7NaNhC/5O938hqR0izIaUX3ah9QV60HgTraNWMVdPwhrLdkS8wkX9iF7EUz
 aL68uXVvvpAF59mRYnNVFaPIY/hqeJ5d+kBWhDLrth3ABt5dL4uH9oxXmy0vMIkFB5G5
 E39qv7s3IX01TPWAaw4GQUFhlFONjnQSAgSnq5ROma9jjreuMKkTSfbGMHwuo80xX3xX
 kJxcMb8WHW/MFFJPb/fez15b25if264BN2hjiUmGj1EwqbJ5sk5Y9BruxFabBBVKjOdZ
 a+JqRcCx3K9GQdgC4ADzcjjFTNFYovEHtpAYm/BfdTeHqJQjGWbFs/38MuxubjOj5QIy
 xW0w==
X-Gm-Message-State: ANoB5pmcKyY/olE5NEgyJnb4T0VrpwNm/0IZsAy3oDqlpaaa6XGK5c2X
 gSUh1VNIQ4LO6rb6Jv3yWkGjr7M1MAArWGVR7zk=
X-Google-Smtp-Source: AA0mqf4KNnke/QaREkpgK6qsBmv2C0m3twDdqpVhav3t5IilQzZOqMmYeoEt1wSFNwmRzpyPJOSpbw==
X-Received: by 2002:a05:6000:795:b0:242:7676:689d with SMTP id
 bu21-20020a056000079500b002427676689dmr26472968wrb.19.1671548200362; 
 Tue, 20 Dec 2022 06:56:40 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 b4-20020a5d4d84000000b002423a5d7cb1sm12795546wru.113.2022.12.20.06.56.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Dec 2022 06:56:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-s390x@nongnu.org,
 Song Gao <gaosong@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/5] target/i386: Restrict sysemu/reset.h to system emulation
Date: Tue, 20 Dec 2022 15:56:22 +0100
Message-Id: <20221220145625.26392-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220145625.26392-1-philmd@linaro.org>
References: <20221220145625.26392-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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

In user emulation, threads -- implemented as CPU -- are
created/destroyed, but never reset. There is no point in
allowing the user emulation access the sysemu/reset API.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 435980dd3a..91961359c7 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -24,7 +24,6 @@
 #include "qemu/hw-version.h"
 #include "cpu.h"
 #include "tcg/helper-tcg.h"
-#include "sysemu/reset.h"
 #include "sysemu/hvf.h"
 #include "kvm/kvm_i386.h"
 #include "sev.h"
@@ -37,6 +36,7 @@
 #ifndef CONFIG_USER_ONLY
 #include "qapi/qapi-commands-machine-target.h"
 #include "exec/address-spaces.h"
+#include "sysemu/reset.h"
 #include "hw/boards.h"
 #include "hw/i386/sgx-epc.h"
 #endif
-- 
2.38.1


