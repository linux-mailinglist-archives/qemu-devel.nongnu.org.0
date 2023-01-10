Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF643664660
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 17:43:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFH68-0003J1-QQ; Tue, 10 Jan 2023 11:03:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFH5y-0003BY-TF
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:03:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFH5x-00053I-Fv
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:03:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673366604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QPdeH0pp/2DTJfVhe1E5vHI0WDekZ9SmrfU0ri7dK28=;
 b=BhxVv0wsTFuyY5bcFhT3FDEMkzlfUIrh05KgoER+Dw/7QDos11/V2BphRN7NJYVdrLC045
 y3sZgYIfmtIDbQ8UASoOz9GOZmj3QEjztWeQ9TNyEt/R4B/K86y1QLy4pwILz7UPXqH9Fu
 rm3g5nolDcm27PDDo0902KCEK00kTB4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-235-yDLgL-ckNJ6cw_n95u9Cfw-1; Tue, 10 Jan 2023 11:03:22 -0500
X-MC-Unique: yDLgL-ckNJ6cw_n95u9Cfw-1
Received: by mail-wr1-f70.google.com with SMTP id
 h24-20020adfa4d8000000b002b4d24b7006so2116501wrb.0
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 08:03:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QPdeH0pp/2DTJfVhe1E5vHI0WDekZ9SmrfU0ri7dK28=;
 b=pkZMxV1WTTYqDO+ZAYfMEHtkpLPtKezmFNOdVmawWKUZ213dGbmTB6jIzOL1hlVnx2
 rShjMTVRz1mFUQNMq+COFBakNDPmirIear8X49gjHdbZX9hB3LAce5TxjgTuxaDhL3e7
 7ZISEzfz1pIVYQe21WhmNPRQb7s7U2uIVtXH29L6phzC2NhGp77b5xRsQ9jQgxfvAxUi
 9YM7d+rXZLEeWfzP+xjup8pEGu1f1PbXbyBtuTO3rq1zK8zpdwzb2LsVVYs+aPmXWgBV
 OG1FjjloTLdaXGWapJoBCdaFGmolvjzxPU7jnx/SLIJeOU3vGmwzizNvDIbjyz2PacjR
 TNuQ==
X-Gm-Message-State: AFqh2kp39pRznBMu2PDcY6JFe9GpL9kyKa/4kg+7TtzbksWox0FRd6WP
 Xjlwa8bj9GTvylcmAUe5MAGHnGZyK66PH0poZ40TY4GQd+CBOlXit7OwXKDaQJREE/+uRDUVQdw
 2fLmB2SRs1AU8Qrxl4e/SZPqLfE0Cfqf9Ogp80m/EAyjIMUeot7m7OK6FV8oJwZy2mkc=
X-Received: by 2002:a5d:4950:0:b0:26e:7604:6575 with SMTP id
 r16-20020a5d4950000000b0026e76046575mr40443060wrs.65.1673366598165; 
 Tue, 10 Jan 2023 08:03:18 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtR/OLpw5QD8Y+6IyX8PW3/QxaMJIxGmrH1P50S2D0A6sztpXdCeUo80NO7cjimvnx/DDBJrA==
X-Received: by 2002:a5d:4950:0:b0:26e:7604:6575 with SMTP id
 r16-20020a5d4950000000b0026e76046575mr40443032wrs.65.1673366597812; 
 Tue, 10 Jan 2023 08:03:17 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 k9-20020adfd229000000b002bdbef07f7csm582633wrh.50.2023.01.10.08.03.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 08:03:17 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Marcel Holtmann <marcel@holtmann.org>
Subject: [PULL 16/29] libvhost-user: Provide _GNU_SOURCE when compiling
 outside of QEMU
Date: Tue, 10 Jan 2023 17:02:20 +0100
Message-Id: <20230110160233.339771-17-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110160233.339771-1-pbonzini@redhat.com>
References: <20230110160233.339771-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Marcel Holtmann <marcel@holtmann.org>

Then the libvhost-user sources are used by another project, it can not
be guaranteed that _GNU_SOURCE is set by the build system. If it is for
example not set, errors like this show up.

  CC       libvhost-user.o
libvhost-user.c: In function ‘vu_panic’:
libvhost-user.c:195:9: error: implicit declaration of function ‘vasprintf’; did you mean ‘vsprintf’? [-Werror=implicit-function-declaration]
  195 |     if (vasprintf(&buf, msg, ap) < 0) {
      |         ^~~~~~~~~
      |         vsprintf

The simplest way to allow external complication of libvhost-user.[ch] is
by setting _GNU_SOURCE if it is not already set by the build system.

Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
Message-Id: <be27dcc747a6b5cc6f8ae3f79e0b79171382bcef.1671741278.git.marcel@holtmann.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 subprojects/libvhost-user/libvhost-user.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index d6ee6e7d9168..b55b9e244d9a 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -13,6 +13,10 @@
  * later.  See the COPYING file in the top-level directory.
  */
 
+#ifndef _GNU_SOURCE
+#define _GNU_SOURCE
+#endif
+
 /* this code avoids GLib dependency */
 #include <stdlib.h>
 #include <stdio.h>
-- 
2.38.1


