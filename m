Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B632A612D7B
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 23:35:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opGqg-0007xP-4N; Sun, 30 Oct 2022 18:32:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGqD-0007VH-8d
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:31:44 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGq9-0008J7-DP
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:31:39 -0400
Received: by mail-wr1-x432.google.com with SMTP id g12so13652830wrs.10
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 15:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TIEJOSpU/Dh3jMhqs70wGUD/EFFQYutQ0ncwTTPFOc0=;
 b=iZ9H8C0GUKToaq5P2PzRLE8THGHzlLiYCAi3kCmZtWHo9sQMlwlWbyraPY2vvm670o
 Ahsqe2iHT8xyT7HZWkjNvl6V/j5+wrS/2U8HLlIMOBaD/Pg2ande/MqbW88IdWEn7Tqw
 Fg3am129KRqXHVQuU+3e+6M9iUeq5w21vVN5EXNeEyen04ITGCQWj41i+7kcAxkw2KMo
 l57xN6KPtW/qmyRGVYt+GMesisLPczuBCNC4wZoKHDi1R+KHJvnOt4JXfJWxDIKEGiqH
 tAKKs3ZKWKWUav7ZnVyZIT8FLrfhsqHE4AAJRVLfHgYusdjJ6uqetsTZ+pgjmpBT6+Sc
 PCIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TIEJOSpU/Dh3jMhqs70wGUD/EFFQYutQ0ncwTTPFOc0=;
 b=EuOOSegBRCXlNKnKnmm1gs+6UQYS0HJzwk4lBa3eoL2qISF7130AzY/hGI7g9/HYT9
 xQzKXE+aaiZPoaKRY8vpXyoF11ERRbJnhArvluqrqFps6bySPHOBD4rtKiTRH6TPSFl9
 ltWOW4JltaYAf1gTOCpEDa+cP05OnczRRlxNrFUaUfu7m8JvRYJ06KWSBynfekf+Gu5X
 UYd7/yu2JNfFtBRxVZKbCoectwHXZgTvCmhIeozlF+f6ERDKlFOjL/xkvgyOf5KCUhnY
 3dY3sAv/8x3KLoBdtYY45vJYq/jjnGu36vl+aEfa0lQk56Fw0eIx/opDXC/16hg3S043
 ImZQ==
X-Gm-Message-State: ACrzQf1KbseFg4/2y84XiKXxZgTsishkVSKT//rL//Q85czyev4bQllW
 yzJ6cvWjRtDzkTUYhC65JxL7cnpUWRp1lg==
X-Google-Smtp-Source: AMsMyM6gvcfrVz87VdFJYgdq+YQo/FzgqFyPO0eAw6tJZT9SpjMaJvtecWkzJXPwb86vtl/N2my35g==
X-Received: by 2002:adf:e7c8:0:b0:236:6a30:cb2e with SMTP id
 e8-20020adfe7c8000000b002366a30cb2emr6233199wrn.12.1667169095641; 
 Sun, 30 Oct 2022 15:31:35 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a7bce84000000b003c6cd82596esm5310940wmj.43.2022.10.30.15.31.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 30 Oct 2022 15:31:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <paulburton@kernel.org>,
 Milica Lazarevic <milica.lazarevic@syrmia.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 26/55] disas/nanomips: Remove #include <sstream>
Date: Sun, 30 Oct 2022 23:28:12 +0100
Message-Id: <20221030222841.42377-27-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221030222841.42377-1-philmd@linaro.org>
References: <20221030222841.42377-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Milica Lazarevic <milica.lazarevic@syrmia.com>

<sstream> is a C++ library and it's not used by disassembler.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220912122635.74032-13-milica.lazarevic@syrmia.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 disas/nanomips.cpp | 1 -
 1 file changed, 1 deletion(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index 7d09fd1a69..4b49630b8b 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -32,7 +32,6 @@
 
 #include <cstring>
 #include <stdexcept>
-#include <sstream>
 #include <stdio.h>
 #include <stdarg.h>
 
-- 
2.37.3


