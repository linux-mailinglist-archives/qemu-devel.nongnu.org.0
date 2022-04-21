Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 524B150A4B7
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 17:53:59 +0200 (CEST)
Received: from localhost ([::1]:56430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhZ82-0002XU-EM
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 11:53:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZr-00007a-O5
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:18:39 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:35526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhYZq-0006OZ-5O
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:18:39 -0400
Received: by mail-pl1-x62f.google.com with SMTP id b7so5182750plh.2
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 08:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/itFkW+4Funmul04niTFa6ZdVhMkyVOGIfuc98g3ypk=;
 b=G4ykTV+bZjw7GOvdpWA/xB8N2oBMWCqpl6o/3J+AhxBwHv6EecL1OvTK4CJrcV4yDC
 4lGBwIzrs6nJDVGy9NBTjG7wTqBBlP8qQzE8qk1P84YQJdgpl8F5IwdPbe4lyAzB1LuP
 cElI9x6y/yZ+lb33WwxHyJQT6KDEi1zS4xwCM0YyoV2DeroHjAP6squFaF6HTK0Ab+tt
 kUXxQxyGezQvwFSzjF07edvoEXMeo4DB7jhOWzHMIbLMBVPVefb4GGjXOcLbaWXpk4Xu
 dE8WBgzMj4NmNdEExoa4z7LC9nfdRECBOVyDBbVislA40dy6+xOlhwa5KqLp9y3fDdyo
 xJWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/itFkW+4Funmul04niTFa6ZdVhMkyVOGIfuc98g3ypk=;
 b=vptS5TIoxgBfrKuh3lm6deXxQQfL/EhUw0rpilACn0KYTn3qnQDAEU2JQMtqNp5g9F
 8WjpdDlziQ+ObwwyD+BaxfR+bEeuYwOZNZNbgwSSo7WHGrsXlqgLStBhvi1umoacK656
 rwYCQ2Cpj/NmiwGFvPVMpMqplR2aGZuCzAIF6umSnOEplKs2EmYaI6rCtgPs+bbCsm14
 oc9YVDFZ2P91F5ehjEw+fVhWmxR4a8/bHQ3cmgM0rPWUHWqtBWRuWtSuEhPK3FCfa+zm
 e1T8fzVukUJ6Ka0dqWmSHdThtaT+j1TymiSKkNv3VLenkZrZRLtWCqouAKYeXGXjSMBs
 ToRA==
X-Gm-Message-State: AOAM532qALiUjZO3riRghexZs6El8nitypcoRVdDFjzRT969FaJK+mYo
 AVXPttHieOgkoOLSkftV2pPQWAKeDTbBLQ==
X-Google-Smtp-Source: ABdhPJya1Ey1QC/4CcatqjdU/jkX8s8eNMhe/j2QFk0sQ8OINr/LfHmPKam/cjAWgMcrRXy1ouDt/w==
X-Received: by 2002:a17:90a:3ee4:b0:1cb:c1a6:e5c3 with SMTP id
 k91-20020a17090a3ee400b001cbc1a6e5c3mr122093pjc.215.1650554316871; 
 Thu, 21 Apr 2022 08:18:36 -0700 (PDT)
Received: from stoup.. ([2607:fb90:80c8:6cf3:a91a:4957:ba18:ac18])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a056a00241000b004f3a647ae89sm24616248pfh.174.2022.04.21.08.18.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 08:18:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 38/64] target/nios2: Implement cpuid
Date: Thu, 21 Apr 2022 08:17:09 -0700
Message-Id: <20220421151735.31996-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220421151735.31996-1-richard.henderson@linaro.org>
References: <20220421151735.31996-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Copy the existing cpu_index into the space reserved for CR_CPUID.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index b3c5ae681c..a0c3e97d72 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -163,6 +163,7 @@ static void realize_cr_status(CPUState *cs)
 static void nios2_cpu_realizefn(DeviceState *dev, Error **errp)
 {
     CPUState *cs = CPU(dev);
+    Nios2CPU *cpu = NIOS2_CPU(cs);
     Nios2CPUClass *ncc = NIOS2_CPU_GET_CLASS(dev);
     Error *local_err = NULL;
 
@@ -176,6 +177,9 @@ static void nios2_cpu_realizefn(DeviceState *dev, Error **errp)
     qemu_init_vcpu(cs);
     cpu_reset(cs);
 
+    /* We have reserved storage for cpuid; might as well use it. */
+    cpu->env.ctrl[CR_CPUID] = cs->cpu_index;
+
     ncc->parent_realize(dev, errp);
 }
 
-- 
2.34.1


