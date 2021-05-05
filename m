Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3B13749F8
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 23:13:54 +0200 (CEST)
Received: from localhost ([::1]:47180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leOqA-00028m-0y
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 17:13:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leOnT-0008E1-QA
 for qemu-devel@nongnu.org; Wed, 05 May 2021 17:11:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leOnS-00049c-AC
 for qemu-devel@nongnu.org; Wed, 05 May 2021 17:11:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620249064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yGG470A3Jaz0DhDPrHiZEZ43qAaY5nNHcaGiMNivkn0=;
 b=X8HP1SO/x3wW+y8yFQy1VqYn4VsbNfiM4sGzhhfUe0MA3lKzLMvIMjeGddffSFuVGHHomJ
 qXTwvHaJV/UhYz2mHKElos5WCHctllqUtb9kvUuPd4Vhg+DVURIRxrn6exydJy/PzmHBvA
 /yJxe87P6xHZMcnSL+I0PB2utrVv4ec=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-i3gvtOTLPZSGB2hEGmtLpQ-1; Wed, 05 May 2021 17:11:01 -0400
X-MC-Unique: i3gvtOTLPZSGB2hEGmtLpQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 n10-20020adfb74a0000b029010e1a98fb84so1237452wre.0
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 14:11:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yGG470A3Jaz0DhDPrHiZEZ43qAaY5nNHcaGiMNivkn0=;
 b=h9ZXhZrNRxrfEVxR1Qjd7viN9hOgVUl/bjXVqTYsQSjOqFvZqoBx3xCu19jvjdtPfA
 Fg5BIdqEX14xRzG0rg7nisAmUPmErc+bjBureFIrlSCpJPEyuNkEefmj1ZjU2t53QUOk
 xHfcn2sMjWuUJOZkcC7CJ+Sayqr4d3o7ND9Ce0jUnVKE96TQlznBnzaukG4yCl0GbcwB
 v9gtz+gYSL/tsPSifK/TP63M8aH9UjaQaXcSIZPW3zBKLfPlGjMprtoNqF+cil0Om2sb
 FX8NC/AuryV1BG7LuSj0yB7kIuNAa4Wwh5lPFiQDnnKZ7Mvook1ASSK73bMq1IrVf188
 MbQA==
X-Gm-Message-State: AOAM532WxGKAtAaBItfZaG9x/tqT/NzZSOO4n53ejEfRNOWGuEu1bprH
 WSW39wJ/amG0ma4VzjpQ4STa1aAZcMDaw+i9IE0ATai/9JyXggoXZhCRBrBZZIVCTthiGzrnZRO
 purrjcd5nPTmhND+HFsJmsCdr24lCU+bTrNI5R5QF+MX2kOKNXRN0bTebLMaAHW7E
X-Received: by 2002:adf:d1ec:: with SMTP id g12mr1078585wrd.294.1620249059936; 
 Wed, 05 May 2021 14:10:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIGIU2wTR52pvVBtbElhLcb5ebrIvmDSZz3nPUhGj9Y9gRioNSfoYQBa7vB+kIDXVm3OwEMQ==
X-Received: by 2002:adf:d1ec:: with SMTP id g12mr1078568wrd.294.1620249059800; 
 Wed, 05 May 2021 14:10:59 -0700 (PDT)
Received: from x1w.redhat.com
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id w22sm7363254wmc.13.2021.05.05.14.10.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 14:10:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/23] chardev/baum: Replace magic values by X_MAX / Y_MAX
 definitions
Date: Wed,  5 May 2021 23:10:26 +0200
Message-Id: <20210505211047.1496765-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210505211047.1496765-1-philmd@redhat.com>
References: <20210505211047.1496765-1-philmd@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace '84' magic value by the X_MAX definition, and '1' by Y_MAX.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 chardev/baum.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/chardev/baum.c b/chardev/baum.c
index 5deca778bc4..adc3d7b3b56 100644
--- a/chardev/baum.c
+++ b/chardev/baum.c
@@ -87,6 +87,9 @@
 
 #define BUF_SIZE 256
 
+#define X_MAX   84
+#define Y_MAX   1
+
 struct BaumChardev {
     Chardev parent;
 
@@ -244,11 +247,11 @@ static int baum_deferred_init(BaumChardev *baum)
         brlapi_perror("baum: brlapi__getDisplaySize");
         return 0;
     }
-    if (baum->y > 1) {
-        baum->y = 1;
+    if (baum->y > Y_MAX) {
+        baum->y = Y_MAX;
     }
-    if (baum->x > 84) {
-        baum->x = 84;
+    if (baum->x > X_MAX) {
+        baum->x = X_MAX;
     }
 
     con = qemu_console_lookup_by_index(0);
-- 
2.26.3


