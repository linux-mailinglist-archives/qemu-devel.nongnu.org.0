Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8884766A158
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 18:59:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGOEZ-000116-Ml; Fri, 13 Jan 2023 12:52:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pGOEK-0000u0-6o
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 12:52:40 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pGOEI-0001Xv-Ld
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 12:52:39 -0500
Received: by mail-oi1-x244.google.com with SMTP id d127so18231379oif.12
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 09:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sxp+GM5ymPv6TyvkEfOVeU9wh4EBckYHO6VlmxtLwwQ=;
 b=W3/jNkNoP1yswlxOKBBSpZ4by/K4sh5PxE0QUkXnn8DER2vDe8s2mqypFYdxz7NIsY
 xZaiFoIjtEgTP2Db3migiXHXH/uxnwDhdRYHeN9pp/y6HM0pHqlBsO13OUdoIxHzDo/i
 2kguM0+EPL+JyJGLQMSM+9g7TNpM+1Lv3TINTDwPA4Ksjz00BeEgzBpZP4rniUb9Pb9q
 nS8t4/IUecZhOjFJlZNq833lea6jeH/Cxx6KmbE5vo8pCpbwi/wpVNtTYq1Gm2GIeBSV
 mCi+LwzpoNipYEuiFnJKVyn5gE/1Zak9UvbJULZ34HO/wYW3hx8Jn1/fS49l+pozxr0J
 PIlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sxp+GM5ymPv6TyvkEfOVeU9wh4EBckYHO6VlmxtLwwQ=;
 b=qprThKf++XQ/vUF1zANIzLzX0MzdXs5h33WXANsgLa/uwbYxTMsoND7IXRdZXOP2eG
 iYkq3Lx6Kiyq32ZAw5fbx+YFuIRT4MvqeKgREoI2tbnhD5VBb0YrR2m3tmmtPbEj/4S9
 xgBLz1l1TUqzozB/rnWmcDPsemRaheJhZh85wcj59W5FTYjNSL/01ZrZJ40p6bqNVJZv
 ASrApaMt9wT21tAgbq1kDZiBBEt4GUpK1q2IH9RW04looqTilgvanGpxVLPiXqvu8P/5
 acGWegFalpWhh2LoUKCWoKjU1KVL6TvPesoNmZET/Xyh7lgsp6sIcCSTcajtqa10P2F4
 BuDw==
X-Gm-Message-State: AFqh2kpHkNek7Itpq0t+Tac5B7Tpft296+rhD6yPsht8iJsUAX/jnwWN
 FSkFhuGudpYRcieiPBbZ+nv2NxfkZN0KFaNt5Co=
X-Google-Smtp-Source: AMrXdXsVcgC2kJbiG9atFWHOvQnLsLwMd7OGoMOTJoImoPzQvoVU4dm2uABhwsltgbHlqM++8QD3Uw==
X-Received: by 2002:aca:2b04:0:b0:364:5f65:952a with SMTP id
 i4-20020aca2b04000000b003645f65952amr6600094oik.27.1673632356264; 
 Fri, 13 Jan 2023 09:52:36 -0800 (PST)
Received: from grind.. ([191.17.222.2]) by smtp.gmail.com with ESMTPSA id
 2-20020aca0702000000b00363ea5be014sm9549276oih.3.2023.01.13.09.52.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 09:52:35 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bmeng.cn@gmail.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 0/2] target/riscv/cpu: fix sifive_u 32/64bits boot in
 riscv-to-apply.next
Date: Fri, 13 Jan 2023 14:52:28 -0300
Message-Id: <20230113175230.473975-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oi1-x244.google.com
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

Hi,

In this version I fixed the commit message typos pointed by Bin. I've
also added some notes about the code repetition the fix is introducing
in the cpu_init() functions.

The patches are based on riscv-to-apply.next at c1e76da3e668
("target/riscv/cpu.c: Fix elen check").

Changes from v1:
- patch 1:
  - fixed commit message typos
v1 review: https://lists.gnu.org/archive/html/qemu-devel/2023-01/msg02035.html

Daniel Henrique Barboza (2):
  target/riscv/cpu: set cpu->cfg in register_cpu_props()
  target/riscv/cpu.c: do not skip misa logic in riscv_cpu_realize()

 target/riscv/cpu.c | 439 +++++++++++++++++++++++++--------------------
 target/riscv/cpu.h |   4 +
 2 files changed, 249 insertions(+), 194 deletions(-)

-- 
2.39.0


