Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 618516A92F5
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 09:47:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY0z8-0007vb-80; Fri, 03 Mar 2023 03:41:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0z5-0007p8-5h
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:41:47 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0z3-0007tE-Kx
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:41:46 -0500
Received: by mail-pl1-x636.google.com with SMTP id a9so1945427plh.11
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 00:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832905;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BSMNIIiNbY/Z/kSdE82Qh/Y2QcKhNFcRwfism8ERmoA=;
 b=l5nzdD6vzGINnZHAEecWZKTLbj6S3oc0cOn0/pH7ZduMliM1NZFRxqc1Ox4ice/saT
 l9QQcMyyTfkWOxiw/2dTJKB5rlH9cbLhtj0yELyZkuf55TVCbtwi+lwE26K8jpNEX9aq
 w+jqP60nQo0MO9VzwBOyc0hYncOghA/PrOCifb4T50SDTh29UkseBPvmz0hLWJRneAm1
 BARExRwfxIlOv4vkz/GLeNI6oFRYCjKZnvqhfHdIIDFSZ5tbtD6oF2fUVKPt9zR2amAL
 oACbaYOgvBU9BS72QD+/zHf+CsHFY7TtBYb89lHTZYalvjlaDVo+PZOI6BJMjDWxdfl+
 EDPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832905;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BSMNIIiNbY/Z/kSdE82Qh/Y2QcKhNFcRwfism8ERmoA=;
 b=FVum3ZPfXlDGLmc5WHMXgmT9JNhxpeOvDHHYncYVPD/16kD22LGtA7KIN/5Bdvsa4p
 23aQm9P3oKCx2u7wrvx9Ykd8I6skRWozjyrrQ1NRsHJtTdB5+97yD51Vx0EQ8+JXOvfA
 NNgNPTpWMZw54ONMj1JXnmCpM4pPdJ0Xtn3us6pEAyl7761n3E73THKEgvhEl/G0hAUK
 PeiCnLunu60FdRbA8Ao9BhrEbRU0NDXVGm/cksyPWIRGcoAGG/V67QuYETJqxVaMxMwz
 rzoAEm0yBuqty01UvHnnT3RcFqGhS7o5fEs8dsg3sl1fLDA9cpx8Q6rOCWQzSw8N14Tf
 schg==
X-Gm-Message-State: AO0yUKUTPsyo6RHHImnMFm7tm5k3BP6rl3n3QqroUiXErv/wyd7oCBge
 F+q/O/IrLn8DWhQ5FZo04cUPxw==
X-Google-Smtp-Source: AK7set84TK5aA5cfW8upcqn3WtXG4rSm6qDZYTiTdf6Eu4XNX2d1sJ7CPa5n6fVbUlQoZx2mSaHPgQ==
X-Received: by 2002:a17:902:d492:b0:19c:b7da:fbdf with SMTP id
 c18-20020a170902d49200b0019cb7dafbdfmr1530397plg.26.1677832904739; 
 Fri, 03 Mar 2023 00:41:44 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 ki13-20020a170903068d00b00194d2f14ef0sm986967plb.23.2023.03.03.00.41.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:41:44 -0800 (PST)
Subject: [PULL 19/59] target/riscv: Replace check for F/D to Zve32f/Zve64d in
 trans_rvv.c.inc
Date: Fri,  3 Mar 2023 00:37:00 -0800
Message-Id: <20230303083740.12817-20-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
References: <20230303083740.12817-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Weiwei Li <liweiwei@iscas.ac.cn>, Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=palmer@rivosinc.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Weiwei Li <liweiwei@iscas.ac.cn>

Check for Zve32f/Zve64d can overlap check for F/D.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-ID: <20230215020539.4788-10-liweiwei@iscas.ac.cn>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 6f7ecf1a68..9b2711b94b 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -41,9 +41,9 @@ static bool require_rvf(DisasContext *s)
     switch (s->sew) {
     case MO_16:
     case MO_32:
-        return has_ext(s, RVF);
+        return s->cfg_ptr->ext_zve32f;
     case MO_64:
-        return has_ext(s, RVD);
+        return s->cfg_ptr->ext_zve64d;
     default:
         return false;
     }
@@ -58,9 +58,9 @@ static bool require_scale_rvf(DisasContext *s)
     switch (s->sew) {
     case MO_8:
     case MO_16:
-        return has_ext(s, RVF);
+        return s->cfg_ptr->ext_zve32f;
     case MO_32:
-        return has_ext(s, RVD);
+        return s->cfg_ptr->ext_zve64d;
     default:
         return false;
     }
-- 
2.39.2


