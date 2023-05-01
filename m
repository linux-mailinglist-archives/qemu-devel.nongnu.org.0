Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7430B6F3063
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 13:16:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptRUe-0005JI-59; Mon, 01 May 2023 07:14:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ricky.zhou@gmail.com>)
 id 1ptRUY-0005IV-3j
 for qemu-devel@nongnu.org; Mon, 01 May 2023 07:14:50 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ricky.zhou@gmail.com>)
 id 1ptRUW-0001rQ-KL
 for qemu-devel@nongnu.org; Mon, 01 May 2023 07:14:49 -0400
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-5286311be47so1533945a12.1
 for <qemu-devel@nongnu.org>; Mon, 01 May 2023 04:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682939687; x=1685531687;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0V7yALppFoB1vChwYP7y4sdxEMmVSB0CFMFV42E4JYM=;
 b=IebAd/84Tm3pevi4LcR7Rm1tliggylG0MLyZJGHiKQtGNbeQYfwLuD5lCvLMUTHiIj
 KyTrX298OMiW5YaozpH//EU18GVEGskDTc14f7i+bqslPL6JWmwnP1JxBhdpYFwq8+Eb
 IBMkWs3JVkHnpQLxMZtQuJcFusmXpJZy1fuBDz6clATM+3pCwzPKMlMdVfV5u9g2GWDN
 1UH4N/lyff2cquBuJLEyK4ob0g4Ufmru7X9sRInRQqjE8P9gkVxlil4huzaCGAf6/Rn3
 0FZlE7Cx0YgpHdouqBU5KL8R4ZKiVLKmS2f2VG++VqoroQQMpWULDQWHACpXd9pMJm7Y
 BU5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682939687; x=1685531687;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0V7yALppFoB1vChwYP7y4sdxEMmVSB0CFMFV42E4JYM=;
 b=LYiQ9dMTFJdoXJSbB65ALFAQ6ltQ5bmf1xg5Ej79/mQ75yUhCTcNv2pDckqz1svbkF
 jYXZ6uxKDfVUQkV0mwYrgs5m0YgRw/aQBfANmJOFXfFY4YukKBwmL7Ol2inXqh8QUkXY
 rYfqL6Nst5+iq8DEQrVXY74o7Fs3wQmKQMnQ7uO54bj9zHQ8LruOKuXbyVy2za/Q7Lz2
 MagQNGTQ6joNr0M9y280IE9W0MPc0VQ+Y2jSsRpuKjPYdu/BL36XGlCBxGk0HdniHxfu
 DUgu1+/ZeS1qvmYnpvzpXSLitzYscsotl7RLvdB3A9KE4zsU7cgP/cS2RjMedmlp2/7H
 wLDg==
X-Gm-Message-State: AC+VfDyUBT3z+6zjQq4KQ4/QdWd3gJFh+gJVSF2nq7UjUposT8km70u8
 p8vJzEnHfbnVYMwhY/2z1mzG3cqVekU=
X-Google-Smtp-Source: ACHHUZ6sPtkz7SF6V7FmX1+11rh++D0C8EEziq1Zazq30Cba0Td7uWF9nOsa+i4VKFm+uEPNmGvyxA==
X-Received: by 2002:a17:902:ce83:b0:1a9:ba26:6cfa with SMTP id
 f3-20020a170902ce8300b001a9ba266cfamr15316978plg.64.1682939686855; 
 Mon, 01 May 2023 04:14:46 -0700 (PDT)
Received: from localhost.localdomain (c-98-35-10-58.hsd1.ca.comcast.net.
 [98.35.10.58]) by smtp.gmail.com with ESMTPSA id
 j5-20020a170902c08500b001aafdf8061dsm1043091pld.207.2023.05.01.04.14.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 04:14:46 -0700 (PDT)
From: Ricky Zhou <ricky@rzhou.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, philmd@linaro.org,
 Ricky Zhou <ricky@rzhou.org>
Subject: [PATCH v2 3/3] target/i386: Fix exception classes for MOVNTPS/MOVNTPD.
Date: Mon,  1 May 2023 04:14:28 -0700
Message-Id: <20230501111428.95998-3-ricky@rzhou.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501111428.95998-1-ricky@rzhou.org>
References: <20230501111428.95998-1-ricky@rzhou.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=ricky.zhou@gmail.com; helo=mail-pg1-x532.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Before this change, MOVNTPS and MOVNTPD were labeled as Exception Class
4 (only requiring alignment for legacy SSE instructions). This changes
them to Exception Class 1 (always requiring memory alignment), as
documented in the Intel manual.
---
 target/i386/tcg/decode-new.c.inc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/i386/tcg/decode-new.c.inc b/target/i386/tcg/decode-new.c.inc
index 796ba7cf18..282721b54c 100644
--- a/target/i386/tcg/decode-new.c.inc
+++ b/target/i386/tcg/decode-new.c.inc
@@ -750,8 +750,9 @@ static void decode_0F2A(DisasContext *s, CPUX86State *env, X86OpEntry *entry, ui
 static void decode_0F2B(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
 {
     static const X86OpEntry opcodes_0F2B[4] = {
-        X86_OP_ENTRY3(MOVDQ,      M,x,  None,None, V,x, vex4), /* MOVNTPS */
-        X86_OP_ENTRY3(MOVDQ,      M,x,  None,None, V,x, vex4), /* MOVNTPD */
+        X86_OP_ENTRY3(MOVDQ,      M,x,  None,None, V,x, vex1), /* MOVNTPS */
+        X86_OP_ENTRY3(MOVDQ,      M,x,  None,None, V,x, vex1), /* MOVNTPD */
+        /* AMD extensions */
         X86_OP_ENTRY3(VMOVSS_st,  M,ss, None,None, V,x, vex4 cpuid(SSE4A)), /* MOVNTSS */
         X86_OP_ENTRY3(VMOVLPx_st, M,sd, None,None, V,x, vex4 cpuid(SSE4A)), /* MOVNTSD */
     };
-- 
2.39.2


