Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 362C0648150
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 12:08:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3bDh-0004yC-Cc; Fri, 09 Dec 2022 06:07:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3bDI-0004wv-D4
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:06:49 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3bDG-0000Zy-Qq
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:06:43 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so3158207wms.2
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 03:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P1XZqzx8SzT2AxQxVxKOk6muGF552luMg73/1kO+f3k=;
 b=Mrcfhes7AV4wSEN7Yjkp0qBJznyW9JsQtege4gj4gcxiniLFiUWBVMWCclUhr3AU87
 MhHQqQv/VM8kqeSBo25mPVyS9xgfVf9nGBzhYg+GB1aDpsmAKZvctK/APyvIXp7vCHnz
 rnXfCqAFX43yO+ABBZfFvlcw7HTKM8352rqWS5M/MzC/9BIzPDfn9Dy2aV9bCoYz2o3d
 4yKnf683k+FKxraoB2mUraMgmKNblB3eR25T+CLV/DoXzTKmbbCbyARex0kupt0hRiZV
 LRKvzhs7+Cbv6KuadixlTA4POOFp/FGDdHBngNUOh4n5JN+EAe8b5I+Wm+4VLbFfBOx4
 jTrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P1XZqzx8SzT2AxQxVxKOk6muGF552luMg73/1kO+f3k=;
 b=EUom8UnZ01rpBLJ08SDvOXpgwjKMb4FYTWMBFzIGiNHZqro5aEOSmo66PF0CutL5C/
 +MANIV5IleBwZbbxnWmLWVa7hYukncAD2DzL0L173Ar0bhASqVUQMgXSeiVW4BSIcvGN
 LSZZINv1Yw8+xMXZJXaKesQrDR5x7xQh0jqw3Q1r/JH48rzsTdvooajITRTjEzVGKXLk
 5VdXAfpC42qAeNjgxjm55zuT1yoj0oM5JunKVaBn6TBkFu02pjaPe+9WZN0Z2UlAh+ak
 YEzkg4Q/PggKij5gUaYCUstvc5eXe+pX4UyR/yA3yCdGjvNSYbY/uW9c0zmoLcNsKoSQ
 rXuQ==
X-Gm-Message-State: ANoB5pkiZe4l3z48kNyN2pqg4NMhGtq/nNs50cMpRQ7CsVMg5KCS0U9p
 hTPsFlVjQFvObi0E17SAHqzkY49ddz+Z2Vg7O5E=
X-Google-Smtp-Source: AA0mqf5jR6n5mzVcnb72vMQus8FxZPR9u9FbtVD8Th+MP6nVXz+dtk8AMhqFurbq6eVM873VRsJREg==
X-Received: by 2002:a05:600c:4e91:b0:3d1:dc6f:b1a4 with SMTP id
 f17-20020a05600c4e9100b003d1dc6fb1a4mr5810026wmq.5.1670584000957; 
 Fri, 09 Dec 2022 03:06:40 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 a9-20020a05600c2d4900b003c6bd12ac27sm1349204wmg.37.2022.12.09.03.06.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 09 Dec 2022 03:06:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.0 v3 1/2] physmem: Remove unused "exec/translate-all.h"
Date: Fri,  9 Dec 2022 12:06:30 +0100
Message-Id: <20221209110631.59031-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221209110631.59031-1-philmd@linaro.org>
References: <20221209110631.59031-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 softmmu/physmem.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 1b606a3002..d562c0bb93 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -58,7 +58,6 @@
 
 #include "qemu/rcu_queue.h"
 #include "qemu/main-loop.h"
-#include "exec/translate-all.h"
 #include "sysemu/replay.h"
 
 #include "exec/memory-internal.h"
-- 
2.38.1


