Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD54700BF7
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 17:36:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxUmz-0003JY-4l; Fri, 12 May 2023 11:34:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxUmw-0003IB-Ou
 for qemu-devel@nongnu.org; Fri, 12 May 2023 11:34:34 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pxUmu-000614-Om
 for qemu-devel@nongnu.org; Fri, 12 May 2023 11:34:34 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3063208beedso9650972f8f.1
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 08:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683905670; x=1686497670;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kjK9aJrCfxZTneunS8eCzgZ7hBHA0FsCr6nfpvU0y2M=;
 b=sncGoFpl7c/z8JOlUU0c5Q2Dj9a1hb/tkZljfni4tdHHk7531SeFTltS0QC7e+9JQg
 q2LRfedQrwV67e4cdgK7XFmnzthB5Fz47DifvBERmLmK4WMwkbopdpxBdlyi8egSfwu4
 xo715Ba+TmLIml+pMJhhK9cz6BKIkP+eShRcNyyrHhfcXIvgoI0/KUCNMykTQw60Q5DD
 ppx/DzZdXXZhIMvZka4Llyg29T8vTMsfqaWPLFmoXRyddq0CQvTqfbKpUQ2V/JFPm6E1
 6x3SneTm3WApAQ77nzdMWtqmfjtkgrzIjqNS/SJxPpQ5S01XOCm7u8sK4spDbiOJphPQ
 2Jzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683905670; x=1686497670;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kjK9aJrCfxZTneunS8eCzgZ7hBHA0FsCr6nfpvU0y2M=;
 b=lskuqQJjSqFmnKYLedyfB9gQBi7uPh6c2uCv8mwaAwhF8+OuXYYK9hCF4/fzpP+ms/
 TgPSdHMaym1pPGUzLEPBAneyS39Ax28Lqqn+cyOZrHHVooq71WSptmoJ1/XaY6i9aLat
 spbl8aBUSu4+Tyq9jqMi4Tt9VXSYuKPic+MPwgL0hhsPql3d3B12WxJVr58jbsai/LpP
 QkyeagWokqQZ7hBFXODVYfpa88u6LhaJ5SlT8B8yEwiI19BX7ssO/0f2odvhyN3V+h5V
 KgwPNwdIv45PUGAYVVhQPuEXg0s4LmlBcIrW4QSJRz22bdncon5rqA29r13Vb4bSOayg
 RfNA==
X-Gm-Message-State: AC+VfDzIXrj/EmaBC7OOHNUPz19ssyNb/0lOhs9e40/rK/OwI/lyI8O5
 CG7Y8rWMsiePByBzFc68N+ay8c2FSua00CLneqg=
X-Google-Smtp-Source: ACHHUZ58YkMxnb0Z9zwnvWtgTmJjk8pdDvGZCgrHGGwoPibHhT6BHwgJXIWLRur8WK4Nlj/h8CL14w==
X-Received: by 2002:a7b:cd0f:0:b0:3f4:23df:c681 with SMTP id
 f15-20020a7bcd0f000000b003f423dfc681mr13061474wmj.12.1683905669726; 
 Fri, 12 May 2023 08:34:29 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b6-20020adfee86000000b002feea065cc9sm11721297wro.111.2023.05.12.08.34.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 May 2023 08:34:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/12] hw/mips/malta: Fix minor dead code issue
Date: Fri, 12 May 2023 16:34:19 +0100
Message-Id: <20230512153423.3704893-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230512153423.3704893-1-peter.maydell@linaro.org>
References: <20230512153423.3704893-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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

Coverity points out (in CID 1508390) that write_bootloader has
some dead code, where we assign to 'p' and then in the following
line assign to it again. This happened as a result of the
refactoring in commit cd5066f8618b.

Fix the dead code by removing the 'void *v' variable entirely and
instead adding a cast when calling bl_setup_gt64120_jump_kernel(), as
we do at its other callsite in write_bootloader_nanomips().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/mips/malta.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index af9021316de..e3be2eea563 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -748,7 +748,6 @@ static void write_bootloader(uint8_t *base, uint64_t run_addr,
                              uint64_t kernel_entry)
 {
     uint32_t *p;
-    void *v;
 
     /* Small bootloader */
     p = (uint32_t *)base;
@@ -785,9 +784,7 @@ static void write_bootloader(uint8_t *base, uint64_t run_addr,
      *
      */
 
-    v = p;
-    bl_setup_gt64120_jump_kernel(&v, run_addr, kernel_entry);
-    p = v;
+    bl_setup_gt64120_jump_kernel((void **)&p, run_addr, kernel_entry);
 
     /* YAMON subroutines */
     p = (uint32_t *) (base + 0x800);
-- 
2.34.1


