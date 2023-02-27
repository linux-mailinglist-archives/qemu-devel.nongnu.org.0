Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A546A4490
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:36:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeFP-0001tg-8c; Mon, 27 Feb 2023 09:12:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeDN-0007v1-1g
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:10:56 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeDL-0000uG-5Q
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:10:52 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 j19-20020a05600c191300b003eb3e1eb0caso2618385wmq.1
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CIcWv0TaZDoMbaIrFqE7v6/az4WY6LGOfyL+qqwxUsI=;
 b=gQbYxqQHzZdRr7ksqnU8yaLeh9BVZElEhM84a/lHzvAf8Yx8YH55O1si77K/DokadF
 HFBojcfGdlYVFy1GMnOWZsFaZv2pI5SboLJbKPaPYup7u2knkxnRndbUqXHFLmMxib7X
 0OTYwP0mkVWYY4lDTtJx1Or40UiUNbM1mnsfYpuo6fmilhPqwANntQCT08puit8tBGlV
 WGMqCn0qoAcjL6h6PoGYUQBdrvmDb68Q1Vi2cCWIPk00RR351Fap+5PoZ6WP6LV2k6cP
 tG5WjNtz8r7mrzXu/dNSjlhPLNuHaRqSOrOwj49N+FdpVKbvBNQQ3dJaYD25bnBHEorj
 fQ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CIcWv0TaZDoMbaIrFqE7v6/az4WY6LGOfyL+qqwxUsI=;
 b=IzAduyFwZLwxs8qQNgrUgBCmZH84OWwuxB4UHIQNamIeEWQ4fe2u2XEsHUru8FzM9y
 W+v/WowmELY/5irRhwcAQPG0zvIypkPpfEYXs5IK5uQqiC7T7zVTmyL9NRuvShub9ygG
 LelaRO9GUHw8+fT/2K1NbOJFbJML1ogp7zRy45nIRLQ4YQ9l+tIRfqmEuw0wjqUUDBfL
 lRysOX40ot5mMEvaAXtX6E0CLaWSAstmCcO0GLnxyVvkMdyl2gkpP0O3X1viGiJ0F6je
 Qx/wd0KFOa8lG3LuGGN7fqaWg4BVQtY3JJE9J3uxR0SpR8GntCMB1lj747VivygDuHBt
 ilkQ==
X-Gm-Message-State: AO0yUKWLoW00eMAo+2k4DyWtRsa0+wsQGgzsFhKxGgmVun8lNWy77cD6
 HZwwW4YStsUoxm5gQCels/cEm04NXZbgxFgv
X-Google-Smtp-Source: AK7set+ibW0r1zojqwHelktZCmYd9AGVdQy2rVuhyoOiveeO3N6qxUV/uzhPhZp6lTR261hVbFsS4A==
X-Received: by 2002:a05:600c:30d2:b0:3eb:3692:644e with SMTP id
 h18-20020a05600c30d200b003eb3692644emr5282436wmn.33.1677507050231; 
 Mon, 27 Feb 2023 06:10:50 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a1c540d000000b003db06224953sm9499129wmb.41.2023.02.27.06.10.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:10:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 104/126] hw/ide: Remove unused 'qapi/qapi-types-run-state.h'
Date: Mon, 27 Feb 2023 15:01:51 +0100
Message-Id: <20230227140213.35084-95-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

Missed in commit d7458e7754 ("hw/ide/internal: Remove unused
DMARestartFunc typedef") which removed the single use of RunState.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230215112712.23110-8-philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/hw/ide/internal.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
index 29a8e79817..e6deb1c5dc 100644
--- a/include/hw/ide/internal.h
+++ b/include/hw/ide/internal.h
@@ -7,7 +7,6 @@
  * non-internal declarations are in hw/ide.h
  */
 
-#include "qapi/qapi-types-run-state.h"
 #include "hw/ide.h"
 #include "hw/irq.h"
 #include "hw/isa/isa.h"
-- 
2.38.1


