Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA65F4D4868
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 14:51:49 +0100 (CET)
Received: from localhost ([::1]:55604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSJCm-0002dE-Ri
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 08:51:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSI9u-0006yf-QS; Thu, 10 Mar 2022 07:44:47 -0500
Received: from [2a00:1450:4864:20::42a] (port=43704
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nSI9t-0005FB-C0; Thu, 10 Mar 2022 07:44:46 -0500
Received: by mail-wr1-x42a.google.com with SMTP id e24so7741714wrc.10;
 Thu, 10 Mar 2022 04:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xTGQ7M7ENCkwdO0I0QDKcDyvsgi5YVkLnkk13pgEIBU=;
 b=WfLCU/mw4ndJOWTq8w9GAz3u8poNeDILAB6ZbuT2aU/uOBGFOAmBeXT7cSnxlBbFv2
 Qr7+CP3EN8ICyJu/UqtmmLlGNV5aWQFS+2SbprSWcUmWqdNIkGpSLUI2aK3ZFe2tgE4q
 pehzeZwZV3LcsTpWBUkK0wvx8daTUqbtEdvFSdRnmM5bfgWcejHgH9zZqIuwIe7sW3KJ
 i4kg8EKWJjGbM+Nuqd7vcHnQwl+xvroJ/eXqGkF4t6TGiE4J1AdvK7UWmMLFfV/QXG9J
 VCugZd1RvSE9l0QagMQB/1Ann34ZWfkDH3zl1I1UPQrmTXf+QwFrpe+nwfwrE8JJiVYG
 QVQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xTGQ7M7ENCkwdO0I0QDKcDyvsgi5YVkLnkk13pgEIBU=;
 b=uqz+uz2BLw0SsmDa1OjxyV5f9MSYbfVXSOLCCuo+wK2YX5G5Q/gy6EJNRqwsp6ruOq
 UjIEYPWmvdywujhTo3qRzkULdi3VV5BeRgm87ZNzdI+3MoK5uO5tspEWp/dUN5f/7SeI
 q1+9XiZD0hnaKD1e3thhIMUPQuOzDuhIx7eGosSYtlG0lV3PJ8MAQfsHDrq7HNNQ1ACp
 I2BrO3QZ6H7WKhJbjCDrvz+tkVIMX55rJZA5bS/4XV4mUGUgf3wKZchWVAHZxVDr8hyU
 XNnDW11J/CS6eEBRHL9d05rvzttN+ftr1DKGT1mxUgvKeQ1NucBQnutEXKDVuOWKdSAg
 FRgA==
X-Gm-Message-State: AOAM533WHrrU8kYrn+qGaM+4FnxJwUl507ejNjDAlml7JkgX0Ciy1tcb
 aaU+FdA7HyPTiih3l6rHoVTztnc6Dv0=
X-Google-Smtp-Source: ABdhPJyP8vjiq7p6KkC25x8m0CNcOWFoPk2cWpsV2L18GgTa8CtZptr94zJTuCxdHdd7C1NKDiwi9g==
X-Received: by 2002:a5d:6da9:0:b0:202:293e:85ff with SMTP id
 u9-20020a5d6da9000000b00202293e85ffmr3558501wrs.159.1646916283762; 
 Thu, 10 Mar 2022 04:44:43 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 r188-20020a1c2bc5000000b00387c81c32e7sm8063026wmr.8.2022.03.10.04.44.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 04:44:43 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 22/35] /perf/function-call
Date: Thu, 10 Mar 2022 13:44:00 +0100
Message-Id: <20220310124413.1102441-23-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220310124413.1102441-1-pbonzini@redhat.com>
References: <20220310124413.1102441-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: hreitz@redhat.com, stefanha@redhat.com, qemu-block@nongnu.org,
 sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/unit/test-coroutine.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/unit/test-coroutine.c b/tests/unit/test-coroutine.c
index 0b7b4d6ef8..c44287bcb0 100644
--- a/tests/unit/test-coroutine.c
+++ b/tests/unit/test-coroutine.c
@@ -686,7 +686,6 @@ static void perf_yield(void)
     g_test_message("Yield %u iterations: %f s", maxcycles, duration);
 }
 
-#if 0
 static __attribute__((noinline)) void dummy(unsigned *i)
 {
     (*i)--;
@@ -709,6 +708,7 @@ static void perf_baseline(void)
     g_test_message("Function call %u iterations: %f s", maxcycles, duration);
 }
 
+#if 0
 static __attribute__((noinline)) void perf_cost_func(void *opaque)
 {
     qemu_coroutine_yield();
@@ -771,8 +771,8 @@ int main(int argc, char **argv)
         g_test_add_func("/perf/lifecycle/noalloc", perf_lifecycle_noalloc);
         g_test_add_func("/perf/nesting", perf_nesting);
         g_test_add_func("/perf/yield", perf_yield);
-#if 0
         g_test_add_func("/perf/function-call", perf_baseline);
+#if 0
         g_test_add_func("/perf/cost", perf_cost);
 #endif
     }
-- 
2.35.1



