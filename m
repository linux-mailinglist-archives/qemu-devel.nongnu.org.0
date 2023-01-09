Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC55663106
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 21:11:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEyRj-00030i-Rp; Mon, 09 Jan 2023 15:08:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEyRh-0002xd-J3
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:08:37 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEyRg-0007VR-22
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 15:08:37 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 o8-20020a17090a9f8800b00223de0364beso13959791pjp.4
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 12:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rzW2RGRVBHiiLOC7jWYoqfyrR/GmVs5nUcJKMJ/tfDc=;
 b=nVRKJ0QDgC9RmCKG1F19fKOj7SNsHPPdFve+fwrjiK7PWFZJVop6d2eiy34K2PEBdg
 KY1b/JRVboTU0x0Vgt1D1NhHPug19nrjjGKsZIT1L6xetnptyCKiVWFKCflInHPcv4v5
 smBFyWdJ4MGQKPxI2BxtDGElGf0zGGqtVEf+O7ehWA6MViy+RjGygkQVx/Znb7rTEePe
 JdF6jP6i3hv0HYdk6FkdmmWF1RR3Yx8FdLL+pciKoPeqEGTxG6Pxoc+LLjZGMhDzvi4B
 2YQumVHK/yHTxIZd+H9AsANkBv84NFvrhNBqADco+KHRmBgEOALlMLhrAgCCj3Ze8yJg
 QiMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rzW2RGRVBHiiLOC7jWYoqfyrR/GmVs5nUcJKMJ/tfDc=;
 b=NijRxmVk3Ho2oURsm/f00K4alI9rf2EIDWYNTibXiLEUw+azl0MRb7H+pmvXAF1nlb
 VEi60e1GhKOtOw/VSslzlyqMLPlpe3s4P+IsbgJe0QInwgcOZA8sY4lSBzC/zBSQ375+
 ojEhY8mjXs0R/x8Lr492tMpuFs21lZBrfDT5Atz12T6sqKJVA5ku4r36raS0w7PHV7J5
 Ao7JjR1aAWdGlNH7L3L1hlvzMbKNZ5Ve8niR79ja1y8DfmgQw1aF9qhicY4C6Q4Vtvn7
 CvCzLJxoJI3zu4ef2SafPBsZXgHapd5reMgiGNRx80h4Og8D/pjyZkux/Tf4Mpr9+9Iv
 8i9w==
X-Gm-Message-State: AFqh2krVLip+r14yc31Nplbj07lT0yf1XMI4JVTS1HO6h3Vkgro1Nrnw
 HlPE4FyZKgMFjRAdxePMyKFeEOgjxpx6xRfG
X-Google-Smtp-Source: AMrXdXtqjajNvHmBi/+xL1yZ6wSu+PmBLFPiQkzxO0D7PWWIr9OEZoyW5eXTYP4Nu8BMYZS5g8/Wgg==
X-Received: by 2002:a17:90a:fe89:b0:226:e59a:f869 with SMTP id
 co9-20020a17090afe8900b00226e59af869mr12647242pjb.43.1673294914116; 
 Mon, 09 Jan 2023 12:08:34 -0800 (PST)
Received: from stoup.. ([2602:47:d48c:8101:158e:facf:7a46:ba9f])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a17090a384200b0022727d4af8dsm577574pjf.48.2023.01.09.12.08.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 12:08:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 11/27] target/s390x: Use gen_psw_addr_disp in save_link_info
Date: Mon,  9 Jan 2023 12:08:03 -0800
Message-Id: <20230109200819.3916395-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109200819.3916395-1-richard.henderson@linaro.org>
References: <20230109200819.3916395-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

Trivial but non-mechanical conversion away from pc_tmp.

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 05a11df00e..001cfa9162 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -1558,9 +1558,11 @@ static void save_link_info(DisasContext *s, DisasOps *o)
         return;
     }
     gen_op_calc_cc(s);
-    tcg_gen_andi_i64(o->out, o->out, 0xffffffff00000000ull);
-    tcg_gen_ori_i64(o->out, o->out, ((s->ilen / 2) << 30) | s->pc_tmp);
     t = tcg_temp_new_i64();
+    tcg_gen_andi_i64(o->out, o->out, 0xffffffff00000000ull);
+    gen_psw_addr_disp(s, t, s->ilen);
+    tcg_gen_or_i64(o->out, o->out, t);
+    tcg_gen_ori_i64(o->out, o->out, (s->ilen / 2) << 30);
     tcg_gen_shri_i64(t, psw_mask, 16);
     tcg_gen_andi_i64(t, t, 0x0f000000);
     tcg_gen_or_i64(o->out, o->out, t);
-- 
2.34.1


