Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A9F5EA84A
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 16:23:11 +0200 (CEST)
Received: from localhost ([::1]:50368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocp0o-0001md-80
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 10:23:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ocoKH-00021V-Ht
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:39:14 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:50833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ocoKD-0005eR-Kx
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 09:39:13 -0400
Received: by mail-wm1-x32f.google.com with SMTP id ay36so4546363wmb.0
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 06:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=8kZr1rxByNkxMPVyKr7Y5lFL0hfWuti5PLDqMUepXx8=;
 b=ndwy5+eZkVYESsES7LBxBD3/B8G371rAOcNuqnAtAQ9nxRsUWFxCrTizlD0qkJKV3Q
 a51WtnaAehNkkWxwddzKW06t24i0AFDJSspiXJn3Y9pH1KB/OtLzdntSC+QKPeccGRAo
 vKpuh5zotD58D2Qr0t0AS1Nh5iXGql8mBF2/7ZjPZf2+7z/i4f/WcmXlqVkoQFqkZt9j
 AprIBjCtmAc/LxlXFD4tX58lYFU7zZxzKgFpNWdL6ehav4fcfCzgYCF8KdIOPeKO4K1q
 HFZvtTb0i7+tEkLianYZuy8x0+x9A/FMAdZ/Vi9eqLti5aToR6huOu0shV0jXGm787TH
 PCXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=8kZr1rxByNkxMPVyKr7Y5lFL0hfWuti5PLDqMUepXx8=;
 b=vajlz7lOWUyDiEtOJ+a4y9YG//Hx+njwJa2fc3/29VJ7o3tW9XqGpXgkp3AR123G5R
 obA/+eyj71YY69dtvdfUGMthcab8bHyucsqwB/KGOvSAxn8K7ouPKsbLwfQypEgJTDnz
 yiMQRHC3azYgsagiD8Yz4XgsMsfPicJF/8v9PGdcNibuE50pNubgv/0xVNmP4PzedtzZ
 pLkyn56d2WvuqIgUuoFmHXZnHgvshhkrUBNiWLoDi5esevwG2YBA7OfFqTyytkNw7HYx
 aEVh98udeZcn3mmOZm9YhDf/SCtq6GehhYrIYXGZpRfDQPSZ8k5GkzIma4eqezf7VLct
 oSMA==
X-Gm-Message-State: ACrzQf00E/QQFVkDC5pBLO09gPezNKjbaRrE40WYQb/tr0H7HnljxpY8
 yX3KpIKd6HBiGtdpvVsI7N0egA==
X-Google-Smtp-Source: AMsMyM7dbdCYkaWmwzivaS0FEb0uVnCL4AEq6KBg94oPwEGSVT61+6CpLFep3cfcDxzRw15czzjYgw==
X-Received: by 2002:a05:600c:a07:b0:3ab:945:77c4 with SMTP id
 z7-20020a05600c0a0700b003ab094577c4mr22167987wmp.97.1664199548086; 
 Mon, 26 Sep 2022 06:39:08 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a05600c354600b003b47b80cec3sm11918658wmq.42.2022.09.26.06.39.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 06:39:05 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F34651FFBB;
 Mon, 26 Sep 2022 14:39:04 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, mads@ynddal.dk, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 03/11] target/arm: ensure HVF traps set appropriate
 MemTxAttrs
Date: Mon, 26 Sep 2022 14:38:56 +0100
Message-Id: <20220926133904.3297263-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220926133904.3297263-1-alex.bennee@linaro.org>
References: <20220926133904.3297263-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As most HVF devices are done purely in software we need to make sure
we properly encode the source CPU in MemTxAttrs. This will allow the
device emulations to use those attributes rather than relying on
current_cpu (although current_cpu will still be correct in this case).

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Mads Ynddal <mads@ynddal.dk>
Cc: Alexander Graf <agraf@csgraf.de>
---
 target/arm/hvf/hvf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 060aa0ccf4..13b7971560 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1233,11 +1233,11 @@ int hvf_vcpu_exec(CPUState *cpu)
             val = hvf_get_reg(cpu, srt);
             address_space_write(&address_space_memory,
                                 hvf_exit->exception.physical_address,
-                                MEMTXATTRS_UNSPECIFIED, &val, len);
+                                MEMTXATTRS_CPU(cpu->cpu_index), &val, len);
         } else {
             address_space_read(&address_space_memory,
                                hvf_exit->exception.physical_address,
-                               MEMTXATTRS_UNSPECIFIED, &val, len);
+                               MEMTXATTRS_CPU(cpu->cpu_index), &val, len);
             hvf_set_reg(cpu, srt, val);
         }
 
-- 
2.34.1


