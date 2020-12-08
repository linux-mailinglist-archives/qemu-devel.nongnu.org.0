Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F612D31F4
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 19:18:20 +0100 (CET)
Received: from localhost ([::1]:36756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmhZ5-0005zH-O5
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 13:18:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhJ0-0007fd-Gr
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:01:42 -0500
Received: from mail-oo1-xc41.google.com ([2607:f8b0:4864:20::c41]:40855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhIz-0006NS-30
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:01:42 -0500
Received: by mail-oo1-xc41.google.com with SMTP id 9so1551466ooy.7
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 10:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7eYNYi6nRqgOF9U1+OBQOhH564yszaE/ArldGpU6S2Q=;
 b=tQNwyo7r0z6wULhVOktBLG7Y8qLwEnzk1uU9wbIPFv+Pfw8ucbNNDvFTvVzTW8umbS
 6EzKyp/lAeVa4A19uJ5qvticHaDwUACwQY0t1U773b1DZnkfJtnKmMyjSePIL1ZHBKtm
 M0+N3dwSetsgr38wvO/nCY4yI4/7FHKz3TLGA9B+8nP95phRMHDP1MDfNUueJ0q+n7R4
 2M/c+E+IKF4cHI4I/dfY7rgp4l/rb6RpgdPODkrELOjHRIu9StcKld17KI7ATONoW1sa
 fRkZeirVPOKJrfheyXinULlnJ6f/9RJ/o4AhvoxDYzDBuV7yhR+zrn1lR1VJpJN1eyxb
 WoAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7eYNYi6nRqgOF9U1+OBQOhH564yszaE/ArldGpU6S2Q=;
 b=UPffeb75j4k3wVP/2J+b7mVR42iB2SjpImt3ZQf4/ZVPNZ8ZFtJiOpthNh7CNLB9zG
 ypXxDa7MrfnZfiAK/8Pc2eplAozyMikwIKJH3GCION6GMTTK1XvkQq/WOJm32USivzJJ
 DB/ms4dyGkKyZDq8GthdCYfG33G4xZb7rIV0tYToq6S7psYgZ8aND3F2H1ampymWkJzE
 qcKGcm3alQuI/ZWF7BdePc8JmN/orfkuF6cRT+0ChRqMQinL1Tb74k7E/HKw73QEs6iw
 xwz80shyb8KdawS6AmH4MOTpnUl/+RUnUnJN4eXXsxkevRujqybY5ce+CHr3D1MM1+eD
 g9wA==
X-Gm-Message-State: AOAM532PyZEsfWA54TNULgdnDhUC23o0xb5BzGCq+guvlNx+FbmBqbMK
 3W/5c95e1esjrwYYFeQrMgHbKQW72RCW6n8R
X-Google-Smtp-Source: ABdhPJzwD82+AId6JSOCwM96wEH9d0p/9HXqDcIXrateGw78sLWGXLR3kTKTADLVbU/WGU+hyoRZPg==
X-Received: by 2002:a4a:9c48:: with SMTP id c8mr17342328ook.84.1607450499646; 
 Tue, 08 Dec 2020 10:01:39 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id k20sm3886805oig.35.2020.12.08.10.01.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 10:01:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/24] target/arm: Enforce alignment for SRS
Date: Tue,  8 Dec 2020 12:01:05 -0600
Message-Id: <20201208180118.157911-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208180118.157911-1-richard.henderson@linaro.org>
References: <20201208180118.157911-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c41;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc41.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index a8bedbb45f..c7e01ea73a 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -5134,11 +5134,11 @@ static void gen_srs(DisasContext *s,
     }
     tcg_gen_addi_i32(addr, addr, offset);
     tmp = load_reg(s, 14);
-    gen_aa32_st32(s, tmp, addr, get_mem_index(s));
+    gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), MO_UL | MO_ALIGN);
     tcg_temp_free_i32(tmp);
     tmp = load_cpu_field(spsr);
     tcg_gen_addi_i32(addr, addr, 4);
-    gen_aa32_st32(s, tmp, addr, get_mem_index(s));
+    gen_aa32_st_i32(s, tmp, addr, get_mem_index(s), MO_UL | MO_ALIGN);
     tcg_temp_free_i32(tmp);
     if (writeback) {
         switch (amode) {
-- 
2.25.1


