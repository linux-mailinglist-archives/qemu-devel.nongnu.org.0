Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0014A32BA08
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 19:53:41 +0100 (CET)
Received: from localhost ([::1]:38176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHWcv-0006jv-0o
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 13:53:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWWX-00056Q-5r
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:47:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWWS-0007xU-GU
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:47:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614797219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0ygJSAUu3nItqoE7XwzNiQqtuF4qShdTNiOm3t1xDK4=;
 b=UX2FktL2VVx7OSUk4O/vxLlytWIWEcZlY+A7nMHit5Oh4D+sgNvKI96wRb7r1p1oL1+VBr
 MUFwq4xvf/GPvg4WdiUDuoWnzdlB6jjZoeWNzYPW9Qofq8HtgsisByWBhZ9gxVRyJTefjF
 bu43dfjccHA+ChPuk1PCq6Kzy9q27T0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-Jai6DimCNZWACwfgie1ikA-1; Wed, 03 Mar 2021 13:46:58 -0500
X-MC-Unique: Jai6DimCNZWACwfgie1ikA-1
Received: by mail-wm1-f71.google.com with SMTP id h20so2173628wmq.9
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 10:46:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0ygJSAUu3nItqoE7XwzNiQqtuF4qShdTNiOm3t1xDK4=;
 b=Gun2xIPmnwLLkC5ZVmslp4f4IzyMusEu00SYm+U+9RKvAkWT7c6BErSn4pOl3gzJM6
 GB2PjN5TsD8d5oRKqfTwmqk0I94yNj6ZSG4Dnshf/I51KiCjXvaaLxnvh0vm6K8498cZ
 CcRN5jBUYlr1d3ZTZCzi4dskJGXWNLUtSulS6v+6Sb5fbGknwFo5s+bADIRIiV9bwL9L
 tKcke9wOkvLCVv5LOR1vAmGVALjYANEo+bD/OgoBItAbTrKos5OKX7PcuNZABFdBcZvi
 HnlJ97eC/ySahM/jpTF3PLIGKbAka4cPdHeknBXGwop3ApzJTEOTz0sUl71sJiLU/lQ+
 nwgg==
X-Gm-Message-State: AOAM530bn78FBpIpV6UMMvFbtNswqZhyIph6lKIcE+6z8bvxmgu/jrCr
 XdDESEvBi2DeFFdSSieMYUhUFfqwOPRoD1Lq7GXgXZ5vm3hv2YeaQC8tqVaM5M2dA/CWPzmI6Vk
 CeoEErPlD/w2c3fn2W/iXXUcUX9gJAHgd/ajSi0sSC9D7tHrdpmU+bjtXm6Xs/X1f
X-Received: by 2002:a1c:2e58:: with SMTP id u85mr317025wmu.71.1614797216622;
 Wed, 03 Mar 2021 10:46:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyfHSzIWGLrgw5CwL8PqoywVG313c7fQf3yvNocBzZ2Tfq9ubtsxolSUUrI7Mp7vTD1awYHlA==
X-Received: by 2002:a1c:2e58:: with SMTP id u85mr316991wmu.71.1614797216348;
 Wed, 03 Mar 2021 10:46:56 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id x6sm5938379wmj.32.2021.03.03.10.46.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 10:46:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/5] ui: Replace the word 'whitelist'
Date: Wed,  3 Mar 2021 19:46:40 +0100
Message-Id: <20210303184644.1639691-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303184644.1639691-1-philmd@redhat.com>
References: <20210303184644.1639691-1-philmd@redhat.com>
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Eduardo Otubo <otubo@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Follow the inclusive terminology from the "Conscious Language in your
Open Source Projects" guidelines [*] and replace the words "whitelist"
appropriately.

[*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 ui/console.c       | 2 +-
 ui/vnc-auth-sasl.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/ui/console.c b/ui/console.c
index c5d11bc7017..5a8311ced20 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1708,7 +1708,7 @@ bool dpy_gfx_check_format(QemuConsole *con,
                 return false;
             }
         } else {
-            /* default is to whitelist native 32 bpp only */
+            /* default is to allow native 32 bpp only */
             if (format != qemu_default_pixman_format(32, true)) {
                 return false;
             }
diff --git a/ui/vnc-auth-sasl.c b/ui/vnc-auth-sasl.c
index f67111a3662..df7dc08e9fc 100644
--- a/ui/vnc-auth-sasl.c
+++ b/ui/vnc-auth-sasl.c
@@ -288,7 +288,7 @@ static int protocol_client_auth_sasl_step(VncState *vs, uint8_t *data, size_t le
             goto authreject;
         }
 
-        /* Check username whitelist ACL */
+        /* Check the username access control list */
         if (vnc_auth_sasl_check_access(vs) < 0) {
             goto authreject;
         }
@@ -409,7 +409,7 @@ static int protocol_client_auth_sasl_start(VncState *vs, uint8_t *data, size_t l
             goto authreject;
         }
 
-        /* Check username whitelist ACL */
+        /* Check the username access control list */
         if (vnc_auth_sasl_check_access(vs) < 0) {
             goto authreject;
         }
-- 
2.26.2


