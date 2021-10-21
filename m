Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3109343665A
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 17:33:50 +0200 (CEST)
Received: from localhost ([::1]:51454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mda4j-000230-5R
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 11:33:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdZx4-0000CE-KD
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:25:54 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:38887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdZx1-0002Sg-I3
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 11:25:54 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 o4-20020a17090a3d4400b001a1c8344c3fso1280670pjf.3
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 08:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MN2J3vMWpFDS9vALOoHKYzaMrPkmzkSrC3GEzqF6qxU=;
 b=cYZT3A8t3ZmAD9mszOecnDYNoVM24+SFeMb6YIqLwTFAKxzOJgElGfVNVGaDX0nNLT
 Ra201vBzXRMm0XZ7w7/mQbhITELXqw+2+s3f3N40ODWQAMroRzI6zNCytZX2vL+0Bi3n
 vGI81zTk+AHAxgGI/LqX6dH7KvRwrzBBraw3ST3E9zRWfdAXdoHhz48e0zqVq4mcKwdO
 nnskRkc2S406po3GHPCX7jLPEq8XZ5MCI7SBUbE56WJIfYkUYjRJNDGLLKh9mtjbP+tK
 EadHoLgO+Z21G00Yh5NOJsiyngzghgLAyuTf/UiMnem8NkCiBNxCml8raqSd5WH7OzyY
 H9+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MN2J3vMWpFDS9vALOoHKYzaMrPkmzkSrC3GEzqF6qxU=;
 b=kjIt0p2gevl6ozpTHIe5iK4YU6Du1NxLRYR4g1MuiwWZz/hiN2Im5Ro8Y0MG8Y7dr2
 tyQdXJcUv4+MIp33QTpGm4ICmF105GZ9CU6Al76YwRcI4ky9VotOiDA18MDH9NXt7W1f
 iW/yZ7P/zd0ODlZh+q+u7MU5m8do/NSW7vWzpR+S+X/wYyVTNgMjT2JibfQTwnZvUpfv
 9OHAQpfjZSBpBxr7wFtGQgzLGb6UJwe5ulbhNpE9ZRIrOT+tCaEnmIYY8K1x0HsfCOmu
 /nkwpYISXiO/Af+2X+wbOSsyncpbTPmSdYrr5nKERsCIgr9V3j95Vf/pM9avIJPAr5te
 ieYg==
X-Gm-Message-State: AOAM530NuTzAd5nj3GpECjsyw2DNee+J+WSA8JHVdgdR/sLa9XHz1ZuG
 S93XGBuegcPtOvEr9qNJ7202KZpwYRxZSA==
X-Google-Smtp-Source: ABdhPJwGTtGZwLEn5eSbHKWqtR6ohtOlop1F0W7UvHRjE8i7eF383YzxERGT2//rkLLIZHk09r3rfA==
X-Received: by 2002:a17:902:bc4a:b0:140:82c:646e with SMTP id
 t10-20020a170902bc4a00b00140082c646emr2091773plz.84.1634829950335; 
 Thu, 21 Oct 2021 08:25:50 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y3sm5676257pge.44.2021.10.21.08.25.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 08:25:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/19] bios-tables-test: Generate reference table for virt/DBG2
Date: Thu, 21 Oct 2021 08:25:33 -0700
Message-Id: <20211021152541.781175-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021152541.781175-1-richard.henderson@linaro.org>
References: <20211021152541.781175-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eric Auger <eric.auger@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Auger <eric.auger@redhat.com>

Add the DBG2 table generated with
tests/data/acpi/rebuild-expected-aml.sh

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20211019080037.930641-4-eric.auger@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   1 -
 tests/data/acpi/virt/DBG2                   | Bin 0 -> 87 bytes
 2 files changed, 1 deletion(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 1910d154c2..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,2 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/virt/DBG2",
diff --git a/tests/data/acpi/virt/DBG2 b/tests/data/acpi/virt/DBG2
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..86e6314f7b0235ef8ed3e0221e09f996c41f5e98 100644
GIT binary patch
literal 87
zcmZ>9ayJTR0D|*Q{>~o33QiFL&I&-l2owUbL9`AKgJ=eA21Zr}H4uw|p@A7lh%qQJ
TFmQk+Il-a=3=Gcxz6J~c3~mVl

literal 0
HcmV?d00001

-- 
2.25.1


