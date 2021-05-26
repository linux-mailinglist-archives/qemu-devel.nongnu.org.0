Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAB9391748
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 14:23:14 +0200 (CEST)
Received: from localhost ([::1]:55638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llsZ7-0004Uh-1n
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 08:23:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamie@nuviainc.com>)
 id 1llsV4-0001ZX-1F
 for qemu-devel@nongnu.org; Wed, 26 May 2021 08:19:02 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:52146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jamie@nuviainc.com>)
 id 1llsUx-00032d-WE
 for qemu-devel@nongnu.org; Wed, 26 May 2021 08:19:01 -0400
Received: by mail-wm1-x32e.google.com with SMTP id b191so603102wmd.1
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 05:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KfA8qXEUy9bbVVK/akFipulP2A2BpZIpjv1lSajdBSk=;
 b=MrJtjQcW06ZUIL9QbU926bZ+aJOBv0P8zFwQThgWw1iweY40rFyvXSbKwmEBdYVwut
 T80BuEKPokFRIXVpZ0DSSbh2o9PKG8KFPcy0q59MIVtsIs5NbdT9wVnv89Mr3V0ok17K
 8oCIA4Uv/nmQAvOsIg6wZp/vO3U7tFIpacOXtIyU6GE7LFDy3y5ZeNDc1blMhFdgL0I8
 PavNUPsZ/voZg8iRC0eFOoQ1MuGnc9WVieTA9Wkskyq0G+cgAROdAuIGSfM8oa8HKpKL
 cKow6NhOwDnc2yQ0M69iSd9sHjNU5Tnqc32TrJ/TDxAr71Ec0m3Tywmfg/YgaYRS2tTP
 Qd0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KfA8qXEUy9bbVVK/akFipulP2A2BpZIpjv1lSajdBSk=;
 b=kzALPfQ7CqsHEI1TEf6lez70mfxMtyADGekWCL9buYFdihSxtOXKRjqXOHfpm+RyA7
 Ha0yWcERSflhsX3qXnkAbRzHJokXb+qiidvpBsI9YqjUyxeygB6XJq1vGwUoDiDpsVn+
 sKDDv2+L4VpItBODKnjCpHVdYAX5YWYKCZvTz0bz02InLwnEouJJYoF5vXrAF/D7mmcs
 5hNWL2B+dt2UvwUzcZOFYj9d4HssdIMCJVfgxNURhDV3TtKT62ZK1haGJ5WWyH/OyVHk
 WVhtxFn50wKlCji15AO2arEzX/P3KUT4gkMynJm+08Jo4xg9UQO2/pI/YseXxPps5dLx
 ru6A==
X-Gm-Message-State: AOAM5322jp1hdkZkFxsPgke6aC3JAB/B4QtIWbYayFrKEwluMsobwWmd
 S8Tb1BEVADHKamXCxlaQiix9+g==
X-Google-Smtp-Source: ABdhPJzI5BdSnyJ47IrOo52SaPJJ1VIoJOcZyon9OngcA8/PPkjgcTjnXwedjH3LBYph0hfgAxIkSg==
X-Received: by 2002:a05:600c:219:: with SMTP id
 25mr3096259wmi.156.1622031533102; 
 Wed, 26 May 2021 05:18:53 -0700 (PDT)
Received: from localhost ([82.44.17.50])
 by smtp.gmail.com with ESMTPSA id c7sm19811030wrs.23.2021.05.26.05.18.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 05:18:52 -0700 (PDT)
From: Jamie Iles <jamie@nuviainc.com>
To: qemu-arm@nongnu.org
Subject: [PATCHv2 1/4] target/arm: fix missing exception class
Date: Wed, 26 May 2021 13:18:44 +0100
Message-Id: <20210526121847.1935454-2-jamie@nuviainc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210526121847.1935454-1-jamie@nuviainc.com>
References: <20210526121847.1935454-1-jamie@nuviainc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=jamie@nuviainc.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Jamie Iles <jamie@nuviainc.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The DAIF and PAC checks used raise_exception_ra to raise an exception
and unwind CPU state but raise_exception_ra is currently designed for
handling data aborts as the syndrome is partially precomputed and
encoded in the TB and then merged in merge_syn_data_abort when handling
the data abort.  Using raise_exception_ra for DAIF and PAC checks
results in an empty syndrome being retrieved from data[2] in
restore_state_to_opc and setting ESR to 0.  This manifested as:

  kvm [571]: Unknown exception class: esr: 0x000000 –
  Unknown/Uncategorized

when launching a KVM guest when the host qemu used a CPU supporting
EL2+pointer authentication and enabling pointer authentication in the
guest.

Rework raise_exception_ra such that the state is restored before raising
the exception so that the exception is not clobbered by
restore_state_to_opc.

Fixes: 0d43e1a2d29a ("target/arm: Add PAuth helpers")
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Jamie Iles <jamie@nuviainc.com>
---
 target/arm/op_helper.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index efcb60099277..078ed74ab962 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -63,8 +63,10 @@ void raise_exception(CPUARMState *env, uint32_t excp,
 void raise_exception_ra(CPUARMState *env, uint32_t excp, uint32_t syndrome,
                         uint32_t target_el, uintptr_t ra)
 {
-    CPUState *cs = do_raise_exception(env, excp, syndrome, target_el);
-    cpu_loop_exit_restore(cs, ra);
+    CPUState *cs = env_cpu(env);
+
+    cpu_restore_state(cs, ra, true);
+    raise_exception(env, excp, syndrome, target_el);
 }
 
 uint64_t HELPER(neon_tbl)(CPUARMState *env, uint32_t desc,
-- 
2.30.2


