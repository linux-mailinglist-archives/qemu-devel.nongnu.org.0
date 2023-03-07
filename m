Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CACB6AED38
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:02:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbah-0006OA-Tk; Tue, 07 Mar 2023 12:59:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbaf-0006I6-50
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:59:09 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbad-0000Dy-3B
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 12:59:08 -0500
Received: by mail-pl1-x633.google.com with SMTP id v11so14999143plz.8
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 09:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678211946;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2eud0jq3U1kTkymD2g4YyBzpoDL7wrCVCnqC9at2w0s=;
 b=uqcMiVNzpY1ifPdSa5D+nuHjz8QFUewu0JqXB9JY2/UNGzQA51J+nSxVr556kvp+MC
 iqFuhKdOjrAcI+k3+A7DAY2lbpkvduxrH+N0znCaiiWoVnsMPFvkMIG0S+7POfGKoRw1
 e7Kl/eXxNOvPW4AS9xibm+RDGB6+ycw40EKTTKGy+vFfYwN6H9VnbGOrfq1slQFKMhYV
 Woz7N2ENLOUM3cLmf0EZdmMUBV7luHq+s5X+yS6twJS3CNMuJENuey40yaFUARYc4Xlt
 7i0fU/9f4gAdv/F+B8yQLAluNTmV+b8bMwrWVg1m/caTtfGkEo9nPBu46NIg4iq6QYcr
 Bo8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678211946;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2eud0jq3U1kTkymD2g4YyBzpoDL7wrCVCnqC9at2w0s=;
 b=VD2Ze+VlPohqZkfRgkmQlUnYYBCtBdtlkbUPtUX79CyUYBRd+sgTyW/mvYC0pxuQXr
 rIsW4TQgRzhaQg3hKd99hdxOb6PgSz/Gvu1EbLyYyY0XJpw0qR50oKf2jta7AqCjMw+1
 JG5R+qXN3EawKph05UkRI6ji4c40yBiRgnJyJA1T108QOzMIyFYJGMMFXoYQgnoRfMmr
 oMR5JtlZQvuOtE8uOFKp6023bPg6k4tQ8vs8RgLhFEiv+0j9U3fynY/pnzqNVvF9vDPz
 bgS1sRKUGR7TFF166kTwFq8zd9Gj+nFLfEMUVq2mGH+NudeKCJfxqmXx5LTi5TC5lYqS
 ZrDg==
X-Gm-Message-State: AO0yUKX7xvKMDq7R+bci8ALuARBhHoKd9liiCbi4rxWaggXNx9/lVlwJ
 PAipTXyT5FYvBsjnV2Bdu6bj+O5IR3ktticsV1g=
X-Google-Smtp-Source: AK7set+f/1WuyEgRK9DYR0HKfYSJbYBv0C/QSjqKGa8f9qB8hhpSyJDyqotywNKvm4IzquAowRce9Q==
X-Received: by 2002:a17:902:8693:b0:19c:dc31:954e with SMTP id
 g19-20020a170902869300b0019cdc31954emr12650266plo.8.1678211946368; 
 Tue, 07 Mar 2023 09:59:06 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 bd6-20020a170902830600b00198e397994bsm8661802plb.136.2023.03.07.09.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 09:59:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 21/67] target/hexagon: Remove `NB_MMU_MODES` define
Date: Tue,  7 Mar 2023 09:58:02 -0800
Message-Id: <20230307175848.2508955-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307175848.2508955-1-richard.henderson@linaro.org>
References: <20230307175848.2508955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Message-Id: <20230306175230.7110-7-anjo@rev.ng>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/cpu-param.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/hexagon/cpu-param.h b/target/hexagon/cpu-param.h
index e8ed5468d9..71b4a9b83e 100644
--- a/target/hexagon/cpu-param.h
+++ b/target/hexagon/cpu-param.h
@@ -24,6 +24,4 @@
 #define TARGET_PHYS_ADDR_SPACE_BITS 36
 #define TARGET_VIRT_ADDR_SPACE_BITS 32
 
-#define NB_MMU_MODES 1
-
 #endif
-- 
2.34.1


