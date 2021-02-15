Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C27031BA34
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 14:20:23 +0100 (CET)
Received: from localhost ([::1]:53622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBdna-0007LC-Cv
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 08:20:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lBdjw-0005X4-It
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 08:16:36 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:34188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lBdjv-0005W2-4q
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 08:16:36 -0500
Received: by mail-ej1-x633.google.com with SMTP id hs11so11110220ejc.1
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 05:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pJZ2UzBf4qDMvnMPIQu0goRmI82r4LnUGUSIEIbHu28=;
 b=prGqWKlb+KXC+JiAqDfHZWjVxNpZagjIosLfj6WE6d/+MgT09/8VVb91ZnovWVX1dB
 9tFYGd86ygFMOAAuCnLWhKFzzUk2+taxHyBWrV5Rz0g/JrFaTqbzWKO0QAepWQ205+tH
 HqNr0HHDQhhoRwM2O7+R8uua6IQe5lSvTRpEruDC6zgfyH8odAsxjb4MFascOzsRW+nt
 Dlcg5eVuN/0IdMC4dEcH0P7+TEgiXaySfcbha55iGvVKfdK++CeMGLHQZXik45plukzl
 kTqb2ZcEfStQbGi0pc2MOHnndZ5HG67Tek1GWOHpP7YQa7ZJt85dD5ub05m8lEfSliND
 6LCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=pJZ2UzBf4qDMvnMPIQu0goRmI82r4LnUGUSIEIbHu28=;
 b=dnNUx/TJbDMPSebMIMlf63H/LufA1MD82Vu+8M4wZ/dr6WqhoDWMp3PjbecyenPsR6
 13R62ma4EDp0rKoAaJna3Ts6nug5h00LrBCf9RbGtgf8JtY9H7WI7GpeNAUnAqHsrv1d
 m4SwwA9W6AHApLpliHwgJssEQBV0/QugtSYRHUzujP36iH8Nm7bzuw5IRFrH2m9B0A4n
 i8rlatSRvYo4PGhHUXZhW2P3TUFLeNTGwFp7aezFIjpR0Ueby7R8PscvgF3yFFuo97LI
 x6vMbgcC9qV6kpMyLvUfsw2je9O/yaXWa+VqyW02wzzWsWRutjf9x2ZkTVhIzXiPvv8R
 6Mqg==
X-Gm-Message-State: AOAM532rGQf1SVI60lVrORIEv4AOPjoBkY5M/eBnXiwY+ynk7iaKKytq
 D46n1jo/z3bIym2GFHts+wKoFR8JDN0=
X-Google-Smtp-Source: ABdhPJzoM9+bja1FDbf4YAg9+EriQnQ8JRPknyas5GQmF6zQm8olF/slNmlnSy8jfHUUUCIkjlkMHA==
X-Received: by 2002:a17:907:35cb:: with SMTP id
 ap11mr15709405ejc.459.1613394993877; 
 Mon, 15 Feb 2021 05:16:33 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o4sm9950184edw.78.2021.02.15.05.16.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 05:16:33 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/19] sev/i386: Enable an SEV-ES guest based on SEV policy
Date: Mon, 15 Feb 2021 14:16:15 +0100
Message-Id: <20210215131626.65640-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210215131626.65640-1-pbonzini@redhat.com>
References: <20210215131626.65640-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x633.google.com
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 Venu Busireddy <venu.busireddy@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Tom Lendacky <thomas.lendacky@amd.com>

Update the sev_es_enabled() function return value to be based on the SEV
policy that has been specified. SEV-ES is enabled if SEV is enabled and
the SEV-ES policy bit is set in the policy object.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
Reviewed-by: Venu Busireddy <venu.busireddy@oracle.com>
Message-Id: <c69f81c6029f31fc4c52a9f35f1bd704362476a5.1611682609.git.thomas.lendacky@amd.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/sev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/sev.c b/target/i386/sev.c
index 4b70d4284f..0f414df02f 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -356,7 +356,7 @@ sev_enabled(void)
 bool
 sev_es_enabled(void)
 {
-    return false;
+    return sev_enabled() && (sev_guest->policy & SEV_POLICY_ES);
 }
 
 uint64_t
-- 
2.29.2



