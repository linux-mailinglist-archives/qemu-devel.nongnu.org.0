Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D864E9839
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 15:33:19 +0200 (CEST)
Received: from localhost ([::1]:46114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYpUk-0007hz-3w
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 09:33:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nYoy4-0005Gc-Al; Mon, 28 Mar 2022 08:59:34 -0400
Received: from [2607:f8b0:4864:20::32b] (port=36863
 helo=mail-ot1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nYoy2-0001kl-Py; Mon, 28 Mar 2022 08:59:31 -0400
Received: by mail-ot1-x32b.google.com with SMTP id
 y3-20020a056830070300b005cd9c4d03feso10612757ots.3; 
 Mon, 28 Mar 2022 05:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OfYvORQRcelgzAlesGQLue5tF08UKLaOx9Jj6VSpm1g=;
 b=biGN/Jo9k2m+UnPwEJsE+EweVaznk/OOd8L6sU9blTIGSDRZ6xU9F0FXiny9IaZdC5
 nrn3QqW/aQj1I555lMi/5cVakCgHJY2PzLJw4x0bJXXdBAzmBvRIvdrCCyMNlHNP7nCL
 p5GlVkmXo1A5JCcP7rEXd8rvhZdNOJ081V+ofv9SUdD4un3MIS5i0H0+wc7e+/cVVOLw
 xkOLEifEwfXsMIwWzoNgeK9SsyXoPCitdMgUc4Sfsj/0o1umQedsvX4ECFFI3srGcDD8
 KdgfCRa7ssVt+26YpIRbooL3Xhw9x+uWOxMLEzBoBZD2LOHuCmH/JFWYxOrhqwP3mCpc
 gzGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OfYvORQRcelgzAlesGQLue5tF08UKLaOx9Jj6VSpm1g=;
 b=Glwbzqi48YFoKMwIwtgyaYWg0xY8YP7yLd9Xuo7tL7WTUxQ+DijJpUFzYsQGbj+DOR
 U7MPmrs66m6znsUXMMQXMzEQbtg/0jhveSeIpei7Tt60S6rtll1aUQ+tIsTVffvMLQyX
 w/8TyienqtG4kFlP1bIbjxNn+pgOtt9zpxMpyVO4J/N6uYxTSJHDIvNtSdYTcBNuC6H6
 ldhxMzyIWidOMD4d0MHxsOC6MrJgz3+OigoVkzxurNLHU/Y/8HS8Sk7scNK0IRpm8+mG
 M4d7TNEJOxN0dzMLpM/6C0/wZSZcQ7wxmzSl7OhNfjziR4xwzUP4q8lCw6jIZn2ndOXM
 2zHw==
X-Gm-Message-State: AOAM530NdhkIjptpRSQIXS+ixlfYdYfhIRqAmA/WC2jC4EmtL9ea3iY+
 U4E4XLgFU4FSyDda4uXoe4txdqsa2ZY=
X-Google-Smtp-Source: ABdhPJzVKztPzorlrLCPPEeSkWl+XWOY3SQ12eniAYFAmHOFrjn/Fu7nAU5l/M4pzE3ljNMthzlexw==
X-Received: by 2002:a9d:720d:0:b0:5cb:6545:57 with SMTP id
 u13-20020a9d720d000000b005cb65450057mr9787692otj.202.1648472368767; 
 Mon, 28 Mar 2022 05:59:28 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c7:8271:32d5:64c:7754:f033])
 by smtp.gmail.com with ESMTPSA id
 e9-20020a056820060900b003216277bfdasm6950698oow.19.2022.03.28.05.59.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 05:59:28 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] hw/ppc/ppc.c: add cpu_ppc_tb_free()
Date: Mon, 28 Mar 2022 09:59:17 -0300
Message-Id: <20220328125918.494787-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220328125918.494787-1-danielhb413@gmail.com>
References: <20220328125918.494787-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32b.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The timebase is created using cpu_ppc_tb_init(). At this moment we don't
have a way to free it. Add cpu_ppc_tb_free() to allow env->tb_env to be
freed.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/ppc.c         | 7 +++++++
 include/hw/ppc/ppc.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index faa02d6710..fea70df45e 100644
--- a/hw/ppc/ppc.c
+++ b/hw/ppc/ppc.c
@@ -1083,6 +1083,13 @@ clk_setup_cb cpu_ppc_tb_init (CPUPPCState *env, uint32_t freq)
     return &cpu_ppc_set_tb_clk;
 }
 
+void cpu_ppc_tb_free(CPUPPCState *env)
+{
+    timer_free(env->tb_env->decr_timer);
+    timer_free(env->tb_env->hdecr_timer);
+    g_free(env->tb_env);
+}
+
 /* cpu_ppc_hdecr_init may be used if the timer is not used by HDEC emulation */
 void cpu_ppc_hdecr_init(CPUPPCState *env)
 {
diff --git a/include/hw/ppc/ppc.h b/include/hw/ppc/ppc.h
index b0ba4bd6b9..364f165b4b 100644
--- a/include/hw/ppc/ppc.h
+++ b/include/hw/ppc/ppc.h
@@ -54,6 +54,7 @@ struct ppc_tb_t {
 
 uint64_t cpu_ppc_get_tb(ppc_tb_t *tb_env, uint64_t vmclk, int64_t tb_offset);
 clk_setup_cb cpu_ppc_tb_init (CPUPPCState *env, uint32_t freq);
+void cpu_ppc_tb_free(CPUPPCState *env);
 void cpu_ppc_hdecr_init(CPUPPCState *env);
 void cpu_ppc_hdecr_exit(CPUPPCState *env);
 
-- 
2.35.1


