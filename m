Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC28E3B6675
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 18:11:59 +0200 (CEST)
Received: from localhost ([::1]:48166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxtra-0004GD-OO
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 12:11:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lxtpT-0000nt-Dj
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 12:09:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lxtpR-00020b-Sv
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 12:09:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624896585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sBGvZXp052kEjTXJ7kkHWmWt6IWVNfRolcBLTV9KMRg=;
 b=JOUxtdnF1tRzdi7pfQZ95lxqCPSDRn6jOaA48XU9/M0wYeYAMnpCSJxNdJaPRJEl57+ZWL
 izT1ZA2DBQ55D+VUNx4zQQ64bJaau7siMy2o9W1ggqVShhulkvxpjGdyHidO909HNqHWxf
 SM9iCW60i70fHv+hE5nPwrf2IVV/7Ts=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-H-FtnMc5NdGRAoPFs79MWQ-1; Mon, 28 Jun 2021 12:09:44 -0400
X-MC-Unique: H-FtnMc5NdGRAoPFs79MWQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 h14-20020a05600c350eb02901dfc071c176so188875wmq.3
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 09:09:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sBGvZXp052kEjTXJ7kkHWmWt6IWVNfRolcBLTV9KMRg=;
 b=Sp1kTm0gpOiRp/NjJrxo1up3rysLBnE7aRX7ajHG8sm4DeUO/0etVeyCGI+rwdzmqQ
 CMJlOzifapFHXyL3vQKSa+8yGrTyxUY/PE51D4NXNL976/NJCWOnI6l3upnecbNa6qK7
 rbfLjaTn+AomG4glNVMeJ+gd2BxKaus5llXNkuv7nUwFY6qv5Oy9JjdCAh+ymnR6cHzB
 gor1LHuMk1+A6lW4rD1rrLVSTtoBjL2LI2GDDRckTR0M6UqczHwYCEhTyhEuekFenkXG
 XwFxYUk7gqC1Rd5Jbton3/HF47v/PQEALsdQ8LfxruoIA0SkqmIiRl9BRimhWgA+nxGh
 Oa4Q==
X-Gm-Message-State: AOAM532qGqU7NbfJbM+2HRgY9NjCMjvk/H5zwoxfW1N14FtSzuab2pHP
 H5HSkz79zM5Mp9joaPD2vDsfq+kTjDLVXHuxLWS/ibux44fv9mImmaA1cuRlCdHHMPBLFOInhEr
 udOzY+Nqy1k0cLAyJJHJ9GD11YXjsH7Hy0CWRO5t4n7xRuVL5eGq/EG+vCDCz4/ND
X-Received: by 2002:a7b:cc09:: with SMTP id f9mr26961709wmh.104.1624896582660; 
 Mon, 28 Jun 2021 09:09:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQ0YzFBUpwScrcSCK4j1u6w+wXm3cwdvfKYcec0UUGgSDVRRMl0kkrUZTyRyo9bZ5NXA0g8A==
X-Received: by 2002:a7b:cc09:: with SMTP id f9mr26961681wmh.104.1624896582479; 
 Mon, 28 Jun 2021 09:09:42 -0700 (PDT)
Received: from x1w.redhat.com (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id a9sm14896918wrv.37.2021.06.28.09.09.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 09:09:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 6/7] ui/vnc: Use qcrypto_tls_creds_check_endpoint()
Date: Mon, 28 Jun 2021 18:09:13 +0200
Message-Id: <20210628160914.2461906-7-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210628160914.2461906-1-philmd@redhat.com>
References: <20210628160914.2461906-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.375,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avoid accessing QCryptoTLSCreds internals by using
the qcrypto_tls_creds_check_endpoint() helper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 ui/vnc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/ui/vnc.c b/ui/vnc.c
index f0a1550d58c..0e5fcb278f3 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -46,6 +46,7 @@
 #include "qapi/qapi-commands-ui.h"
 #include "ui/input.h"
 #include "crypto/hash.h"
+#include "crypto/tlscreds.h"
 #include "crypto/tlscredsanon.h"
 #include "crypto/tlscredsx509.h"
 #include "crypto/random.h"
@@ -4080,9 +4081,9 @@ void vnc_display_open(const char *id, Error **errp)
         }
         object_ref(OBJECT(vd->tlscreds));
 
-        if (vd->tlscreds->endpoint != QCRYPTO_TLS_CREDS_ENDPOINT_SERVER) {
-            error_setg(errp,
-                       "Expecting TLS credentials with a server endpoint");
+        if (!qcrypto_tls_creds_check_endpoint(vd->tlscreds,
+                                              QCRYPTO_TLS_CREDS_ENDPOINT_SERVER,
+                                              errp)) {
             goto fail;
         }
     }
-- 
2.31.1


