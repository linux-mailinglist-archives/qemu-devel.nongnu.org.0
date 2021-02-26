Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6F0325F23
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 09:35:42 +0100 (CET)
Received: from localhost ([::1]:59512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFYb7-0001kL-BT
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 03:35:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFY89-0001rz-Jk
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:05:47 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:43403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFY87-0004Ah-Ab
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:05:44 -0500
Received: by mail-wr1-x435.google.com with SMTP id w11so7649532wrr.10
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 00:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=05AZRXWbyn+bWvJPWKwjXp65/qILBYcVFo3vpzLecO4=;
 b=nYaMpmOEUu2IUEyiVLlQ3+mqCUOwXUL4fxoPdDqn6v57yRyn25qP60rWCWySyK5pJW
 HnCCx2jGt0Wl3ndRV63NKcmT9uSBugwQ/ieBxcpn+eI0mDj0Jh+EXa+siqebcT9c/d3e
 hSfHc2EkYHhiIZw/0IFCLoSZ3Ft7yADnNnZfYJ49XMV39m9EfYqKSUuxfxcHapzMjBy8
 51j4eDYsyP8NFjjdvSmo+oodjcLFQvZMlsS+36NYvY8Xg8816eWzoZSVPvKiRy5lQ4Wu
 XrSJU8czDfCeDnx7GfUBvcWpdLwC5+UDq78PXQEF9Df1h7K50S1J9th7Ez83Q7p4B8YB
 qyWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=05AZRXWbyn+bWvJPWKwjXp65/qILBYcVFo3vpzLecO4=;
 b=OljTtHuDvDh7C0HzqDIUXVh54h81s7h1YAD9o3kH9ECHcwMQWnr++IyiD9sPpB/tTD
 pDKWmo9JOEMdj13gkTMo1hdrgNonZNUjHXET8iEEIJvlyA6dB+2Y7rIOAU9WP5Dk8bn0
 Mh6Pxosk30vb5ckJMle+3VPO8UICo3zy5z2ydfT4wN6zrMCrA4NxEBTgOoJaq9DF7A2V
 bhWV+vYESfWSCkhuze+JZvGKMl+oSdy3u78a64e8gD4+09+3NfiFca/FM7ZjI4cxlLjB
 B4DpvfVP2yZdiPTN2J1BHwxFbf/J/5Zkz+3rRJHXjA/c0DnE3EnzhqHkNZjV8DzWqrnN
 K6Yg==
X-Gm-Message-State: AOAM531Uzr54jJFNNmpkH45jQHdiopDcOMclokMghM6HB4tlYU1qzep5
 YPSRG558nO0AUv9rLY5zoJ3otE8MX2c=
X-Google-Smtp-Source: ABdhPJzp4Z9/DlEOgrIIvjW0qmDxAdC5kat2KymDQtwgnQEk7xCk2cUwRlmxQsNBLsUzv7JmtpUspQ==
X-Received: by 2002:a5d:4ac4:: with SMTP id y4mr1845553wrs.86.1614326740733;
 Fri, 26 Feb 2021 00:05:40 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n66sm10700830wmn.25.2021.02.26.00.05.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 00:05:40 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/29] qemu-options: update to show preferred boolean syntax
 for -vnc
Date: Fri, 26 Feb 2021 09:05:17 +0100
Message-Id: <20210226080526.651705-21-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210226080526.651705-1-pbonzini@redhat.com>
References: <20210226080526.651705-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x435.google.com
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

The on|off syntax has been supported since -vnc switched to use
QemuOpts in commit 4db14629c38611061fc19ec6927405923de84f08

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210216191027.595031-7-berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qemu-options.hx | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index da0ddf8a3a..34be5a7a2d 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2123,13 +2123,13 @@ SRST
     Following the display value there may be one or more option flags
     separated by commas. Valid options are
 
-    ``reverse``
+    ``reverse=on|off``
         Connect to a listening VNC client via a "reverse" connection.
         The client is specified by the display. For reverse network
         connections (host:d,``reverse``), the d argument is a TCP port
         number, not a display number.
 
-    ``websocket``
+    ``websocket=on|off``
         Opens an additional TCP listening port dedicated to VNC
         Websocket connections. If a bare websocket option is given, the
         Websocket port is 5700+display. An alternative port can be
@@ -2143,7 +2143,7 @@ SRST
         runs in unencrypted mode. If TLS credentials are provided, the
         websocket connection requires encrypted client connections.
 
-    ``password``
+    ``password=on|off``
         Require that password based authentication is used for client
         connections.
 
@@ -2180,7 +2180,7 @@ SRST
         on the fly while the VNC server is active. If missing, it will
         default to denying access.
 
-    ``sasl``
+    ``sasl=on|off``
         Require that the client use SASL to authenticate with the VNC
         server. The exact choice of authentication method used is
         controlled from the system / user's SASL configuration file for
@@ -2203,7 +2203,7 @@ SRST
         fly while the VNC server is active. If missing, it will default
         to denying access.
 
-    ``acl``
+    ``acl=on|off``
         Legacy method for enabling authorization of clients against the
         x509 distinguished name and SASL username. It results in the
         creation of two ``authz-list`` objects with IDs of
@@ -2213,13 +2213,13 @@ SRST
         This option is deprecated and should no longer be used. The new
         ``sasl-authz`` and ``tls-authz`` options are a replacement.
 
-    ``lossy``
+    ``lossy=on|off``
         Enable lossy compression methods (gradient, JPEG, ...). If this
         option is set, VNC client may receive lossy framebuffer updates
         depending on its encoding settings. Enabling this option can
         save a lot of bandwidth at the expense of quality.
 
-    ``non-adaptive``
+    ``non-adaptive=on|off``
         Disable adaptive encodings. Adaptive encodings are enabled by
         default. An adaptive encoding will try to detect frequently
         updated screen regions, and send updates in these regions using
@@ -2254,7 +2254,7 @@ SRST
         must be omitted, otherwise is must be present and specify a
         valid audiodev.
 
-    ``power-control``
+    ``power-control=on|off``
         Permit the remote client to issue shutdown, reboot or reset power
         control requests.
 ERST
-- 
2.29.2



