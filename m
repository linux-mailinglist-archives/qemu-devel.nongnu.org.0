Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 779B463D746
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 14:54:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0NWr-0004lb-Dc; Wed, 30 Nov 2022 08:53:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0NWo-0004kE-FO
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 08:53:34 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0NWl-0003ds-ED
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 08:53:34 -0500
Received: by mail-wr1-x434.google.com with SMTP id bs21so27190808wrb.4
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 05:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YrUtSE5dC3cHHgtF+qcazL1snDSkIkTilGiwDbpeyUM=;
 b=koOOJDDMECgcrMAPmzHZIaijEQdWdIeOTLqT72Py4/cOtWC15p+rlT1Cgg3HKQkjjO
 df2fjAxX8dnZz9dawtVKcUF2egCK5kII2DuagEnUTM6RkNm+7m/YPfyGXwi4+clCXlgG
 thveWqsBo67yRIXoP9QzZpKKpc80e2FnBAgAik7ea8IlrGbP70BaBrKvyjRxo6HL86sf
 WMJzIwljNDkg0f2rJzIi/u+0akPc5b+5BgirpEDn8KAIrI7iS/yapFm2YiBqahzWCSrn
 JdhZl05guzqyXV1Juh9mGqUstD7GDPW+aui753UunNDLlellj7ULPSosxDBwn0u+QHJj
 aYQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YrUtSE5dC3cHHgtF+qcazL1snDSkIkTilGiwDbpeyUM=;
 b=rSrPRbbOaZDU9B6xbtXymfAAxvl31QcnVssvq9Ue0lwlREgGfmxEIGokZEZgq+niFn
 M1h59taw4K6DOcAJfrDxAnp/Mg6UsVdWu/flJ885y/SWPg6+7d+JjJ1TSBRTBW6qFJoZ
 CGJRy3497OURz8puY0it0/L83tq3g6ErG+aN2RHPDohyq1UmUnbWKk3mz7X09llHb3tE
 eiXbR3DJDP8O2rTkIVDD+R2V92e7SBCpAt1bNW8vC0O8E04wahmzXkVFBo9YjX61OW4E
 QuFjlbU1pQe7d/L8qnFVsag2Jzbw5FORRUbk8MU7qq478M40nuhc8OcUUi6GqCBJddxR
 LMbA==
X-Gm-Message-State: ANoB5pmjl1Hv6GNroE51ZmkXJj28U9yun2enEhTUq392CUpXvs43YNuj
 Rmd6zRzxfKPBvSfjetHbOw8bMqXgfbVQ81/a
X-Google-Smtp-Source: AA0mqf5kTcCLFRdhP0AjndYfXwh+XflYoGNOxHOOYbbEbarmrG9Z4AzD8FjbZIrxzUrB3htP3u2WoA==
X-Received: by 2002:a05:6000:10c6:b0:242:2368:dd00 with SMTP id
 b6-20020a05600010c600b002422368dd00mr4584392wrx.88.1669816389417; 
 Wed, 30 Nov 2022 05:53:09 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 j8-20020adfff88000000b0023677fd2657sm1666959wrr.52.2022.11.30.05.53.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 30 Nov 2022 05:53:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH-for-8.0 5/5] cpu: Remove unused includes
Date: Wed, 30 Nov 2022 14:52:41 +0100
Message-Id: <20221130135241.85060-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221130135241.85060-1-philmd@linaro.org>
References: <20221130135241.85060-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 cpu.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/cpu.c b/cpu.c
index d6936a536b..d512b24c0a 100644
--- a/cpu.c
+++ b/cpu.c
@@ -31,10 +31,7 @@
 #endif
 #include "sysemu/tcg.h"
 #include "sysemu/kvm.h"
-#include "exec/cpu-common.h"
-#include "exec/exec-all.h"
 #include "exec/translate-all.h"
-#include "hw/core/accel-cpu.h"
 #include "trace/trace-root.h"
 #include "qemu/accel.h"
 
-- 
2.38.1


