Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A05372DB06C
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 16:49:27 +0100 (CET)
Received: from localhost ([::1]:35004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpCZq-0003tQ-Mv
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 10:49:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpCRv-0003QK-RQ
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:41:15 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:35503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpCRu-0004u6-4B
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:41:15 -0500
Received: by mail-wr1-x442.google.com with SMTP id r3so20333820wrt.2
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 07:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c7bNvnyceo3xPeeAF05QCJAT5Wp/7viHuY0BxuSz7YY=;
 b=GsOZbuTXB1qrpE+nmi18kBVQ8inhJBEAa62A/ZPgLSDvzDiLcldjr9nlaAptOnaTcS
 s0SXHXIKARUCKZ8IcUMPBAbGPPtzpKKidK9UpcP734u3TT5GwhYd0DpK4ANCy356d5IF
 BDnvigtcasWhwRRdHFLHoi1lLadhhSAuGuWZHGR0q4/7W76EXpC2OGBsetxl3462sGjZ
 pMfD5d/1Bnv7lminVv1Zf3VPIGswIBvb1zxKSuoAqSIUHTFTXzDwiSrFkZHEdAr6EfiE
 5rR+kkiJkTpTXcJcfExIKmB3yS6cyPRaVN8KXnGH8kvFTZaRnmnY/vM5kZgsAcqLYrDx
 LXSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c7bNvnyceo3xPeeAF05QCJAT5Wp/7viHuY0BxuSz7YY=;
 b=h9zO+FfNim4RUb23+4+9DrpZ+CNbxfEWsNXPqM6uJhzvOIYBZoGLTHS1nQtqmHF8Fn
 VLnabWYfVABKA5xsLsfx2dewykt6CRlFKS4cVZTMJ7vPVHlMyUH1LImyimSvtSBFJimZ
 Sy1umepwUz6awBp1gbdUXm7rhR8lCDRhxIJLtzySqY+gMRYVlTu4n9Mb+YdV5PZPxXZY
 ehZSzBtFbWJY1q55o4o4u1N85///oAaOR4dJUV6f9DmgA/62mgWvHM3vM7VBRraaiEuW
 RSq4MQC97OAX55XT/ZTxcG0JzrQYzyTPViqbA3aCYQFn2EL58RxKOqOM+6JXtOMlPjUp
 fs5w==
X-Gm-Message-State: AOAM531//TlqZ+CP/OH/2chtWQNtCm6FjBSnBnDveRkLpkNLFWMGrMtm
 adw3QamZS6+GgEhPGo5Oz/781jqPF5zxdQ==
X-Google-Smtp-Source: ABdhPJzyN88F+tAwjLFOcCstFIwcODWq9AUcuSLCl9vYMKha7cQPKiUXKNXXrhl+TixpZUHKZX7dog==
X-Received: by 2002:adf:f58a:: with SMTP id f10mr22427204wro.338.1608046872544; 
 Tue, 15 Dec 2020 07:41:12 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 34sm38259978wrh.78.2020.12.15.07.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 07:41:11 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/4] scripts/coccinelle: New script to remove unnecessary
 timer_del() calls
Date: Tue, 15 Dec 2020 15:41:05 +0000
Message-Id: <20201215154107.3255-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201215154107.3255-1-peter.maydell@linaro.org>
References: <20201215154107.3255-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x442.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that timer_free() implicitly calls timer_del(), sequences
  timer_del(mytimer);
  timer_free(mytimer);

can be simplified to just
  timer_free(mytimer);


Add a Coccinelle script to do this transformation.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/coccinelle/timer-del-timer-free.cocci | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 scripts/coccinelle/timer-del-timer-free.cocci

diff --git a/scripts/coccinelle/timer-del-timer-free.cocci b/scripts/coccinelle/timer-del-timer-free.cocci
new file mode 100644
index 00000000000..c3cfd428039
--- /dev/null
+++ b/scripts/coccinelle/timer-del-timer-free.cocci
@@ -0,0 +1,18 @@
+// Remove superfluous timer_del() calls
+//
+// Copyright Linaro Limited 2020
+// This work is licensed under the terms of the GNU GPLv2 or later.
+//
+// spatch --macro-file scripts/cocci-macro-file.h \
+//        --sp-file scripts/coccinelle/timer-del-timer-free.cocci \
+//        --in-place --dir .
+//
+// The timer_free() function now implicitly calls timer_del()
+// for you, so calls to timer_del() immediately before the
+// timer_free() of the same timer can be deleted.
+
+@@
+expression T;
+@@
+-timer_del(T);
+ timer_free(T);
-- 
2.20.1


