Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A04457685
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 19:38:25 +0100 (CET)
Received: from localhost ([::1]:42008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo8mG-0007rd-AX
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 13:38:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mo8b7-0002i5-3R
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 13:26:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mo8b3-0002Uc-Og
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 13:26:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637346408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=t/+69RMQMKVy9SWHWe9IbQWVPseIcaQ5vY4PE8uxTRA=;
 b=eobOZ062Zqt7SSadktVZnWwzP81AwjZi18hrTh+bc8pqooxJTMQPq2nzW79Mk+xiYsO4Xa
 TpDjVRAfPt1WZehePpyDvdv4Uzudmw9POniCLrVSZA1RzmWJcTmSrPHjglAGTpM6M+KfJR
 DFfC2Ny5+FLkrgaAGazbuzLeMfdBp4M=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-100--jO48dzuN4arZoaEEL8j2Q-1; Fri, 19 Nov 2021 13:26:47 -0500
X-MC-Unique: -jO48dzuN4arZoaEEL8j2Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 y9-20020a1c7d09000000b003316e18949bso4444230wmc.5
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 10:26:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t/+69RMQMKVy9SWHWe9IbQWVPseIcaQ5vY4PE8uxTRA=;
 b=r4VpV4b/oX6NuiqScy3ioebeSuFbGLuNWIdVL2iYssteS5yxRqB9dN82h3AIQx/10s
 86WIitIdnNGzNxVO5bc1N0eVW7Uj700ODGdJBIu3USpppy4rA4xJ8h0EssbjAU91cYde
 c+7LUa0v+9O65Uq7qIJD2PQm904B86TYltBjNY3ZtXw50Ez6XVzRudZ9GohZh0/mbdJf
 e8dGc3uTDlZHrZd2Mj2RAUNsu0uT7WDV5rQsp9x6aNBnNowTT8UbawvqT/NohI8eHJDp
 CQzt+axxLF0tmkYC9g3XUTObdnoKeht52BXSnAWLcRnHuVuf2td5Xdd5SeG7kLmDR4YC
 3NFg==
X-Gm-Message-State: AOAM533s3GsXzm1NBhTIgbrZZ2pLpl8Va5WlUWFTPvdOIyMk9Ti9kg9T
 EFTTlr7dcRnqWQ1noG6ErzHO2nqz6WdxF6KyVV9eX6EUTTrIOiljLky6eKM5rFOhDMipGChO6s7
 jtKpFrEH+TIy+FGGG99U12dNgZmvhizLw1bOT1FIWv79zIOEqbnrifOU7pZVMH/oR
X-Received: by 2002:a1c:f005:: with SMTP id a5mr2200867wmb.19.1637346406162;
 Fri, 19 Nov 2021 10:26:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwDM5yzNZtwt1ryIh4WXKoM6ikc3nfIEwR17SaCBev4PZWXTwgIYx3+yAkUJDZnCoobTx515Q==
X-Received: by 2002:a1c:f005:: with SMTP id a5mr2200838wmb.19.1637346405972;
 Fri, 19 Nov 2021 10:26:45 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 b10sm510248wrt.36.2021.11.19.10.26.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 10:26:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH-for-6.2 v3] qdev-monitor: Only allow full --global
 <driver>.<property>=<val> option
Date: Fri, 19 Nov 2021 19:26:44 +0100
Message-Id: <20211119182644.480115-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When not all fields of the --global option are provided,
QEMU might crash:

  $ qemu-system-x86_64 -global driver=isa-fdc
  qemu-system-x86_64: ../../devel/qemu/qapi/string-input-visitor.c:394:
  string_input_visitor_new: Assertion `str' failed.
  Aborted (core dumped)

Fix by only allowing --global with all 3 fields:

  $ qemu-system-x86_64 -global driver=isa-fdc
  Invalid 'global' option format. It must be provided as:
    --global <driver>.<property>=<value>

Reported-by: Thomas Huth <thuth@redhat.com>
Suggested-by: Markus Armbruster <armbru@redhat.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/604
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
v3: Change qemu_global_option (Markus)

Supersedes: <20211119122911.365036-1-philmd@redhat.com>
---
 softmmu/qdev-monitor.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 01f3834db57..558272b147c 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -1029,13 +1029,10 @@ int qemu_global_option(const char *str)
         qemu_opt_set(opts, "value", str + offset + 1, &error_abort);
         return 0;
     }
+    printf("Invalid 'global' option format. It must be provided as:\n");
+    printf("  --global <driver>.<property>=<value>\n");
 
-    opts = qemu_opts_parse_noisily(&qemu_global_opts, str, false);
-    if (!opts) {
-        return -1;
-    }
-
-    return 0;
+    return -1;
 }
 
 bool qmp_command_available(const QmpCommand *cmd, Error **errp)
-- 
2.31.1


