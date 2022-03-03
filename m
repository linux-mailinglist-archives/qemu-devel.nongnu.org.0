Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1474CB547
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 04:16:01 +0100 (CET)
Received: from localhost ([::1]:38104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPbwe-0001VY-Hc
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 22:16:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPbsW-0006x8-Vm
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 22:11:45 -0500
Received: from [2607:f8b0:4864:20::1032] (port=41655
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPbsU-0003X4-7U
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 22:11:44 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 ev16-20020a17090aead000b001bc3835fea8so3677347pjb.0
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 19:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DPs3qyT+uZfNbgHJhAl1/at2oy1K0HPub76v6Xk9tE4=;
 b=OfS4Ns3Mg0VEHvFW7Pm7KFSx9SCEqPhSAoL/AEMZB6yLObtcQoXwAmOwn8seYE8GoC
 5w8trA/rrLS1Hba2l7UwfINbGpsp6qQ359G0gnuDWK2CpRtdizyq5i9GKhiHAw+Obp3k
 vxPr7Klwl1kv+FulCwFekMVPJ6jGI21ACVGnkU2gNPqAfuR9F+gvW/SW8FCFiy5kIjWy
 t/cP6GpQMAkTv67JjwiFfbIKT+5cYQ96KL473k5JaGtbuzBkYyDueL74/FolWzcsK0YV
 +uhq+mAPv4MWsU3RZHZI4kDhchnHxwjX7i5O5RO4CsSBjdSqHK+R1fUhSaBH62fwVvc0
 NCjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DPs3qyT+uZfNbgHJhAl1/at2oy1K0HPub76v6Xk9tE4=;
 b=ida7WF4WfOhOzGp4lHpGwZQyGzwLM+MrOX5sPzBJY6jx8HhIRCS3+VTtjJ5KuuTHc4
 f2KdbYd1rPHDanwJJYR+NEtSAIFOq6eOLy+yG2mfUP7jmfPublmvORbDxBZHPHDoYjil
 2cbUqdz6K0JnKR0rJ5KUPRuYEqNRadFxi1Q9A/na9YYyMl/qJ6bwm3MevvHzfM8H++Zr
 AYT6l69z6DTpzMFM48SyTKcyttcRSXbvoM8gKpxSnIF803Q3uY8NitQF13RkVxh+miA3
 GUo+jhBgLMQko7wXyoWx3Tl8UW9nusWdVHof9s3AMLWwNZB9wRwWXeAOyjSY+P2PfFns
 P64w==
X-Gm-Message-State: AOAM533m62h6gDAKvuEtbBpSFYJcZtyDTvfj+YhKz6SNp71vrj1FDZKj
 T3rTI1Mw8YUdRf5JTfG5yoTH3zbDq+aCGw==
X-Google-Smtp-Source: ABdhPJxT0H3GC2Atls+ti5Qt4igH25votxbUyb5ElPQtXrl+W9Ons3qk8PsALKataGlIuKrAxbuJAw==
X-Received: by 2002:a17:903:230f:b0:150:a2f:e070 with SMTP id
 d15-20020a170903230f00b001500a2fe070mr33897186plh.139.1646277098726; 
 Wed, 02 Mar 2022 19:11:38 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-e819-4400-f268-c391.res6.spectrum.com.
 [2603:800c:1201:c600:e819:4400:f268:c391])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a056a00170700b004e01663f59bsm605789pfc.117.2022.03.02.19.11.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 19:11:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] tcg/s390x: Fix tcg_out_dup_vec vs general registers
Date: Wed,  2 Mar 2022 17:11:32 -1000
Message-Id: <20220303031132.444233-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303031132.444233-1-richard.henderson@linaro.org>
References: <20220303031132.444233-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: qemu-s390x@nongnu.org
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


