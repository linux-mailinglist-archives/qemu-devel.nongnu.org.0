Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C786F43A7
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 14:21:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptouY-0003lC-GJ; Tue, 02 May 2023 08:15:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptouW-0003kU-Jv
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:12 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptouO-0002zt-7b
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:12 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f315712406so166346145e9.0
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 05:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683029702; x=1685621702;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=TenP9QN04wk7Cs3GRlFWsM87sW34MbN5XiVfw5QurKU=;
 b=yodDQZqO11mBpCsFdbVGaH80QiejTGw434Nwb1IM5KVfiOszb3lJl1+X1y7Z3AeT3a
 00sezK3ee0/ewX9Em9M5Y/jAYmgtVAjftTAbRFRwbFuAlV9Ib1AeRp81PYHJJ4dNIVQw
 hBeop8YY6q2AGTiB1mabtq2oGRt7+ZBvhik3PQaLsTAwX3bOMCqnHWYFMhWlAxMEGiML
 abFIRLPndLh276x0FzSTbmsAlx2VL5KYs46hswXTI9z/xP0UUENZqpto5fmeq39wX8/n
 xZHcxposmoYEDu7qLGZ1BmZ4xmzs4L7SyIZsJRL8U5+g2mvjcPnEgLWUaHQcGYHKynwF
 g+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683029702; x=1685621702;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TenP9QN04wk7Cs3GRlFWsM87sW34MbN5XiVfw5QurKU=;
 b=JwmBkFtxpJXffZRSO5p4wqHCkWgIT4pCrgIQgquuBupQDCbxnbtw4qRm9q5kSnxF+a
 96zlg3UFx+Rxv3cEi8C8lQL7c04jR+LfC3KevHduYiPcMWuSn8waE2pT+Fu6GMx0N4Ru
 efd3VC5yjpBsbCDyNkEUIGXMxQ/3BUbMOLvpTuOZC8xulT+zlJoNhW7dtchd9m+Xn9m+
 i8YO97GCyhU20ijFyDWTUS6y4sdSAXd25UzEsEMzEG25shxIUPW9DWIZq3N+jfh1Dw6T
 xwwkQAbqrTDQwjkPM2kQyOII6zwjo9PsY+g1XkrK516lPrDKZzHU+kq25L3kYekU4oPC
 pzEA==
X-Gm-Message-State: AC+VfDy4b4t2OEXzsgDA7THF6XDqZSVLPlJO5q/wCfziZKGINP+flIwB
 ajElHKhWTIYx3ol7nHPscHDsjsTjLPdlTWLKuz8=
X-Google-Smtp-Source: ACHHUZ53agnKV+zIYd27BlAdsOIqqyl4alR+YFA1gVY1vPB/gQyQY4hH4MxGquzV/0WHAMttdR0ngw==
X-Received: by 2002:a05:600c:5117:b0:3f1:6fb4:5645 with SMTP id
 o23-20020a05600c511700b003f16fb45645mr15788554wms.1.1683029702090; 
 Tue, 02 May 2023 05:15:02 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a7bc4ca000000b003f171234a08sm35040330wmk.20.2023.05.02.05.15.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 05:15:01 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/35] target/arm: Remove dead code from cpu_max_set_sve_max_vq
Date: Tue,  2 May 2023 13:14:26 +0100
Message-Id: <20230502121459.2422303-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230502121459.2422303-1-peter.maydell@linaro.org>
References: <20230502121459.2422303-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Fabiano Rosas <farosas@suse.de>

The sve-max-vq property has been removed from the -cpu max used with
KVM, so code under kvm_enabled in cpu_max_set_sve_max_vq is not
reachable.

Fixes: 0baa21be49 ("target/arm: Make KVM -cpu max exactly like -cpu host")
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
Message-id: 20230426180013.14814-3-farosas@suse.de
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu64.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 76891c92883..fb5e1b69db4 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -336,12 +336,6 @@ static void cpu_max_set_sve_max_vq(Object *obj, Visitor *v, const char *name,
         return;
     }
 
-    if (kvm_enabled() && !kvm_arm_sve_supported()) {
-        error_setg(errp, "cannot set sve-max-vq");
-        error_append_hint(errp, "SVE not supported by KVM on this host\n");
-        return;
-    }
-
     if (max_vq == 0 || max_vq > ARM_MAX_VQ) {
         error_setg(errp, "unsupported SVE vector length");
         error_append_hint(errp, "Valid sve-max-vq in range [1-%d]\n",
-- 
2.34.1


