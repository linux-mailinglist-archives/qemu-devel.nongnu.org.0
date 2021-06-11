Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF44F3A4B6E
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 01:51:36 +0200 (CEST)
Received: from localhost ([::1]:49182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrqw3-0005DN-Ln
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 19:51:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqmf-0002Om-2n
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:41:53 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:36396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lrqmd-0002ba-ER
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 19:41:52 -0400
Received: by mail-pg1-x529.google.com with SMTP id 27so3678928pgy.3
 for <qemu-devel@nongnu.org>; Fri, 11 Jun 2021 16:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Jny2BOuw8fi5i5pkScXK8a6G/xlMZW6X9SAJzS70TA4=;
 b=QDOqi2q0hdwoLJUh1hs4iBexdH8qPBxjDOv+QdYPilPQLBK0O1u0sbBIfrDk6DpQpV
 0pagxSnmvYFjy0MXt6Dw83KoV06ZLFzoKa8DIO5CCBeiRYle2uVdhrENsrmLOajhjllY
 lXNWEeSR1wH9ifPpVFov1j7dMofoA/HJ66gUU7j6TeIr2OkNjNZptoEshSMzOxpy5Nj9
 K9l2pd/kC60Gm9GOJNCMng4TSCtd5FcxmtBV0VFIqqoGHIfp4FSlEjJdIA4GndejvmEg
 yFfSAqbGT6BkmkhKCnyM3jjiHuBvlQx5bD64PkkIU0FCVOkSnr8VMj3fPs7V6cXJDfGU
 J2uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Jny2BOuw8fi5i5pkScXK8a6G/xlMZW6X9SAJzS70TA4=;
 b=QLHL2mpuufovsZUDhi/YGh4EDiPVMjCDeS/WnOlOhRffPnPMF6ICGrnVjiA5HbvwSY
 UX5MqxoGRgMNK75hBYz1TI2eTY0RSHXjFKNgRnVDdJ7wQCF2kbGa3V1Xjm9Gh1bBeo2j
 5GXov8XBJonuDEFbb51RhCVcvAYWR8LdVHo757TdqfLeAXHe00SejAoNVscwO0nyWL3s
 3btWdnr78QRNuxy92qFRMjzKSkzXdzY0y4rC9RiunHJZymKYleWotUzeEEUX39mpSDze
 3wRoP6NxwbcTtiDM3ETxigtd6xX5juMtSa3Cxzo/icasOO5pNQwJI0gaL2SFZVc/o4vY
 NDwA==
X-Gm-Message-State: AOAM532VCr74txSbW5EX36XV07QlwJK+pNv8apEkJWNFlScV+eXOC9qO
 j46Hbz7BmfmYvqtUdsMrBmFIbGlo0S/mgw==
X-Google-Smtp-Source: ABdhPJxLOXDA6WyDTK/Mg+X319iYw+Q4PPukGSjIb6TwUGAG1P91rHWGL+TT1MS7lHOejYiu2m/h8Q==
X-Received: by 2002:a63:514f:: with SMTP id r15mr5829404pgl.374.1623454910270; 
 Fri, 11 Jun 2021 16:41:50 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id q23sm6139829pgm.31.2021.06.11.16.41.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 16:41:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/34] accel/tcg: Inline cpu_gen_init
Date: Fri, 11 Jun 2021 16:41:18 -0700
Message-Id: <20210611234144.653682-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210611234144.653682-1-richard.henderson@linaro.org>
References: <20210611234144.653682-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Luis Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It consists of one function call and has only one caller.

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/translate-all.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 04764626bc..337fbb11fa 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -245,11 +245,6 @@ static void page_table_config_init(void)
     assert(v_l2_levels >= 0);
 }
 
-static void cpu_gen_init(void)
-{
-    tcg_context_init(&tcg_init_ctx);
-}
-
 /* Encode VAL as a signed leb128 sequence at P.
    Return P incremented past the encoded value.  */
 static uint8_t *encode_sleb128(uint8_t *p, target_long val)
@@ -1331,7 +1326,7 @@ void tcg_exec_init(unsigned long tb_size, int splitwx)
     bool ok;
 
     tcg_allowed = true;
-    cpu_gen_init();
+    tcg_context_init(&tcg_init_ctx);
     page_init();
     tb_htable_init();
 
-- 
2.25.1


