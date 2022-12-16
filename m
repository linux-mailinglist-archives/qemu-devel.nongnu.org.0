Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1DA64F430
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 23:33:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6IpF-0007s1-6x; Fri, 16 Dec 2022 17:05:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Iot-0007hM-Au
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 17:04:45 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Ioq-0005EX-B5
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 17:04:42 -0500
Received: by mail-ej1-x62c.google.com with SMTP id kw15so9210375ejc.10
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 14:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b6XVltRxKK+Iiw2FnUeIqN6W0oZMrnhMzv1AL8xsjzw=;
 b=DBQHO3QBD1AUyKyJqnkqsOhQUI51KHZWId4ict2/0IPbti2e/RDlHt4RQGHQkBI9Xz
 mwYkWLBLQ+uSsWnNd5fu8eP92oYB9Hu4KjPOamoCe0bnSQhxbQgA1NlKleQfAraLvThp
 JwTREePzdFAzLRWy5MoHsZu215rufbTRPPF63E27z2fbPcsG3jnf//8V+dIGK9a4LRgz
 q3BJyNyddWym5MVux/ctAqpM47y50uPL+nkpsRvUUfJrNJG6P6TRowBq4BLAPz7gv0xD
 kFjXmgXX59KyEXx/ZdYBtoBIuOarPGZsUjgbctrWPaGKS7deOg7iXjIv4nhn5k9AnYAT
 vnTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b6XVltRxKK+Iiw2FnUeIqN6W0oZMrnhMzv1AL8xsjzw=;
 b=2fjehCix7VGDUfI8L/SEYENPxQAWyXMpz2Fya0oNimnlgqy2x0J2QSZVlvRQPidnyk
 T4Acy7noUMUbvNQP8m83fyeWCAafBXMpDbI29PqJ2/1FwweliAv+baY5LgLSmencg46u
 3IqJCnaRGkD/n+7ZIfSPNTn+KBjD2qpLJ+SLme9MuSJ4wvOvhRdFYPqv9UqDD+yE14h9
 rxUnTzDdO73o0+iAa3Sm13lrr1mmhYKctfU4Po8yv0ak6DK40rSDcnZX34Yrqufh3nqW
 m9Deti8jYElNg6L+it4/8hn/Mv4b4/R1WH+BdKMz34A8Bhahsl2iC35oYWCDbnvmEnj2
 AFIw==
X-Gm-Message-State: ANoB5pm8hLYJeOV1lW1MXQjcManob9CDhsowlrELpg5dPXGQJg5l6A+P
 UtWd85uegaGCU9IS8IL42vrfYCHISemli+3XhFI=
X-Google-Smtp-Source: AA0mqf7+/pw2dylZ3yAILSCzSMIl6KzqEMW08UDBdA4Klh/CeZmTDZ5O5omSshyuov2dn32/R5xfuA==
X-Received: by 2002:a17:907:f8d:b0:7c0:f684:9091 with SMTP id
 kb13-20020a1709070f8d00b007c0f6849091mr14812869ejc.11.1671228278463; 
 Fri, 16 Dec 2022 14:04:38 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 q23-20020a17090676d700b007c1175334basm1288832ejn.78.2022.12.16.14.04.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Dec 2022 14:04:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Farman <farman@linux.ibm.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Xu <peterx@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>
Subject: [PATCH 4/5] target/s390x/tcg/misc_helper: Remove unused "memory.h"
 include
Date: Fri, 16 Dec 2022 23:04:10 +0100
Message-Id: <20221216220411.6779-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221216220411.6779-1-philmd@linaro.org>
References: <20221216220411.6779-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/s390x/tcg/misc_helper.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/s390x/tcg/misc_helper.c b/target/s390x/tcg/misc_helper.c
index 71388a7119..576157b1f3 100644
--- a/target/s390x/tcg/misc_helper.c
+++ b/target/s390x/tcg/misc_helper.c
@@ -23,7 +23,6 @@
 #include "qemu/main-loop.h"
 #include "cpu.h"
 #include "s390x-internal.h"
-#include "exec/memory.h"
 #include "qemu/host-utils.h"
 #include "exec/helper-proto.h"
 #include "qemu/timer.h"
-- 
2.38.1


