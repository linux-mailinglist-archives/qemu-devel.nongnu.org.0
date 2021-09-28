Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F62E41AFFC
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 15:24:39 +0200 (CEST)
Received: from localhost ([::1]:43006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVD66-0000jm-3X
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 09:24:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVCaL-0006gq-Up
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:51:51 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:37543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVCaK-0001Yi-Ed
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 08:51:49 -0400
Received: by mail-ed1-x52b.google.com with SMTP id ba1so24898811edb.4
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 05:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H2j0w3zV2aYZRFejCWueKk3nNl/dRSroOVrcszJhoRY=;
 b=PvhJUJ84RY886qQJaDbCYRvAzEB7Abo5LtO/7Fwmjw4aE81IXs8IBKi3Vm6ZjYdmRR
 1H3JqaG/FTy1YEHYTD+BP5GUkKqa52OWnF01wwoKhIIAFg9k6qtJeXfvf4OzUf3AKn8e
 5Sk/orEprsn/Qgbtv5JBgtU0NB89AXGvPT1H+KhMbRLzLSm5VeV4mLM9cPjfeEGciFhY
 rZ5Mb8RvmnGNRsiqaYPA4Rs/Npbby5YmdtPoWeaX3speHuYKAXpgCOTgf5vX2qhqFRyI
 XLc4MlvBK+mpqhfauSAgQXC8UUppgCrneW36v8R1g/0HW/CLdo8jzqxmH9hB+nos01OJ
 a32Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=H2j0w3zV2aYZRFejCWueKk3nNl/dRSroOVrcszJhoRY=;
 b=5g/W6nwspV9biFS+Hp11rA1xAMnxwW2VVoujcz83dRyZIhAaabz2s3uDRCDQ/s+JtZ
 DGi/WkAaiTj2sAj8AbUJjgDfdGNgS+hH/hGLfG62KFeR4RT7l3XmOgsevLizQGEyFINF
 WaVNCSVI11W5P5aI+qXpm/XzQQjoKAZfGiGbVQPPORvmS5dgI89jsxttiPRdzGzWat/V
 sjOoDsUNbTKvxxzsLs6gc1BObVCJc4zjHV35Zk+x39AIsetFoQ5T/vtY/MufLe0g2Ho8
 q0fTq++xObpDObe9ovcuGeLS0AwhjCJrc9GepSmqVGh2ckOV6vImfFMQk0U4pgY/1Yep
 Aqcg==
X-Gm-Message-State: AOAM5331XsHa4Pl7IzBU8tIrBbHsqtpP4COSHlyw87tCxpejMeuOERnQ
 5zt++sbvo1vG3f5FFHe8XARsJbpMDZs=
X-Google-Smtp-Source: ABdhPJySug+ggOA7h908cfakAgy2A9QdE1t3j+VhMXUxylGbKEq5wnn9EXhnUW26EJq1glp4UwB7+Q==
X-Received: by 2002:a17:906:169a:: with SMTP id
 s26mr6058248ejd.278.1632833503206; 
 Tue, 28 Sep 2021 05:51:43 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p24sm12641685edq.27.2021.09.28.05.51.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 05:51:42 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 32/33] build-sys: add HAVE_IPPROTO_MPTCP
Date: Tue, 28 Sep 2021 14:51:15 +0200
Message-Id: <20210928125116.183620-33-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210928125116.183620-1-pbonzini@redhat.com>
References: <20210928125116.183620-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The QAPI schema shouldn't rely on C system headers #define, but on
configure-time project #define, so we can express the build condition in
a C-independent way.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210907121943.3498701-3-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 io/dns-resolver.c   | 2 +-
 meson.build         | 2 ++
 qapi/sockets.json   | 2 +-
 util/qemu-sockets.c | 6 +++---
 4 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/io/dns-resolver.c b/io/dns-resolver.c
index a5946a93bf..53b0e8407a 100644
--- a/io/dns-resolver.c
+++ b/io/dns-resolver.c
@@ -122,7 +122,7 @@ static int qio_dns_resolver_lookup_sync_inet(QIODNSResolver *resolver,
             .ipv4 = iaddr->ipv4,
             .has_ipv6 = iaddr->has_ipv6,
             .ipv6 = iaddr->ipv6,
-#ifdef IPPROTO_MPTCP
+#ifdef HAVE_IPPROTO_MPTCP
             .has_mptcp = iaddr->has_mptcp,
             .mptcp = iaddr->mptcp,
 #endif
diff --git a/meson.build b/meson.build
index 978e8329f7..7f0fafff4a 100644
--- a/meson.build
+++ b/meson.build
@@ -1374,6 +1374,8 @@ config_host_data.set('HAVE_OPTRESET',
                      cc.has_header_symbol('getopt.h', 'optreset'))
 config_host_data.set('HAVE_UTMPX',
                      cc.has_header_symbol('utmpx.h', 'struct utmpx'))
+config_host_data.set('HAVE_IPPROTO_MPTCP',
+                     cc.has_header_symbol('netinet/in.h', 'IPPROTO_MPTCP'))
 
 # has_member
 config_host_data.set('HAVE_SIGEV_NOTIFY_THREAD_ID',
diff --git a/qapi/sockets.json b/qapi/sockets.json
index ef4b16d6f2..5773d9fcc4 100644
--- a/qapi/sockets.json
+++ b/qapi/sockets.json
@@ -69,7 +69,7 @@
     '*ipv4': 'bool',
     '*ipv6': 'bool',
     '*keep-alive': 'bool',
-    '*mptcp': { 'type': 'bool', 'if': 'IPPROTO_MPTCP' } } }
+    '*mptcp': { 'type': 'bool', 'if': 'HAVE_IPPROTO_MPTCP' } } }
 
 ##
 # @UnixSocketAddress:
diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 72216ef980..0585e7a629 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -278,7 +278,7 @@ static int inet_listen_saddr(InetSocketAddress *saddr,
 
     /* create socket + bind/listen */
     for (e = res; e != NULL; e = e->ai_next) {
-#ifdef IPPROTO_MPTCP
+#ifdef HAVE_IPPROTO_MPTCP
         if (saddr->has_mptcp && saddr->mptcp) {
             e->ai_protocol = IPPROTO_MPTCP;
         }
@@ -462,7 +462,7 @@ int inet_connect_saddr(InetSocketAddress *saddr, Error **errp)
         error_free(local_err);
         local_err = NULL;
 
-#ifdef IPPROTO_MPTCP
+#ifdef HAVE_IPPROTO_MPTCP
         if (saddr->has_mptcp && saddr->mptcp) {
             e->ai_protocol = IPPROTO_MPTCP;
         }
@@ -699,7 +699,7 @@ int inet_parse(InetSocketAddress *addr, const char *str, Error **errp)
         }
         addr->has_keep_alive = true;
     }
-#ifdef IPPROTO_MPTCP
+#ifdef HAVE_IPPROTO_MPTCP
     begin = strstr(optstr, ",mptcp");
     if (begin) {
         if (inet_parse_flag("mptcp", begin + strlen(",mptcp"),
-- 
2.31.1



