Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0650F3A8792
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 19:31:31 +0200 (CEST)
Received: from localhost ([::1]:44990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltCuQ-0004SE-0G
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 13:31:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltCrK-0005Br-CC
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 13:28:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltCrI-0003uv-Ff
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 13:28:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623778095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4C/sIPJIJ9x04mkRkFeW0rAiiCZBP7NEySvc0zgDkpg=;
 b=VEUTcdaQmI6r9grvP2vv0PIHlgDMLZ5/5t5MzEodpiiX7RwWfSuzhTH6UE7v2Go+gdKIMs
 D/H2CNKA2P10KZPZX1F+ze7KFOPvhcO+QwRK/mfvi224pNbbC5HiDIV2DwrBR1afKDtEIB
 ruLHa1SfA+9kOGzrM4NaknaDog2cqTI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-_nGM_abuPquqHc-qCDPN3Q-1; Tue, 15 Jun 2021 13:28:14 -0400
X-MC-Unique: _nGM_abuPquqHc-qCDPN3Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 z25-20020a1c4c190000b029019f15b0657dso33179wmf.8
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 10:28:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4C/sIPJIJ9x04mkRkFeW0rAiiCZBP7NEySvc0zgDkpg=;
 b=rR2fJUHBq/5CJrZU7BUlCXQIhVcXY9YeA66fW8BLTwuhrsiDOqtFsnPNVrIa5te6/m
 t9fe8/XermYjf8M9ivDU9APbvzLiul+aDZaQIsDMGiIrpqGueRwjy581YGMB1WIc8yFK
 mZsLrlQr5e42IY00U3dhXev5OxkVthqXrT72+uKnsEWiG57XG0VG0rEP+KHYl6THkXXZ
 IwVgm+eGIheQTA2r3d/cFdvk50TcbwivBMsidW/7a6UAZSpxHlt8ZXY6RUrdCLb2+Vo2
 32jHPLKvXNzLiiPp2LrDFvUb6AFi4yNj7srIpUG5fIAmXM6SqTR+f/R3x4xJVLNwK/VR
 9X8w==
X-Gm-Message-State: AOAM532VSAD4vqyKsTXm49m0AZdcp7iM8V+rftEAHVviQoUDnCi0Wr6j
 7zCD81XRJrzb5WEmh8uKzOfU6XDMfpI9WxPSf0MlzyjMULZPf6mfvlIvVszqXywPnlifNT1yDsU
 TqRu6Qm0dwQFEiA5drLfUXfERazjJsv0hDuSokA6w6hkPApTLH0FMgvgg8OP6uqcX
X-Received: by 2002:a7b:c206:: with SMTP id x6mr6480321wmi.26.1623778093574;
 Tue, 15 Jun 2021 10:28:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVhE4snd4Wo8U1+kBEFMYEhRwTltYtN0lJS/a+i6yHGkCF7q/HmdMzhy+UaDLJg+8hYMIWkw==
X-Received: by 2002:a7b:c206:: with SMTP id x6mr6480292wmi.26.1623778093378;
 Tue, 15 Jun 2021 10:28:13 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id q5sm16204726wmc.0.2021.06.15.10.28.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 10:28:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 6/7] ui/vnc: Use qcrypto_tls_session_check_role()
Date: Tue, 15 Jun 2021 19:27:45 +0200
Message-Id: <20210615172746.2212998-7-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615172746.2212998-1-philmd@redhat.com>
References: <20210615172746.2212998-1-philmd@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Leonardo Bras <leobras.c@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avoid accessing QCryptoTLSCreds internals by using
the qcrypto_tls_session_check_role() helper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 ui/vnc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/ui/vnc.c b/ui/vnc.c
index b3d4d7b9a5f..c7c8454b873 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -4080,9 +4080,9 @@ void vnc_display_open(const char *id, Error **errp)
         }
         object_ref(OBJECT(vd->tlscreds));
 
-        if (vd->tlscreds->endpoint != QCRYPTO_TLS_CREDS_ENDPOINT_SERVER) {
-            error_setg(errp,
-                       "Expecting TLS credentials with a server endpoint");
+        if (!qcrypto_tls_session_check_role(vd->tlscreds,
+                                            QCRYPTO_TLS_CREDS_ENDPOINT_SERVER,
+                                            errp)) {
             goto fail;
         }
     }
-- 
2.31.1


