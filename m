Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EAF5A9D7A
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 18:48:49 +0200 (CEST)
Received: from localhost ([::1]:55198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTnN1-0006SD-EK
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 12:48:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn1y-0001sA-Bc
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:02 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:39477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn1w-0001VH-Mu
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:02 -0400
Received: by mail-ej1-x62d.google.com with SMTP id fy31so35421750ejc.6
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 09:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=31lPKLYnuDCb1yDq5SV4IaHEb8zoMnE3VsuK5jWdAf8=;
 b=jBN/Y+NZ0iW7vQ9ssRpiDDYvWQq0MVS8FIE/GHhD5m6TB0IwhwA/xRV6NjjrPQ+gK3
 UOq0VBhPxqjEj3iIXBqy7XOoj+wsbrFwQ2D/NONDb4Quz4FfCmxlFP1vW1e/wkj2NPPX
 /1yuo+n7+Mb1O10ZpfAcVdK5FbVMzaDdeFjeWv1CaHRndSYhd9JVYN8NghBqrxj/Z047
 c8Q4a/s8akWODf1FOBMZyaLNQed3HPvV6pZDSWOmmKtLes55087VaD2U5ZBjbDe4v2Z5
 JDs9h6OXoIwm3avykkADVamjbilxBMeQ/gdAWkKYQ6bU3D+Gom+jmusbe31hidEH+L1Q
 Sqhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=31lPKLYnuDCb1yDq5SV4IaHEb8zoMnE3VsuK5jWdAf8=;
 b=HsecyipiAy7uZjpCjGqLXiTRKdxkBfigBrXZdhq2nQ+KlKCjMGzJZDM29y/V1mvoMj
 GiHuxzWj3kiE1Jb7OQZoxRz5Rg8txhAnxB4NK0qENuJITz/mL2JHykIf7pthePOomL74
 Dm+0hfXaLGcHfK9DyDwc+umZFnTAskWdnNYHJBrmGKMkZaXmqcv5Nzxyt/2PVFPkdNoE
 sDuALg3RQLZ7pX+vbWPRjtuc0n+ieXwjZCU80HKTyNFxI3AVe972N57+XXObT6AoUpK1
 lSOQbc1xmOFNPKF39cSZIuEoO6KTNrVDumumRo6lM6Bd8cGv0FNON6OE5OzgUegcujzD
 R1Ww==
X-Gm-Message-State: ACgBeo14Io31PSDlzPVFmkTWUwVTA+ZHkCjKs2Jc8rTom9ZZ66BrIcfS
 qXXb1JVeCfn9qjEZy798WPK6FGORTmo=
X-Google-Smtp-Source: AA6agR4+RK+LTyzJ7ndq710qxb4Ebn07lezPJdZaIf4DZ+a1xk5la59rw5w6+TQdnreKobKbOdk+Kw==
X-Received: by 2002:a17:906:cc0e:b0:73d:d898:3900 with SMTP id
 ml14-20020a170906cc0e00b0073dd8983900mr22466134ejb.82.1662049619229; 
 Thu, 01 Sep 2022 09:26:59 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 p6-20020aa7d306000000b00447c0dcbb99sm1587672edq.83.2022.09.01.09.26.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 09:26:58 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 12/42] hw/isa/piix3: Remove unused include
Date: Thu,  1 Sep 2022 18:25:43 +0200
Message-Id: <20220901162613.6939-13-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901162613.6939-1-shentey@gmail.com>
References: <20220901162613.6939-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Ammends commit 988fb613215993dd0ce642b89ca8182c479d39dd.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/piix3.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 0117f896d2..b54ff1c948 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -31,7 +31,6 @@
 #include "hw/qdev-properties.h"
 #include "hw/isa/isa.h"
 #include "hw/xen/xen.h"
-#include "sysemu/xen.h"
 #include "sysemu/reset.h"
 #include "sysemu/runstate.h"
 #include "migration/vmstate.h"
-- 
2.37.3


