Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C69BF6B2E32
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:09:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMWw-0004Yg-Ku; Thu, 09 Mar 2023 15:06:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWu-0004Y7-Gc
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:24 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWs-0000nz-Ty
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:24 -0500
Received: by mail-pl1-x632.google.com with SMTP id x11so3181481pln.12
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392381;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B8ssnQIoVR4qHGBncrOTH6f/klwQ2PZUd8m0h16nwg4=;
 b=M626yR1RMxCh1hzbqBsRCZutQNOuz5Qt3s66uqL+9YasudyVgI29nPOHchDSC4zKl/
 VP1lZkgZ33gw3z5BnU2ztjPQa2RnoqsmtEKJC3IQUpiXBblbIczFZCEY1Ee5B6YBBBZF
 P+Me2DU1w+S/SpQO1BHl3cO8v/4Kjk8yQG6F9JjIXSRbp1ji6JcDt/TWQj/DYqCR5xV+
 50iJ5GEiBG/N16N32MLQG71XnbtnegbHKOnkWpJHbez94eGREIwKvBj/kGLkSRylE9v4
 kChrBF6qMcs/ozmunrUln/q+tDzqzVe8bMSwCjJjqB2v5Yh6hha8KfnsivdASbzIEiwP
 3VxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392381;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B8ssnQIoVR4qHGBncrOTH6f/klwQ2PZUd8m0h16nwg4=;
 b=aQ1uhxTcIFpd3y/pLkQXLqtp65W2qi93T69TjaBpTTjwwbIIqyDc4eiCMnmaYGXeWD
 bjuLKzEwQKjYoFoTsv/pFUkv+DHZur/rt7oTBIMKT48GoDqiEHLQMe/zg902BGu4K2fl
 h0yVjzu9o6O0pyfl8Xo22/6ioabGq1NRrNRaWgsyTMDC8eXx80cHPoXsjcPbnmVGNWlN
 1p6X/qNFH4UWd3EkDOlvCEm5e2Tas418lMc/hMI65yjIyd7JleV0KlLwB7zjSpofIenj
 kUEn5ZGgRmI3nrInJm/8tYRc0xDAiMp2FlVEwGnjj4EfFPhmMlZKggpaKaZrRbY2eP5A
 v+Lw==
X-Gm-Message-State: AO0yUKVWcmJd+Jwkh4bbWKDVgKFFALq9w+BmSwQz7iuJuMvHQTMnzpry
 B9XY+/4080Vw/i7b0uv68P/K1asm2bb9lMif394=
X-Google-Smtp-Source: AK7set89cyo7AnAI/hixQMl3BywLYqoc99H/qYP7HJb+VFtqXinY2ci+7RmXYyAIxy/Zj33ljaKPJQ==
X-Received: by 2002:a17:90a:1a49:b0:234:b964:570d with SMTP id
 9-20020a17090a1a4900b00234b964570dmr23566131pjl.13.1678392381303; 
 Thu, 09 Mar 2023 12:06:21 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a17090ad15400b002340f58e19bsm308083pjw.45.2023.03.09.12.06.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:06:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL v2 33/91] target/s390x: Remove `NB_MMU_MODES` define
Date: Thu,  9 Mar 2023 12:04:52 -0800
Message-Id: <20230309200550.3878088-34-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
Message-Id: <20230306175230.7110-19-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/cpu-param.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/s390x/cpu-param.h b/target/s390x/cpu-param.h
index bf951a002e..84ca08626b 100644
--- a/target/s390x/cpu-param.h
+++ b/target/s390x/cpu-param.h
@@ -12,6 +12,5 @@
 #define TARGET_PAGE_BITS 12
 #define TARGET_PHYS_ADDR_SPACE_BITS 64
 #define TARGET_VIRT_ADDR_SPACE_BITS 64
-#define NB_MMU_MODES 4
 
 #endif
-- 
2.34.1


