Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F55C41FBF9
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 14:56:19 +0200 (CEST)
Received: from localhost ([::1]:59710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWeYs-0003k2-Mg
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 08:56:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mWeWQ-0000pl-Gb
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 08:53:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mWeWP-0000eB-0N
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 08:53:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633179224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l2pfbYxP1f86zn1O+UmnIVR/OdXuADklhW48W/+4agE=;
 b=a3wrPNUsBVuFSd39Ry5BR29l1bW+jcDy5QBt08URukX0JGgIkzXeWJrWzxncBvMAbMCQNK
 nNx5S92KP1jCFXOCFsHEIrFWTGRXNiKjWOV1bRGXsa/x+AGEOqI0g7wAUIc2/iZF27Rx8v
 5HPsJCE+J5IVaEI3zdZwixgEnjmT8pU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-LI-aGiA4MamwNBeYTy0WZg-1; Sat, 02 Oct 2021 08:53:43 -0400
X-MC-Unique: LI-aGiA4MamwNBeYTy0WZg-1
Received: by mail-wm1-f69.google.com with SMTP id
 10-20020a05600c240a00b0030d403f24e2so3204588wmp.9
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 05:53:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l2pfbYxP1f86zn1O+UmnIVR/OdXuADklhW48W/+4agE=;
 b=qFnyfu5o5Of9xVEXWPNi7EywkXBsmGm8VwyvAzOo67Ckr0/SsMQZL8cZVn6q5RdO1x
 +gt4/D78jnfSbYqM8XFxaWwPPFBbVIFFYMyfH6/a64AmQlZOjM8DdE4XrxFRAYmyrDJX
 mSNGXROXZzwtZssA1SYWTL+l7pJcEwbvkV0yGSJvYjnYr85yvxAvTMj3RUvIJ2l3IX+h
 OHv/FKiF5/ebrfZAtfMnpCoR/kS3jybjnKkJHtWwWViRoIRnTOrPyW1VrDhHMsNb5b+z
 S5wcbH4LmOblAblXoPp8F5sJUS8iezHWZunX351a5x/ZlBuAe7lDXsjMPJFE+s9xmi4p
 wuUQ==
X-Gm-Message-State: AOAM533jMHUlRg9Lo4WMZ+6/0AV25FPhS1cBg7JINvzbhv+o9mss5GOJ
 peScsUqTnTZbb8wpb5qtIiluXzDUpDqZB1vwP5iagPjKB/n63Z8S9uj2WtZkT/65kdzHeJv2DeY
 lr5hLKcFYW3mJZron0hJEf/CrXaNmLlNSgQiC62pR+GtLENrKq/0kmNfzSrQ5gq4M
X-Received: by 2002:adf:b19b:: with SMTP id q27mr3023141wra.125.1633179222070; 
 Sat, 02 Oct 2021 05:53:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0wFJ6jOD1dsu7MobrHxWDwOimiCMUGE3Wc9F0Vh2YBeD1QDrYkdFU3s2oEYQ/eTvQ2tlbQw==
X-Received: by 2002:adf:b19b:: with SMTP id q27mr3023109wra.125.1633179221880; 
 Sat, 02 Oct 2021 05:53:41 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 l21sm1643231wmg.18.2021.10.02.05.53.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Oct 2021 05:53:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/22] target/i386/monitor: Return QMP error when SEV is
 disabled in build
Date: Sat,  2 Oct 2021 14:53:00 +0200
Message-Id: <20211002125317.3418648-6-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211002125317.3418648-1-philmd@redhat.com>
References: <20211002125317.3418648-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Brijesh Singh <brijesh.singh@amd.com>, kvm@vger.kernel.org,
 Sergio Lopez <slp@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
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

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/monitor.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index 196c1c9e77f..a9f85acd473 100644
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
+        error_setg(errp, QERR_UNSUPPORTED);
+        return;
+    }
     if (!has_gpa) {
         uint8_t *data;
         struct sev_secret_area *area;
-- 
2.31.1


