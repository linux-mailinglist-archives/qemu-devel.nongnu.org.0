Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CEF33767E
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 16:06:48 +0100 (CET)
Received: from localhost ([::1]:42166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKMtj-0006vT-9Q
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 10:06:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMUa-0003lc-5p
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:40:50 -0500
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:34276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKMUS-0006bE-V4
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:40:47 -0500
Received: by mail-qk1-x72f.google.com with SMTP id t4so20834686qkp.1
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 06:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EsUj7sq9+NLQtwJZ+3yHUWsYmpE8j3VuEo3uruSYCgE=;
 b=py20UqvxhJh+FIvFAI9mq3TUgusl0xUuCs3JDi+FVDIiVBLMS01JIpPcrT5wim3RTQ
 OVQgmnOoBpDItKkmOyU6l5hBdIuJTNQIxDDXhAZqXCqvtaMo4lZGXS/php3Yjpv/pje/
 mLVCbhAWMNpwD2prMnyZPBnZjiT+0N1jhkVQJ1HXrmNsQzZQ2Ic/s/96Wr1Xfd8q41aX
 u9JPXsRWT9DF0j+Le/Ip550k8G2+ccriJZ6lfuofAzrZyitZkDFL5gdYN4KVFpdVkqZL
 HENfREZCUFQVmcYXDHoh6IU/CHBI+184+5k7tAJtRsGTo1m36xbI1rbTf63jwuqGdecy
 /DLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EsUj7sq9+NLQtwJZ+3yHUWsYmpE8j3VuEo3uruSYCgE=;
 b=RPXnJ3KP3EBILF69GeJcvFtsjwQwhdbB6PgQuoJKiN6exsNJieO7+i8efdWl+EF+0H
 qFZThNtfbTDys9L/tJg/3acluAXOD0MMzuVLo+aa4Phqj3fU9h4wgLnocsiOqH3eD9qz
 md4OmPKXCcJiAn80UXyYHTcdgbgfvaioZQQq/UQ2Uv510YzTF4qCl55HPjReBU585srm
 x6MmOIp24TRdXFBbkBI3lPV9nqNXQg2Ef1sU7356AviutyNVE/iuXFC/8V0EY+tXKTL/
 j+f4WHXnU3G0km/4sn5hqQzL1yDmZpxCaw5IgUHQxTjKrawbRRcHzJ1SH6YKHPF/6GXr
 wrrg==
X-Gm-Message-State: AOAM532+Sv3sOoz00I6NvYgj+QeqhxW3o19qN9/wH2uXDtKcHhxOIiWa
 RvvbiQbeFOvsKrDWcxgN75kTUeq7ety3/ssR
X-Google-Smtp-Source: ABdhPJyYozwoTSA7eeuWYf+r5o3VMIhoh/rsnDn/wnGsQ5zuebotzvKFoAvpdfHXwSHpXJRsw5kB/g==
X-Received: by 2002:a05:620a:798:: with SMTP id
 24mr7909654qka.493.1615473640201; 
 Thu, 11 Mar 2021 06:40:40 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id d84sm2070324qke.53.2021.03.11.06.40.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 06:40:39 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 28/57] tcg/tci: Split out tcg_out_op_l
Date: Thu, 11 Mar 2021 08:39:29 -0600
Message-Id: <20210311143958.562625-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311143958.562625-1-richard.henderson@linaro.org>
References: <20210311143958.562625-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72f.google.com
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 707f801099..1e3f2c4049 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -283,6 +283,16 @@ static void stack_bounds_check(TCGReg base, target_long offset)
     }
 }
 
+static void tcg_out_op_l(TCGContext *s, TCGOpcode op, TCGLabel *l0)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+    tci_out_label(s, l0);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
+
 static void tcg_out_op_rrs(TCGContext *s, TCGOpcode op,
                            TCGReg r0, TCGReg r1, intptr_t i2)
 {
@@ -408,9 +418,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         break;
 
     case INDEX_op_br:
-        tcg_out_op_t(s, opc);
-        tci_out_label(s, arg_label(args[0]));
-        old_code_ptr[1] = s->code_ptr - old_code_ptr;
+        tcg_out_op_l(s, opc, arg_label(args[0]));
         break;
 
     CASE_32_64(setcond)
-- 
2.25.1


