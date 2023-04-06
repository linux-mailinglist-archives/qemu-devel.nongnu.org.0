Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 530606D9C89
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 17:39:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkRgM-0004Je-5E; Thu, 06 Apr 2023 11:37:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pkRg7-0004II-K0
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 11:37:36 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pkRg1-0003G0-1a
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 11:37:35 -0400
Received: by mail-wr1-x42d.google.com with SMTP id i9so39944454wrp.3
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 08:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680795443; x=1683387443;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rDPB0Vrze01poFSd6DQd6uFNtL1bRE0xGzVa5dYm2B4=;
 b=G4SI3FBGs6ofYg2TWylLzqJKDdTPQ/yTOL8UkTvWHZmzY+tw75WvscXkMcOucwNx4Q
 CRSKWQjGN6ILxQPXty7o1jCXiXs8IMEYiEdKjttluHb0gQDGiECww65arQMPgW13GBZw
 oYl3BcIKqn3yv7h3oxid0HNV851g8Qs5YiM02tQ2lvW4b13MDsnVInXl/UjDB3EKBApm
 VTDo8U1BrJ1FpS151XHidYLPv29NQyil/DYwTsHGM4dAwUrr96BuTEpGQOvPPEOSZGK6
 QWQXkQg9fzHXt/4aZYV/nt9NxgV62uel2Dnn+vHjmniqCkfu13wfI/1U0LobvbQDFnGB
 pY7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680795443; x=1683387443;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rDPB0Vrze01poFSd6DQd6uFNtL1bRE0xGzVa5dYm2B4=;
 b=b+2yJtkZ4Te8hjxgSJKZkwNZPwRiBfyCBVxgyrRQqJzgziBQXzgHh7/fJHoRRTiAWN
 QM94gffrpY6QOd4EpVnTDpjITlF7JuekfEvGEmtNS0v99VUH9jJ9XDfKqOtxC5hMkDRS
 RrqZ8KSV5moDOi1ZUJKOcWAAbgfYiBgg3dpDgvIFXc4de52UQRzkjDZ67LClTRdGrkwY
 7rgp6y5Q/9sVQmQfgsGr4dCHvxqMyJ+chYJlKlX90d4g0pFrhk8QDQNdCjyJKzeGey2L
 qeaam2j6I3HQAhKbqmPSUQlmwcwCZ1fD2YHBIlGMFdI7DrS/ad2yNUJENdjoW7HczG3H
 26mQ==
X-Gm-Message-State: AAQBX9cVTxP2DztsyVENG4AFXc9qwwPgnHT8Z9k1U6jGooAPUbL+STTS
 OcjsDmlnmgpN1e0QjmXfzht8cM6ut1znmVSNKdE=
X-Google-Smtp-Source: AKy350ZFQIVZegJYnEcZJ2WWUUtQ+twxaHAv2TY99QVItxyYcix3D0GQdr8w+aEJgGXaxINjLg94YA==
X-Received: by 2002:a5d:6145:0:b0:2ef:4bea:b032 with SMTP id
 y5-20020a5d6145000000b002ef4beab032mr1069244wrt.64.1680795443157; 
 Thu, 06 Apr 2023 08:37:23 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 o18-20020a5d6712000000b002ef349e73cbsm1366226wru.19.2023.04.06.08.37.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 08:37:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH] hw/mips/malta: Fix minor dead code issue
Date: Thu,  6 Apr 2023 16:37:21 +0100
Message-Id: <20230406153721.3349647-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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

Coverity points out (in CID 1508390) that write_bootloader has
some dead code, where we assign to 'p' and then in the following
line assign to it again. This happened as a result of the
refactoring in commit cd5066f8618b.

Fix the dead code by removing the 'void *v' variable entirely and
instead adding a cast when calling bl_setup_gt64120_jump_kernel(), as
we do at its other callsite in write_bootloader_nanomips().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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


