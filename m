Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF1B3DA361
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 14:51:54 +0200 (CEST)
Received: from localhost ([::1]:40910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m95Vx-0003ZD-Vo
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 08:51:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m95RY-0003T5-HS
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 08:47:20 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:34459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m95RX-0007WX-3z
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 08:47:20 -0400
Received: by mail-ed1-x532.google.com with SMTP id da26so8070548edb.1
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 05:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V7u3spPMXKKHXP+HJV/7psbE6yjKKmmYZelJx4HC01Q=;
 b=h2ckxjk9CtCrB5rvNmbOWZ+7G0BLZtfbCfI4zwOt4Fb2EwMOqXw1SKzdpMQesGhsRV
 g11W4tOjcMDfaofrOs84gS4SdSRLx9F1wys5A9xT/hIeanfPQ1CglcqWRYwLkTX/t2Dn
 img1jhLlMyawkW9Dgt/EZ2QESFUF5F/hqb72UhUWmdCwBG7CSylKngDriQWSNz/J+Ilw
 2klDfFiqdvUf9Ap1SEeAJwTI/vy+xmqtjY1k5cU/Tm3oYlYl0dDzrwIu8S/6MM981Upa
 IgUsqFTi7YODwpK5Ue8zOUR8mvLr5UwxMCTNIIRF4HW1SA/WhlOzGeHm7vW19R+NUO4P
 PQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=V7u3spPMXKKHXP+HJV/7psbE6yjKKmmYZelJx4HC01Q=;
 b=uZm/MvUlTsxNbFMNhfD76K9SeVH14gpu4jVOSGFYGhr9WhKx2d/gx/4B6cKpmI9IVT
 rTZQandT1FugWN6fjYTODo3trsHd54udyHMamsVs6gKx57Kk1xSpMWWeKupqbl4dkhSa
 lvJLtJadiGi+9iFmYjYTCCjdPPsEqC7AZeEqonEDb1XSWkGFpgXxO5lLK2M8yfzO4Ze6
 Xbrn7TG7VFH4CWJSDYq3zjJlgSGvhEv8r27OTg1T3rBdU54cTkCqk22pEH3TALdcrOHP
 jJcM8dsm/cvQ65KYofhDQHaSFsglxpmFH/EVN4q+vYc0iDxV4Cfn4QsreBxw3xkmTrdH
 qDPg==
X-Gm-Message-State: AOAM5311Kht/tGryoUZCQElrl4MQEr1fNah/ZjoUEyRRIxu0Qgtderpb
 6OlLuUKx8sV9msSTcPXQujE4sCvttuG3BA==
X-Google-Smtp-Source: ABdhPJxSzQLw0KHj1WABF1+bI2n3VV7d83x0R36zbsaYimP2u2o3DL53P/TN8naUjyaO7lP9L7tsrg==
X-Received: by 2002:a50:d64a:: with SMTP id c10mr6022403edj.199.1627562837709; 
 Thu, 29 Jul 2021 05:47:17 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id m12sm954659ejd.21.2021.07.29.05.47.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 05:47:17 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/7] Makefile: ignore long options
Date: Thu, 29 Jul 2021 14:47:08 +0200
Message-Id: <20210729124713.208422-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210729124713.208422-1-pbonzini@redhat.com>
References: <20210729124713.208422-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Alexey Neyman <stilor@att.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexey Neyman <stilor@att.net>

When searching for options like -n in MAKEFLAGS, current code may result
in a false positive match when make is invoked with long options like
--no-print-directory. This has been observed with certain versions of
host make (e.g. 3.82) while building the Qemu package in buildroot.

Filter out such long options before searching for one-character options.

Signed-off-by: Alexey Neyman <stilor@att.net>
Message-Id: <20210722020846.3678817-1-stilor@att.net>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 6c36330eef..401c623a65 100644
--- a/Makefile
+++ b/Makefile
@@ -129,9 +129,11 @@ endif
 # 4. Rules to bridge to other makefiles
 
 ifneq ($(NINJA),)
-MAKE.n = $(findstring n,$(firstword $(MAKEFLAGS)))
-MAKE.k = $(findstring k,$(firstword $(MAKEFLAGS)))
-MAKE.q = $(findstring q,$(firstword $(MAKEFLAGS)))
+# Filter out long options to avoid flags like --no-print-directory which
+# may result in false positive match for MAKE.n
+MAKE.n = $(findstring n,$(firstword $(filter-out --%,$(MAKEFLAGS))))
+MAKE.k = $(findstring k,$(firstword $(filter-out --%,$(MAKEFLAGS))))
+MAKE.q = $(findstring q,$(firstword $(filter-out --%,$(MAKEFLAGS))))
 MAKE.nq = $(if $(word 2, $(MAKE.n) $(MAKE.q)),nq)
 NINJAFLAGS = $(if $V,-v) $(if $(MAKE.n), -n) $(if $(MAKE.k), -k0) \
         $(filter-out -j, $(lastword -j1 $(filter -l% -j%, $(MAKEFLAGS)))) \
-- 
2.31.1



