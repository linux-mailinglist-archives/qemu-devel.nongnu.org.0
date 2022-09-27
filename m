Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A67885EC831
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 17:39:27 +0200 (CEST)
Received: from localhost ([::1]:48250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odCgA-0004AN-Es
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 11:39:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odBMe-00053y-OH
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 10:15:13 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:40639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1odBMb-0005yp-N5
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 10:15:12 -0400
Received: by mail-wr1-x42d.google.com with SMTP id x18so15215703wrm.7
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 07:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=tuxNv9/88S7ezaeS7QVX6RVgPFquMHRDAzKT6wAF58Q=;
 b=TU/IHbgsBWvhI/LiwObqBNrJ635QK32n5ZKe0vWT486YUFn3wClp0UI68x8IpSuq3A
 T1SYm6oLvS2GKcYVQ1Ubm1MGn27HOlxfz4xxGUO72N76tuKBv3oL9ycNs+gG3OTO2PC6
 2J94kplvKI6gjfqci5btZav6f3CooHxcd5QSu+1ar3y9G6JGQIzLPn2jWAju6/Bp1dPh
 bP8S7j36zl5Ksh61EEExHEG2NezJNosmr/cXF8+wircmAM9DVV7h5OOH7iL3Gsb/IP1V
 IHiGUDMgWAU/W5HX2IAybtTe0hAniuPHR7LfJ7/X9OVC7lVz2KB0BZ6hz4QeqJq4eiHf
 /xzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=tuxNv9/88S7ezaeS7QVX6RVgPFquMHRDAzKT6wAF58Q=;
 b=caCX2UuNFNJAhGn/t1xFHrHDBdETSjMFb1Lg4PyE00nFSAmZLMRu5bexgXyBqq4Zhk
 EPN1Iet6Aq5TG6FOEfFMiYegKTwSvSIFElbK+kqpID8po57wWGePhKmZnQQ2jUj2dD/c
 +J8SgYl1J3BkpLdk1GCF1Bq1VTgwEzjzCkBOML12KJC8uONe9HcZhkK1GwG0U+AkNe4b
 M4p5ioqhON2tAcJyzDoBhb5fa2ervQy9GZ1Ee3GzcEbRPWNXcbshc6ldxAoGWZfa/mLw
 l1FI/gdPs4hSHWkyjRVB49yz8LhH/WVVhpVdbuedg6WaYE2bX/D773mgTnoPYbyrExEO
 ymPQ==
X-Gm-Message-State: ACrzQf12k26/FQxC68XKk3dVARqPQb1cGFTP3GG2FFdcyGUqYur2aFQU
 JFhgaPWE11xASxfRRcgY0Blv8A==
X-Google-Smtp-Source: AMsMyM7bYGQoPW806GzbntY5LQ+v2RxdYyH3CB0vzNfvUGGyjkFlfWesdVOQa7kPUn7zO4Lt2vWSXA==
X-Received: by 2002:adf:f18d:0:b0:228:9f0a:f291 with SMTP id
 h13-20020adff18d000000b002289f0af291mr18117532wro.252.1664288107948; 
 Tue, 27 Sep 2022 07:15:07 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 p2-20020adfce02000000b00226dba960b4sm1983711wrn.3.2022.09.27.07.15.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 07:15:06 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9F8E71FFBB;
 Tue, 27 Sep 2022 15:15:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexander Graf <agraf@csgraf.de>, Mads Ynddal <mads@ynddal.dk>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 03/15] target/arm: ensure HVF traps set appropriate
 MemTxAttrs
Date: Tue, 27 Sep 2022 15:14:52 +0100
Message-Id: <20220927141504.3886314-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927141504.3886314-1-alex.bennee@linaro.org>
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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

As most HVF devices are done purely in software we need to make sure
we properly encode the source CPU in MemTxAttrs. This will allow the
device emulations to use those attributes rather than relying on
current_cpu (although current_cpu will still be correct in this case).

Acked-by: Alexander Graf <agraf@csgraf.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Mads Ynddal <mads@ynddal.dk>

---
v2
  - update MEMTXATTRS macro
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


