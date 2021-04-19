Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 720EA363B3E
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 08:04:42 +0200 (CEST)
Received: from localhost ([::1]:38590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYN1V-000761-Du
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 02:04:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lYN02-0005lx-BF
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 02:03:10 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:33436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lYMzz-0004ov-TL
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 02:03:10 -0400
Received: by mail-pl1-x630.google.com with SMTP id n10so5959099plc.0
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 23:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=41vtdKBbxUOFhp4p6eMdPTd6SyBd/ck8tNGb28KQNqA=;
 b=P2Gkq3xhnvboohiN8KLkgPCBjn7OcNZAFRh//o+L9FznXn1cdOAVgmfkbcKE3vHrqD
 B6tXfTb37wQlthGc8A97w9L2YN2679g0jXyje/W5CR+iy3Q+ufWpjkQD7OVOUEl3Xj+I
 3+u5X3r403quYcL6BJqr8IePmHYtvOUaDVEgrBiQU7CDfjPctdkUzT8Fi6ZbqwnAMyRc
 Hy2mxPFtArNMnUEh9QYMCZxAzDZ5u4Skz3rM1oF3alEqEWK6Bt0z52C3yrQBeswiRzud
 lfiP2KEq2H4gJDfCPp3PlkvWe2KjAl7Q8Hs/MWvO2zzeOl/NUBtoBE4yBFNpEUAay5gd
 M3nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=41vtdKBbxUOFhp4p6eMdPTd6SyBd/ck8tNGb28KQNqA=;
 b=XJbWPSbN3zedfYqEun2KhSyFXgoqIxUEAtUhUZ/AC+QdE7brMHtYo664V9Iuth0B2l
 t/bwUAMw96Ti+WWlKUowaF6mrHSF/ZFmoLqVBFe9nkAvKAGDw4AFCkaXa60j3ugQOMio
 vAJaCSdxRUUIyWY4h/bsHE1nMXBd21rWhJQ5iKHTIZ78VW2f268qH3FqEvfE55mutFv8
 SFi2KYuqXFBGNKSTjXXPMdSFIS/bFN3d+sbKkUV7UNGEt4Hxtp5ohkuzG+d1OFfqAVNK
 9XTo9uhx9s9W0JIfpOMwmYYDC9VNyMYdI8LabtE6/yaUyejrF/2NWspeYb766TQ2ubWW
 nnjg==
X-Gm-Message-State: AOAM5328TJSl/+SbfoAZjnOAErSIxV/M9jcBWQNqbC337RxpLGXpd+VS
 gg9EsLh5AR6ebduFSalHp0UiqOPT326vYuKc
X-Google-Smtp-Source: ABdhPJxII5Btbdx5IEaOpeI/n42ng91b4o41UUzoPvPPyEVHZJi36SBc36osMUZ/DyJ5M+RuCrjFeA==
X-Received: by 2002:a17:902:edd5:b029:e9:7477:5f0a with SMTP id
 q21-20020a170902edd5b02900e974775f0amr20915755plk.81.1618812186128; 
 Sun, 18 Apr 2021 23:03:06 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id x83sm5939316pfc.219.2021.04.18.23.03.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 23:03:05 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH] target/riscv: fix vrgather macro index variable type bug
Date: Mon, 19 Apr 2021 14:03:01 +0800
Message-Id: <20210419060302.14075-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

ETYPE may be type of uint64_t, thus index variable has to be declared as
type of uint64_t, too. Otherwise the value read from vs1 register may be
truncated to type of uint32_t.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/vector_helper.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index a156573d281..4a70776af32 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4796,7 +4796,8 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,               \
     uint32_t vlmax = env_archcpu(env)->cfg.vlen / mlen;                   \
     uint32_t vm = vext_vm(desc);                                          \
     uint32_t vl = env->vl;                                                \
-    uint32_t index, i;                                                    \
+    uint64_t index;                                                       \
+    uint32_t i;                                                           \
                                                                           \
     for (i = 0; i < vl; i++) {                                            \
         if (!vm && !vext_elem_mask(v0, mlen, i)) {                        \
@@ -4826,7 +4827,8 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
     uint32_t vlmax = env_archcpu(env)->cfg.vlen / mlen;                   \
     uint32_t vm = vext_vm(desc);                                          \
     uint32_t vl = env->vl;                                                \
-    uint32_t index = s1, i;                                               \
+    uint64_t index = s1;                                                  \
+    uint32_t i;                                                           \
                                                                           \
     for (i = 0; i < vl; i++) {                                            \
         if (!vm && !vext_elem_mask(v0, mlen, i)) {                        \
-- 
2.17.1


