Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9CA59CCAA
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 02:00:11 +0200 (CEST)
Received: from localhost ([::1]:39332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQHL0-00004x-6o
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 20:00:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGvb-0006AM-LL
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:33:57 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:34374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGvW-0007Hh-Ab
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:33:54 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 c16-20020a17090aa61000b001fb3286d9f7so75081pjq.1
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 16:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=fK7z6rYpSkLAcVSpIb1K7FULXyqRfpPeN4PMueAi39g=;
 b=DcoSbjrOA65xkTbZbOVsSsMcNIBulsgqjElj65vP6aTgwivgcF9G75NUxMZJqxzTq7
 cBhUeWH5OVKTUhWwf9XsznbZxEZH9Su2a9Tk1JZn5ME1aGMGMVgS07VVLGu98AicKRjb
 83dCXKBwEe0helwrU/pk6cra49h/KQvdieRmmnk911FXt1f+b8Na++r6p+cndqtU9rJF
 QYuGgfTicZQumwelYU5F8AvYVEOiFu4Dv0dR83efL1SGfb5vyxYzfwH3DTJaVsguQqFf
 cy9veyE0gu4P3ZrR765yC38nb2A4GHIwV210k4YKIFWtPamarvVM09YvfL13QmKwUKAK
 uaJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=fK7z6rYpSkLAcVSpIb1K7FULXyqRfpPeN4PMueAi39g=;
 b=GmU59ufEfu1dxHCr0C8i39+FewEeMIZ3d7LVP0kB9Pm3M4pSQkreN1mqfU0PyBmiI+
 QKT+CwJJswKem3pCQ0Bdrdkna+r0WXNy6N+mq2DhBIKBZe9gKyYQRRMnHI9oydvQxoAn
 JUt4LH1xrh870smOYD3EJdQZAAyhdhzBfbDO/fTfj7RKFBkEBrU1dDo5VHlctVzoPyGN
 8avccAIOji6G4xhx6DHxvUzYWr1BQTgv78IcPO/vCcWQ3PBDbYFvNjZ1fHGlPUoD+2De
 w7wMqI/aTvkLfMnykLsyCh4rtNb07qszUhaUtKjdtkrw2FO9mvaWw+HGnKIp0XJ+HC9S
 8Bqw==
X-Gm-Message-State: ACgBeo3vnEqxmykAw4IZC4fwCIUwGSVefYLsXU+INLj7NyNeHMckQd92
 ZTfP/xPRYv1lTusGKljq+2GwlG62bu7SEA==
X-Google-Smtp-Source: AA6agR5K3N6830tXGC1pFEvBsB1oRafAXkrE02kkmnsMtA39itSrSltnCUlTYspwTQMMZTVSEinjBQ==
X-Received: by 2002:a17:90a:4e46:b0:1fb:45e2:5d86 with SMTP id
 t6-20020a17090a4e4600b001fb45e25d86mr636483pjl.193.1661211226482; 
 Mon, 22 Aug 2022 16:33:46 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:c3f1:b74f:5edd:63af])
 by smtp.gmail.com with ESMTPSA id
 82-20020a621555000000b0053655af14easm5133124pfv.45.2022.08.22.16.33.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 16:33:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 20/22] target/i386: Use gen_jmp_rel for DISAS_TOO_MANY
Date: Mon, 22 Aug 2022 16:33:16 -0700
Message-Id: <20220822233318.1728621-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822233318.1728621-1-richard.henderson@linaro.org>
References: <20220822233318.1728621-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With gen_jmp_rel, we may chain between two translation blocks
which may only be separated because of TB size limits.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 67c803263b..846040c1ab 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -8627,6 +8627,9 @@ static void i386_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
     case DISAS_NORETURN:
         break;
     case DISAS_TOO_MANY:
+        gen_update_cc_op(dc);
+        gen_jmp_rel(dc, MO_32, 0, 0);
+        break;
     case DISAS_EOB_NEXT:
         gen_update_cc_op(dc);
         gen_update_eip_cur(dc);
-- 
2.34.1


