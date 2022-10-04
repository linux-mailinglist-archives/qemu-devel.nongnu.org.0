Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 303485F4534
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 16:12:07 +0200 (CEST)
Received: from localhost ([::1]:42910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofieT-0003dA-9a
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 10:12:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhq3-0001J1-Ht
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:20:03 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:41925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhq0-0001pm-RI
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:19:58 -0400
Received: by mail-wr1-x42b.google.com with SMTP id bu30so1403122wrb.8
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 06:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=9LqzuxSgRUEWhI49Vb5gMhdtkHKyysd2sMCsQOX6w2Q=;
 b=lIHIeBrqv7USjW7i7efOXs46rVW/DvGIO3QBl8zayH1LDJ5nDGGXRuXN6f5UaKvWgj
 FCnPP66IotfsUSFKPn6paCvbGXFktCoIxOZcCssD0Q+RI1NFVvVrsXrRo5ZG08brvoXY
 YjXOF+eulpN52DIZQ05W8vOqi0z8cyFOZB1OLQATpQktPQje4ljR5EEfulE1FIhTL63s
 1UHsm63Sohlnlbcg4PbGZ46lmbVVKnFiAe9xZTLh1XdnZMXuj4AlQRo2xK4TzyBpPn4o
 zEaAZqEyg861eUdL3j2y5a2haWfPl2qXdMTgeHXA+wGPEOtR5LrcSfP8udCZ72GV4XtR
 PAiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=9LqzuxSgRUEWhI49Vb5gMhdtkHKyysd2sMCsQOX6w2Q=;
 b=vzjqXL7+uZNVozkBrWgCNr4Cbm93iAFPN3kLj9YzHIygm+pROW/0a4RFnozenlcsZD
 DQNGYNagESSv+D1nAZWhx7NYvcRx1+ot2jVc7RNu3IX3Q7D5dPswZ50jh5cWM57c9Zov
 8L0o+ic/Rc1LsWmP1vhLixdqlOXGq9b0Kchm12+V4igDOdCphfMoEYqdB6yKFYFMBA/c
 q23UmqfqrPILrHpvAAvtucH7gXoQrdeG0puOQ13q9M0XVZC9PGxi3pUd93JOnTgTqxY8
 4HA7KEqaVbtDYb6aKmOxregU+AjWf574fyMbRGNpi0siMppOV1cUssp2p3g+pn/9gXYb
 w9sw==
X-Gm-Message-State: ACrzQf3pzLaJI4RlfRhY91wZiGRByN8Gzq96pt4dVbp5pKCe5pCBLbYw
 kH0Y1+7W8qpjG0bQpqIH30B0WQ==
X-Google-Smtp-Source: AMsMyM4RgtiZ9lUpD7pw5zDh7OETibbJ20oI2iYYRWXqoBNBPYrd7nychy9G5dMJaZsaXw4s4iyvgg==
X-Received: by 2002:a5d:5944:0:b0:22e:3c67:75de with SMTP id
 e4-20020a5d5944000000b0022e3c6775demr6636044wri.5.1664889596059; 
 Tue, 04 Oct 2022 06:19:56 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 o20-20020a05600c339400b003a5c999cd1asm17742276wmp.14.2022.10.04.06.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 06:19:54 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AD3961FFDB;
 Tue,  4 Oct 2022 14:01:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: [PULL 39/54] contrib/plugins: reset skip when matching in execlog
Date: Tue,  4 Oct 2022 14:01:23 +0100
Message-Id: <20221004130138.2299307-40-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004130138.2299307-1-alex.bennee@linaro.org>
References: <20221004130138.2299307-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The purpose of the matches was to only track the execution of
instructions we care about. Without resetting skip to the value at the
start of the block we end up dumping all instructions after the match
with the consequent load on the instrumentation.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Alexandre Iooss <erdnaxe@crans.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220929114231.583801-40-alex.bennee@linaro.org>

diff --git a/contrib/plugins/execlog.c b/contrib/plugins/execlog.c
index e659ac9cbb..1b3bb7ebba 100644
--- a/contrib/plugins/execlog.c
+++ b/contrib/plugins/execlog.c
@@ -88,7 +88,7 @@ static void vcpu_insn_exec(unsigned int cpu_index, void *udata)
 static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
 {
     struct qemu_plugin_insn *insn;
-    bool skip = (imatches || amatches) ? true : false;
+    bool skip = (imatches || amatches);
 
     size_t n = qemu_plugin_tb_n_insns(tb);
     for (size_t i = 0; i < n; i++) {
@@ -147,6 +147,9 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
             /* Register callback on instruction */
             qemu_plugin_register_vcpu_insn_exec_cb(insn, vcpu_insn_exec,
                                                    QEMU_PLUGIN_CB_NO_REGS, output);
+
+            /* reset skip */
+            skip = (imatches || amatches);
         }
 
     }
-- 
2.34.1


