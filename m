Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C00E44257BA
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 18:19:53 +0200 (CEST)
Received: from localhost ([::1]:39600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYW7c-0006aB-SB
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 12:19:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYW5f-0003kB-Mx
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:17:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYW5e-0004ou-5g
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:17:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633623469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o9lSbhoBJitVWDueMdjjLMLVkRSyu1rE4Rg4emr9Ei8=;
 b=LKGWtvBY357RpRJt3l25M0pN2JPgk3OFjogVrGp6s3NzAPfOl/DitfTD7GntS6mNPQe4dd
 0HhY8zSN3SFHv2Yo7iyjBNalX6LCR1l2/qH+1gKCFw5iXgtcjn26nBD6p5IF9r0L9Ud+sF
 KaoxjR1XSuzxPsAlCA8frRiMhEOd9xc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-ZE5xBiIeNwGn2zhnBmb2Fw-1; Thu, 07 Oct 2021 12:17:47 -0400
X-MC-Unique: ZE5xBiIeNwGn2zhnBmb2Fw-1
Received: by mail-wr1-f69.google.com with SMTP id
 s18-20020adfbc12000000b00160b2d4d5ebso5150196wrg.7
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 09:17:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o9lSbhoBJitVWDueMdjjLMLVkRSyu1rE4Rg4emr9Ei8=;
 b=pwIpfFTRs5yVuZIWkx6ebvx/pGb9vGgGy2Febhhyemw9iqvJMrCpKoyA3teLxiUmAy
 1eGe4lv2dR+D+kxK7yThPjaA1i7ryrGRespXOlObPLuDL14cQhCDUtS01pBTPXekga32
 pZVg1DA/167xMScW1kMQAXpxt7Vtu8FMGQcfaV0ispVntKP+2XIl+gi6tFSIsdoYTsoo
 3IWnYHJEBtOU4cojp5NB2xgtUzq4PUH3MDr8otB7FXqPb9GzQacPf5IRCaae+OjljerG
 6vHltstWAxcLRumIILJ+iTiZI3ex9cTP6/c/RblZbWMc24oMjylcd0FeFSjhaYZ3kAVq
 9cUQ==
X-Gm-Message-State: AOAM531zNTXneyWu6ut5wDR8/g7DPsqSU/48yYzrWTxR2IqPRSEzrHcS
 QDqWUT6ahcv6aAQz09TwbFhRkRFrLbdwAvwVJVwHT4F65MzD8MiKx4PJRGh97MaJ5DoRkqQPc1q
 w9SVL9VuWyq6cbwihVGVZFNYwXPv2D5zmp+ALZtgufjklpi9deC0n6u7f4IVj/cBQ
X-Received: by 2002:a05:6000:550:: with SMTP id
 b16mr6795196wrf.297.1633623466115; 
 Thu, 07 Oct 2021 09:17:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnfMiJdq3t4lKJrJn6gn2ZgOjVVHTpcfnmUwoUkpuTzHD+tLUzVsylqOO/srQz9P+TjP4dcA==
X-Received: by 2002:a05:6000:550:: with SMTP id
 b16mr6795160wrf.297.1633623465856; 
 Thu, 07 Oct 2021 09:17:45 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id x15sm51076wrl.74.2021.10.07.09.17.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 09:17:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 06/23] target/i386/monitor: Return QMP error when SEV is
 not enabled for guest
Date: Thu,  7 Oct 2021 18:16:59 +0200
Message-Id: <20211007161716.453984-7-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007161716.453984-1-philmd@redhat.com>
References: <20211007161716.453984-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Sergio Lopez <slp@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Connor Kuehl <ckuehl@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the management layer tries to inject a secret, it gets an empty
response in case the guest doesn't have SEV enabled, or the binary
is built without SEV:

  { "execute": "sev-inject-launch-secret",
    "arguments": { "packet-header": "mypkt", "secret": "mypass", "gpa": 4294959104 }
  }
  {
      "return": {
      }
  }

Make it clearer by returning an error:

  { "execute": "sev-inject-launch-secret",
    "arguments": { "packet-header": "mypkt", "secret": "mypass", "gpa": 4294959104 }
  }
  {
      "error": {
          "class": "GenericError",
          "desc": "SEV not enabled for guest"
      }
  }

Note: we will remove the sev_inject_launch_secret() stub in few commits,
      so we don't bother to add error_setg() there.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/monitor.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index eabbeb9be95..ea836678f51 100644
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
@@ -743,6 +744,10 @@ void qmp_sev_inject_launch_secret(const char *packet_hdr,
                                   bool has_gpa, uint64_t gpa,
                                   Error **errp)
 {
+    if (!sev_enabled()) {
+        error_setg(errp, "SEV not enabled for guest");
+        return;
+    }
     if (!has_gpa) {
         uint8_t *data;
         struct sev_secret_area *area;
-- 
2.31.1


