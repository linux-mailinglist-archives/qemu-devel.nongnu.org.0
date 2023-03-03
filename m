Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7416A92E2
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 09:44:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY0z5-0007ox-IP; Fri, 03 Mar 2023 03:41:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0yz-0007Vu-Mj
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:41:41 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0yx-0007s7-UP
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:41:41 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 6-20020a17090a190600b00237c5b6ecd7so5413121pjg.4
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 00:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832898;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E2uTMnecgdqwtCVcnTwCqTOoQw2CLDtGHhwqfs8rN5Y=;
 b=nOByMZlfUE+3wYpRTD2WQ0zfJQvWJEtBmdP3X8qn+3yNeyCYl8MY54sjvwEUubiIeD
 CZIoDDcLRJ1KylGpULcO7EHnxuk9DAPw/G5uR+KSyL63lQUC7eW1HwHJie3+2RH2AQTl
 lqzanUuDe6obwgYedvNSQ9KuSz60J+VtwB0k3tkvR/8TNekvcKHfAE9H8pAh87cSATj/
 v1V6p1FIpQmgyf8kbSN6QZs0r0w6ciMuvvsxp8Gls4kyPiR/z4w9mXZfP2Py1lQfSTlB
 J6Qs/HvXa//vQeJ99WR2QqNmXiCGvppIgUdPoyIlQkQPODWORn2pCPNDAzkN8mxGs7om
 eeOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832898;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E2uTMnecgdqwtCVcnTwCqTOoQw2CLDtGHhwqfs8rN5Y=;
 b=Se5+Tl1+GlhhL+vjxeYitq71Q8XA4unMPNNDL11nb+OIv1VWpqwxUbdyiKTEA9lm/O
 KIqwno0t0c3g/GXemT9QMUZFt3O/sJcQhaovNndFAIXoyUFrQ+/L7IMcAWu7WLtgeOto
 rdgmCj4GvC+GOQ7aQoSU+bsWtxILNldezLdSYMi/uPILqdhI3FEg1GmmyTRaykwsr/W0
 6aW2QG8Plp2tk8CLEcz5RIKSlnjG9SaZoYOUjULYQSJIc+hrSAPm4DPed5uHgAxOOgYh
 svQwl209Rtry3akoCbHv723XXjsqDxQuxs2JtuPnYgj6NE1j8rpmi5S7Zzhpgzn9J1v3
 B3yw==
X-Gm-Message-State: AO0yUKXcDClX4QF03F7ejfKWU2BpjSRdXL2YFoq4KjPAB5PZi8tCDhLv
 Veqe3jxFmzxvh04d7EbDL1Q4+A==
X-Google-Smtp-Source: AK7set/CnTo1KPFRpz3pbg8Tes8k0/Cs7AyRXYoU+gzf6Y9pqPZ3HvJqO3pmKPaB9xTPQNb/yeRDCA==
X-Received: by 2002:a05:6a20:7785:b0:c7:13be:6de9 with SMTP id
 c5-20020a056a20778500b000c713be6de9mr1258284pzg.14.1677832898510; 
 Fri, 03 Mar 2023 00:41:38 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 m8-20020aa79008000000b005dae7d1b61asm1021857pfo.154.2023.03.03.00.41.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:41:38 -0800 (PST)
Subject: [PULL 14/59] target/riscv: Add cfg properties for Zv* extensions
Date: Fri,  3 Mar 2023 00:36:55 -0800
Message-Id: <20230303083740.12817-15-palmer@rivosinc.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x1031.google.com
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

Add properties for Zve64d,Zvfh,Zvfhmin extensions.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-ID: <20230215020539.4788-5-liweiwei@iscas.ac.cn>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/cpu.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 31537fc05f..7f5264e165 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -462,7 +462,10 @@ struct RISCVCPUConfig {
     bool ext_zhinxmin;
     bool ext_zve32f;
     bool ext_zve64f;
+    bool ext_zve64d;
     bool ext_zmmul;
+    bool ext_zvfh;
+    bool ext_zvfhmin;
     bool ext_smaia;
     bool ext_ssaia;
     bool ext_sscofpmf;
-- 
2.39.2


