Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D05A5626129
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 19:30:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otYio-00082C-Lw; Fri, 11 Nov 2022 13:25:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otYil-00080Q-Vc
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 13:25:44 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1otYij-0005Ev-83
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 13:25:43 -0500
Received: by mail-wr1-x430.google.com with SMTP id v1so7471953wrt.11
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 10:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yRiOg7bg8oS8kaYUc50xaOLL3jm/f2eXWCl+zuHDC2s=;
 b=id7utgly0WQbUninVCOnLgxd/TcwkyrRfiZ/OerQyzTwXl38i82MjTJ/qm79pPpKxK
 EW+z/Ibvx6TzEL9DAzcf0Nk8nf5RywE1k/07J6T3uLIdnLvZIM59ODi4TyyLcAIWiK52
 HmJMpv01Agsw9xTs4sOBOPzQQujEoy6gJJAz5dnds2H76GA/tlodRanJFUgeRwVuIBLC
 CHZMym90Cft7RqHDHSVBTqZCfij4O2MdLqzmFhTfQdYC/b1EJ+p7Ww/gQurP80VI1C8u
 k6uNrBQ7A/sG+fYbrEiBZIHBA4wD8Fw03l7hNy3QJdcsEq1D9aIXEYmcXcslwbv9Dmyr
 YUAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yRiOg7bg8oS8kaYUc50xaOLL3jm/f2eXWCl+zuHDC2s=;
 b=EbMjHuXHAG/VkkMqx5pSgdi5v8is1vBXGZSj4tLT7r5H0JLLGBBljDeQ5lMd1WkwzO
 PZdiHiQ6Nk4WSFNmz7IEKl9crkkWlVvaPImHi0yBRw7Y0dERI1Hl6VMo+cVYWXe4itZh
 KHCC3hoWE3Y90zfRwsqFXpvu4XB6vXjP+ulUC2763L9uUJtgvbDyAy26XK86yi3nMrN9
 WFhcm5MhzI9Z0GOuF7D0Js4bRBQN13oOte9rpFUfRXN04bDrTV1EbCFFrSQvzt+rmpaY
 +Zim0VG+9t7IAwV+ICkw68bUbAjNexsxWNuGnDRk2lWo97nP0NKyamiLLpc05sY8XxIN
 T/BQ==
X-Gm-Message-State: ANoB5plv0fspbDOTpbcFbcuG3cE1ut4D3nNH5uqFg/IMwJ5NzXoQtNhX
 yHLEHrafEV5lT7w9uynu6Z2qJA==
X-Google-Smtp-Source: AA0mqf7Z6+0hUR0wBgIaN7xErs+Fk3pZy8xfQOhk7zoRRbRB1rrcZQF+ATEqYN5fmW2pG6UPLUBdvw==
X-Received: by 2002:a5d:45d0:0:b0:238:3d2a:cd12 with SMTP id
 b16-20020a5d45d0000000b002383d2acd12mr2016487wrs.172.1668191137779; 
 Fri, 11 Nov 2022 10:25:37 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t67-20020a1c4646000000b003cfa622a18asm9443469wma.3.2022.11.11.10.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 10:25:36 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E4CFE1FFBB;
 Fri, 11 Nov 2022 18:25:35 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mads Ynddal <mads@ynddal.dk>, Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH v5 03/20] target/arm: ensure HVF traps set appropriate
 MemTxAttrs
Date: Fri, 11 Nov 2022 18:25:18 +0000
Message-Id: <20221111182535.64844-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111182535.64844-1-alex.bennee@linaro.org>
References: <20221111182535.64844-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

As most HVF devices are done purely in software we need to make sure
we properly encode the source CPU in MemTxAttrs. This will allow the
device emulations to use those attributes rather than relying on
current_cpu (although current_cpu will still be correct in this case).

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Mads Ynddal <mads@ynddal.dk>
Acked-by: Alexander Graf <agraf@csgraf.de>

---
v2
  - update MEMTXATTRS macro
v5
  - more tags
---
 target/arm/hvf/hvf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 060aa0ccf4..d81fbbb2df 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1233,11 +1233,11 @@ int hvf_vcpu_exec(CPUState *cpu)
             val = hvf_get_reg(cpu, srt);
             address_space_write(&address_space_memory,
                                 hvf_exit->exception.physical_address,
-                                MEMTXATTRS_UNSPECIFIED, &val, len);
+                                MEMTXATTRS_CPU(cpu), &val, len);
         } else {
             address_space_read(&address_space_memory,
                                hvf_exit->exception.physical_address,
-                               MEMTXATTRS_UNSPECIFIED, &val, len);
+                               MEMTXATTRS_CPU(cpu), &val, len);
             hvf_set_reg(cpu, srt, val);
         }
 
-- 
2.34.1


