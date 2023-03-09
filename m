Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1450E6B2E3A
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:10:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMWj-0004QH-N4; Thu, 09 Mar 2023 15:06:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWg-0004J5-8a
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:10 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWe-0000jf-HQ
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:09 -0500
Received: by mail-pl1-x636.google.com with SMTP id ky4so3228058plb.3
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392367;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wZOOmOAc6YX0S/OYqWCOw6PwgXPk0NBldwfN7jSvCxI=;
 b=eBd29/YF0m/sI+xqq+WBm8Y9TNKY+dvRZwUkWwr1qc+fgUE0DLzwi9oXW3D5K/grEu
 +FfLdwVYin414WBVsfPklq6b+pIOj+Xg/2ggICvkhsRorMK3DnBYYOqqBcsmuLiVtFRl
 gaLgotM2s5tOCx+/yo5njCWR/8PWdB/gW3QpsCizeaMFIsAXQwhLz79N1hs+BgI4S9iZ
 Ynigsq9JKBIRQBBGL0yIfPQe8ahCskA19EQgJZONYXVfgtVbh0Fx5micunghXgQ7ZPzl
 Es6fME2gJIrjZdIbujeJ5kuvQERns5GwH9wjyOpqJ2uTa1HRnFta899AwQXENvNI+swy
 1PCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392367;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wZOOmOAc6YX0S/OYqWCOw6PwgXPk0NBldwfN7jSvCxI=;
 b=eSSPvhM+MeXLsfDHFUNDdkXtd4W+ON99Ct0kXNMEQS/IOxi7oC/HjjtykEwTosuhGY
 RTWAFlRBHpnxGG3cnivq8XUdcPN4iNx484ThQTBGvVVYuYg76rbn5VcUJXjVkuhIGyuC
 1OEOFkaiPMCPpVHe5P5k6E9Iy7oCWIc4Y0tUx52CTztEWgW8ZqiDerEP/HDHzxEeVHiY
 E02xuB7pYAnxAqOMB+5/ThIvkuRzpoxTp9D07MqPn02RS5cxZw7R/iTf9gEz2QjavL/r
 MDkhe2FV0dRGz5wHSVrsRItKdm629obbDy5BuZ+FL/EAQucKq2nQCKMTrBkqLF/PqttK
 u/1Q==
X-Gm-Message-State: AO0yUKV15tUB+8VjwTpVkbYbDDWw7Cdv49sVCy7QARrdetaAbkk9gS2D
 y3HSO+2uE7iL7C7tWhOi/T+FIPqOZkBrKL8Ubrc=
X-Google-Smtp-Source: AK7set80cczyOEe71Nl2ONN3c0RFkhb7J3Rmn5IHM1f1KkSp5uzeOeYKyrrr7/ZPPzDskC27rT+0pQ==
X-Received: by 2002:a17:90b:350f:b0:235:31e9:e793 with SMTP id
 ls15-20020a17090b350f00b0023531e9e793mr26701144pjb.13.1678392367245; 
 Thu, 09 Mar 2023 12:06:07 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a17090ad15400b002340f58e19bsm308083pjw.45.2023.03.09.12.06.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:06:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL v2 17/91] target/alpha: Remove `NB_MMU_MODES` define
Date: Thu,  9 Mar 2023 12:04:36 -0800
Message-Id: <20230309200550.3878088-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
Message-Id: <20230306175230.7110-3-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/alpha/cpu-param.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/alpha/cpu-param.h b/target/alpha/cpu-param.h
index 17cd14e590..68c46f7998 100644
--- a/target/alpha/cpu-param.h
+++ b/target/alpha/cpu-param.h
@@ -15,6 +15,4 @@
 #define TARGET_PHYS_ADDR_SPACE_BITS  44
 #define TARGET_VIRT_ADDR_SPACE_BITS  (30 + TARGET_PAGE_BITS)
 
-#define NB_MMU_MODES 3
-
 #endif
-- 
2.34.1


