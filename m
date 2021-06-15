Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 239E43A86EC
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 18:54:49 +0200 (CEST)
Received: from localhost ([::1]:51308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltCKu-0001pV-4l
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 12:54:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltCEV-0004H8-5Q
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 12:48:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltCES-0003PF-Pl
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 12:48:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623775688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0mRh7tvlatkuMCVBMr+kWyLCBcff/Kp/cdfu0ZIMjj4=;
 b=a1UVpKd2J9ew3lmpiQwOYDMUxObRruCwWCqEuOyTg0gfsOzmz9Y++hgPtF2mzVZ0c2fhHD
 fm08cB7wXwzcDMU+MyQ6qfA0V9cbrJhlAOl3nK4dhN20N4k8dzu/cdawfPzQbQzRXl/Mem
 d5R8x61cooV+BPjsEbJ9UD6hp5WBr+Y=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-vi3umdB9NhuzVoPgd-wwfw-1; Tue, 15 Jun 2021 12:48:06 -0400
X-MC-Unique: vi3umdB9NhuzVoPgd-wwfw-1
Received: by mail-wr1-f72.google.com with SMTP id
 t10-20020a5d49ca0000b029011a61d5c96bso1221883wrs.11
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 09:48:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0mRh7tvlatkuMCVBMr+kWyLCBcff/Kp/cdfu0ZIMjj4=;
 b=jpXE1cJvp1mNZH9ZGejyde5Bz8SAycKibY6N/FyhLALhiASFDsTo+8hAxDFemCKBWW
 gmg0O3Uz/hjta0XyWI9haTvY5QLBSGPbI7GccRvXo5gdHOS7z9sTs1tQy/v9xW02paUt
 4BteoYWuajtnCF5DxguedWIN1sUfeRBKjK9s5A5ic6eC2uyYZ5SQMifwIUVgFTT2C1O/
 h8c9h1WUuI9vWlylUDKlJccb3On2NtCMb3QbtDb1jDPAev40ngtp+X7b8bcl4cW1JvOl
 jVFCpmEsYUkTkKDn9KwN7v511sovge7CmB6K7oUd/hxSN8gdcPAbc9R16k2JtrLX4hks
 EbGA==
X-Gm-Message-State: AOAM533tQwj+kA2sV2+NTk9eUbr8B8Kkddh6FBZJ2ujW+IWuThj2xJHF
 BzP6emBC0PS/X4F+0szW6XFVjU1aliqainE9h3y6LrxIeTOoXnfQMTueQ+iQvWEqoGK4xDWO7AP
 rP4z6dpmhDW9pcsQgIUwVwd/e+2WioqSQ3GhuszgeRtwANgsleakoWZLhmRLqziwH
X-Received: by 2002:a5d:6d8c:: with SMTP id l12mr5847wrs.189.1623775685681;
 Tue, 15 Jun 2021 09:48:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUaqQvrvO6xkBnzLpZrDbpy/Ce/yfzmll5b3Wc17Qe9fv8icSjn7D4TWXDtcYK59AtzNKiEA==
X-Received: by 2002:a5d:6d8c:: with SMTP id l12mr5817wrs.189.1623775685454;
 Tue, 15 Jun 2021 09:48:05 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id m3sm20139429wrr.32.2021.06.15.09.48.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 09:48:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/7] chardev/socket: Use qcrypto_tls_creds_check_endpoint()
Date: Tue, 15 Jun 2021 18:47:47 +0200
Message-Id: <20210615164751.2192807-4-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615164751.2192807-1-philmd@redhat.com>
References: <20210615164751.2192807-1-philmd@redhat.com>
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
Cc: Leonardo Bras <leobras.c@gmail.com>, Lukas Straub <lukasstraub2@web.de>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avoid accessing QCryptoTLSCreds internals by using
the qcrypto_tls_creds_check_endpoint() helper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 chardev/char-socket.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index daa89fe5d1d..fe6b1fe2110 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -1403,13 +1403,15 @@ static void qmp_chardev_open_socket(Chardev *chr,
         }
         object_ref(OBJECT(s->tls_creds));
         if (is_listen) {
-            if (s->tls_creds->endpoint != QCRYPTO_TLS_CREDS_ENDPOINT_SERVER) {
+            if (!qcrypto_tls_creds_check_endpoint(s->tls_creds,
+                                        QCRYPTO_TLS_CREDS_ENDPOINT_SERVER)) {
                 error_setg(errp, "%s",
                            "Expected TLS credentials for server endpoint");
                 return;
             }
         } else {
-            if (s->tls_creds->endpoint != QCRYPTO_TLS_CREDS_ENDPOINT_CLIENT) {
+            if (!qcrypto_tls_creds_check_endpoint(s->tls_creds,
+                                        QCRYPTO_TLS_CREDS_ENDPOINT_CLIENT)) {
                 error_setg(errp, "%s",
                            "Expected TLS credentials for client endpoint");
                 return;
-- 
2.31.1


