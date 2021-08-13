Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5549F3EB61F
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 15:40:16 +0200 (CEST)
Received: from localhost ([::1]:34178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEXPz-0005qz-DP
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 09:40:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mEXNE-0001Uz-Co
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 09:37:24 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:46773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mEXNC-0002f4-5m
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 09:37:24 -0400
Received: by mail-wr1-x431.google.com with SMTP id f5so13295604wrm.13
 for <qemu-devel@nongnu.org>; Fri, 13 Aug 2021 06:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b2NyfF/otIRHGJukgp7GESYRZCWhUy3Br4FtVTJRyvo=;
 b=R4ysGzA/bNAHyTQsP4nq6NR1+jWAjerxdUwDaAKWW1E9Hf2VmD9IrTcswMqmtXVLL/
 v9+fm6rT9yWHgpItBEcjsEK99qq6eanS9WGb2SUfMwWUQcP8gsUTna6I8/cccifum6Kx
 hlTAYRDuKYoLUZZKFHfOE358M0jQtq6yOZTAOWjauqIykMXeVxvFYbmIjSlloDNh36PM
 5wYJRPseznkyB0PM8eZWEwsOvcPIDd1yhO3IxXrANsOZzfKxgIllluVbEv2rEJG0zhm9
 mPYNksq6zJb4udcN0W+EEZo+bDf45DtamfXaJs2CDJNkicjjHT1vFcTZ2F2ARJSg0OUg
 WCVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=b2NyfF/otIRHGJukgp7GESYRZCWhUy3Br4FtVTJRyvo=;
 b=NJfDOWIOGbWXZ1lEM2Gc7zxpMua6XYD8u481aqm0Obl6s8B2KnpBobOKHhvF1BXrGw
 hZjgkuren9vEJi+OlzSmO+DgsN81lEzD3kTMblqmTxVUbfUaPQMNKwgqErcANJDjsqUA
 6bQsco8Pv2colG8iQGjDytV9j+Xn1lW/RFBQyRPtvCxp8suOqjLvcHJfzC45f3HoJ+PS
 vJK1DrlhONSDDavF3DxNJ5lvnoD3ygZYI+pTxeZQQ2T+lnZeXh0mw+rFiL9UFRvzhpsp
 wPXEYQafrCLJ9jIGefTiuFu5KWUslDEaFFdPyRY/O1UKwly3Rl8d9MjWC3oclQwZf0oC
 ziYg==
X-Gm-Message-State: AOAM531W5r/qjyQ5nw8T68GxLp4aaroNM9K/Wli6tkOnj3j/W0X1uIa+
 jGWEma7GC42W1XuJgiulJIuS4Vl1YBl/6Q==
X-Google-Smtp-Source: ABdhPJxNjsAPGxVB5xGDGQhmPTQEGzAG0ULUlKsi7llJu1SAeAfq4FQ4SoqrLqEh+loKbUOCTEBpcg==
X-Received: by 2002:adf:a4c4:: with SMTP id h4mr3155029wrb.367.1628861840812; 
 Fri, 13 Aug 2021 06:37:20 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 w1sm1413671wmc.19.2021.08.13.06.37.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 06:37:20 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/3] hw/core: fix error checking in smp_parse
Date: Fri, 13 Aug 2021 15:37:16 +0200
Message-Id: <20210813133716.289058-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210813133716.289058-1-pbonzini@redhat.com>
References: <20210813133716.289058-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

machine_set_smp() mistakenly checks 'errp' not '*errp',
and so thinks there is an error every single time it runs.
This causes it to jump to the end of the method, skipping
the max CPUs checks. The caller meanwhile sees no error
and so carries on execution. The result of all this is:

 $ qemu-system-x86_64 -smp -1
 qemu-system-x86_64: GLib: ../glib/gmem.c:142: failed to allocate 481036337048 bytes

instead of

 $ qemu-system-x86_64 -smp -1
 qemu-system-x86_64: Invalid SMP CPUs -1. The max CPUs supported by machine 'pc-i440fx-6.1' is 255

This is a regression from

  commit fe68090e8fbd6e831aaf3fc3bb0459c5cccf14cf
  Author: Paolo Bonzini <pbonzini@redhat.com>
  Date:   Thu May 13 09:03:48 2021 -0400

    machine: add smp compound property

Closes: https://gitlab.com/qemu-project/qemu/-/issues/524
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210812175353.4128471-1-berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/machine.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index abaeda589b..54e040587d 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -833,7 +833,7 @@ static void machine_set_smp(Object *obj, Visitor *v, const char *name,
     }
 
     mc->smp_parse(ms, config, errp);
-    if (errp) {
+    if (*errp) {
         goto out_free;
     }
 
-- 
2.31.1


