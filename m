Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAA44AD399
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 09:39:46 +0100 (CET)
Received: from localhost ([::1]:46742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHM2E-0000HM-A2
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 03:39:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHKg9-00075g-PR
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 02:12:45 -0500
Received: from [2607:f8b0:4864:20::62a] (port=35449
 helo=mail-pl1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHKg7-0000RE-T3
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 02:12:45 -0500
Received: by mail-pl1-x62a.google.com with SMTP id y7so7844732plp.2
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 23:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=95uqxe4z0njk29NOtAs+KrRHrBfnHEzIFQZpK0SEfT8=;
 b=bNh5aAPkK8ZJgBljHDC2UBNkG6yq+V3rJn9nZVGFU0J3qfp1adOKidaRkPUaxkh4PK
 T9K9ZgFDYNRHu0Xx/sgWkw5Yk3fVqAvNAzMkEWPKlzEPzbfrjJqwKguNaWstzetrDPqB
 vSe2uXqXXrEykWIHT/7xCJtivFNyKFTf1H8JPHQZIgNW49B6TtC4DDdHgqNTOD2x4DKB
 oMutQn+eWU1907zljf1RbI5uwlmWpUDVDnm1vlk7ZHutD/TC6Lr4JNGipHkTrBzjuWwg
 llkUx3D9vgKZ8Mgt/GMqe3FfGBlihka+cdzqf+Et67dNHXCi/XmBsv0ER5tI0nvvE62J
 nA1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=95uqxe4z0njk29NOtAs+KrRHrBfnHEzIFQZpK0SEfT8=;
 b=AXP9r2+V2YWsIC+G73QVzHFtvshUKEUXTiQGCnAebnsl39QVSwbV2nYBAqmJO5sz72
 21jydDhW4dcQ6knuL1tRw6ZxsDKW/XOMv0TLTCA7UKs3pBSs6H0o/iMkY4q5NriyQNYo
 WLzyXF3M1l4q8u7aw8qQPPPEot9U6iweRB3ftTTtateoMKc3FUVyiIGYE02a8+1SeDbm
 hpc5zwfzo0aoFA7q9/NaOLKMzeGe+4z+QzaMo5u4kGbv/k/qvATx6RMio1qxxRSsSvRs
 GHyrLnxeTagNOHBIzim9vCYsRghfE0XxqqoUpR+sH9MfVjw7suM1yB6PbCb6p3/xo8//
 5mSA==
X-Gm-Message-State: AOAM530rAxCPBrf8PNm6+5PhHdKd8kg1blUC0cE1ONo3MWFbJXElhjIA
 bCDuIL6GFok/pRdaB8LAehqWJbmfxW4WTg==
X-Google-Smtp-Source: ABdhPJzQ6B24gv60UsZ4ID7QJ2qVG7++vUGIoBg8ORJSty3RlprbO3LRlp4Y/xn7TQMZQ/JmrX7uUQ==
X-Received: by 2002:a17:90a:5998:: with SMTP id
 l24mr2935165pji.57.1644304362232; 
 Mon, 07 Feb 2022 23:12:42 -0800 (PST)
Received: from localhost.localdomain (121-45-127-8.tpgi.com.au. [121.45.127.8])
 by smtp.gmail.com with ESMTPSA id b12sm13908088pfm.154.2022.02.07.23.12.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 23:12:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/5] linux-user: Fixes for sparc64 host
Date: Tue,  8 Feb 2022 18:12:32 +1100
Message-Id: <20220208071237.319844-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Brown bag time, since both of these problems are my fault, and I
ostensibly tested them.  Ho hum.  Anyway, this brings linux-test
back to working.


r~


Richard Henderson (5):
  common-user/host/sparc64: Fix safe_syscall_base
  linux-user: Introduce host_signal_mask
  linux-user: Introduce host_sigcontext
  linux-user: Move sparc/host-signal.h to sparc64/host-signal.h
  linux-user/include/host/sparc64: Fix host_sigcontext

 linux-user/include/host/aarch64/host-signal.h | 16 +++--
 linux-user/include/host/alpha/host-signal.h   | 14 +++-
 linux-user/include/host/arm/host-signal.h     | 14 +++-
 linux-user/include/host/i386/host-signal.h    | 14 +++-
 .../include/host/loongarch64/host-signal.h    | 14 +++-
 linux-user/include/host/mips/host-signal.h    | 14 +++-
 linux-user/include/host/ppc/host-signal.h     | 14 +++-
 linux-user/include/host/riscv/host-signal.h   | 14 +++-
 linux-user/include/host/s390/host-signal.h    | 14 +++-
 linux-user/include/host/sparc/host-signal.h   | 63 ------------------
 linux-user/include/host/sparc64/host-signal.h | 65 ++++++++++++++++++-
 linux-user/include/host/x86_64/host-signal.h  | 14 +++-
 linux-user/signal.c                           | 22 +++----
 common-user/host/sparc64/safe-syscall.inc.S   |  5 +-
 14 files changed, 188 insertions(+), 109 deletions(-)
 delete mode 100644 linux-user/include/host/sparc/host-signal.h

-- 
2.25.1


