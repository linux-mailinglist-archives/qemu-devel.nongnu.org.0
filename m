Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3347D59F732
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 12:13:00 +0200 (CEST)
Received: from localhost ([::1]:52652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQnNb-0008QN-5T
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 06:12:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmt4-0002Qg-MB
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:41:26 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:42702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmt2-0001MR-5F
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:41:26 -0400
Received: by mail-pg1-x534.google.com with SMTP id q63so307367pga.9
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 02:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=eT7i3FFQc8PKKRNmStJpuuvLEJ+xIi8cvZUWYereUgg=;
 b=p47+6C9tssfPWv9BETDMsqh64W3+bu2N3xF/7dhXwCtmpD2GYRRWihXipD9l65BhXY
 PZhP3e128o5zbFiLLamo+7fuebF9fqmT+WxNiQQ3htiCyyN2XCR3vUaivlzAo0TNzRXI
 HCuSHw6spa9ZVD2Npl/3Jr+yphS4IanP7pLciB+srzCJuVmIye06wnZ5f53J+AF8R4p3
 4QhIV34Kj8gnNUNDejsMkrKlZWNjsJXqJ4KroJQnxJFW7ldwn3+L4illeuXCC0A98x4V
 kC4eH0XZAnJe6nQrbM8zOLNTWGPP66WOyecwyvgf4t910HRjhMJw6xi6RRmAZT7Z0q1z
 dheQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=eT7i3FFQc8PKKRNmStJpuuvLEJ+xIi8cvZUWYereUgg=;
 b=IJYlL3ZJsh3hF3xAS1dvhirYxdp/H1+jN4t+HFHMokBLkARagVw4Pr2giy7VzTbxpV
 40yoY2SbfGflfJAL425xxz0r5w6+1zvEnXxxKVioF8opFW3wYu90bAkNHbsJWgttBGLS
 Y2uR724gM+qnPVADAHoQzR7mmj9nFTCivrDJVidTEZjvjZ95y8qJ+4ZU45vl3cqua9Ig
 ZJTb6Q+/5T6vW4zhZ8p4lekyMTYICOncjaokbgD9mrbF0sDXEpxogioGfeHJbDZwAP4f
 /ylW2VIzaAYQ7Z2NXFAKXO8AnXB9JxUVUR79AlqKo0xCdwHfL/h6+TRHQSx8MmKP2Rb8
 4auQ==
X-Gm-Message-State: ACgBeo1pgBxvgevaH2ePCGBUSRGlXlzvH0mXcd1Y5yOAyLU8MahZKgGP
 /W8KYun71Hs28DYLMwp7N1/W8InHS3s=
X-Google-Smtp-Source: AA6agR5Eb6m0IlugLrXcv5q6A/iKTNFX3dL0JP8rJloM3sVwsYvaXKMgNU+xwu+YXfbZtfQ0RIN3vw==
X-Received: by 2002:a05:6a00:1687:b0:518:6c6b:6a9a with SMTP id
 k7-20020a056a00168700b005186c6b6a9amr29351167pfc.81.1661334082646; 
 Wed, 24 Aug 2022 02:41:22 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a170903228e00b001728eb339e2sm12165972plh.286.2022.08.24.02.41.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 02:41:22 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 05/51] tcg: Avoid using hardcoded /tmp
Date: Wed, 24 Aug 2022 17:39:43 +0800
Message-Id: <20220824094029.1634519-6-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824094029.1634519-1-bmeng.cn@gmail.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Use g_get_tmp_dir() to get the directory to use for temporary files.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 tcg/tcg.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 0f9cfe96f2..932156a352 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -4729,13 +4729,15 @@ static void tcg_register_jit_int(const void *buf_ptr, size_t buf_size,
     /* Enable this block to be able to debug the ELF image file creation.
        One can use readelf, objdump, or other inspection utilities.  */
     {
-        FILE *f = fopen("/tmp/qemu.jit", "w+b");
+        char *jit = g_strdup_printf("%s/qemu.jit", g_get_tmp_dir());
+        FILE *f = fopen(jit, "w+b");
         if (f) {
             if (fwrite(img, img_size, 1, f) != img_size) {
                 /* Avoid stupid unused return value warning for fwrite.  */
             }
             fclose(f);
         }
+        g_free(jit);
     }
 #endif
 
-- 
2.34.1


