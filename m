Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0024D8B02
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 18:44:10 +0100 (CET)
Received: from localhost ([::1]:33370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTojp-0006KD-Vg
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 13:44:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nTocA-0006rV-AP
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 13:36:14 -0400
Received: from [2607:f8b0:4864:20::62a] (port=44874
 helo=mail-pl1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nToc8-0007sB-NL
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 13:36:14 -0400
Received: by mail-pl1-x62a.google.com with SMTP id q11so14146608pln.11
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 10:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DPs3qyT+uZfNbgHJhAl1/at2oy1K0HPub76v6Xk9tE4=;
 b=lT78N4ZyASJn4M/xrb7b9OkLLWxDz0QxoHI5OO9Ox9NOfu8uUKc7lAZdiW3blDcGZl
 +tR1vHtmNKY5uvuzlGQa9p37s9E7MBgdJQCt7MAcbAeq4CFh1r7HW3tjJTz55lyD8O60
 zsiWsgCWjfa3gnAMTLYQWTyAiflXWqVHaIY3h3fV02Sy9YD25qSzYDzse74DlC/+7mxW
 WENAP8V6eLzeHcC9NBc/LURHJTtT7gxNttK1CYwvYTy8hvUxmTkkZa2Z+BIxd/TcDA+/
 +s8dvdApXjdh2Ekb8VREQRL88I25PTK3TELJnrW13hsPeV11ff0fDXBKinv3ISqliK9Z
 xplA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DPs3qyT+uZfNbgHJhAl1/at2oy1K0HPub76v6Xk9tE4=;
 b=OceOW3lNBrf1+lS6xLau8hglpnXRcKkNRhb61HficZsQawii5zx1TAY7GZPaBvK4Vr
 9nV4+DuG9NukSvVE+QsbZ+GZjDrS/qLdvHbcTV//lvwl3b72GvXQdfX06b9kNlPYq+Nr
 nW/zmYBirEv4SDqVWb6UWJdfiFQkkq/7OBDOh2UvJ560qY9FISe1MNtlgNxYm69fEsdA
 Ggzocn5Kfa3iNhp+zeG6NFp0MZT10CBumKluMgs5AQXYvwexRSDz7PGuIS4nJJ9+Fk49
 ikmOSWoU+92FcR8efgkV1kZhuprqcZk2CtoNwpD3GHjHQC00zBUiB/pr8eU+QUqZkEnG
 GRgw==
X-Gm-Message-State: AOAM531svi9G9UQlbCFSmzz5FbN6N/9sgADMdDwfU2TyIT44yqLJkaVU
 ZJA0L8Hlagqmt1E75yT+6t8m7zT5gMCmMg==
X-Google-Smtp-Source: ABdhPJxTQiaBQIlQvkl4QtSawyhPEH4+X22uzjEA4ABErHURxSXJlxftFEXRx2wU5cbEkvv0ITyAZw==
X-Received: by 2002:a17:90b:314e:b0:1bf:38a0:8e6b with SMTP id
 ip14-20020a17090b314e00b001bf38a08e6bmr380769pjb.22.1647279371139; 
 Mon, 14 Mar 2022 10:36:11 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 g24-20020a17090a579800b001c60f919656sm113847pji.18.2022.03.14.10.36.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 10:36:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 3/4] tcg/s390x: Fix tcg_out_dup_vec vs general registers
Date: Mon, 14 Mar 2022 10:36:06 -0700
Message-Id: <20220314173607.145630-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220314173607.145630-1-richard.henderson@linaro.org>
References: <20220314173607.145630-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We copied the data from the general register input to the
vector register output, but have not yet replicated it.
We intended to fall through into the vector-vector case,
but failed to redirect the input register.

This is caught by an assertion failure in tcg_out_insn_VRIc,
which diagnosed the incorrect register class.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 3b185b3c96..33becd7694 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -2675,6 +2675,7 @@ static bool tcg_out_dup_vec(TCGContext *s, TCGType type, unsigned vece,
         if (vece == MO_64) {
             return true;
         }
+        src = dst;
     }
 
     /*
-- 
2.25.1


