Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB17431B94D
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 13:33:04 +0100 (CET)
Received: from localhost ([::1]:52990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBd3n-0002V9-Tn
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 07:33:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lBcsK-000833-F3
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 07:21:12 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:40439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lBcsI-0007Fi-Ot
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 07:21:12 -0500
Received: by mail-ed1-x533.google.com with SMTP id q10so7732080edt.7
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 04:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fXrVralff0SjoDVI5QtpCncRZch593aCZlgQG/xWAvk=;
 b=L+CkY36hcfEHtDWMAKJbVwqo48m4wFnpnJrdI4CvjF6YdCtzuOfPwGJ1LPo7x0fzOO
 sH08YRulwInI/mOIjsqTqbIf8yQ1f7pEjlhME0nmEPHPbJ+7CHUSKipc+TKHkwcTx425
 oisIEE0/zEl5zHUu7NWe6L6LD8sj4TF8l/Tb3HI8b92l21MHCubVjPWY/GtMtzJHCIh+
 EXneIwcuupOimkz75X65R5ZyDyUK4MqhI0Xdwh74pUJhnH1uczDxFwAQloHBNX/g5Air
 O9TJqsVvCw3YSPFR5Joa0o6tXYpSQWWGur1mkDb7o3ygm/DnBkYOAy0rWMxKmrMJqqCB
 GdMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=fXrVralff0SjoDVI5QtpCncRZch593aCZlgQG/xWAvk=;
 b=bt9tuZ41/iwgyBn/VEO0MTqgrdZTbZp6vh3fKxFWPb24hfHFOYpsHwufwiuqWwa0in
 66ipHnA7Qhsw/RApl3UgFZCq56BrgsybnGmZjEWfQ36TbIkN6MknSM+x/DQHricWAzse
 cfY3N6tUXwOdMV2DJJdNu47CzSExKT86BxfD4pDNSIPL+VLFoKQW6G92fRovLaGyu0rx
 doog/S8XVvjGJktfnLH23eNZGv1M4AQ+Tz1+tjJcOxQzySbOrZNITUYptadsTwykqVMv
 +OkfdSQz8kEAk+Uv9Wp/cX7VyHpQI+/+u6Olk/8aEZJDtdPoK1+vd5yMEerf3BzXx40T
 Tc2A==
X-Gm-Message-State: AOAM53379qnIM3HoaSjD9OlHua3w5/s8rKLTQW5XweMVz1TgGJvJg2RE
 XJYNl6ZH5EurCw933UbPUL3FNnDulWY=
X-Google-Smtp-Source: ABdhPJyzG6H6e4l29pVcNnlxVJh67Bfo9oKdThIztrlWdxae1m5F34xP9jYGhsEBmfrxDWnq1lAxHA==
X-Received: by 2002:a05:6402:26d5:: with SMTP id
 x21mr15293514edd.50.1613391665578; 
 Mon, 15 Feb 2021 04:21:05 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c18sm9676794edu.20.2021.02.15.04.21.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 04:21:04 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] build-sys: invoke ninja with -d keepdepfile
Date: Mon, 15 Feb 2021 13:21:03 +0100
Message-Id: <20210215122103.63933-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After reading the dependency file, ninja just deletes it, in the name
of cleanliness I guess.  However this complicates debugging unnecessarily
compared to good old "-include *.d".  Use the keepdepfile debugging
option to make it easier to see what is going on.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index d7fb6b270e..bcbbec71a1 100644
--- a/Makefile
+++ b/Makefile
@@ -149,7 +149,7 @@ $(ninja-targets): run-ninja
 # --output-sync line.
 run-ninja: config-host.mak
 ifneq ($(filter $(ninja-targets), $(ninja-cmd-goals)),)
-	+$(quiet-@)$(if $(MAKE.nq),@:, $(NINJA) \
+	+$(quiet-@)$(if $(MAKE.nq),@:, $(NINJA) -d keepdepfile \
 	   $(NINJAFLAGS) $(sort $(filter $(ninja-targets), $(ninja-cmd-goals))) | cat)
 endif
 endif
-- 
2.29.2


