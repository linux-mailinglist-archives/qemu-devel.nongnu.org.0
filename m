Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C24D1FB5AA
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 17:09:14 +0200 (CEST)
Received: from localhost ([::1]:36946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlDD7-0002Xj-76
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 11:09:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <flukshun@gmail.com>)
 id 1jlCRB-0004dk-9I; Tue, 16 Jun 2020 10:19:41 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:41889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <flukshun@gmail.com>)
 id 1jlCR9-000734-J9; Tue, 16 Jun 2020 10:19:40 -0400
Received: by mail-ot1-x344.google.com with SMTP id k15so16046034otp.8;
 Tue, 16 Jun 2020 07:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kAY3Dn2N1bHaiQSIZRgbVopwR1kTKhAsT3MjOygGjVA=;
 b=qifVdR3NpgESKquRDTJKu0r4SlbeUQmTzdnUiSHPHMkDB80rdOxPXUaw0dcjRpRucf
 +eF/uS6WIM6UYEakBAK/sH9BZZYv+EfayDJ7CSAnWPXQob7lBnhgdAzXOAN/NpQHK6Xh
 SJkfDjkl1YfKWcUo0+4WPEWvYDb5M/gS2Cq47pFydCXEJJS3AZ2sm3LlM+0oblLDMFUg
 MNa6H7a40jRRhCgywJl7hKoIySuKUY1ZdkxU4qaxOrXkW5YJdToQTRAsbv6bibdKS+VQ
 Ld2Op//B9qTfTRy+Q68I8NG0c1qR3NM/LADC7utA4/qLeZY6XilXFtr+Axtmj/W6BC76
 Y9AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=kAY3Dn2N1bHaiQSIZRgbVopwR1kTKhAsT3MjOygGjVA=;
 b=N0iO6AVoh8OcnQAyHdI0zU5oN8plc1YeUGTviB2/qf4Egf+8xG9JkzLVTDoc0jfenl
 shRdU7ncAtMkMFHxuYdqJ10OIwLcf+Ltp8bwk7LTBVNhRYXyRrug6vBCFWuT6tmzWmZl
 B61oEZmIgAvQuhEmHf0GhgoOdEOFPpJZEw7B4audVDcqyNyOjAn0l/dpRbF3qqHDdSX+
 iacReB5QON2ebLbkyeJ3NscApnnvrzZOJtaW1u055dEHTNRrT+85LBedDC/E90yNT8GU
 6b4giCZ8Adm5i9Y2Ab/vo+rlWDKhOJngY6S4UTTEfkpM0aWQ9pMSa76BYdPprvCrd96E
 iFNw==
X-Gm-Message-State: AOAM532CDKDvToy18EpMKqNJQBbXPfchrEFvFZUtiweBD80SfPCg8T9E
 Tgn6OhIwM0yGl50SZO+Tr1/mt362ikQ=
X-Google-Smtp-Source: ABdhPJzSaBmx+9tvAUsCnDJq8AbtirjnA2aqB3i0DTmNRZUJwerV+z2vnRsKY4VVNy3exTDFqU59oQ==
X-Received: by 2002:a9d:4691:: with SMTP id z17mr2524965ote.88.1592317176949; 
 Tue, 16 Jun 2020 07:19:36 -0700 (PDT)
Received: from localhost (76-251-165-188.lightspeed.austtx.sbcglobal.net.
 [76.251.165.188])
 by smtp.gmail.com with ESMTPSA id k7sm4035245oon.29.2020.06.16.07.19.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 16 Jun 2020 07:19:36 -0700 (PDT)
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 73/78] net: Do not include a newline in the id of -nic devices
Date: Tue, 16 Jun 2020 09:15:42 -0500
Message-Id: <20200616141547.24664-74-mdroth@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200616141547.24664-1-mdroth@linux.vnet.ibm.com>
References: <20200616141547.24664-1-mdroth@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=flukshun@gmail.com; helo=mail-ot1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-stable@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

The '\n' sneaked in by accident here, an "id" string should really
not contain a newline character at the end.

Fixes: 78cd6f7bf6b ('net: Add a new convenience option "--nic" ...')
Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20200518074352.23125-1-thuth@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
(cherry picked from commit 0561dfac082becdd9e89110249a27b309b62aa9f)
Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
---
 net/net.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/net.c b/net/net.c
index 84aa6d8d00..58adaafba9 100644
--- a/net/net.c
+++ b/net/net.c
@@ -1524,7 +1524,7 @@ static int net_param_nic(void *dummy, QemuOpts *opts, Error **errp)
     /* Create an ID if the user did not specify one */
     nd_id = g_strdup(qemu_opts_id(opts));
     if (!nd_id) {
-        nd_id = g_strdup_printf("__org.qemu.nic%i\n", idx);
+        nd_id = g_strdup_printf("__org.qemu.nic%i", idx);
         qemu_opts_set_id(opts, nd_id);
     }
 
-- 
2.17.1


