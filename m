Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BDE619CDC
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 17:17:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqzMk-0008RR-2F; Fri, 04 Nov 2022 12:16:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oqzLy-0006Vm-GU
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 12:15:40 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oqzLm-0000gI-V6
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 12:15:34 -0400
Received: by mail-wr1-x42c.google.com with SMTP id j15so7750443wrq.3
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 09:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9hcZsgv1OlTjH0ZCrKa3WYUQGgMlxaCEIip18pDUCr0=;
 b=R9RDXtUd06YgEqBkF/nNO7fxZpIVnqqIZy+UyZdasTIVIV7kRkIThe6I8Aj1w9D3G0
 Kmg6rqTsoUWaTLa1fzx4piUWN0Ox0B6Ro9tgoaXYvWsgevKm9irU4S1YpCtU6BXayN7c
 WhuwkRLMHccY0avGu9tRAgU5TGWMnm+JZ4EvM+seAuoISvL4c81wwB252V9IDrba+B0m
 Or5Oh4hSiIAMQj3Ttt8+8bBWc+0WvnsUn/4VkiUiqMSoFSRmioGZa936bz+ULFkJKTJn
 Y1yefPRVATjRIAoWPOJl28M7RIfIvloy+oPxHIo0CQyBX5VqCKxumWkBajhVBV27yybH
 i+Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9hcZsgv1OlTjH0ZCrKa3WYUQGgMlxaCEIip18pDUCr0=;
 b=W2j95AYtjQ1W5QzJ+LuPPiIzXeyQSClErlwDhv+pdYEUmqleSadGYpQmeqOKFcXt5h
 RyFzvsCoWqacxTRSp3gq+XTyTQrvtWiLENZjOMfc7qWgEQUmiuz/WLztmdQ/LggsN70O
 fgEwvwYT2haddT3prZv8EpM1jaO03Y7+N4weTv+Z3HnOHGE5oODTvej3tYkHwjpcxaJi
 zvV3H0o0IQn6/3GVWZWgoH1LzhyBczp9h57NYg/Nc7yapCrOC8yAaKpiQnGNzr95kTGK
 wADq0QzIo6KM6dhbDwGUudJqMUAA9IlNHelobjoLYwDQSR8BzmcZYMHzsPn0GXVdwf/T
 8ghQ==
X-Gm-Message-State: ANoB5pklSQn5KlmKs/oUbcJKuiJGaso+fDTpp+RYI5o+lMqQtZkeWVeP
 lyghaadXWnbGfobnfK56GrXkwcqN5+y6GQ==
X-Google-Smtp-Source: AA0mqf4bOBgGDfzS6FSiepFaJumWDUAislSdOnqdMRQESQml4FflPwkegR9xmHykdFOvGYavZJNaNg==
X-Received: by 2002:a05:6000:1544:b0:23b:b7e4:b89f with SMTP id
 4-20020a056000154400b0023bb7e4b89fmr1521168wry.163.1667578520320; 
 Fri, 04 Nov 2022 09:15:20 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ay5-20020a5d6f05000000b0022e57e66824sm4649645wrb.99.2022.11.04.09.15.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 09:15:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH for-8.0 3/9] hw/audio/intel-hda: Drop unnecessary prototype
Date: Fri,  4 Nov 2022 16:15:07 +0000
Message-Id: <20221104161513.2455862-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104161513.2455862-1-peter.maydell@linaro.org>
References: <20221104161513.2455862-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The only use of intel_hda_reset() is after its definition, so we
don't need to separately declare its prototype at the top of the
file; drop the unnecessary line.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/audio/intel-hda.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
index 38cfa20262e..b9ed231fe84 100644
--- a/hw/audio/intel-hda.c
+++ b/hw/audio/intel-hda.c
@@ -220,8 +220,6 @@ struct IntelHDAReg {
     void       (*rhandler)(IntelHDAState *d, const IntelHDAReg *reg);
 };
 
-static void intel_hda_reset(DeviceState *dev);
-
 /* --------------------------------------------------------------------- */
 
 static hwaddr intel_hda_addr(uint32_t lbase, uint32_t ubase)
-- 
2.25.1


