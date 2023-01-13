Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 310ED6699F9
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 15:21:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKnJ-0001VX-8z; Fri, 13 Jan 2023 09:12:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKml-00012h-7V
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:11:59 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmh-0003pM-96
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:11:58 -0500
Received: by mail-wm1-x336.google.com with SMTP id q8so3554826wmo.5
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 06:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=K7L7nETsVwMFzyPJrLglCmIuDx0/wFyIH1/RuTBWzQ8=;
 b=YLnMVNnjVbSfN+4jlohZ8w9KWK/7rmMGKW/GHBcv2yIrJ2WdQokLH7ptDhsSBPkzDJ
 dBqCzLwqyfVLLLx2Ncy0V289/fUQn7OlCJFiZ7LZkVRBxm9TB16kaVSLCU7W+OExh4KO
 qHYNs3a5qv1B+ytNf8BsWYr1wDFjM8DlKYXN7SAZ88mMOtaI/0jGXPAVCPd/oDKkVPcg
 Qw2pNub+pY5rXLOmVYMHzMuXojd1pPVFF6minEKPyldsswX/bZWZ6Xx1ikiNdNap3vDF
 5oOGwsaJGFFE6RHPTUS2j1ccaeiIiUEQQDgw+tELh+kdPbDCFoyBlFZTRKfrlHEy4Mu0
 MLcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K7L7nETsVwMFzyPJrLglCmIuDx0/wFyIH1/RuTBWzQ8=;
 b=wdmgSWasNxfk1ljHXhdzogm7PIjTBVvy8rcN11qsMFNPbDpj8bh0JEwf0XP6Y0peaM
 fqblHC8kBtxbhL8T7wmhuPftRPbcjixpPG+B22x+FVBUJedxGwIExaOJV03O5pIusrlF
 2vvUavvb0KFaEbYBCJbcc1M8LKo5Bhe1Ja6I+FCrKkiMx1sR09onO4nMN2BIN44XEBlO
 YDTrr3PNBqj6IflG4jdr45PpK6Z3cLmm1Fu0gEV4wMYqyhRLs6YhiAn/iAoYJDWt0oUO
 soKxIkn3eqn7tzcX4KA55zis/kbBeR7tH8LeSvxcMiFqYO0X2FPsQpqPWulsXDpd3g5M
 Vjeg==
X-Gm-Message-State: AFqh2kqZnbQmf289vdS9lDthoMR1q/9VzhjL5CiPSIdphm42gFaZCLRF
 DNGZSbgMeYuPlqTe9krCl20+Ulvkbwf1+zju
X-Google-Smtp-Source: AMrXdXsrpEuBQANpqzentmhW7qsxAYUC3ANlkCi/vEzWe5XEP34o2TM+F0/8SUhPbbDKMDpAVEK78Q==
X-Received: by 2002:a05:600c:358f:b0:3d1:cdf7:debf with SMTP id
 p15-20020a05600c358f00b003d1cdf7debfmr60018610wmq.26.1673619113662; 
 Fri, 13 Jan 2023 06:11:53 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n36-20020a05600c502400b003da0b75de94sm5334464wmr.8.2023.01.13.06.11.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 06:11:53 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 30/38] hw/arm/stellaris: Drop useless casts from void * to
 pointer
Date: Fri, 13 Jan 2023 14:11:18 +0000
Message-Id: <20230113141126.535646-31-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230113141126.535646-1-peter.maydell@linaro.org>
References: <20230113141126.535646-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230109140306.23161-8-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/stellaris.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index a9e96c37f89..051c242e9d6 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -749,7 +749,7 @@ static void stellaris_adc_update(stellaris_adc_state *s)
 
 static void stellaris_adc_trigger(void *opaque, int irq, int level)
 {
-    stellaris_adc_state *s = (stellaris_adc_state *)opaque;
+    stellaris_adc_state *s = opaque;
     int n;
 
     for (n = 0; n < 4; n++) {
@@ -785,7 +785,7 @@ static void stellaris_adc_reset(stellaris_adc_state *s)
 static uint64_t stellaris_adc_read(void *opaque, hwaddr offset,
                                    unsigned size)
 {
-    stellaris_adc_state *s = (stellaris_adc_state *)opaque;
+    stellaris_adc_state *s = opaque;
 
     /* TODO: Implement this.  */
     if (offset >= 0x40 && offset < 0xc0) {
@@ -833,7 +833,7 @@ static uint64_t stellaris_adc_read(void *opaque, hwaddr offset,
 static void stellaris_adc_write(void *opaque, hwaddr offset,
                                 uint64_t value, unsigned size)
 {
-    stellaris_adc_state *s = (stellaris_adc_state *)opaque;
+    stellaris_adc_state *s = opaque;
 
     /* TODO: Implement this.  */
     if (offset >= 0x40 && offset < 0xc0) {
-- 
2.34.1


