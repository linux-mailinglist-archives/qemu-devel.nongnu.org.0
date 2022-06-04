Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E56353D521
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Jun 2022 06:09:31 +0200 (CEST)
Received: from localhost ([::1]:46318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxL6Q-00020W-4J
	for lists+qemu-devel@lfdr.de; Sat, 04 Jun 2022 00:09:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3G-0007VR-GH
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 00:06:14 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:55160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3D-0008Uy-Aq
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 00:06:14 -0400
Received: by mail-pj1-x1035.google.com with SMTP id j7so8692071pjn.4
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 21:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=seW1fdhWGUT/3IrTFxKp5B2hwNwp/rzz5mP3cAVntBY=;
 b=SymN1ePsZBXi06F47vvZUNr8xIyDLmgnBBI5aqIRirMYWVgJCqogHvZijjTulOzTBD
 hBb8/dJMqe2WXZW2oxA0VM0PBAqHm/PTwUB3d45pxZDaEthRziR8LHjj9ZXAcJQQ47aC
 pK87gbf6kUlrv66ClyITqltuD+mYyZYzC/Tak00b7mAlIQLroifDqfvFZPDaw01rVu16
 WcBI0y9HKnsXCrPszfp1l3M0v674jwA651uTwOOA/osTxG4vqbptN9jUfduUy0OJd8ck
 VB4RxfpJOcbYf/vi6iR2JJMqcdaTFrf3SV+6UtXy6KvZ8JBu/OVVIPWMYd6rfpV7BWzH
 9X8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=seW1fdhWGUT/3IrTFxKp5B2hwNwp/rzz5mP3cAVntBY=;
 b=vaSmkha1FX4i42m1QWg6avoHiJkebGIhQz5AWDdm2nwsqo4Uus9zQ7/gpkh01r85bE
 YryOVOiggLS62rYLPwSPGXuJ1auCzadYnzKpkuNgyJDlyWDxtqy8N5kHaYGXKCv3Fqq8
 h0I2LjucbEluUk6DZ0vEPKOwHLvaxX4mSa31qQlSMVvotCn7ZHiK7C0dTvdTEDpShUQQ
 YOyIwDhR451uHolkM/D6cNWmfC3HTqRqmUvEfZ2MiBrtHO9mA/kwWvRi1OT5YjVJku70
 CDPoiNeQkXfpLj/zCqs2MzHFiZ/1WFd/qLS8NwUaq/WOXQYJhKtr01BsoK5meHdJmCj1
 T2kQ==
X-Gm-Message-State: AOAM531xZIBNmmXMJpLuLaTTWf3wbvjsagUdVWdLSYxnuMh4P046G2g7
 SagqTZ2aIlUnun68wiShH73YEZ8SGgzlRQ==
X-Google-Smtp-Source: ABdhPJyy8p66992L9YVH8CrD1YN4Njtg2z+/ANWSTInX/esGItb45rnipLC9wQtyZhEGepbO03sAAA==
X-Received: by 2002:a17:902:bd09:b0:162:1497:de0a with SMTP id
 p9-20020a170902bd0900b001621497de0amr13103332pls.64.1654315569560; 
 Fri, 03 Jun 2022 21:06:09 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3286:cc26:3d5e:3f94])
 by smtp.gmail.com with ESMTPSA id
 a37-20020a631a65000000b003c14af50626sm6093779pgm.62.2022.06.03.21.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 21:06:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 00/28] target/arm: Split out ptw.c from helper.c
Date: Fri,  3 Jun 2022 21:05:39 -0700
Message-Id: <20220604040607.269301-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The object here is to move 2500 lines out of helper.c.  Yay!


r~


Richard Henderson (28):
  target/arm: Move stage_1_mmu_idx decl to internals.h
  target/arm: Move get_phys_addr to ptw.c
  target/arm: Move get_phys_addr_v5 to ptw.c
  target/arm: Move get_phys_addr_v6 to ptw.c
  target/arm: Move get_phys_addr_pmsav5 to ptw.c
  target/arm: Move get_phys_addr_pmsav7_default to ptw.c
  target/arm: Move get_phys_addr_pmsav7 to ptw.c
  target/arm: Move get_phys_addr_pmsav8 to ptw.c
  target/arm: Move pmsav8_mpu_lookup to ptw.c
  target/arm: Move pmsav7_use_background_region to ptw.c
  target/arm: Move v8m_security_lookup to ptw.c
  target/arm: Move m_is_{ppb,system}_region to ptw.c
  target/arm: Move get_level1_table_address to ptw.c
  target/arm: Move combine_cacheattrs and subroutines to ptw.c
  target/arm: Move get_phys_addr_lpae to ptw.c
  target/arm: Move arm_{ldl,ldq}_ptw to ptw.c
  target/arm: Move {arm_s1_,}regime_using_lpae_format to tlb_helper.c
  target/arm: Move arm_pamax, pamax_map into ptw.c
  target/arm: Move get_S1prot, get_S2prot to ptw.c
  target/arm: Move check_s2_mmu_setup to ptw.c
  target/arm: Move aa32_va_parameters to ptw.c
  target/arm: Move ap_to_tw_prot etc to ptw.c
  target/arm: Move regime_is_user to ptw.c
  target/arm: Move regime_ttbr to ptw.c
  target/arm: Move regime_translation_disabled to ptw.c
  target/arm: Move arm_cpu_get_phys_page_attrs_debug to ptw.c
  target/arm: Move stage_1_mmu_idx, arm_stage1_mmu_idx to ptw.c
  target/arm: Pass CPUARMState to arm_ld[lq]_ptw

 target/arm/internals.h  |   23 +-
 target/arm/helper.c     | 2555 +--------------------------------------
 target/arm/ptw.c        | 2540 ++++++++++++++++++++++++++++++++++++++
 target/arm/tlb_helper.c |   26 +
 target/arm/meson.build  |    1 +
 5 files changed, 2590 insertions(+), 2555 deletions(-)
 create mode 100644 target/arm/ptw.c

-- 
2.34.1


