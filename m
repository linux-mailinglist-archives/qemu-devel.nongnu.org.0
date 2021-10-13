Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F01542BB4D
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 11:16:23 +0200 (CEST)
Received: from localhost ([::1]:34718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maaN4-0002xr-1e
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 05:16:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEl-0002Fa-E8
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:48 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:35653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEh-0005hm-9Z
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:47 -0400
Received: by mail-ed1-x531.google.com with SMTP id w19so7362093edd.2
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 02:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vu1dBQYjlPMeD+bu2re3t6lrd4Enxp4xeWWzptccB38=;
 b=p01dKUSbEV49MZMNsEcKPIzfqdfmtkwBQu4b9cIhX7TOS7DBY/77eH9x/gJh8XX55n
 nXEWDo2Xqe1QwEVyLJmtRIOOI8ujn0OEfJzMKWn6k2BrX0MnoRzgMQ2aBNdpTTGOtETd
 kN4ZJbRpD4kgH8zkrat7wPpgaGSmejG3PH7QaVKikRpIUviO/GLcvWY/x37s13VHxlWF
 JMdBPB9sQ9FSDgYN/jEA+WEL1U/YWqgQx134KmS1J/wTNXc1pD5XAo6mBb58JFgU1IgI
 JYChvqHHXQfPJ62aKkEXlluZYv5Bh10rSDk0lwG7lBRcm7+lhwy0poSTKTq2AUmT8+rD
 ad0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vu1dBQYjlPMeD+bu2re3t6lrd4Enxp4xeWWzptccB38=;
 b=22RWF5fHf0eQpIz+wYVH3Z7POUXp9e5t8Ep44BXFaeAiAbfA46rwFTh+HrLJS/gLsE
 OIfxA4VZmzRavPldAvyBoFOrZREyPyA/5nnVFGmRlsNPVBEWb6pfKg1vk7f6mnAdXqdT
 c/VZCmShYl/lyPtWEq35BlIx+e0jj8nideox1NW7T0iljyPwOr5RP68xO+Lr1qXBzcaH
 bBczwC4PhHrxZuPHRSd8LAgjI4Fcna6YbU4WzXA0VmHjNa8KRESPVVvicx9yXobFxoWK
 BNx/IuKMt2VPpWRpRmDGHdfT2Ct0+ejxo6oQJg+A0BhMK/t4l1M4qNpx/OqdxZF2R2Qk
 4aPQ==
X-Gm-Message-State: AOAM530bUgQX7O9qoUlwnN9v1UcAWZahinTZ7dq53/n1gv1SnZ4Oa3am
 8EUAhNyHBOEF3psCmKpsSykMpyPBG4U=
X-Google-Smtp-Source: ABdhPJw9+8z42YwwztR8UCTDcYE97tDFmDTiB/bwO+5zo5V+j5y8/lHbeIKPjsOAx5iCIoZjKnuDBQ==
X-Received: by 2002:a17:906:ccde:: with SMTP id
 ot30mr17457924ejb.121.1634116057603; 
 Wed, 13 Oct 2021 02:07:37 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c6sm6177849ejb.41.2021.10.13.02.07.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 02:07:37 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/40] target/i386/monitor: Return QMP error when SEV is not
 enabled for guest
Date: Wed, 13 Oct 2021 11:06:59 +0200
Message-Id: <20211013090728.309365-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211013090728.309365-1-pbonzini@redhat.com>
References: <20211013090728.309365-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Connor Kuehl <ckuehl@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

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
Message-Id: <20211007161716.453984-7-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/monitor.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index eabbeb9be9..ea836678f5 100644
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



