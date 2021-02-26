Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F77325ECC
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 09:21:25 +0100 (CET)
Received: from localhost ([::1]:36958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFYNI-0000Kl-Db
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 03:21:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFY87-0001pe-LI
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:05:45 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:35835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFY85-00049k-2I
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:05:43 -0500
Received: by mail-wm1-x32f.google.com with SMTP id o16so6955596wmh.0
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 00:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kf+lvljz372V0FIW3LDVvUzPPbqpQ8K07ZfLmGiXllY=;
 b=gy11z+ZAjYScTfOBlwoNGR/d3ShuhHzVEj83rOj8Dsx88C4Ru0NJZXOor7ULFHWH7J
 8/tNsEkBbcxKh8igWq4uHt+L9z0gZAH8YA+1+CtajT8+wToBduMeCfYHffkZ7SwwH4fK
 Ra99u9GauGrs9LJlZtyZ6O6Duqo2y87tq4fLPJZvecB5OjSxfgA0DQELiOK3g/G6xm14
 ZWOjVLCX7qGm4fg9lSfgOnTD952fb7Qc8OjIZM5Xi9sH8wZHrZocOwU9/05dFkKl2NSL
 ytradTucd8iE59D/w+PeGwD+A6p93oPj1tozv5A0VVAOwUl+W2hnhZ086OviSp22WCW2
 WPZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=kf+lvljz372V0FIW3LDVvUzPPbqpQ8K07ZfLmGiXllY=;
 b=rKJQBxJMgkmijuqHJQA2Uu0N0zeheFb1DgASw3tuIPvSKC5+v/vHQKI5KDH1cBkALi
 +oFTbsJwFvQv9K6BqbtxWJ3gi9/An62NPX4l6DfIk9jiH7yL1HX1+I6ZVGvqdedLSk/c
 58nFLAvymlmIzkhbzm6tYvux6FbGaSk0X6+8k2u3ioEtjge3O1cOFcNMZVWZzP63ZcLT
 7JRhCfkRzG1psqqtr7HRS4bChxiIz1XBTOtBbHmuc/2sxHryFub7PZ6fMWFJmmTx+tHF
 oazpUBfJ7Was1dPSJ6Alrdl442Nqai3mwSYfj/QKqAU/525RQDILIhoOpGol70qkf9nl
 N4KQ==
X-Gm-Message-State: AOAM532gR+NlKUTBnr+3EsieuXCJkkH7MmljuU2Lt7L25ooxvb36I6aG
 4WtD9h/GCt1ttlPc9AxWlnNRrKHJth0=
X-Google-Smtp-Source: ABdhPJzCuQH3eEF/GYuKhWlxBLifbhgzU93mGUWmglzbD8qHspV1witLfMai8EV1L6QYZi3VlBaggA==
X-Received: by 2002:a1c:a985:: with SMTP id s127mr1511214wme.158.1614326738890; 
 Fri, 26 Feb 2021 00:05:38 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n66sm10700830wmn.25.2021.02.26.00.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 00:05:38 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/29] qemu-options: update to show preferred boolean syntax
 for -spice
Date: Fri, 26 Feb 2021 09:05:14 +0100
Message-Id: <20210226080526.651705-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210226080526.651705-1-pbonzini@redhat.com>
References: <20210226080526.651705-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

The preferred syntax is to use "foo=on|off", rather than a bare
"foo" or "nofoo".

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210216191027.595031-4-berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qemu-options.hx | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 972ef412cc..bdf159c929 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1894,16 +1894,17 @@ DEF("spice", HAS_ARG, QEMU_OPTION_spice,
     "-spice [port=port][,tls-port=secured-port][,x509-dir=<dir>]\n"
     "       [,x509-key-file=<file>][,x509-key-password=<file>]\n"
     "       [,x509-cert-file=<file>][,x509-cacert-file=<file>]\n"
-    "       [,x509-dh-key-file=<file>][,addr=addr][,ipv4|ipv6|unix]\n"
+    "       [,x509-dh-key-file=<file>][,addr=addr]\n"
+    "       [,ipv4=on|off][,ipv6=on|off][,unix=on|off]\n"
     "       [,tls-ciphers=<list>]\n"
     "       [,tls-channel=[main|display|cursor|inputs|record|playback]]\n"
     "       [,plaintext-channel=[main|display|cursor|inputs|record|playback]]\n"
-    "       [,sasl][,password=<secret>][,disable-ticketing]\n"
+    "       [,sasl=on|off][,password=<secret>][,disable-ticketing=on|off]\n"
     "       [,image-compression=[auto_glz|auto_lz|quic|glz|lz|off]]\n"
     "       [,jpeg-wan-compression=[auto|never|always]]\n"
     "       [,zlib-glz-wan-compression=[auto|never|always]]\n"
-    "       [,streaming-video=[off|all|filter]][,disable-copy-paste]\n"
-    "       [,disable-agent-file-xfer][,agent-mouse=[on|off]]\n"
+    "       [,streaming-video=[off|all|filter]][,disable-copy-paste=on|off]\n"
+    "       [,disable-agent-file-xfer=on|off][,agent-mouse=[on|off]]\n"
     "       [,playback-compression=[on|off]][,seamless-migration=[on|off]]\n"
     "       [,gl=[on|off]][,rendernode=<file>]\n"
     "   enable spice\n"
@@ -1920,13 +1921,13 @@ SRST
         Set the IP address spice is listening on. Default is any
         address.
 
-    ``ipv4``; \ ``ipv6``; \ ``unix``
+    ``ipv4=on|off``; \ ``ipv6=on|off``; \ ``unix=on|off``
         Force using the specified IP version.
 
     ``password=<secret>``
         Set the password you need to authenticate.
 
-    ``sasl``
+    ``sasl=on|off``
         Require that the client use SASL to authenticate with the spice.
         The exact choice of authentication method used is controlled
         from the system / user's SASL configuration file for the 'qemu'
@@ -1940,13 +1941,13 @@ SRST
         data encryption preventing compromise of authentication
         credentials.
 
-    ``disable-ticketing``
+    ``disable-ticketing=on|off``
         Allow client connects without authentication.
 
-    ``disable-copy-paste``
+    ``disable-copy-paste=on|off``
         Disable copy paste between the client and the guest.
 
-    ``disable-agent-file-xfer``
+    ``disable-agent-file-xfer=on|off``
         Disable spice-vdagent based file-xfer between the client and the
         guest.
 
-- 
2.29.2



