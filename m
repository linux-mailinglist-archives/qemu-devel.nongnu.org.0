Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17263382BB1
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 14:01:55 +0200 (CEST)
Received: from localhost ([::1]:59168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1libwY-0003iP-4S
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 08:01:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1libqv-0003yw-5J
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:56:10 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:34699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1libqo-0002vY-On
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:56:03 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso5132917wmc.1
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 04:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h74n15CgGUrao8YiqbCGB58c5XEuJcuW9skFxH7JU3E=;
 b=VXGTlqG9kcZzQhGHsJnDnlQZh+FLyR7M8NMcboGO2Vksqf1DcZHNFMKQRimuZgasJU
 x4gYYMGyoIz8OeaMjlAiAridv/TiukPfuS3JNdKnmZ1MdWH69KAdQqZVvJhovcwjjSjW
 CqC6O6q2HV/z4ruyjH/eh4LUSCezCsO9Ot0KY2xULSlQnUeWkJ2k0BSvGxDWguECb6sZ
 Ky2g3i+ynXqgLDmvcNmZPifWwZEkwf5RoyVc4mmxixUhd4n0G/UsVLiKS6JOMldEBLl7
 6ScHmhvwceBDt85a7a1YxU7x5DA0ti/7VLU4JiNu98p6wZC4adVPens45GtwH+CORJcn
 e9sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=h74n15CgGUrao8YiqbCGB58c5XEuJcuW9skFxH7JU3E=;
 b=THd7JZjMnHVL4mCVETJ90iFLwltM8EtHAkLZcLB5SbMuQS2ZEMnMGl2bxOoAQNCOZ2
 G3DYgubMWxedPou5eUo/YstIXyN2khqBVa4C4vvRQn25rV7zKqbfDoF1szDu+q+pqW69
 vYnUOIxH5R4gJDwm1C61OSw2PBFOC/reECdgHGqhcy70FhGYADlktTMU7wjKGxh3AFGY
 c+PFbDtoilGlsju2wOMV+d/fG4hoBKZE/VZU2ewoKTF4WMIixzKCVYcotiRP9atdItfI
 /larrpH4FazjlbMsdbgTPkaPMzdDKta8D7VyCUDshJAahFcERjazv4MOUozb1ZY7Utr2
 sloQ==
X-Gm-Message-State: AOAM530g3aX+qc9/TxpSRJtIddLAo/R98tU6kgWi/UxhtaHt96dM/nKE
 nmf+hKWhMIePlYnn+4hDsGKvZS7Qc4MUFA==
X-Google-Smtp-Source: ABdhPJycW/h+x63pgRhNXWlXhkHnPVCdnZezMWARkl2+AioirvCmPvQEbqyCzCggnST1/LqTgkb8EA==
X-Received: by 2002:a05:600c:198a:: with SMTP id
 t10mr22200329wmq.97.1621252557207; 
 Mon, 17 May 2021 04:55:57 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id y2sm23625710wmq.45.2021.05.17.04.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 04:55:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 06/15] hw/acpi/memory_hotplug: Remove unused
 'hw/acpi/pc-hotplug.h' header
Date: Mon, 17 May 2021 13:55:16 +0200
Message-Id: <20210517115525.1088693-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210517115525.1088693-1-f4bug@amsat.org>
References: <20210517115525.1088693-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/acpi/memory_hotplug.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
index af378894235..104c1abd4eb 100644
--- a/hw/acpi/memory_hotplug.c
+++ b/hw/acpi/memory_hotplug.c
@@ -1,6 +1,5 @@
 #include "qemu/osdep.h"
 #include "hw/acpi/memory_hotplug.h"
-#include "hw/acpi/pc-hotplug.h"
 #include "hw/mem/pc-dimm.h"
 #include "hw/qdev-core.h"
 #include "migration/vmstate.h"
-- 
2.26.3


