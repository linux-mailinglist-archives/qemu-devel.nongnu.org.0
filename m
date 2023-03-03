Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 677496A92E6
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 09:45:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY0zh-0008QC-N1; Fri, 03 Mar 2023 03:42:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zR-0008JP-NZ
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:42:09 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zQ-0007wn-3J
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:42:09 -0500
Received: by mail-pj1-x102a.google.com with SMTP id bo22so1785592pjb.4
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 00:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832927;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cVGv5A6n5nDBuoDvZ7Dj19W/tsB8uDWCqYxpjR3oN5A=;
 b=JM1r19QFyOabMzjhsD3qyNFwASqda9cW79YkUsvFlXT8adlSUbG/2dMtQkutwH7PaQ
 TbB30qeouPxOimz743dHS+mJNr9pJhDZWcEWYuYQldl2Dr9xFzwWPtfoCXFjbg1RjEV8
 VF0E9qkobrMc8q5ibXwb70CrG90CicZ65TlG9oIlsUZl81vCXzEUrcuYD3//Ou5OtfCJ
 yEj9JXyCy499q1c1K1nlqC/lSxOLQu8XL4UJBgfCzpSg8TJKbUckJlHIN4/EcACxLYlb
 QhGHlkHlZQDizO0Wr6ssvdp2Jn/B0TjXKUnwHtYajDpKQuTcM9ClGMSCdYgbPzPcL3F3
 qwBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832927;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cVGv5A6n5nDBuoDvZ7Dj19W/tsB8uDWCqYxpjR3oN5A=;
 b=ggur+4NGCFd5iRbEa3pUEZILeRPzH6PknOldx6uL9Gce8PcCqXw3wTdPpjLTDPJF1M
 IkdtWkcyQwL8LqU+ljEMp6jshipv18wsJcevAnL4l9xWRaWrFcsLeaJSJGDp/UMSNwte
 tXPXVdEZM9ZXwVtpnJlD2RhAhnpdCDWWgk19nHg2QNQMFhZCv+hbsAgwmv5nD5Hjr53/
 LW7UoH26ffavSM3VYtjqYoCS/kEO14LDMbiiitEpbG2bxVVJd4NNNNIoqmKyZ1Y2zzDf
 EICCkSNROzAfjHwDnJEXiP/Ihc2JvTHcSQIVEnPeep97bsQ5DSIkaxI0cYFo8MwxFlSa
 TpLA==
X-Gm-Message-State: AO0yUKXbNmSqm9wxFcEaFyMNsnAggI/OG0IAbaXw/URPmPnWn1TbQ5Af
 WCDeDjXnLcTr/luAehJdcvL0JQ==
X-Google-Smtp-Source: AK7set/Hc1iLzH5tVm2dNh6nfSbGwv9Rw0alwxbYUIfNxjsAioejBHdSsljGSNHeurOdhnMxjrq2FQ==
X-Received: by 2002:a17:90b:3e8c:b0:237:85e5:3294 with SMTP id
 rj12-20020a17090b3e8c00b0023785e53294mr922194pjb.20.1677832927239; 
 Fri, 03 Mar 2023 00:42:07 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 kw6-20020a170902f90600b0019cad2de86bsm975020plb.156.2023.03.03.00.42.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:42:06 -0800 (PST)
Subject: [PULL 37/59] target/riscv: Allow debugger to access user timer and
 counter CSRs
Date: Fri,  3 Mar 2023 00:37:18 -0800
Message-Id: <20230303083740.12817-38-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
References: <20230303083740.12817-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Bin Meng <bmeng@tinylab.org>, Weiwei Li <liweiwei@iscas.ac.cn>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x102a.google.com
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

From: Bin Meng <bmeng@tinylab.org>

At present user timer and counter CSRs are not reported in the
CSR XML hence gdb cannot access them.

Fix it by adding a debugger check in their predicate() routine.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Message-ID: <20230228104035.1879882-14-bmeng@tinylab.org>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/csr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 7284fd8a0d..10ae5df5e6 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -131,6 +131,10 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
 
 skip_ext_pmu_check:
 
+    if (env->debugger) {
+        return RISCV_EXCP_NONE;
+    }
+
     if (env->priv < PRV_M && !get_field(env->mcounteren, ctr_mask)) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
-- 
2.39.2


