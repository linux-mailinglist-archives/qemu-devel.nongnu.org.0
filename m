Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 680465355E3
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 00:00:06 +0200 (CEST)
Received: from localhost ([::1]:55190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuLWX-0000nM-8s
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 18:00:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLCI-0001ot-Tp; Thu, 26 May 2022 17:39:11 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:42963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLCE-00087c-8w; Thu, 26 May 2022 17:39:10 -0400
Received: by mail-oi1-x235.google.com with SMTP id q10so3632533oia.9;
 Thu, 26 May 2022 14:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VSNL4OevG9cw8y5LNytE2yhoXe6nu0ALTHWdV92uj+o=;
 b=efs8G8sTEC3B22CcRpvPlTWFPn3KblhAMKl8TqehRlPaKxxUDDDu/uKBkQb+M4WyRA
 6QfsXk4paPpuB2m744mhPa3VpaeyP0SvknQLby/S8PTIk0xJF8RKI4dajkhdMk2yHl9f
 dsLQ/NePGL9xtR/fyvvNNb4Zce6vOMZFVQy47sLJU0ficmJ6TJeChDqqZGc0RpvhBM5R
 ZfRHYe1kegPR18sk71n8tvcVkcoTodHhwtMllKbu53EdWuEYgeMMtl+ZLL1IoEYQCmew
 ZBGK2DhEoQRoAV4EgNVzyzm1LXIyKn1ExYal0mDXA3RE78upDuNXj9FIdSYNIbUHthf8
 nqjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VSNL4OevG9cw8y5LNytE2yhoXe6nu0ALTHWdV92uj+o=;
 b=D42tHICLXP0P6/Psh9+Eri+EQkG6HtxPoQbsHarNvisXq06s80UzjG+PwhcSt/5P2z
 usVOBXxZcSblRHwfoSpZZ3qBjUu+vod3FcWJK8u9dd1k4b+Rz/0AEBMChoA+xISdxhcO
 AgbJjVP43knwdfe3qhGwKVC5wqyhySghlQsUk0yS++lR5d+d1PUPPL1YaLrzPx6Nwdcn
 RqSQTe3Sr5TdYU+Y7y5JQ0wNPXRrjqlb/8s0/2+EQAdSkxuK4S8C+70/keJDBCo30+/C
 QMdtB055MwABWDnKheAYGWTgJfWH3v9EhEGC2yDqC6tjYXE4Tb0suQU1ddobjdEZDpD7
 eBTg==
X-Gm-Message-State: AOAM533fk7GOrgDS2IYwQa/UiOAXAlHs6Z9NA3Qj2lfrkouDt2ia+tLB
 ayrl1JrZRuzS6ek9Oyh3uZ5HKN/RpQ8=
X-Google-Smtp-Source: ABdhPJyS5Yy1cMug4UNrqaXEwIyT6bycLcb1Ecun+iQxGYccSpxPu9QqkAbDZMQjf69mNcZFnvj2KA==
X-Received: by 2002:a05:6808:dc3:b0:2ef:86e7:a0b with SMTP id
 g3-20020a0568080dc300b002ef86e70a0bmr2249071oic.48.1653601144736; 
 Thu, 26 May 2022 14:39:04 -0700 (PDT)
Received: from balboa.COMFAST (189-46-169-45.dsl.telesp.net.br.
 [189.46.169.45]) by smtp.gmail.com with ESMTPSA id
 l43-20020a0568302b2b00b00606ad72bdcbsm1066999otv.38.2022.05.26.14.39.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 14:39:04 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, Frederic Barrat <fbarrat@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 10/34] pnv/xive2: Don't overwrite PC registers when writing
 TCTXT registers
Date: Thu, 26 May 2022 18:37:51 -0300
Message-Id: <20220526213815.92701-11-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220526213815.92701-1-danielhb413@gmail.com>
References: <20220526213815.92701-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x235.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

From: Frederic Barrat <fbarrat@linux.ibm.com>

When writing a register from the TCTXT memory region (4th page within
the IC BAR), we were overwriting the Presentation Controller (PC)
register at the same offset. It looks like a silly cut and paste
error.

We were somehow lucky: the TCTXT registers being touched are
TCTXT_ENx/_SET/_RESET to enable physical threads and the PC registers
at the same offset are either not used by our model or the update was
harmless.

Found through code inspection.

Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20220523151859.72283-1-fbarrat@linux.ibm.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/intc/pnv_xive2.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/hw/intc/pnv_xive2.c b/hw/intc/pnv_xive2.c
index 87303b4064..a39e070e82 100644
--- a/hw/intc/pnv_xive2.c
+++ b/hw/intc/pnv_xive2.c
@@ -1295,7 +1295,6 @@ static void pnv_xive2_ic_tctxt_write(void *opaque, hwaddr offset,
                                      uint64_t val, unsigned size)
 {
     PnvXive2 *xive = PNV_XIVE2(opaque);
-    uint32_t reg = offset >> 3;
 
     switch (offset) {
     /*
@@ -1322,8 +1321,6 @@ static void pnv_xive2_ic_tctxt_write(void *opaque, hwaddr offset,
         xive2_error(xive, "TCTXT: invalid write @%"HWADDR_PRIx, offset);
         return;
     }
-
-    xive->pc_regs[reg] = val;
 }
 
 static const MemoryRegionOps pnv_xive2_ic_tctxt_ops = {
-- 
2.36.1


