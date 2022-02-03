Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B82054A8CF6
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 21:10:03 +0100 (CET)
Received: from localhost ([::1]:46406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFiQb-0006eI-IR
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 15:10:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFheS-00030K-PO
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:20:19 -0500
Received: from [2607:f8b0:4864:20::635] (port=43676
 helo=mail-pl1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFheP-0002ZP-AH
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:20:15 -0500
Received: by mail-pl1-x635.google.com with SMTP id d1so3007172plh.10
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 11:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xRNuVWjHnz4AEmzf2/W8Pgl1VXuC167dQIcX38lV+CU=;
 b=IbzhXVZ63aqvpBQ4mJC1+6basybn8bDjyAcJeK2q0otu1hlhYPqh9XQdMW1gNlPQTn
 qgAmmvMc2Ez36XS8s+sFdZm/lQSmWqU+eeSbN1b8GBNZ0FeXt5G+JuizYk9TVNn7q6ES
 iDeUC+wgskV01ItVS3ROPjDDU2rOs/Yio5/mbdX4NhFWTYCrWi+JW4ItIfNAQ5rC8gFy
 8Wnoapw8KrqeC5q7o4l06XcwIkkFFtfzxXhmyarCTIueZV6KV6o+ez3ICwyOSv0nifLA
 3NuC4C69trkRa9okbv4E0kVct93g0xuKE4Lmjp5FOprY0hRAQZbf7K69qJP8bHmvXXoU
 7LyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xRNuVWjHnz4AEmzf2/W8Pgl1VXuC167dQIcX38lV+CU=;
 b=N05r+kRbxlXnp4SPV9UkX5zdZtKAqkcMpB5et0pA4Cku7Ncs1Y27PIaIG3IYYstFrY
 /jleSWNJa5t7f63S9Lalzux6dgvOFUiP1Q66Ow6Xv3yzFATIvhuCrbXeZf3VETRZ9Kim
 +EMxs1njzwF6igsPSVRYKpfJVYCCwJE+dmkkcu5bCyIr8KHvzzlrfpHXg0dNHkZawVim
 fIHQOCuJsn1UwYw3dPP3/sNzHLkUIydOv9/UmN2d5MUDYXL/KRB3kR/aPxP8iBd2ai4j
 fPFIn7CG/ubD+iuid23VwM+f2IUq98ygni3R6fzBi858VNPJC203R6irbKxPSu9pbi+g
 u8Ng==
X-Gm-Message-State: AOAM533GdQN942rWVKsem3LqG2xBQOWi/JCLpE6b/hzZBwhGiKcq/Cmu
 QyTAGpCrVX8ARZKWr0RmoATy5ayLW3A=
X-Google-Smtp-Source: ABdhPJwVAhOmJBmAMpAEyFMvqi8mSu6dLqxPLQLu6swh5JdmNfZE3gPtWDV2FZZRlNSJFTswiS3N0Q==
X-Received: by 2002:a17:90b:1898:: with SMTP id
 mn24mr15524129pjb.123.1643916011811; 
 Thu, 03 Feb 2022 11:20:11 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id q16sm29876917pfu.194.2022.02.03.11.20.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 03 Feb 2022 11:20:11 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 14/21] softmmu/physmem: Remove unnecessary include
Date: Thu,  3 Feb 2022 20:18:07 +0100
Message-Id: <20220203191814.45023-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203191814.45023-1-f4bug@amsat.org>
References: <20220203191814.45023-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::635
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 softmmu/physmem.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index eb4b3bcae7..09951c0996 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -60,7 +60,6 @@
 
 #include "exec/memory-internal.h"
 #include "exec/ram_addr.h"
-#include "exec/log.h"
 
 #include "qemu/pmem.h"
 
-- 
2.34.1


