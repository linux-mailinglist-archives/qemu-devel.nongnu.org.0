Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE9F6B2E37
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:10:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMWz-0004jF-KU; Thu, 09 Mar 2023 15:06:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWx-0004eC-B7
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:27 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWv-0000hP-AT
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:27 -0500
Received: by mail-pj1-x102e.google.com with SMTP id l1so3160374pjt.2
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392384;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ft8dDYRyvEXF/hO4IZc8hI1S9uzAq/4cglGj/sKNb1A=;
 b=gETwF/wvx1smt2XtmGrGrJHJ6aJna0HQJywy5rwNdlj4lvv7kM40TXmXD4Z91rFvjy
 NPjONDnnSquf97Ar7S6LqtyrXmaEwpHsOpNdc0gwQmYmZri/yXZb2L4NQ+vRLpfHj+Fy
 1s3Y9Vv+sg51Bf2yOiG/bGTTEMGndKZVVdL1ZkfO/64F0/0ZEQYXI6H8AQ4MvprtDvKm
 PafR9a8hpMqXfv+qDJnhLrfN/Mk/nSd6wepoBRxL8iJsh9ivr6T7AjIKN2Rw/uutrHrD
 8x1zXkFNI0uSbH+lp5pQo9MBFMeKGAvN3qXxqW7agNYlCSrv4bwQ5EEeARnMuJnqYc+0
 +Hdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392384;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ft8dDYRyvEXF/hO4IZc8hI1S9uzAq/4cglGj/sKNb1A=;
 b=klu29PeKxkE/HrhA9IP5yVKE9BTRJSN6LDi9fXxa9fhdiS0Kj6llN6cSWsMxi3bXxT
 NOKIHZGzcqzpnaAscPvEfLtyZ1dlpmvq/Hcf3I/HodJaOUuxTURBMR5/bnR6OPPPw/DM
 6cT6lBPDa/g+UOjgIG58m+3Xk0azBxmzOXLJBRGNQeqf3booa7HaTJ+ma7S7wFfYweIZ
 F+qHE2b7djR1GoqBvAn4YoWupxPjTufvW/Gi9lVY9i0GBAofaajDfEssQ5FS/lc6XMqT
 44dQpASOeEYmw+XVD2r2ZwZdn4WjrpeODl3sEc2uUx2AwJCXrb08DzhWvT4TEGPJKVrP
 zXmA==
X-Gm-Message-State: AO0yUKUm/KyPj0dBbyA/59nOWAy27JYPLxEmWGNtuGXOhngEXUgcIJP2
 sDDFG6CCUEsIwPXvz7EKtCASPxCfFqg7sEiSBjg=
X-Google-Smtp-Source: AK7set/tO/eb+WZHTTITehDXyb5RbnYfCpWzmAtjGf7ZrW8TI57E5v+chTmqhcg2Rzx7mGdLnJhU+w==
X-Received: by 2002:a17:90b:38cb:b0:237:1d83:3d97 with SMTP id
 nn11-20020a17090b38cb00b002371d833d97mr23857558pjb.21.1678392384634; 
 Thu, 09 Mar 2023 12:06:24 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a17090ad15400b002340f58e19bsm308083pjw.45.2023.03.09.12.06.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:06:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL v2 37/91] target/xtensa: Remove `NB_MMU_MODES` define
Date: Thu,  9 Mar 2023 12:04:56 -0800
Message-Id: <20230309200550.3878088-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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
Message-Id: <20230306175230.7110-23-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/cpu-param.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/xtensa/cpu-param.h b/target/xtensa/cpu-param.h
index b53e9a3e08..b1da0555de 100644
--- a/target/xtensa/cpu-param.h
+++ b/target/xtensa/cpu-param.h
@@ -16,6 +16,5 @@
 #else
 #define TARGET_VIRT_ADDR_SPACE_BITS 32
 #endif
-#define NB_MMU_MODES 4
 
 #endif
-- 
2.34.1


