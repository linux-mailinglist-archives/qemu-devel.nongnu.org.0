Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0D739A592
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 18:15:46 +0200 (CEST)
Received: from localhost ([::1]:41038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loq0X-0008Ds-AD
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 12:15:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopkf-0008Mj-07
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:21 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:42683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lopkb-0006s8-1f
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 11:59:20 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 o2-20020a05600c4fc2b029019a0a8f959dso4008968wmq.1
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 08:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=e18UyqU2eD7I5G09WnQcZF/NFS28TUDyqVO+oXWqCrE=;
 b=zrhdj446QonT4WtFtWW0XFMA75zadna0J164675iGPNO/quBER5LsR0K950FD/lYxe
 6kMZ1cUo79F0SA7TYI+5ytytJ/kxZo1JKNFoEmFYbdDCpGIiQZnQeWBPgRzPufRgdmPc
 UsmCNerAyMdJBfrOc6CApZvUNpUlowtB7nXxhykbHRMd4UKUtSi87PiD7Fcpapqpq3F+
 HFtjGecktXZutI5m2XC2vrKQSSiDC5kubuwmyolYrME92kPLknEUJnPM89zgPN9xUH8V
 rkorimTJnq5/tr6sI0InwFXLOI2dJxl2ohrzhoBm7dcpKvhKpK33HGmcCn/h/ywWiDGp
 RbOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e18UyqU2eD7I5G09WnQcZF/NFS28TUDyqVO+oXWqCrE=;
 b=VTB1Vc7aGHOJR+JpujXIqNbb78IqaTODlL3mIsVxWS3+vnjdwvK8HhwxdCS9f/U3oM
 tqnsHfcLHFpOcF8jrt8A4jefshHJAdW+ki+O4xNg6w0mf47YEYMS46oi02c/iwUN/kjn
 vNdfGDaZGkK0Ngxdc8DhMlpqPxVmvdKq8E48c8RVxIIi2Whzexi335ffTsdAbzjCOK/S
 XWRApA9DcNfwyIpsG/Wv+RlLEis0zIi99U1VfUT/Kr9RCNLmFE8C8iRnYOPlIuFfpyJh
 1qAzt5X8+A/nwuY/9s+GEEtu2x1Ghcml/KUo6yGE06adP6+a6hBnmWWR4JyXzCgTez9I
 IUvg==
X-Gm-Message-State: AOAM5328tAv3clmxNNlxt2608bPAIwy3FFSnrOp4GGGoTcwWZ56nXroF
 kK2VQjjNOpkOGVNP9XyI5dqTATDNHmf1a/tL
X-Google-Smtp-Source: ABdhPJx8Yb7iWHsfO9y1IUemPQYVpcgWElIssd2UdOH5FEYh58rrl59ptVBEhQ0Ejr2SPQnJWyZDMQ==
X-Received: by 2002:a7b:c210:: with SMTP id x16mr9608354wmi.105.1622735955505; 
 Thu, 03 Jun 2021 08:59:15 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m7sm3856470wrv.35.2021.06.03.08.59.15
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 08:59:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/45] target/arm: fix missing exception class
Date: Thu,  3 Jun 2021 16:58:31 +0100
Message-Id: <20210603155904.26021-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210603155904.26021-1-peter.maydell@linaro.org>
References: <20210603155904.26021-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jamie Iles <jamie@nuviainc.com>

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
[PMM: added comment]
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/op_helper.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index efcb6009927..1a95972bcc5 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -63,8 +63,15 @@ void raise_exception(CPUARMState *env, uint32_t excp,
 void raise_exception_ra(CPUARMState *env, uint32_t excp, uint32_t syndrome,
                         uint32_t target_el, uintptr_t ra)
 {
-    CPUState *cs = do_raise_exception(env, excp, syndrome, target_el);
-    cpu_loop_exit_restore(cs, ra);
+    CPUState *cs = env_cpu(env);
+
+    /*
+     * restore_state_to_opc() will set env->exception.syndrome, so
+     * we must restore CPU state here before setting the syndrome
+     * the caller passed us, and cannot use cpu_loop_exit_restore().
+     */
+    cpu_restore_state(cs, ra, true);
+    raise_exception(env, excp, syndrome, target_el);
 }
 
 uint64_t HELPER(neon_tbl)(CPUARMState *env, uint32_t desc,
-- 
2.20.1


