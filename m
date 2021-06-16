Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AC33AA152
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 18:29:51 +0200 (CEST)
Received: from localhost ([::1]:40516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltYQI-0008RI-RX
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 12:29:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltYJU-0000wm-Bp
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 12:22:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltYJS-0002ES-LO
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 12:22:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623860566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xExdDe4N+GemsTc4t2mEkAP+Zb7Tj4gyC4bIiLrVVZE=;
 b=P/gA7FaS+IDhv4AbbgRrkceU0efra7cMYOCMa530OP2DUW0BY47jzqpgzi9Ub+0abwE194
 t3YMH4GqPauRTgLFO1J5IFIt7UMmOe74cED1oq3P8lCuiqackSMuWdprNgYRKE0z34KMoX
 QT+/THkF5UwFXliFbCchi6Kw5CL6Av8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-oq8mZmUEOvW7RUDRZvON1w-1; Wed, 16 Jun 2021 12:22:45 -0400
X-MC-Unique: oq8mZmUEOvW7RUDRZvON1w-1
Received: by mail-wr1-f70.google.com with SMTP id
 k25-20020a5d52590000b0290114dee5b660so1498168wrc.16
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 09:22:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xExdDe4N+GemsTc4t2mEkAP+Zb7Tj4gyC4bIiLrVVZE=;
 b=NZiX/LaPDqPaW5T9eQH4tuQXJBt/QFE/2MozA/MixfIFuUQ29uiheX9jOAYa8QLjkV
 oQ0AdtZBpEY94GsXFcv8vLG0QHxgFGA+oS03q0gs9EpKmUzZapP8dK0ngNtIKfBrBmVr
 BZZxbdZDFu47i71dinDN4KJ5KvDMtwWUQA/cThkVsBLN7vkolURSLsm1KgiN+v+1NCNd
 NRjjDqfYdexHEjrPgKdNmEoLt++6E5XC9+sG3KXizywMEDwFJHJYlwIJGoSE9JggF79y
 J7XbmqApB4fuybfQ4WHcznvvQXB8HrUyCyNCUGeAC1IUh89Vkh5gjccO+uGmrHuwZxBK
 /8Dg==
X-Gm-Message-State: AOAM530RJLH1aZp7KHmbToWxKTMNdoo6ASmxbKGb2vCRgTr186Btb03Z
 ULzOTpY4GteFDd35DBHpAk4J8tGt9CO0TqTDqPqlLql4qifzKfh9Jr79x19k0Tz6otEXnHJcRG9
 aC+TDTVKtLtKOPR7xIuxrLgANiWIHWsJ2LRJFMdAEJI0EEfpFZ7GKrxa4Ch/2JYvW
X-Received: by 2002:adf:9084:: with SMTP id i4mr264049wri.23.1623860563724;
 Wed, 16 Jun 2021 09:22:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4FWPI4rSW/7Fl3ABL8A5d3xEHe8JRbTVo85W7RW+Y/dZfWooCgU7n+1cEjvpIFpBs33cQ2Q==
X-Received: by 2002:adf:9084:: with SMTP id i4mr264029wri.23.1623860563529;
 Wed, 16 Jun 2021 09:22:43 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id z17sm2645973wrt.60.2021.06.16.09.22.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 09:22:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 4/7] migration/tls: Use qcrypto_tls_creds_check_endpoint()
Date: Wed, 16 Jun 2021 18:22:22 +0200
Message-Id: <20210616162225.2517463-5-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616162225.2517463-1-philmd@redhat.com>
References: <20210616162225.2517463-1-philmd@redhat.com>
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avoid accessing QCryptoTLSCreds internals by using
the qcrypto_tls_creds_check_endpoint() helper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 migration/tls.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/migration/tls.c b/migration/tls.c
index abb149d8325..ca1ea3bbdd4 100644
--- a/migration/tls.c
+++ b/migration/tls.c
@@ -49,11 +49,7 @@ migration_tls_get_creds(MigrationState *s,
                    s->parameters.tls_creds);
         return NULL;
     }
-    if (ret->endpoint != endpoint) {
-        error_setg(errp,
-                   "Expected TLS credentials for a %s endpoint",
-                   endpoint == QCRYPTO_TLS_CREDS_ENDPOINT_CLIENT ?
-                   "client" : "server");
+    if (!qcrypto_tls_creds_check_endpoint(ret, endpoint, errp)) {
         return NULL;
     }
 
-- 
2.31.1


