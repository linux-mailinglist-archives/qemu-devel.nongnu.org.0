Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D162DA194
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 21:33:06 +0100 (CET)
Received: from localhost ([::1]:42032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kouWn-0006ew-LJ
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 15:33:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kouUk-0004zl-VR
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 15:30:58 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:52055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kouUi-0007ca-D0
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 15:30:58 -0500
Received: by mail-wm1-x344.google.com with SMTP id v14so14959091wml.1
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 12:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=21KnFkdAMVkSF+cDRYsDtvMiTW+sOKxoFovUdhz8oFk=;
 b=HyoF9ZygFpv3Vr4Lrw80gfm6wFsO371gKij+OqyV4Votevvm1/MTXzv5VmDuXuiVNg
 67z3EZyrlPhIMHAgc3AvwfUPg1gZcy3qwHWIJZdydvExhyJz3OaT6Fmzp2lwcsaa2qMF
 hcfjpVUmUUZRD+eEsWInsPyoFLAuLa4GofMLaIPy70I4vOn8DSMgiLeisLszi7G2tlKF
 QVnjVz9igDZm2rL3qM4Zc2GZn0NmUvbkfzWag64h1LKGhOnegBESUDuAJ9MPtJeq6uvC
 BYvwSLcxAVwVfWKFTz6mHMmQXqzBLapUiV1DDbLww0RgYL/l2CgPxQMx33ai7xrIzf8g
 Zesg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=21KnFkdAMVkSF+cDRYsDtvMiTW+sOKxoFovUdhz8oFk=;
 b=iDqw2FksLe0YEuJGJdvfn22LmJ8FjzTabEYbImburuxsYXBeXPNpwZut3crVRJv8Sq
 WhQr8IHu1dmpJmDgzUG4SOEyobZSv0lGrSzEIzZZe1YPhW7EpOxtxGTilOdPe4CD1R2I
 jwUSa3yk6Xf7iGvkCN3AI/HasOlLvYXAxlPXgnbVxg7Kd2EaC+5JDUymRZBXWqsLlec8
 lU6N2Wm0NM3L0O36y5ylA2j62Nt1OUY8lXwbw0C7hPeP3hlcOiFEsaQ23oardj8/17f/
 /yUDroD+sTZp6sfxShJTAdHFiNRLKPlX9W3J+MEEalFdZXc1hVyRtT1E9HAToJme6KpS
 6XUw==
X-Gm-Message-State: AOAM5333zkMAOwaLm6t5KkMPUSDnkYIpVODWJFp5ANk42EvHy97KWIc/
 /aly5FJHcPme5tZnF3wnqndpXZKk82r2Pg==
X-Google-Smtp-Source: ABdhPJzgQ2e0cFREZH1NzZ3l81olXPlc9xcwlU+hO4wXjgUnXl2IXr32MplAOBBk/7E5n5DhEP2j9w==
X-Received: by 2002:a1c:2c83:: with SMTP id
 s125mr29720858wms.161.1607977854812; 
 Mon, 14 Dec 2020 12:30:54 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b7sm34273589wrv.47.2020.12.14.12.30.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 12:30:54 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] scripts/coccinelle: New script to remove unnecessary
 timer_del() calls
Date: Mon, 14 Dec 2020 20:30:49 +0000
Message-Id: <20201214203050.6993-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201214203050.6993-1-peter.maydell@linaro.org>
References: <20201214203050.6993-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x344.google.com
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


