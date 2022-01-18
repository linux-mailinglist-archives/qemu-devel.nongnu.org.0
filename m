Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1263D4913E5
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 03:04:53 +0100 (CET)
Received: from localhost ([::1]:34386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9drg-0006Ac-5i
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 21:04:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n9das-0000wB-ED
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 20:47:32 -0500
Received: from [2607:f8b0:4864:20::1034] (port=56114
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1n9dal-0007eV-MO
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 20:47:28 -0500
Received: by mail-pj1-x1034.google.com with SMTP id hv15so21898082pjb.5
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 17:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QuND1ULQJ+/TaSqlnYNx8EL683pCF87FYDnAtdJNACU=;
 b=cU7ElmE8svPbDLciy9g/5DfyZ1CwYCnRg4InNDX5gfmwTCwV3INa4GL7CAIuO1x3dl
 kexCSU0E7+wO4xv59jqT2GO9N36pt0puSrJ3sUphZH4WaFCWfFWv+pi//9wlknzUTkQW
 ZdfIp9YX27U9i9lLQxOTiYcuOan/Istxvf2KwJZrinK+iERcZeERDXc51d7ZX41exMo6
 LP/8kS6w1MMuFerbtwnq08xHOSFRU0sh+BWepebDVqQCMRtKLWTJnPTLfZPTjnng0XKA
 vPq5e/ySSKCoUpmu65QJRHd7wWxac891Dnru4CbekELQgjYViS3+q9dsojSICRWbuYhg
 Nhrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QuND1ULQJ+/TaSqlnYNx8EL683pCF87FYDnAtdJNACU=;
 b=ok4CT2Zf8GO2B1xYzjHUV+iHHEIg+xfux7NB+RSuU1YSUc/aoJUzQMaoosYaXo3T+9
 0U4icU9k25IWtQAQ+/mYneKf4+76sZQi6I9Lrop5F2tzcJogjOKV1vXxFbTo3rFUVEl4
 DVP6LmdIGG0sSZpTIsuZExl7zdIjBn0WmmVhKd8iyCJrMY5SbF6IE5Ngi+a3bFoekkgH
 Yfc+pbH0hG3kN+F55P7/rpKVFbSQkR2UDsMRNzwkjoetG6OOCbCdn6QDB1OhPknUrghw
 +BQVrgw473h9WByYFyNTYHShNKHxujq62FmUlYIYIC0ypLHhCjjLkQk+Pc/mO6+Lge3k
 2JCQ==
X-Gm-Message-State: AOAM530zscspEwaKztYD9SjcBrAbUnO1HxhkrtawNOn/rHyobM25mHi2
 5SeqA4p8oLihF1JOFVNE7p2Cq0iCRJUXTXKu
X-Google-Smtp-Source: ABdhPJxbhFkCA/4uEa4T4W+Hlta92zKRzYngFc5q8xieCmYxNFxWjJ9L/XsPMBK+C2THMLGzvTCWaw==
X-Received: by 2002:a17:90a:d3c8:: with SMTP id
 d8mr27902572pjw.189.1642470383916; 
 Mon, 17 Jan 2022 17:46:23 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id c12sm8286136pfm.113.2022.01.17.17.46.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 17:46:23 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 17/17] target/riscv: rvv-1.0: Allow Zve32f extension to be
 turned on
Date: Tue, 18 Jan 2022 09:45:20 +0800
Message-Id: <20220118014522.13613-18-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220118014522.13613-1-frank.chang@sifive.com>
References: <20220118014522.13613-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 0898954c02..33c1df638b 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -664,6 +664,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
     DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
     DEFINE_PROP_BOOL("Zfhmin", RISCVCPU, cfg.ext_zfhmin, false),
+    DEFINE_PROP_BOOL("Zve32f", RISCVCPU, cfg.ext_zve32f, false),
     DEFINE_PROP_BOOL("Zve64f", RISCVCPU, cfg.ext_zve64f, false),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
-- 
2.31.1


