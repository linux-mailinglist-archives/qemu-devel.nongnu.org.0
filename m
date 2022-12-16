Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9098364EA44
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 12:24:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p68n8-00022g-Tn; Fri, 16 Dec 2022 06:22:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p68n6-00021a-Jv
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 06:22:12 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1p68n3-00067Q-Ug
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 06:22:12 -0500
Received: by mail-wr1-x433.google.com with SMTP id o5so2186642wrm.1
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 03:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BgiiBb+yScI+SL2a4SbN56s5Ld04rpPxAdeXU8vVFIY=;
 b=KnKehXyWDns0B5o5+TZgEZDYCXazjpeIgKhcKi4SK3WckClQHvZxxDcSTlteqQfHCx
 KAVqcRoXqMutoy2g+PiddBXp0VdXy+88Rc1nskuVEBeckXrCLR+DPGa0fDh1BkS9uT5x
 WGaVj9/kj2a0eI5i3G9k4wC+i9FpF60a+5Z8QXnhCBOmrnlkvFXrHHWla3RJJkRaNeNd
 JuBbSmAfCIfClYqp7nffZPZt2y4EjPHV5zDkfFHNBoAdUJIlImDR5PvU4MGgpJ6sXYpT
 vEZOvw5q9DvUyRz4Vz1y64ow7Xp+Pvu+rE8k0gRbtq1ApmrJGWtv7farGDhCYcnaAOfd
 Yciw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BgiiBb+yScI+SL2a4SbN56s5Ld04rpPxAdeXU8vVFIY=;
 b=Ki7lpo8Xxqpu8CQZFZYD9QAWHz0UsgBWMhTkD05/iJoBavb7H+973CQiNXVprUvgju
 F1+SheBiH3y88NzGHGRbutO1dJV5lenaXE7g8S4MjcQAkDhfkQMVm/1qfLlARFmub+kN
 Gn+WkvAtCStaoiE7UCREBT38aTBYWcJDpQSvqa0Cv5KAx5/nzURkbKRYqvJcLO7q9VmQ
 pW1CSpcJ99ObA67dvHsmKspUOfUEAyoL1jgrq8zyB5ARpf7dSAQcqC0ZXJ6liH5DmNbk
 acZ+sFW4f4KCLGXR6jXXmX5YHfeZspFYE+8lr8Drowr1Cz2Cy8//WnxsGk1XMb5w0FT0
 EF1g==
X-Gm-Message-State: ANoB5pmBgJ40aI4uH7EsHa+e2AQs9eMis80eGBBqaCRcba7atcg35U91
 WxjaAJepWovdOkd1bgW7VADsgA==
X-Google-Smtp-Source: AA0mqf6UfIvwg9x2+D+2CAWrM9re2a24Y9M0/YxqdLhYP33CXjP1z6ebrdqkVN7FHWkZt+W1HU/QQg==
X-Received: by 2002:a5d:4e06:0:b0:242:4f56:6b4b with SMTP id
 p6-20020a5d4e06000000b002424f566b4bmr19780600wrt.38.1671189728663; 
 Fri, 16 Dec 2022 03:22:08 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 b4-20020a5d4d84000000b002423a5d7cb1sm1981521wru.113.2022.12.16.03.22.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 03:22:07 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 16CE41FFBA;
 Fri, 16 Dec 2022 11:22:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, mads@ynddal.dk,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH  v1 02/10] gdbstub: fix-up copyright and license files
Date: Fri, 16 Dec 2022 11:21:58 +0000
Message-Id: <20221216112206.3171578-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221216112206.3171578-1-alex.bennee@linaro.org>
References: <20221216112206.3171578-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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

When I started splitting gdbstub apart I was a little too boilerplate
with my file headers. Fix up to carry over Fabrice's copyright and the
LGPL license header.

Fixes: ae7467b1ac (gdbstub: move breakpoint logic to accel ops)
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub/softmmu.c | 3 ++-
 gdbstub/user.c    | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/gdbstub/softmmu.c b/gdbstub/softmmu.c
index f208c6cf15..183dfb40e4 100644
--- a/gdbstub/softmmu.c
+++ b/gdbstub/softmmu.c
@@ -4,9 +4,10 @@
  * Debug integration depends on support from the individual
  * accelerators so most of this involves calling the ops helpers.
  *
+ * Copyright (c) 2003-2005 Fabrice Bellard
  * Copyright (c) 2022 Linaro Ltd
  *
- * SPDX-License-Identifier: GPL-2.0-or-later
+ * SPDX-License-Identifier: LGPL-2.0+
  */
 
 #include "qemu/osdep.h"
diff --git a/gdbstub/user.c b/gdbstub/user.c
index 033e5fdd71..a5f370bcf9 100644
--- a/gdbstub/user.c
+++ b/gdbstub/user.c
@@ -3,9 +3,10 @@
  *
  * We know for user-mode we are using TCG so we can call stuff directly.
  *
+ * Copyright (c) 2003-2005 Fabrice Bellard
  * Copyright (c) 2022 Linaro Ltd
  *
- * SPDX-License-Identifier: GPL-2.0-or-later
+ * SPDX-License-Identifier: LGPL-2.0+
  */
 
 #include "qemu/osdep.h"
-- 
2.34.1


