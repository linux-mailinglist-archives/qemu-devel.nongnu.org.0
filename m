Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E5B351473
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 13:28:19 +0200 (CEST)
Received: from localhost ([::1]:44004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRvUo-0006Bz-Tk
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 07:28:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lRvPG-0000lY-1I
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 07:22:34 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:40547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lRvPD-0006gq-Td
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 07:22:33 -0400
Received: by mail-ed1-x532.google.com with SMTP id b16so1526647eds.7
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 04:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lEWIVDCtkimYtMK0ltNHTGDin3qV16dT3jK9cH3aIDI=;
 b=HhFegB0Hu2K6XbH+2BX+DNT8c9BbNMKQestSQX1WdY+EkZzV/sB85E8p+9jOs7fVML
 wIxn8NCUGuSh7LhxKjfF/wOhJ8fe9vnuQSCW9HkYTZ+EICP6vNy4AyTWLlO1lXWC5EsM
 nY9yi9cs/ulInHHFOkhlBYXNwnPKU0iMbncEE+YUKiLAF97P9xycMUeMSpYedGZbB8MJ
 PdYgwQrw+yC/AZ3TzQLnA5n9IaabSApi+o/bSlNp7RPHbn8SYvJdTOyKuauBhYStzEhY
 SjLcZTDRkN3To+Wt4djuhbwX8P8TaZoSGBFJrfrNDCYLQn8ICxkpIwx29M32cmDbpOwg
 bMRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=lEWIVDCtkimYtMK0ltNHTGDin3qV16dT3jK9cH3aIDI=;
 b=CfcHvZpG4DMwTPMXMAIXMt6rX3+7K5v3d7LfzcImbW4FGndAwt/uCSXv76NzAC4vyd
 spOh+UbPrA0zHJIUztHCXO8VFZ/ZG0JimNIigy4bxbVrE49MsRqfJ1M6M635pLlYEYgB
 1Km6S6gWtVL7vjQVh/iYNfjGEF75HQKpCTrZdqI4d/Sc6U3dtQ8NsNtfr65dzwo3QOWo
 xxalmKgKmdLLr+stXvA11MGlSRxbHu+tdlAnn/bQng6dnkBcCrcZkiO/T6X/dq5OkCya
 GL0rQJI5OwY8e2tCTs7hgGzinTgF2PMWrmb8vRvl2Dot+Fp+qw/Tqhk/ISp9fdiuJmFZ
 U5Sw==
X-Gm-Message-State: AOAM53132Tr89tavQOyXbd8QJRuYyGB2QbJ6xQKyQIGP8ZbERBSUu0+Y
 kXfYXvjOus/U4bijO97A3AlfbC5MriA=
X-Google-Smtp-Source: ABdhPJxFR9jAO7r8sW8lMV3pgTOMQKDPt5xCoDm4RufLoAco79BWeXcPucsHhPkfYSNs3OWc32Mnpw==
X-Received: by 2002:aa7:c9d1:: with SMTP id i17mr9029326edt.46.1617276148241; 
 Thu, 01 Apr 2021 04:22:28 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id d15sm3383516edx.62.2021.04.01.04.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 04:22:27 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/12] Revert "qom: use qemu_printf to print help for
 user-creatable objects"
Date: Thu,  1 Apr 2021 13:22:16 +0200
Message-Id: <20210401112223.55711-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210401112223.55711-1-pbonzini@redhat.com>
References: <20210401112223.55711-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

This reverts commit 6d9abb6de9cc53a508823db0283061824f2f98a2.

The real code change had already been added by Kevin's commit da0a932bbf
("hmp: QAPIfy object_add") and commit 6d9abb6d just added a duplicated
include statement as a left-over of a rebase.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210328054758.2351461-1-thuth@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qom/object_interfaces.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
index c3324b0f86..b17aa57de1 100644
--- a/qom/object_interfaces.c
+++ b/qom/object_interfaces.c
@@ -17,7 +17,6 @@
 #include "qemu/qemu-print.h"
 #include "qapi/opts-visitor.h"
 #include "qemu/config-file.h"
-#include "qemu/qemu-print.h"
 
 bool user_creatable_complete(UserCreatable *uc, Error **errp)
 {
-- 
2.30.1



