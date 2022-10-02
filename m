Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 070505F244C
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Oct 2022 19:36:18 +0200 (CEST)
Received: from localhost ([::1]:37492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1of2sy-0005Tr-Kh
	for lists+qemu-devel@lfdr.de; Sun, 02 Oct 2022 13:36:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1of2nL-0005SW-T5
 for qemu-devel@nongnu.org; Sun, 02 Oct 2022 13:30:43 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:36805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1of2nK-0006At-5G
 for qemu-devel@nongnu.org; Sun, 02 Oct 2022 13:30:27 -0400
Received: by mail-pl1-x62c.google.com with SMTP id c24so7903162plo.3
 for <qemu-devel@nongnu.org>; Sun, 02 Oct 2022 10:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=K4fJO7OxtAxIix/bw/qT/yaLWfwtHR6M9qzaQp11iAY=;
 b=t2dAyais5qFlGKcI1TsXl/9qM9Sk070Y8cxzvqFJurc+zVSZh6FoUXB/rW9IIF/g/S
 y83umyNgylhcdq/qWI1xHWAeapoDCNT8+u5VeBFGNrq3dboGtxnSoWAdz+3UM1aX8aPT
 9X82jBXVToMRYlBRbODt0zxrfmVvqnbBMbTx6BPtGrjbZXTToc9urgI0LoVpM6IqZM3U
 L65GH0wmZ2J/oiix5cXCH0Jauu42Os0MkbH/SFyhwt4UrvZQ0HUD2CLvoeMPmuXpe6oU
 IMFg1NF6MXb+SMoRY8wI7OCqN7fgkiI7U05TMkOG9xC5YRY8XYyhegQbh9m45qe936/2
 Eiow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=K4fJO7OxtAxIix/bw/qT/yaLWfwtHR6M9qzaQp11iAY=;
 b=Lu8StS2VxIcBeALGLUzCyqVRUfAbhAm1noPZY9kAV/Z2zdZcuN84av39acTILLA7fk
 PQZ0gPfiqgBzgE6Mr4gq28qK1OmAY/xyNef3tL/A7TS4sI/uiG8z5t9u3bhTro9tGOcx
 bHuA6ocmr9fE9aftMUGRSFb7sr6N67wRlhZvsT7mCgNcheD7N/RuetckCbRsqLyQXZY0
 iMVmsBPZvrun16iZZesOFcJntjjbAWFA6KteDNZbB1rFRV5xV/1JUhjFc0tdeyDA+Ko5
 Gn6W571KyfTcHVbIRAl0xgcFRiM9AQBBvHQuFyRxTmvuv6ZjLGg/T1NQ134fiJqPwWFb
 WCMg==
X-Gm-Message-State: ACrzQf06H3YYVQH/qC6jGEguyhPkiNnrm31nF7b4m2gGGoPlXJTh4T16
 OW8INse0uDrroIgbuTVwFviR4/K+VxxyKw==
X-Google-Smtp-Source: AMsMyM5ZFWzyqDEZs3gQCKBzN+s49r0TFeNnzerGjJyMAtWcnR4+kFvvxouAejz9I1oTPogSlP4v9A==
X-Received: by 2002:a17:90b:3ec1:b0:203:7c2a:af00 with SMTP id
 rm1-20020a17090b3ec100b002037c2aaf00mr8268986pjb.246.1664731824604; 
 Sun, 02 Oct 2022 10:30:24 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8002:3cad:72cd:dd96:98f6:c3cf])
 by smtp.gmail.com with ESMTPSA id
 135-20020a62168d000000b0056025ccc3bbsm2749783pfw.146.2022.10.02.10.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Oct 2022 10:30:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v2 0/9] target/i386: Use atomic operations for pte updates
Date: Sun,  2 Oct 2022 10:29:47 -0700
Message-Id: <20221002172956.265735-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

Use atomic operations for pte updates, which is a long-standing
bug since our conversion to MTTCG.  Modulo rebase, this has one
change from v1, which is the new patch 9.


r~


Based-on: 20220930212622.108363-1-richard.henderson@linaro.org
("[PATCH v6 00/18] tcg: CPUTLBEntryFull and TARGET_TB_PCREL")


Richard Henderson (9):
  target/i386: Use MMUAccessType across excp_helper.c
  target/i386: Direct call get_hphys from mmu_translate
  target/i386: Introduce structures for mmu_translate
  target/i386: Reorg GET_HPHYS
  target/i386: Add MMU_PHYS_IDX and MMU_NESTED_IDX
  target/i386: Use MMU_NESTED_IDX for vmload/vmsave
  target/i386: Combine 5 sets of variables in mmu_translate
  target/i386: Use atomic operations for pte updates
  target/i386: Use probe_access_full for final stage2 translation

 target/i386/cpu-param.h              |   2 +-
 target/i386/cpu.h                    |   5 +-
 target/i386/tcg/sysemu/excp_helper.c | 706 +++++++++++++++++----------
 target/i386/tcg/sysemu/svm_helper.c  | 234 +++++----
 4 files changed, 581 insertions(+), 366 deletions(-)

-- 
2.34.1


