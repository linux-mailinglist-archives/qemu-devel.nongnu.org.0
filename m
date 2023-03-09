Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D0A6B2E2A
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:08:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMWn-0004U6-MV; Thu, 09 Mar 2023 15:06:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWm-0004TX-DR
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:16 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWk-0000iD-TA
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:16 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 h17-20020a17090aea9100b0023739b10792so3015993pjz.1
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392374;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VG15pUCqeZD0ZpYgHzBpQKAuWq0tbQlET0QjaCMeMz0=;
 b=ZeDn+puHFR06dxn42TPJ0+RE4GecwLXv1KN0pL+xVm+Kq9wWTajOR23GqiyTzS3Oji
 c/+hO299vHLksuc6mIemNpqNii1f/sdfcqCQEZMA3E0a576L1joHF5MQ81h/kRqiNJ1k
 YUCfi1e+NoIJmFqsoWyPGGvyq0rC4LU5UAyeigIP8hZzSqLDdI/BwNmzDefyJ7EsDZW3
 WtBTxXuqUwoqZODyngFlldOQrdl8wTVOkwMzlKLCNzlizlHvKcPsnnDridg8Dm6boBGt
 V+vCrSd/tGT+JHR4KFv6RJOc7i2IKLQ8dcMeGRv5SKGEKsj7Fr6ARREOvcIHUVVVwwn4
 avsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392374;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VG15pUCqeZD0ZpYgHzBpQKAuWq0tbQlET0QjaCMeMz0=;
 b=aMddknk8XVChf1OD7QsEKm6u8RADgONLTsFwDpVDauQMTUaPypFzKMjq2V+WPoSFmO
 sTi3r5aTR7ZwmGyxKDtAk/bm42MGi82Zx+NeQoKzJjTQpt8ILCc8ZIwCUVhEobc8pCEE
 /8x0GP4eGNiC9iXrC1dR1Q3Ha+SCCTN7Fa43OmkGPbO3Ha3BGEFZD0ldgDLGOVTjyY60
 UHACkEu+tC5/ywmag/ji1nj8RcKXRiOUmG86VJuaj9JvK/mtG0HCLW9VCdcX0Ra0U2Ro
 IULNk9nefQatwgH+TKZ6r5M2OEGID34hzov7zokYdJ4ZqUExrMemRQWbi31QlQn/s/2F
 rsBw==
X-Gm-Message-State: AO0yUKVn0pcm00PpPQ9dk+kLpsziVUZ9VAn5KinqVMVUMVmPUsr7MCIp
 kO8BFZOApzwlqUk7Dp4DtViJlRtWd4kQqTT79BM=
X-Google-Smtp-Source: AK7set+vNgl4D/7FCGY98kbeoHW4dOal/8ea7GufXdER3R1O2rFQw5/3l8EDzXjl4W2cnkXjEyrAmA==
X-Received: by 2002:a17:90a:191c:b0:237:50b6:7835 with SMTP id
 28-20020a17090a191c00b0023750b67835mr23640048pjg.20.1678392374041; 
 Thu, 09 Mar 2023 12:06:14 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a17090ad15400b002340f58e19bsm308083pjw.45.2023.03.09.12.06.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:06:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL v2 25/91] target/m68k: Remove `NB_MMU_MODES` define
Date: Thu,  9 Mar 2023 12:04:44 -0800
Message-Id: <20230309200550.3878088-26-richard.henderson@linaro.org>
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
Message-Id: <20230306175230.7110-11-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/cpu-param.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/m68k/cpu-param.h b/target/m68k/cpu-param.h
index 44a8d193f0..39dcbcece8 100644
--- a/target/m68k/cpu-param.h
+++ b/target/m68k/cpu-param.h
@@ -17,6 +17,5 @@
 #define TARGET_PAGE_BITS 12
 #define TARGET_PHYS_ADDR_SPACE_BITS 32
 #define TARGET_VIRT_ADDR_SPACE_BITS 32
-#define NB_MMU_MODES 2
 
 #endif
-- 
2.34.1


