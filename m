Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9153D3E64
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 19:20:36 +0200 (CEST)
Received: from localhost ([::1]:33682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6yqh-0003hO-MR
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 13:20:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6yg7-0005ft-JV
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:09:39 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:36382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6yg5-0008Df-Tk
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:09:39 -0400
Received: by mail-wr1-x42a.google.com with SMTP id g15so3128956wrd.3
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 10:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uS1pSxcrnef9Bi6E/um0jmW2U80D77g2Q5XIJv/shJM=;
 b=kEr55rufDlLnSGjL9H2TVkP5kY/XcpJRlY8KUhlyqH+DqbdYIftsCmYCluzRrFlDLT
 kQg7d4KuapxfVj6PfHFsnuswZOmLZ2V2odbD2Fp4hlqCdAhc/PsSUgVI/t/f0Mly2ZrD
 HnjDXhoYMncJTA0wU2HoQhDCPlCTWUxjq1B2QZ6ElR3LNRnn+r/b+GC2DbwkYoARTpNC
 9pulf3UYLnytkK7fD7adXLUZ1WWqp7la1aOqJyf0bu559mt5kX7pV7Txkf2BInu9qyNZ
 slUZ0VQRGgKt0o5cu26AxPg4rdulsU2RyJm0ZwyNmxEaquzpFp+QzHWC/Sd6ukRcKe+F
 5dPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uS1pSxcrnef9Bi6E/um0jmW2U80D77g2Q5XIJv/shJM=;
 b=GdddSRa60UUgUKHuHOJwBgS7ER2NgCaD9JTvA0siNV8tjUhhTGXfOdtENfXosgD2/c
 in637B8+ixsh+/yt17H4Ege+bnhyfSvX/0px8FCi1vT9+mXG2u0ktrZ2vnP56H+OkGcx
 fSRzdEPmvNU/pgiE0RmygK5TSucY6mH6Ze9uBYYhOSRUrLaEizIXNZ+aePdI6R+Q3MqK
 Q4tKPX7MMmiwtdjscVqb2pTm4YjdNzB+MkGQ9dAAwSFBj3rNsXbwfr7mHMlOh6p/kdRS
 6JzyvuBRVZWjyFDBdJ8sec7cczyPhlXTzuwv/bcpScNNVZ6lhm6IjyfPD+yMsOPVi8Yx
 5pJw==
X-Gm-Message-State: AOAM531GR1nyM0vXZF+2xE9mb1I1ex/7HO7X2igNu31uLcERy8Q1lyHl
 xfmdHz7eP0ZHamW+4ojhFd8qTQ==
X-Google-Smtp-Source: ABdhPJz/A9/GGwKGRQrknEm/t8Yl7F/NCBW9wOhMDk9IaaGvqPG0E1s1+R1IdjGTUDfSlB/3H4ctww==
X-Received: by 2002:adf:ffc3:: with SMTP id x3mr2813169wrs.136.1627060176592; 
 Fri, 23 Jul 2021 10:09:36 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r11sm16276173wma.24.2021.07.23.10.09.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 10:09:30 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6864B1FFAF;
 Fri, 23 Jul 2021 18:03:56 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 24/28] plugins: Fix physical address calculation for IO regions
Date: Fri, 23 Jul 2021 18:03:50 +0100
Message-Id: <20210723170354.18975-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210723170354.18975-1-alex.bennee@linaro.org>
References: <20210723170354.18975-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Aaron Lindsay <aaron@os.amperecomputing.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aaron Lindsay <aaron@os.amperecomputing.com>

The address calculation for IO regions introduced by

commit 787148bf928a54b5cc86f5b434f9399e9737679c
Author: Aaron Lindsay <aaron@os.amperecomputing.com>
    plugins: Expose physical addresses instead of device offsets

is not always accurate. Use the more correct
MemoryRegionSection.offset_within_address_space.

Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210720195735.3934473-1-aaron@os.amperecomputing.com>
Message-Id: <20210720232703.10650-25-alex.bennee@linaro.org>

diff --git a/plugins/api.c b/plugins/api.c
index 78b563c5c5..2d521e6ba8 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -319,7 +319,7 @@ uint64_t qemu_plugin_hwaddr_phys_addr(const struct qemu_plugin_hwaddr *haddr)
             return block->offset + offset + block->mr->addr;
         } else {
             MemoryRegionSection *mrs = haddr->v.io.section;
-            return haddr->v.io.offset + mrs->mr->addr;
+            return mrs->offset_within_address_space + haddr->v.io.offset;
         }
     }
 #endif
-- 
2.20.1


