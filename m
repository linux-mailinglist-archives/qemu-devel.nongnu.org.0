Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58419510357
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 18:30:44 +0200 (CEST)
Received: from localhost ([::1]:53416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njO5K-0002Dq-GM
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 12:30:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1njO40-0001WZ-2z
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:29:20 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:38628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1njO3y-0003Jz-Lk
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:29:19 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 cx11-20020a17090afd8b00b001d9fe5965b3so670742pjb.3
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WEBl8XzyNxAwtoklGwlboNeQT42vtG+q9/H2/Eotyjg=;
 b=bVZOCxpzEP8PCswybK8TWAA+XteCw56StRhF7JbayDhYLH2ooSxEq6d0U4CzmOHIN8
 PtykTtkgSM7WldagDr5yZWjSs234EBv38d6261aeeZuUgAhITfiHvzQuHw85JP+TLvhZ
 Gi1mejY7uVxlWV0SCAGx4Y925B3l9fIcyWAjtzuNTgfz0PZdCBEgkxWaTSrJyimx95JO
 bAJuuqVqwh4GRamckKV2vEgkBPl7WnXVKqsLNqRQWdMyOUlBC3fC0LAsSgenszS8jLHk
 nDBBliZuHTAFXaRac/dTtszx8sly8IdFS5ONeE19ww5TlmbFKU2QKPsUXn1e2SCXBifA
 PZ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WEBl8XzyNxAwtoklGwlboNeQT42vtG+q9/H2/Eotyjg=;
 b=Qtbyv1NsejU1wXHldG0eXf4iB7zmwqHKLbaWUk5Syb6d93p/dFjLa+HJHPI06nxsS+
 5pa7lHEtiud1cD0QqtTZptmrnRLi/vNHpBWEVKVEwsr1H/+X+kXV3Y9zqp6bt2o+N8Eu
 hCT5o4rRsqhvKIdbPKMAUaT6PdD/WzJVlO9jb8FFBzqDpJ2Ou1r07zDm5ZDGTmNyi/CP
 lG2YRPM3+ZmZjVlSPx8gKPWV27ogyTPd5lPzvXSvhpsBliJADy8jrEAMdK6IIGNKNYSy
 l42WySFaugHsuDDHbRDxWEiA05nS2ArgL78dli4dP7/3pUlVL/NT491ZmvCkw7bo2ZFc
 N/iA==
X-Gm-Message-State: AOAM531TuF34V2xc9cpC6oxYzEM/z6ArfQl1+7G5+U16hR8tV/fHIulA
 ImmuVk3oBi1JcLUP3YPyuR+Z3FjAh04=
X-Google-Smtp-Source: ABdhPJwOGHc8lDZwihI40pmIwB+FZK/CwLqdybwBXDW7IFz4v/nR+Mif3IhVu4hHP7Ul4VOSSmYfSw==
X-Received: by 2002:a17:90a:7f94:b0:1cb:1853:da1b with SMTP id
 m20-20020a17090a7f9400b001cb1853da1bmr27228981pjl.14.1650990556185; 
 Tue, 26 Apr 2022 09:29:16 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:401:1d20:f93d:1970:9b66:cfb2])
 by smtp.gmail.com with ESMTPSA id
 p27-20020a056a000a1b00b004f3f63e3cf2sm18118550pfh.58.2022.04.26.09.29.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:29:12 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/xtensa: fix reset value of MIROUT register of MX PIC
Date: Tue, 26 Apr 2022 09:28:58 -0700
Message-Id: <20220426162858.1114691-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Max Filippov <jcmvbkbc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

MX PIC comes out of reset with IRQ routing registers set to 0, thus
not delivering any external IRQ to any connected CPU by default.
Fix the model to match the hardware.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 hw/xtensa/mx_pic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/xtensa/mx_pic.c b/hw/xtensa/mx_pic.c
index d889f953d17e..8211c993eb74 100644
--- a/hw/xtensa/mx_pic.c
+++ b/hw/xtensa/mx_pic.c
@@ -334,7 +334,7 @@ void xtensa_mx_pic_reset(void *opaque)
     mx->miasg = 0;
     mx->mipipart = 0;
     for (i = 0; i < mx->n_irq; ++i) {
-        mx->mirout[i] = 1;
+        mx->mirout[i] = 0;
     }
     for (i = 0; i < mx->n_cpu; ++i) {
         mx->cpu[i].mipicause = 0;
-- 
2.30.2


