Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD5966A3D3
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 21:03:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGQFf-0003fG-Dn; Fri, 13 Jan 2023 15:02:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGQFW-0003bs-D8
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 15:02:03 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGQFT-0006nf-Ud
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 15:02:02 -0500
Received: by mail-wr1-x434.google.com with SMTP id t5so17638911wrq.1
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 12:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cfx0zFqCbh87Y8xDP2juuUaDdoqJVp8e6EOhMeHV/Uk=;
 b=yd4VADnGyYvVFjVhslN7ei4pR2/ws5LjuJs2oC+/TPQwbLiF5yqCT2x52JRaKi90YM
 vzWOlm0PglcWAc/1dFqVVsE/tFZXNvTRdIC9VUdoKdGJdVvRF7UPN3BXgTpBcjkQUKYi
 tFSJNfvsCbUXwyCgKriCu4ECgcVSgJjiOB6hGx5VAmp8tQptqZLHzssIXpf3ZyTSmuFA
 uIcPRyUBULU5vZqBRLckMXZ61riXRDVoHC+BBuBGDzSU07w0OXq8ug/Se6CcxNpUn+CD
 pGdnd/uQuvQ78L5358ClrXKo/lq3pyDDrMKZw3cv/pbQ80KkD3iTlHFZ5AF+Tpu+tdtW
 rwvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cfx0zFqCbh87Y8xDP2juuUaDdoqJVp8e6EOhMeHV/Uk=;
 b=XMmJmYNlczSbLfDO0U9EieEY0zFpKWqAhI20yGzIZWwG37C/v+uKuDKgJZemCRMYuz
 X1SFNZaH6ZOH/q/oS1sfl8484kZg1nMg7Umzouv3t7WDPtUsf4grHN9KWnp/69woCV5E
 BRvvmLomHQQNKPJhu7kdSP4DX+/fdWr3aTiKldw4xCkO7pZsHn1l8BqOrez4aV10frWF
 9xd5wnsi92WVKXQlWhLuOtRu57Fg4EjNsOVchZHRWL+1VeG4Dvw+Ee+52yRgh3vFE829
 LrsHyPNY1x6o2nxhgEdXkJ1L0nepjlYNmxcDnNSeoH023kqLUDbqq2diwxRBcbbxqbJE
 +VLw==
X-Gm-Message-State: AFqh2kodxCUmlRymtHM19J6TmSILKQR5i6RQWG1xRm5ZHSligLL7+8/7
 GsdrsO0GpAV7CYeFGRAts/zyGQmganpMHXVr
X-Google-Smtp-Source: AMrXdXuBIERP/Bw1eawhj9893t9imJZXn55wjrjHY+h7hvCDUlfjObxAF4hWxyJduBzxqZuuZ/FoKw==
X-Received: by 2002:a5d:530f:0:b0:2bb:dd87:3485 with SMTP id
 e15-20020a5d530f000000b002bbdd873485mr15258163wrv.30.1673640118403; 
 Fri, 13 Jan 2023 12:01:58 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 d14-20020adffbce000000b002bddd75a83fsm2591341wrs.8.2023.01.13.12.01.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Jan 2023 12:01:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-trivial@nongnu.org,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/4] hw/or-irq: Declare QOM macros using
 OBJECT_DECLARE_SIMPLE_TYPE()
Date: Fri, 13 Jan 2023 21:01:37 +0100
Message-Id: <20230113200138.52869-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113200138.52869-1-philmd@linaro.org>
References: <20230113200138.52869-1-philmd@linaro.org>
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

Missed during automatic conversion from commit 8063396bf3
("Use OBJECT_DECLARE_SIMPLE_TYPE when possible").

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/or-irq.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/hw/or-irq.h b/include/hw/or-irq.h
index f2f0a27381..131abc2e0c 100644
--- a/include/hw/or-irq.h
+++ b/include/hw/or-irq.h
@@ -37,8 +37,7 @@
 
 typedef struct OrIRQState qemu_or_irq;
 
-DECLARE_INSTANCE_CHECKER(qemu_or_irq, OR_IRQ,
-                         TYPE_OR_IRQ)
+OBJECT_DECLARE_SIMPLE_TYPE(OrIRQState, OR_IRQ)
 
 struct OrIRQState {
     DeviceState parent_obj;
-- 
2.38.1


