Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3945EF784
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 16:28:23 +0200 (CEST)
Received: from localhost ([::1]:35158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oduWU-0005tr-Uh
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 10:28:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odsD0-0007TH-89
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 08:00:06 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:41516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odsCu-0004NU-Mq
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 08:00:05 -0400
Received: by mail-wr1-x42e.google.com with SMTP id r6so1814629wru.8
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 04:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=XomK1kpXDqBk+Ebyq0kQyqmYRo/vpKvPg6SHFpAPqMU=;
 b=tIgI4mtOBVpLyM5P7GpZ8WrF7OVzbQbi1d4wBSIQs036078Y+fh68AvJm9shzXsemj
 /lKYWBWU0l1YNcUWWkXQUXztMjru1GXzQf/PYXGtQSxVlT9OZE8gII5m7eyjTbhmXDjY
 qHf5rcQ0JSgjBclL3nPgKsFj/v6rKUjNddTh9OlVPjGz+HdFdmLw8YACwkY/iNvHr7Ti
 ADghZWKhFnCg8WfveggGQrp2ZAV2NwZjJsacPXnoR4WZ5aLQM1g2sqqVPPHP5ESiabeU
 XQxc4aSEcJWufi+jxgQNGoR6p12pDDAyapcv0vliiJ53MWD9Mwyo+5a4B2GuiNLaqVsS
 XWnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=XomK1kpXDqBk+Ebyq0kQyqmYRo/vpKvPg6SHFpAPqMU=;
 b=76dWCqfvj7VaEEpmQutsia50F29YnLz5j3qS8cXqndJvdbD2QFfPihs0dITZovKGih
 5pO99RCRV6iQOuDq5XkEk1uuevprUyS89cAPvFVf2OhVeIdEo/88yahLjKVMeSl00RcK
 YkCmfmw7n1bcYdj4qMBqVx7g7bP9rlscwwkX1MTBoby4a+es7MTHQEcKGyXygsjf3JTi
 rLm9G1/zAzGb7q1t2BNqWk+PbyBFWiIAz8TVLGkPghKg/m3wRDPN2RfpBpZ52Ts2NONb
 kLT30kzrdbD27w5C+gMSBgFwL3QkLGr1/RBJdKOdf2jh20HW8OiaxnfGsXZkAQMBEWxp
 AwNQ==
X-Gm-Message-State: ACrzQf1l/vpK/ZjIjabgdw+ZsZgvytrtXxRfmE/r11G6bx7nMr7q3lIQ
 vmz8gkw/NYXD69+QfA2Tcy2KcA==
X-Google-Smtp-Source: AMsMyM4gAARlFW6X4HwnoZP9c80yjLB+fsxQiuvF89jhPlNG4MJG3PR49cnvxE+x/rPS7TQu8kSDEw==
X-Received: by 2002:a05:6000:1f09:b0:22c:c6d9:5f42 with SMTP id
 bv9-20020a0560001f0900b0022cc6d95f42mr2065581wrb.84.1664452798085; 
 Thu, 29 Sep 2022 04:59:58 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 p14-20020adfce0e000000b0022af6c93340sm6579624wrn.17.2022.09.29.04.59.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 04:59:54 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AD2371FFD8;
 Thu, 29 Sep 2022 12:42:35 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v1 39/51] contrib/plugins: reset skip when matching in execlog
Date: Thu, 29 Sep 2022 12:42:19 +0100
Message-Id: <20220929114231.583801-40-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220929114231.583801-1-alex.bennee@linaro.org>
References: <20220929114231.583801-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Message-Id: <20220921160801.1490125-10-alex.bennee@linaro.org>

---
v2
  - drop the ? bool ternary for skip
---
 contrib/plugins/execlog.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

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


