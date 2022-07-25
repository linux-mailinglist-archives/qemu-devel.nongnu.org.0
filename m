Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95174580576
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 22:24:06 +0200 (CEST)
Received: from localhost ([::1]:57312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oG4cW-00038a-9e
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 16:24:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oG4a1-0000Tn-MO; Mon, 25 Jul 2022 16:21:29 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:44813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oG4a0-0007d5-48; Mon, 25 Jul 2022 16:21:29 -0400
Received: by mail-oi1-x235.google.com with SMTP id bb16so14811987oib.11;
 Mon, 25 Jul 2022 13:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MCW3ZxsJ6nUUD4dmc92+40EWq4rDZOrRjODdMwmoGlU=;
 b=fb5TnYU7N6MohK5ogilRKc/bEZEh7YasLh1yFYk8DqyV7s4zomCyYVh/U099WT8REG
 YDGLFrt+7y+wEAI/alrKZM/4yf3W+pKjj6gPPc+UTp2r5ASArFcpEfcdJag2CrwGm1Ei
 q3etzcCE6IndlNxNt+OGyMghsOerHLSMl08Kw8HOCdS85pqLS5z1dCy7JZoNvuGcgLpp
 qpzcAn/YGIYSsilsxXkvu2WLPBcbyQGNPylunc7lpMk10qJkmKsXb+cU8FllXD8LXyIm
 cUGNiyRlp+wpfuMoeyHjZ5V5lvhOqB0d6zdvs/WN8xcq5L8qGDBumu1cdEVkObv0C0qR
 N6Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MCW3ZxsJ6nUUD4dmc92+40EWq4rDZOrRjODdMwmoGlU=;
 b=AGaeZqoh/LocQ+K1SZ+rployHFaoQb6BoM+f9a3XLLsYzVLmJs3r0zr4pNT8QWqJAQ
 n3dhSx00nI521a6Cq2z7RYN6ut1/B2LIc/6L+otVo+WbEXP081oUnpK0kR/3MMoFxaFc
 SZ5AWJLS3IoeFTO2Sb3SWKqexWPQfGFc4ZmT7xDNDNIl0BnoMgAIF0vgSDhb3InnlXzO
 FOmuRQL4T1EWu9wZQ5sZ/rFxyb1rHWkxatt21+kq+hwdiLvlNLz2S+kj5ac3oluyJuBd
 IlFlHTY0WjxxDD00ivdWz7t75CIg/QO7wAkSwbS+9LztPQZXHYE11dAIfjuJeCauOFm8
 bPcg==
X-Gm-Message-State: AJIora8cwvqIscHFj8gqFpMOwhvOKnJMMwzYQ4kPek6s2NSNL6WFrV7j
 xiQxIVp9FFQGUJyg3/GE4mLglKXssKI=
X-Google-Smtp-Source: AGRyM1tH76S4E+OYqIfYooqXKqheACF/f4uv2K19VBkgYBTx6Kh8pDZB0ieB6aV8ZoRzKzunQVzoHw==
X-Received: by 2002:a05:6808:3091:b0:33a:5f00:c43 with SMTP id
 bl17-20020a056808309100b0033a5f000c43mr6220521oib.35.1658780486453; 
 Mon, 25 Jul 2022 13:21:26 -0700 (PDT)
Received: from balboa.ibmmodules.com ([2804:431:c7c7:1396:9fee:cbb9:2bbd:ebf6])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a4ad0b0000000b0043577be222bsm5173669oor.22.2022.07.25.13.21.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 13:21:26 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v2 0/1] target/ppc: fix unreachable code in do_ldst_quad()
Date: Mon, 25 Jul 2022 17:21:21 -0300
Message-Id: <20220725202122.1810709-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x235.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

changes from v1:
- do not use ifdefs
- returned to the code that was in placed before the macro
- v1 link: https://lists.gnu.org/archive/html/qemu-devel/2022-07/msg03697.html

Daniel Henrique Barboza (1):
  target/ppc: fix unreachable code in do_ldst_quad()

 target/ppc/translate/fixedpoint-impl.c.inc | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

-- 
2.36.1


