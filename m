Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0806D7951
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 12:09:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk04m-0000kq-ES; Wed, 05 Apr 2023 06:09:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk04k-0000kR-Ci
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 06:09:10 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk04j-00056d-0U
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 06:09:10 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 i5-20020a05600c354500b003edd24054e0so23378827wmq.4
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 03:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680689347;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hOIUAejMDgPGNri6CTMX+NYmgz2rO96F3gJmXNOLJxs=;
 b=S/sJ8y4f2rUl+i71e+mCuGZuZfY5fREdNc1TFr/aEXiGuikTme64GMgqYOa7eqvixO
 sNf4U91Oj8cWhbCz7saOEF1jx3ZzoabpA11OvpGepX7sFWjMI2K2iaCYA5Fb4cTqW4qv
 HoQvYT2zAkq2AlgE8ycDb+ODBHfZ/BCzFs9ybHjyfKeXsodw2D/l0JLrY1+diUnYMK0E
 tXVNnQT0t9UN3DtYNnVA9xztmGer2h8JkgXwvU5dkPdsfscXL8aUv9mc9gBJdYD4Nbx/
 4iwShUAj28BK3KLQ6kcThPbwc066mniDVXLh3YMBP3tos1Egxks3TfoEQ8SlpiFstZX7
 RYdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680689347;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hOIUAejMDgPGNri6CTMX+NYmgz2rO96F3gJmXNOLJxs=;
 b=N6P13+pifmQvk7q53/5oC0tni/CESLvOnTBWXVar3xJWFT8X1lc5JUVef4Y4SwAAtl
 Nyl4JJ3mbmBI/MfkV5NEvtO62+/LTGNAv7wSK7EVcrtepTRI+0vssaFUcjowRoA5bptv
 ILEGwh+ppF8+Z9Mc3EZ5clzZgF4pG94J/XED/tfmZLGsFuOhKQJ+H5/JpIk2Op4x2qdd
 YQA4NCvwh93ozDVHgGdfMvVvPiK39OEb1IIrp8ZMCANU5yDaJeWsTZkgSd2xHVJ4+cgS
 +XRe2dFW45dL05gtxSJkOOL3g9GUhBPjh6G0xuNv9wnPVO/yo91EFF06NB8IVjbH/4/t
 YE3g==
X-Gm-Message-State: AAQBX9eZTjjiiQG+qBEx2ySph1oy7n3K8DucOGnWOt+jgiiRhRT0xkjw
 S0dVMrY3WJp3vQrcpNIc3RFp/kbCzYgL+PZlqTg=
X-Google-Smtp-Source: AKy350ZwPv7srv1WoSO/MmSOa2UJdjZu3e7HsfWH/ffyjG4++YTRkUBAfgBBRDMhjS3YahEj4GkMfQ==
X-Received: by 2002:a05:600c:25a:b0:3ed:237f:3da with SMTP id
 26-20020a05600c025a00b003ed237f03damr4592489wmj.22.1680689347060; 
 Wed, 05 Apr 2023 03:09:07 -0700 (PDT)
Received: from localhost.localdomain
 (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr. [176.184.52.81])
 by smtp.gmail.com with ESMTPSA id
 m19-20020a7bce13000000b003ee1acdb036sm1700160wmc.17.2023.04.05.03.09.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 05 Apr 2023 03:09:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/2] hw/arm/virt: Restrict Cortex-A7 check to TCG
Date: Wed,  5 Apr 2023 12:08:48 +0200
Message-Id: <20230405100848.76145-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230405100848.76145-1-philmd@linaro.org>
References: <20230405100848.76145-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

The Cortex-A7 core is only available when TCG is enabled (see
commit 80485d88f9 "target/arm: Restrict v7A TCG cpus to TCG accel").

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/virt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ac626b3bef..1fe39c6683 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -204,7 +204,9 @@ static const int a15irqmap[] = {
 };
 
 static const char *valid_cpus[] = {
+#ifdef CONFIG_TCG
     ARM_CPU_TYPE_NAME("cortex-a7"),
+#endif
     ARM_CPU_TYPE_NAME("cortex-a15"),
     ARM_CPU_TYPE_NAME("cortex-a35"),
     ARM_CPU_TYPE_NAME("cortex-a53"),
-- 
2.38.1


