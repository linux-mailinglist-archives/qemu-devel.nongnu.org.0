Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F826A92E9
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 09:46:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY0zH-000872-4j; Fri, 03 Mar 2023 03:41:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zC-00083u-FH
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:41:54 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zA-0007xz-II
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:41:53 -0500
Received: by mail-pj1-x102b.google.com with SMTP id l1so1811442pjt.2
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 00:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832911;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XBFShlq0Mtiviu35cbAP5uhkLUId7RlJPqqDmZVwaNg=;
 b=xirFmfVUod07P7pa/XjEM8cMjT468Tgyyrd9rkdG3BGq2FKKGv8ypJR3QAvb8H0l/G
 8id1jZA/NDUcLXy7j/86dr6l52jXd+C7wbZuCouV3MqOw61tT/biwPjGHsKc6nhMblsb
 cLf4GLnWBmiy2eCGMyU1HU2m0oDHBkYh/fdKLPa4axowMkKUffvnsAHucSmRb7AC9Ey7
 QnD4INeihTIv9qetxHOlj0yDX4AiuWFY37sJo51vABEVD5EjTz6pvRrpbd5M8tUS82hw
 UFVjyGuGAV8JxM00RrWrKCdjoK7lTg2m6YHP8FNZ0RUDtO6ztnqFejMcjND1/NZptMgc
 UdjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832911;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XBFShlq0Mtiviu35cbAP5uhkLUId7RlJPqqDmZVwaNg=;
 b=4iy3BFqTi3GbUG90XFEeGHVfTgqG9A6Pfa4KL8rreB6gLhiMU/8imrNyqTSSN0yTW/
 rMwO/SQ6zImsr/+t+g3r6nMoUhS9dwzXKAWQ4TH9OiIcTeeYnLpZWYkYE62rzck90bsJ
 eXqy+iqodcK6UdFx7utkPD+m4dhAIeXhMpfHa1OjY4XdYnmTdjgYlttdN6RkKt8Dr4Dl
 GRoemijWEtkMlWHau9gM2kxq8kZR4WxxLpS1pI30tsUn0eDvbwyWfaWEazlVQIV2DTYu
 ljWvbTKxiJJnXYt7uI10qxoc9QTnWGOtfxZdess0q6wUsrCHvkak+wFlU3mP7303k90w
 mOZQ==
X-Gm-Message-State: AO0yUKX5DcJOI74nAVYYrQZZuPyxAfkYcJnavz0AQbxE/pegk9zt3kf7
 t1xBdIdogJRsQOFka81ifDbwFQ==
X-Google-Smtp-Source: AK7set8JLVsVYr9oI/lKgb+DcO4W+oSVT0pZlxlskrp0UHxki+YkU9cBvQ9ozjJypNKMydjzw2uVJg==
X-Received: by 2002:a17:903:11cc:b0:19c:eb50:88b9 with SMTP id
 q12-20020a17090311cc00b0019ceb5088b9mr1538220plh.29.1677832911260; 
 Fri, 03 Mar 2023 00:41:51 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 kz14-20020a170902f9ce00b0019a733a75a2sm979406plb.60.2023.03.03.00.41.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:41:50 -0800 (PST)
Subject: [PULL 24/59] target/riscv: Expose properties for Zv* extensions
Date: Fri,  3 Mar 2023 00:37:05 -0800
Message-Id: <20230303083740.12817-25-palmer@rivosinc.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From: Weiwei Li <liweiwei@iscas.ac.cn>

Expose Zve64d,Zvfh,Zvfhmin properties.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-ID: <20230215020539.4788-15-liweiwei@iscas.ac.cn>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/cpu.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 9b8747ab15..b7f212c59e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -101,6 +101,9 @@ static const struct isa_ext_data isa_edata_arr[] = {
     ISA_EXT_DATA_ENTRY(zkt, true, PRIV_VERSION_1_12_0, ext_zkt),
     ISA_EXT_DATA_ENTRY(zve32f, true, PRIV_VERSION_1_12_0, ext_zve32f),
     ISA_EXT_DATA_ENTRY(zve64f, true, PRIV_VERSION_1_12_0, ext_zve64f),
+    ISA_EXT_DATA_ENTRY(zve64d, true, PRIV_VERSION_1_12_0, ext_zve64d),
+    ISA_EXT_DATA_ENTRY(zvfh, true, PRIV_VERSION_1_12_0, ext_zvfh),
+    ISA_EXT_DATA_ENTRY(zvfhmin, true, PRIV_VERSION_1_12_0, ext_zvfhmin),
     ISA_EXT_DATA_ENTRY(zhinx, true, PRIV_VERSION_1_12_0, ext_zhinx),
     ISA_EXT_DATA_ENTRY(zhinxmin, true, PRIV_VERSION_1_12_0, ext_zhinxmin),
     ISA_EXT_DATA_ENTRY(smaia, true, PRIV_VERSION_1_12_0, ext_smaia),
@@ -1126,6 +1129,7 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
     DEFINE_PROP_BOOL("Zve32f", RISCVCPU, cfg.ext_zve32f, false),
     DEFINE_PROP_BOOL("Zve64f", RISCVCPU, cfg.ext_zve64f, false),
+    DEFINE_PROP_BOOL("Zve64d", RISCVCPU, cfg.ext_zve64d, false),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
     DEFINE_PROP_BOOL("sstc", RISCVCPU, cfg.ext_sstc, true),
@@ -1185,6 +1189,9 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("x-smaia", RISCVCPU, cfg.ext_smaia, false),
     DEFINE_PROP_BOOL("x-ssaia", RISCVCPU, cfg.ext_ssaia, false),
 
+    DEFINE_PROP_BOOL("x-zvfh", RISCVCPU, cfg.ext_zvfh, false),
+    DEFINE_PROP_BOOL("x-zvfhmin", RISCVCPU, cfg.ext_zvfhmin, false),
+
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.39.2


