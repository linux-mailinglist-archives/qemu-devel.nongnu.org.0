Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F29713A24B9
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 08:48:55 +0200 (CEST)
Received: from localhost ([::1]:60106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrEUp-0001wd-1E
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 02:48:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lrESJ-0007b4-OK
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 02:46:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lrESG-0005E5-UB
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 02:46:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623307576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qAeYox9UkBZPHYKkLVvU16TBQxc6Vg+PmuhGEFonMEo=;
 b=KVIw1crK1ozf8htPQGLqlP7geu6ZaM5QrEhZnkuOWRCBKvjwoehqUj/0vq3QHyCb2/tfFZ
 VcfQ5dLTCyWuaKBK50Xa7XkrsMh4hMGeMFF+vpcT9h8YzolID4mf2Nzlg1tHCNPjhzV60S
 Apt9mBTDow/yFqszavHWMTP7+gi/bZ8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-RUaZUZmUO8a71ZFaArt9cg-1; Thu, 10 Jun 2021 02:46:13 -0400
X-MC-Unique: RUaZUZmUO8a71ZFaArt9cg-1
Received: by mail-wr1-f71.google.com with SMTP id
 z4-20020adfe5440000b0290114f89c9931so415270wrm.17
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 23:46:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qAeYox9UkBZPHYKkLVvU16TBQxc6Vg+PmuhGEFonMEo=;
 b=K6pDAcaHt3tg9bbFbKjqilKihRuR7/HdwWjruiaIcr525tXshp/o7KOj4NVAbOaWN2
 EJ3XhLfNG0heWrqxXvkfkwdjPP4mghIZ8bN73UKGmtRcuaqmexoSW7EXlXRhjkgchVca
 s5igXImr/itSrLqofcwScre7o2ice00yQFUKYoaR5c/yRkZmR6x/112e1FdaIewvLMsJ
 V0tLvkdRYhRZ5VL3XeCwRla52MZXJlYdSfvIQFYalHsWx42OpIacEWK174pT7GsTVTP6
 HdaTTcEd+ORREvpX5RV/5Im78iTajLpG/uLoOyFIXLVeOgvk93ol4jiOnY+P7gmS4yTR
 36fQ==
X-Gm-Message-State: AOAM5304pJwD99kiLCTRiqUwjPO7BWK3kzeV77TbiRHDG9Kg5GkoMb9I
 troOhH3kFgxPit8E+e2DPilwrBG1RGw0QZL3U1A3ghx1gbLvH9E30bnLDkz7CBPQjOqHijsbIw8
 JqOro66nohhujXMd1t08xrncHuQ4K3Om1j84xWdvkRVPS84f+tlcRmR1VoS36zPTk
X-Received: by 2002:a1c:c90f:: with SMTP id f15mr13488947wmb.142.1623307571695; 
 Wed, 09 Jun 2021 23:46:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6Hq00i0ztkKyzUvWxnzo1iEeA/63BuNypt08r8vuuELaHl+8hw5IieEoeFEuIHHuDDp5dsA==
X-Received: by 2002:a1c:c90f:: with SMTP id f15mr13488926wmb.142.1623307571548; 
 Wed, 09 Jun 2021 23:46:11 -0700 (PDT)
Received: from x1w.redhat.com (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id g23sm8523342wmk.3.2021.06.09.23.46.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 23:46:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/11] target/i386/monitor: Return QMP error when SEV is
 disabled in build
Date: Thu, 10 Jun 2021 08:45:48 +0200
Message-Id: <20210610064556.1421620-4-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210610064556.1421620-1-philmd@redhat.com>
References: <20210610064556.1421620-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Brijesh Singh <brijesh.singh@amd.com>, Connor Kuehl <ckuehl@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the management layer tries to inject a secret, it gets an empty
response in case the binary built without SEV:

  { "execute": "sev-inject-launch-secret",
    "arguments": { "packet-header": "mypkt", "secret": "mypass", "gpa": 4294959104 }
  }
  {
      "return": {
      }
  }

Make it clearer by returning an error, mentioning the feature is
disabled:

  { "execute": "sev-inject-launch-secret",
    "arguments": { "packet-header": "mypkt", "secret": "mypass", "gpa": 4294959104 }
  }
  {
      "error": {
          "class": "GenericError",
          "desc": "this feature or command is not currently supported"
      }
  }

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/monitor.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index 119211f0b06..c83cca80dc2 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -28,6 +28,7 @@
 #include "monitor/hmp-target.h"
 #include "monitor/hmp.h"
 #include "qapi/qmp/qdict.h"
+#include "qapi/qmp/qerror.h"
 #include "sysemu/kvm.h"
 #include "sysemu/sev.h"
 #include "qapi/error.h"
@@ -742,6 +743,10 @@ void qmp_sev_inject_launch_secret(const char *packet_hdr,
                                   bool has_gpa, uint64_t gpa,
                                   Error **errp)
 {
+    if (!sev_enabled()) {
+        error_setg(errp, QERR_UNSUPPORTED);
+        return;
+    }
     if (!has_gpa) {
         uint8_t *data;
         struct sev_secret_area *area;
-- 
2.31.1


