Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DE16AED11
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:01:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbbS-0007u0-2U; Tue, 07 Mar 2023 12:59:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbap-0006UZ-Km
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:59:19 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbam-0000JA-Ui
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:59:19 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 me6-20020a17090b17c600b0023816b0c7ceso17364070pjb.2
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 09:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678211954;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xgeApVkfEzqYJTuK+AGyP6LhMQJV1qK9YROzxC4IHQM=;
 b=AacqCI+wMf7KTAmkWinsvoXY6JqR6PMzB+Kr2kDwak8G1j/qswbEG+PD7kxJeXfQOj
 Lj4IOkb4VGzBN1GQZmN+5rLfwUVie2/NBM/2UBKCInYiIN6Sz/pwRn0+/mOuL0cUcLe6
 YUP12cdmWAufrCI/2D49QA9J+DF+pGd/CRycAkMDX+V4HREzPxomOpR1WMISaeWqUBrX
 wTkT781AzkORyO7HOFnkFemf1y7gTlI1qWTxP0Y5MTcFePMydsx2AX9Cx/fNvTN1idFc
 FSYq7GS8HkFJHCH6eIQEZk+kUCU3yM/ze2EXlNcdbx0DrHAaA5A6YwN3LhBvrevuWzIU
 od1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678211954;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xgeApVkfEzqYJTuK+AGyP6LhMQJV1qK9YROzxC4IHQM=;
 b=OxQZY/D6WR7K4K2sLnsyE2H0FRblVdn+8rvX04FKbravFCw2vZ8RK/dSifxwm3Q0fV
 V04s98ndXWy46lrrJ90NAE31GNMEMzEkt4yG1gnKx3WNxlQIjmSRAWV5tIjN1m8DXEWK
 QAvosQvNV1Dz5jCzKw4+h0Y5c+DzlfFF01f5Po+0UPutisvefLh+9fY3PyJa8XKRHBP8
 KAxmLoZ1iiEZCXro/jrdYQ5SAiAkGxs2HrWhl3VyE3Z82Ll/vn+Mr9DlDyxFidxtc2NM
 HCBPYPW7P+GMMqAn+ePUPs/a6E93O1r09pZ+GZrm/KhhkYJNndzHlYQ6C5HmcpoyAc+q
 XEVg==
X-Gm-Message-State: AO0yUKW2p5vxoUuheS4k+OuA7UK/B9urukV5fEkGfLggDVL6cUEFAXEi
 SBCFChfMmu2eSqQ7BZW4ndCu2NWHUlx2lCVTb94=
X-Google-Smtp-Source: AK7set9M0yoZFwQOvDyS6CpDe8ATEj7m/8Iffe1x5J0cVwFvO4qZOVqUyULwC+H9TV+vKs2IiM3GOQ==
X-Received: by 2002:a17:903:441:b0:19e:7d5b:90fd with SMTP id
 iw1-20020a170903044100b0019e7d5b90fdmr14108254plb.41.1678211954437; 
 Tue, 07 Mar 2023 09:59:14 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 bd6-20020a170902830600b00198e397994bsm8661802plb.136.2023.03.07.09.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 09:59:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 31/67] target/riscv: Remove `NB_MMU_MODES` define
Date: Tue,  7 Mar 2023 09:58:12 -0800
Message-Id: <20230307175848.2508955-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307175848.2508955-1-richard.henderson@linaro.org>
References: <20230307175848.2508955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

From: Anton Johansson via <qemu-devel@nongnu.org>

Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230306175230.7110-17-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/cpu-param.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/riscv/cpu-param.h b/target/riscv/cpu-param.h
index ebaf26d26d..b2a9396dec 100644
--- a/target/riscv/cpu-param.h
+++ b/target/riscv/cpu-param.h
@@ -27,6 +27,5 @@
  *  - S mode HLV/HLVX/HSV 0b101
  *  - M mode HLV/HLVX/HSV 0b111
  */
-#define NB_MMU_MODES 8
 
 #endif
-- 
2.34.1


