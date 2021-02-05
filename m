Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0FB310CC3
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 15:55:42 +0100 (CET)
Received: from localhost ([::1]:51700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l82WL-00061N-53
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 09:55:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l82Ld-000321-25; Fri, 05 Feb 2021 09:44:37 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:32947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l82Lb-0002Xl-C1; Fri, 05 Feb 2021 09:44:36 -0500
Received: by mail-ed1-x535.google.com with SMTP id c6so9109132ede.0;
 Fri, 05 Feb 2021 06:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i5wyr4PRXVQ5d0pNsqkILJYj5Hv2M/2Enr4o3DvA4Fg=;
 b=bZKD6AwFbpEQGiOLznFufh3bCqr65lgZtxvTNUB7g4ljTIZ1JYjCLk8e14W1uVV+bA
 58MjocnpBUdyfg3IRf53wvmw4VTdwVxnV8xXxRxYt5SPD4FXCd7IAz7JKIj7Sm9hhPYU
 PwIJsN+g7nd9TBw/JgOKeifVM3dLUCZrSPNFqxJ8GL0iu4hAa3KWMlCEcHs7kXzHzyhl
 gvQaL2MQGxux8zI3JknpcGQzA8cwli27uS5DUIyyyOogzNKvJSxqKvoawFIaYpA85TVK
 U7ash/zjWwTsPI/70jgbrQvdYOmUxwWd1gweBFLftRSSJr1+HL+w91dSW3usEYkVP9r0
 ffEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=i5wyr4PRXVQ5d0pNsqkILJYj5Hv2M/2Enr4o3DvA4Fg=;
 b=Ppb0GSF3kQRC+lCccqn8HnCFONbfl/jxgaYdoAHa40Sc/q9gHFJhwlzKd1USzhe4eK
 vnaMycDLdJIWLQH+Jo4gTq7dEb66lpWc2eGS+ctIi+MdjX169agPKVUAxUCQTj6S8n1v
 f4UPWdlduAV+2/lSB/hUCp7Ql6J9Vnlr23FF3SHEn6V/seeYbcRUrIk2jh+NEcUtE0Gm
 6aDjfnQ90gKTGtMce3feQGGspklOUyfaIiJH2MGRTHcwGLL9a71Q54lbYdJdZVaSrmU7
 AjQJomg3neK3A9R7AdFaGE4/uvZN/r3XzoAe9l/6rmw+z41O549LnZ5zKAr3kURaJWll
 MucA==
X-Gm-Message-State: AOAM530eDZSo2wOWjSCszNpOpOafaHFWRbIk6ChILLWLjs/neGxDgPo2
 W4jl1oBZc9YmAKpQl01SV3D/fi3s918=
X-Google-Smtp-Source: ABdhPJye5KJ20GFuxtd8ET/2AAuofbRosb8AVqSHILvFF1z2hno/xpz67vXbf57XS+J7FPgIm8w+1w==
X-Received: by 2002:aa7:de82:: with SMTP id j2mr3811845edv.313.1612536272904; 
 Fri, 05 Feb 2021 06:44:32 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id q9sm4010233ejd.113.2021.02.05.06.44.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 06:44:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 8/9] hw/arm/virt: Restrict 32-bit CPUs to TCG
Date: Fri,  5 Feb 2021 15:43:44 +0100
Message-Id: <20210205144345.2068758-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210205144345.2068758-1-f4bug@amsat.org>
References: <20210205144345.2068758-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Support for ARMv7 has been dropped in commit 82bf7ae84ce
("target/arm: Remove KVM support for 32-bit Arm hosts").
Restrict the 32-bit CPUs to --enable-tcg builds.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/virt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index f5e4a6ec914..ab6300650f9 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -197,8 +197,10 @@ static const int a15irqmap[] = {
 };
 
 static const char *valid_cpus[] = {
+#ifdef CONFIG_TCG
     ARM_CPU_TYPE_NAME("cortex-a7"),
     ARM_CPU_TYPE_NAME("cortex-a15"),
+#endif /* CONFIG_TCG */
 #ifdef TARGET_AARCH64
     ARM_CPU_TYPE_NAME("cortex-a53"),
     ARM_CPU_TYPE_NAME("cortex-a57"),
-- 
2.26.2


