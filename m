Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B15663C1610
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:34:04 +0200 (CEST)
Received: from localhost ([::1]:41828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1W2N-00076A-OA
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:34:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vmy-0000V0-Ul
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:08 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:36542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m1Vmx-0008ED-DN
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:18:08 -0400
Received: by mail-ed1-x52b.google.com with SMTP id h2so9075922edt.3
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FiDDayin7HJXjqU9AzxoZp/3bpNscaqg9/qQn+dbhhA=;
 b=G+sw1f9Fx/LsydpeuipqR3Ng0RGZWAQ8IrIDlZhaVG7L9rfoAr7wMO/iikQkS9ql6n
 HMSwybUysBdxylw16NgxKIGGgo57u8Xpcqv5fnEUCHM6vBbOgjezbV95jKoscCmQfLsn
 OBF7YfKCQhkG7QOSLVuAirarMCgQW58Z0JnaWrHiwvhZH3FT0/UaoTziUcIWQAnNi6KE
 1w0znxPD3OCpfO4YmSDlFYlKe0iaMG1xLC1Hc/US/pBmldlMwGzX8310NV4mZ5VmAx9X
 8HFPGgwkqmPOYqko4FC+xSs5nVsxZFQXDZeR8frH9BTmv5il2WtQyGBaybm+Ae7RIepz
 Bq4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=FiDDayin7HJXjqU9AzxoZp/3bpNscaqg9/qQn+dbhhA=;
 b=V31N+xspEV9+H0+ZSuzkuriQ5G0tnr8DqgADUpR92veC00zdzrtKMLRXanaV40uZt3
 S3zffYEHRw8Dx90nc2PP0jJ8B1Av5A8oAjgYS3N15xJ0+mgFsXxQ/q6bgsfqFTLP9e00
 gxPpE7kh4cVh/Pd0vIc7aTVHVeyARd86jhAvvikkiIMR+Q37bK9cjxu1YzFJMsC3nuhq
 Hny/yim8exsYf46XccAUPkvfcdQe/H41MDOTqBYXWRCHO/Vu5r2qb03wJ3qnaDY8B1Zy
 wPCdeFiJrnYlTN6IjBvomHCEtrgvb1jDJ9uxTcw8ridnVV6V9/smeSilUyvREfRvM3p2
 l2eg==
X-Gm-Message-State: AOAM5314lBuB8jaXugGP1WPR4hw7Fo3D8tjgiTNO8CWrx44UsDU6pjjp
 KoIYqpzu5Eaf8jSKgL4q9cGH0WgNrhM=
X-Google-Smtp-Source: ABdhPJwfDldnk6lTy35+d8vm3uNn2PC+ZWsC1x69Z6wMvTN5ys2+Sb1OwEyW8o8WY8WZ+k9jIXQ+8g==
X-Received: by 2002:a05:6402:90b:: with SMTP id
 g11mr39541253edz.336.1625757486098; 
 Thu, 08 Jul 2021 08:18:06 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ak16sm1103694ejc.17.2021.07.08.08.18.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 08:18:05 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 23/48] modules: check arch on qom lookup
Date: Thu,  8 Jul 2021 17:17:23 +0200
Message-Id: <20210708151748.408754-24-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708151748.408754-1-pbonzini@redhat.com>
References: <20210708151748.408754-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Jose R . Ziviani" <jziviani@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gerd Hoffmann <kraxel@redhat.com>

With target-specific modules we can have multiple modules implementing
the same object.  Therefore we have to check the target arch on lookup
to find the correct module.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Jose R. Ziviani <jziviani@suse.de>
Message-Id: <20210624103836.2382472-20-kraxel@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/module.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/util/module.c b/util/module.c
index 065aed09ff..6bb4ad915a 100644
--- a/util/module.c
+++ b/util/module.c
@@ -329,6 +329,9 @@ void module_load_qom_one(const char *type)
         if (!modinfo->objs) {
             continue;
         }
+        if (!module_check_arch(modinfo)) {
+            continue;
+        }
         for (sl = modinfo->objs; *sl != NULL; sl++) {
             if (strcmp(type, *sl) == 0) {
                 module_load_one("", modinfo->name, false);
@@ -349,6 +352,9 @@ void module_load_qom_all(void)
         if (!modinfo->objs) {
             continue;
         }
+        if (!module_check_arch(modinfo)) {
+            continue;
+        }
         module_load_one("", modinfo->name, false);
     }
     module_loaded_qom_all = true;
-- 
2.31.1



