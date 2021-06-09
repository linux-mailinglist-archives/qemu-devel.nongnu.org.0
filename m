Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA953A1D3E
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 20:54:41 +0200 (CEST)
Received: from localhost ([::1]:42744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr3Lc-0001wB-Lq
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 14:54:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lr3HH-0006hG-Tw
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 14:50:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lr3HG-00040s-5B
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 14:50:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623264609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KJ1YTTR/nBbs6rHT6mYAJ1Ya0bPTslGD6b4LhbiYzwc=;
 b=a9oAgjg+5iWtaMFAcEVRLIm/rbxkhHdF/xXn6NoO6ADf+MnftPNUBiMgR9ufcCkNS+Zid5
 xpTR3eF/calGJiVMPih2y+hbBi1fNIB5qrGa62ZrZYNA4VxQ39lSngla8jmbYlnvVjBuGN
 G4hKV2xQJWGLiNec6dmblkgHVIJ6Xcc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-CTFc3GcROdOPTeHl_XiRcQ-1; Wed, 09 Jun 2021 14:50:08 -0400
X-MC-Unique: CTFc3GcROdOPTeHl_XiRcQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 u17-20020a05600c19d1b02901af4c4deac5so2258377wmq.7
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 11:50:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KJ1YTTR/nBbs6rHT6mYAJ1Ya0bPTslGD6b4LhbiYzwc=;
 b=EwTHIhDXpfi1o0nBRjmPaUJwHJkreuJk61qtsAJDs6zBCQhwkTFxIJvrGQd/b9SL/n
 m40UpDBlxzwvzKFDuQNmPVnkevUVm6A76Jd08y4Zp/fB9GZdlqhcPeOP8MSopccXakEW
 7KptgKLGwI33IO7NtXndlPemlcUfrFpFbLRM5FEG+e2Jj2n5oJaHSgVPDeW+cZMORkD4
 vBj9KBh2x/YTT2Nf6aQjLPNu6l0/olcOMTlP/aW/Qbn30L5A9bRAaZ0hNAZHKdodkU8S
 o3geA7RqJUb90TOkmqTxRNY8L65ye2GLTYbaHe4+0iJgUOGI0VSf1UW1un3j2JyBBbae
 CIlg==
X-Gm-Message-State: AOAM531POgpwFG9xHzzBxtr4IIsxYj3r+vdE02AoHKAh0UQoFe7GcDg7
 ozSaaI91gmp1rfXg6naClpRn9w5rEyHTLk7Hyk9Ch1jnE+e6n8feT6WClgWkEanawlTZXwn4KJB
 KNiukmzCoXpT8J8/yT0I+F0qjJ+x4hpsksuS20/dh/xkcKZFoD3c25PNhACyv9KM2
X-Received: by 2002:a05:6000:1563:: with SMTP id
 3mr1223987wrz.59.1623264606693; 
 Wed, 09 Jun 2021 11:50:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMcdliCeI9K1BsfuD2A0zwV3f2hdz5PD2A41FQIZOeqMBevK4CGq8hES5fOvTTkmuGTsB9Zw==
X-Received: by 2002:a05:6000:1563:: with SMTP id
 3mr1223961wrz.59.1623264606452; 
 Wed, 09 Jun 2021 11:50:06 -0700 (PDT)
Received: from x1w.redhat.com (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id f18sm643774wmj.13.2021.06.09.11.50.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 11:50:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] tpm: Return QMP error when TPM is disabled in build
Date: Wed,  9 Jun 2021 20:49:55 +0200
Message-Id: <20210609184955.1193081-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609184955.1193081-1-philmd@redhat.com>
References: <20210609184955.1193081-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the management layer queries a binary built using --disable-tpm
for TPM devices, it gets confused by getting empty responses:

  { "execute": "query-tpm" }
  {
      "return": [
      ]
  }
  { "execute": "query-tpm-types" }
  {
      "return": [
      ]
  }
  { "execute": "query-tpm-models" }
  {
      "return": [
      ]
  }

To make it clearer by returning an error:
- Make the TPM QAPI schema conditional
- Adapt the HMP command
- Remove stubs which became unnecessary

The management layer now gets a 'CommandNotFound' error:

  { "execute": "query-tpm" }
  {
      "error": {
          "class": "CommandNotFound",
          "desc": "The command query-tpm has not been found"
      }
  }

Suggested-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 qapi/tpm.json      |  9 ++++++---
 monitor/hmp-cmds.c |  4 ++++
 stubs/tpm.c        | 16 ----------------
 3 files changed, 10 insertions(+), 19 deletions(-)

diff --git a/qapi/tpm.json b/qapi/tpm.json
index 6a10c9ed8d2..09332e6f996 100644
--- a/qapi/tpm.json
+++ b/qapi/tpm.json
@@ -33,7 +33,8 @@
 # <- { "return": [ "tpm-tis", "tpm-crb", "tpm-spapr" ] }
 #
 ##
-{ 'command': 'query-tpm-models', 'returns': ['TpmModel'] }
+{ 'command': 'query-tpm-models', 'returns': ['TpmModel'],
+  'if': 'defined(CONFIG_TPM)' }
 
 ##
 # @TpmType:
@@ -63,7 +64,8 @@
 # <- { "return": [ "passthrough", "emulator" ] }
 #
 ##
-{ 'command': 'query-tpm-types', 'returns': ['TpmType'] }
+{ 'command': 'query-tpm-types', 'returns': ['TpmType'],
+  'if': 'defined(CONFIG_TPM)' }
 
 ##
 # @TPMPassthroughOptions:
@@ -152,4 +154,5 @@
 #    }
 #
 ##
-{ 'command': 'query-tpm', 'returns': ['TPMInfo'] }
+{ 'command': 'query-tpm', 'returns': ['TPMInfo'],
+  'if': 'defined(CONFIG_TPM)' }
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index d10ee141109..f6cadede40f 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -901,6 +901,9 @@ void hmp_info_pci(Monitor *mon, const QDict *qdict)
 
 void hmp_info_tpm(Monitor *mon, const QDict *qdict)
 {
+#ifndef CONFIG_TPM
+    monitor_printf(mon, "TPM device not supported\n");
+#else
     TPMInfoList *info_list, *info;
     Error *err = NULL;
     unsigned int c = 0;
@@ -946,6 +949,7 @@ void hmp_info_tpm(Monitor *mon, const QDict *qdict)
         c++;
     }
     qapi_free_TPMInfoList(info_list);
+#endif /* CONFIG_TPM */
 }
 
 void hmp_quit(Monitor *mon, const QDict *qdict)
diff --git a/stubs/tpm.c b/stubs/tpm.c
index 9bded191d9d..b1dc6370a5e 100644
--- a/stubs/tpm.c
+++ b/stubs/tpm.c
@@ -6,7 +6,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qapi/qapi-commands-tpm.h"
 #include "sysemu/tpm.h"
 #include "hw/acpi/tpm.h"
 
@@ -19,21 +18,6 @@ void tpm_cleanup(void)
 {
 }
 
-TPMInfoList *qmp_query_tpm(Error **errp)
-{
-    return NULL;
-}
-
-TpmTypeList *qmp_query_tpm_types(Error **errp)
-{
-    return NULL;
-}
-
-TpmModelList *qmp_query_tpm_models(Error **errp)
-{
-    return NULL;
-}
-
 void tpm_build_ppi_acpi(TPMIf *tpm, Aml *dev)
 {
 }
-- 
2.31.1


