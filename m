Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD33C4AFFEB
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 23:14:01 +0100 (CET)
Received: from localhost ([::1]:43068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHvDs-0000Gl-Sl
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 17:14:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHuwD-0005Xy-UX
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 16:55:45 -0500
Received: from [2607:f8b0:4864:20::1035] (port=46965
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHuwA-00086F-Nb
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 16:55:45 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 t4-20020a17090a510400b001b8c4a6cd5dso3622915pjh.5
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 13:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cwzAoSrGJ3x/bKluviqLTkKJTgNhXDXBL+z+UP/egkI=;
 b=qsYixGPkXVy5qm7zcx6NNvjA6SqpxDl3yMstkeOEzFJ+E4Wx5deFpGTlWlcqIWbZif
 Iw6foF7LviOLFWmE3JVb/rt9dmlmbC98wRK4npMpGX0dmr1peIQH1ia4Mk52Ze5/xybU
 Fxvnv81VdZ3jaur3hPpn2dULY/j6akaid+Jkfa6BIo3xziPNhaG1z6tCcEUlxzLZmvC0
 x4Hb7l7/v/U5/ENaqcXtCfEJqS0INeqSW+WXnnb9oHJzVvoqz5kPPbGHDba2sADIeRhf
 xZwswQQZd5/dCK6VPtqNrWQETnw1INxDtK2jLmvt4beSjq2pWph3kIA/P/GQ8RNwEnxX
 WJHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cwzAoSrGJ3x/bKluviqLTkKJTgNhXDXBL+z+UP/egkI=;
 b=IviAvMIdM9pKv8b1H3+M4boCRCPyIxODddkQDYtUOgKJ6oiYUEo0UFZ2h9t6A2o2hz
 saBqA0JvtkszRkgIY2G8NjjU4wN12hg4fITv5PLB5vVDHBSbFKjBvEzIhCJh6343vTBS
 VASTyfunzDoXKgGVL/pm+mlS4FZaF/wxo643YACDVX3M4AmNYVO8u569Yqjve5Jwk92J
 UdiDCLu5hwzJeo6WLrZQbKCF0ADpb6XwYEWHeWiHKK8/goPvMA7w7RVOwd9NDlIkISY2
 f11YwDMkUpxM5lcYMKWKyMAgBMkyj0R442edrybvqhshSJhAGhxE1005mRcIOC/9h1/x
 06ng==
X-Gm-Message-State: AOAM531h4n86wlOWSN7OxpuiegVLQuhAsLT69rHldvgxjMxcCoqLmLGi
 3S4/5sozjHu+DFhTANe8qw1mbGX3Oks=
X-Google-Smtp-Source: ABdhPJyDX6LYHTl089fisc7yWraY7QSnjcngtiFuEbnhEVVbEkkCXrbdDpF2zcSGDbZbMpXM/LT2Ow==
X-Received: by 2002:a17:90a:72c2:: with SMTP id
 l2mr4833458pjk.14.1644443741257; 
 Wed, 09 Feb 2022 13:55:41 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id 13sm8304240pfx.122.2022.02.09.13.55.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 09 Feb 2022 13:55:40 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 06/15] target/i386/cpu: Ensure accelerators set CPU addressble
 physical bits
Date: Wed,  9 Feb 2022 22:54:37 +0100
Message-Id: <20220209215446.58402-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209215446.58402-1-f4bug@amsat.org>
References: <20220209215446.58402-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

The only accelerator allowed to use zero as default value is TCG.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/i386/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index aa9e636800..16523a78d9 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6384,6 +6384,7 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
          * In this case, the default is the value used by TCG (40).
          */
         if (cpu->phys_bits == 0) {
+            assert(tcg_enabled());
             cpu->phys_bits = TCG_PHYS_ADDR_BITS;
         }
     } else {
-- 
2.34.1


