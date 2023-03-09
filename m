Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C816B2E34
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:09:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMWm-0004TM-AC; Thu, 09 Mar 2023 15:06:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWk-0004Qa-3c
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:14 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWi-0000ka-K6
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:13 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 qa18-20020a17090b4fd200b0023750b675f5so7381970pjb.3
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392371;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pcdp/kDbHqmt48uvHF6elXceAutr0UAXpAaZeCJ35PM=;
 b=AHc+V5OnQz9JG/1zVVtgVqSv0w9rjFkUUI6QU041e7lGty1sJIdI+N408xZMbqcZ3g
 E33s//TPQoViJwQ4dRYkswv8FKCz8xR5qmfWmmqrNkVRdkulsy3/U00ETr8xzVJ2XM1B
 bMltLmo00RpYPoAl+Db+RkO/Wjfhr5G/eGKYAFMEjMZFL3sXdRS8wE2Sc1+B8GdgyyvK
 SHtz9OL+l3FZQMfqRt0Hjyk2mgYSEjv1Eue41ZIsbbYCQ6ji0WYepw+lZMRS6wFIb3W2
 DxQPAUR9o8Tu4iww3HyY8C9G+ZBXItCJ0sZG4Ze9iYZB1HW09lGOY16PUqVpWWlibr+a
 rsaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392371;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pcdp/kDbHqmt48uvHF6elXceAutr0UAXpAaZeCJ35PM=;
 b=ks2cIVIvbk8UeSb2Hs5cKc9cW3+Tkt38tQdTp2r5SkmdHsVZoZ3PTsFKB9MaHupxi5
 L8ene1wXvBG+ZyqnCdHMlipXSRUorRHm6l+oJBoGYThNflAtV7S/E0r/5b7dBj+HxyAB
 fafVJMA2MFckJyYsdOmafKbSv2EcozRD2YhCWG7a1Az7TjXxgqkTzSn4usYDvfVByYqU
 ex3yy8AuCNfZ/MoU8T1fo3bk/US+yFu/67zqGr0zxQBRInddqnLWhztudF0SBHjEpjIh
 wCWDJQRj/9WWt+tXp/wMJLdByYLahpF4GwII1F4ZdjVXm8Q3Db/Z4ec6KnY0csJlznQ1
 L9LA==
X-Gm-Message-State: AO0yUKWC2Ibl61PSk/jQz+LBcscxpHqttZ6HwhBh50Whgvz87rdL8bav
 kaNHGW2bYXujTDZBt3zYuw3MWdqH8oghYNWRqiQ=
X-Google-Smtp-Source: AK7set+XaGtDfeFmNcO49QZ6r/dU76N9zrx66e5htlussb7/doYZ492afOrEGq/Txx53iN+VHzKIoA==
X-Received: by 2002:a17:90b:4b89:b0:234:68d:b8ea with SMTP id
 lr9-20020a17090b4b8900b00234068db8eamr23874262pjb.39.1678392371365; 
 Thu, 09 Mar 2023 12:06:11 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a17090ad15400b002340f58e19bsm308083pjw.45.2023.03.09.12.06.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:06:11 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL v2 22/91] target/hppa: Remove `NB_MMU_MODES` define
Date: Thu,  9 Mar 2023 12:04:41 -0800
Message-Id: <20230309200550.3878088-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Anton Johansson <anjo@rev.ng>

Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230306175230.7110-8-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hppa/cpu-param.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/hppa/cpu-param.h b/target/hppa/cpu-param.h
index a48a2701ae..c2791ae5f2 100644
--- a/target/hppa/cpu-param.h
+++ b/target/hppa/cpu-param.h
@@ -29,6 +29,5 @@
 # define TARGET_PHYS_ADDR_SPACE_BITS  32
 #endif
 #define TARGET_PAGE_BITS 12
-#define NB_MMU_MODES 5
 
 #endif
-- 
2.34.1


