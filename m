Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D67312FBB59
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 16:39:31 +0100 (CET)
Received: from localhost ([::1]:42104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1t6P-0007EX-QU
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 10:39:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sfI-0007lQ-Uy
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:29 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:41225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sfF-0001Hl-BF
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:28 -0500
Received: by mail-wr1-x42e.google.com with SMTP id a12so20053833wrv.8
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 07:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=N9/jfC0RGgmKeeG5Rwr+eyqipbrTQHZCgzzexTT34b4=;
 b=oM6/OIDMbP8Ejb+3Lx6DsVJUgfjLvevjHdxqxCsdHVUqXOTMWufWnsoyukw8SdYxDk
 GcJ9ZRXejtykMSgsYOK0WcasVz6muDETbLvdmViuV0zwC0g64LvoowsdQYaFIVRk5jgA
 /YI8OExSa/oGNPA3N1nbSO+DumYxLxih8donLDQpG8z6UWrH4SIv7ul7Ay7CHYmKVMbN
 Yq/llem/4TdYeZA1Snb4Fd+WeoHVmI4clYlnD71lzOIKetYXGQC4knQUNoyUYEhS6nRy
 6hvzAJLqgRm4tme/cplDrGo4NspJkvjn64u1BEJTqHEnMq56zJaeGB/1R0EQin7L8+A3
 zIyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N9/jfC0RGgmKeeG5Rwr+eyqipbrTQHZCgzzexTT34b4=;
 b=Ukzt/hPLIpKRO9HdUSWHHlj2CfDcyZeDzSKsB1t5oiQQKaaD/PioAHV8SWl008TIBf
 huX/b7ezp4RP8IVDm0m6ftK1r4q6FiyJLoiRqA5QX9kO/oH2HnTfoUlSzslUuPZuQ3HY
 iW9kCcTqqzIGm3yB7kxLgAXAbaT2cAMCeNo6Z+i9BTjtoG/F9ay7JnzzU4tF2QNpRRvc
 9IPaoyUMABvfNtqc1UkY5M1r5mYFKudynVtEKzNJfA0b+Wi1Qg2qRp/uEmC09X1sWxmT
 KRm1ZDE0M2UmvlMiac0IcvPfvwyyJvzoZCMiaobpeRRR67h19wi7TL8/MJnbOIkcNpEZ
 2GfQ==
X-Gm-Message-State: AOAM532mwNWb1lhfTsnPg3e8e1+Y1/zy/R0f+HGVOXSikKBn5knec9DE
 arTVLaDydmpidfVRbEo/763cwKGoCpH+bg==
X-Google-Smtp-Source: ABdhPJzBR94JlX5hOPwtRSpgck2cooVp6100GNKEiSeWCQ1r7wdLePlCWxwtf5al4UGHdOIpQNEGjQ==
X-Received: by 2002:adf:9dc4:: with SMTP id q4mr4745086wre.367.1611069083852; 
 Tue, 19 Jan 2021 07:11:23 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a184sm4843699wme.35.2021.01.19.07.11.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 07:11:23 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/33] target/arm: enable Secure EL2 in max CPU
Date: Tue, 19 Jan 2021 15:10:52 +0000
Message-Id: <20210119151104.16264-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210119151104.16264-1-peter.maydell@linaro.org>
References: <20210119151104.16264-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210112104511.36576-18-remi.denis.courmont@huawei.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index dbd06ccc24c..5e851028c59 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -665,6 +665,7 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
         t = FIELD_DP64(t, ID_AA64PFR0, FP, 1);
         t = FIELD_DP64(t, ID_AA64PFR0, ADVSIMD, 1);
+        t = FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);
         cpu->isar.id_aa64pfr0 = t;
 
         t = cpu->isar.id_aa64pfr1;
-- 
2.20.1


