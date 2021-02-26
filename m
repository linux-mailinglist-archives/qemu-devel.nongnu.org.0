Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DBA325EEB
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 09:26:47 +0100 (CET)
Received: from localhost ([::1]:46446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFYSU-0004Tb-Dr
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 03:26:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFY87-0001pd-Ju
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:05:45 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:40185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lFY85-0004AR-21
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 03:05:43 -0500
Received: by mail-wr1-x42d.google.com with SMTP id d11so7661763wrj.7
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 00:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=30KXONDiNcy4WUvSxoUXnCCDoB6X1hP4UlcthuQ38g0=;
 b=NkQGrR248FkWbFTCQ0AfUDC14qbW8+YqyGlbMR/ATh95DLrlEes2S9zJQJc0jG7sPb
 Q/nh5G/R26w2PU4SfkJc/zhAnh7VAZlDM9Km/SxZ4RyohBaVQc9v0ftTLrN4QnqYxyJs
 sz0oFFGnNKBD/IZzkXnI0IhV/AfWVESdxeN78r2/5dY+uiYK3erVImqg+74Wk0yk8gWx
 lMDMKnP+uJUdBMyQeCZnLIIDXrq6PIFqwjiKkbKgkoKC64x2gV0Fs4+NBDjo5wfn3tpA
 6wMHCQMr3qn3C4jMvvFxa9PPtl0jQLg8Dl/5SG9fjmL+PS6ofLwVAetP1SqJB+2MkTYd
 K5Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=30KXONDiNcy4WUvSxoUXnCCDoB6X1hP4UlcthuQ38g0=;
 b=YCK5LGPJSNCoXbBR6vyjkGF5HRHqkW7N0WuTNepxFhhg+SX5cKT6reDJABQZXKc9rw
 EkIm5ene270t6chxIhflPNKe+7H1JuVnaM1yFTrmGA0Nq1M8YJlU5BvxQN6GEgWz0mq2
 TKiU3u9sndZLetm5aA/hA5Fg8APMIz/0UUjBwVXDsZaLDnO0XIGlJMCSSzvpZ8Cz8SfA
 +6GnuIh48EjIJEUKXHUr5/UzEcOA21/i3kJ9WrQKhoFbHMDyJL4K2qRiEBggk+EeV40O
 n/Sku7CFuePd7OK6xmK0veRiHB2K4FIUuElOavDeWSCCKLNodfTnxPEMtcMB7kjV4V6S
 DxTg==
X-Gm-Message-State: AOAM531IBmKwU7MwNo3QGHtmxZ/CbJ0oobnQrfwfaBUIJlEUGXp+ucdu
 tWmUssOOCYoCatE0n5fWM6UEc65k0Ow=
X-Google-Smtp-Source: ABdhPJwMUTZ8dsaPDhejzxQaS5GGrNdrwJjHdGGnNrtnr9GovEJCg8/JTCrlf/rrdIVtysudPTBUlw==
X-Received: by 2002:a5d:452e:: with SMTP id j14mr1983921wra.244.1614326739482; 
 Fri, 26 Feb 2021 00:05:39 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n66sm10700830wmn.25.2021.02.26.00.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 00:05:39 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/29] qemu-options: update to show preferred boolean syntax
 for -netdev
Date: Fri, 26 Feb 2021 09:05:15 +0100
Message-Id: <20210226080526.651705-19-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210226080526.651705-1-pbonzini@redhat.com>
References: <20210226080526.651705-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42d.google.com
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
Message-Id: <20210216191027.595031-5-berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qemu-options.hx | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index bdf159c929..fb2050cda9 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2406,8 +2406,8 @@ DEFHEADING(Network options:)
 
 DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
 #ifdef CONFIG_SLIRP
-    "-netdev user,id=str[,ipv4[=on|off]][,net=addr[/mask]][,host=addr]\n"
-    "         [,ipv6[=on|off]][,ipv6-net=addr[/int]][,ipv6-host=addr]\n"
+    "-netdev user,id=str[,ipv4=on|off][,net=addr[/mask]][,host=addr]\n"
+    "         [,ipv6=on|off][,ipv6-net=addr[/int]][,ipv6-host=addr]\n"
     "         [,restrict=on|off][,hostname=host][,dhcpstart=addr]\n"
     "         [,dns=addr][,ipv6-dns=addr][,dnssearch=domain][,domainname=domain]\n"
     "         [,tftp=dir][,tftp-server-name=name][,bootfile=f][,hostfwd=rule][,guestfwd=rule]"
@@ -2454,8 +2454,8 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
 #endif
 #ifdef __linux__
     "-netdev l2tpv3,id=str,src=srcaddr,dst=dstaddr[,srcport=srcport][,dstport=dstport]\n"
-    "         [,rxsession=rxsession],txsession=txsession[,ipv6=on/off][,udp=on/off]\n"
-    "         [,cookie64=on/off][,counter][,pincounter][,txcookie=txcookie]\n"
+    "         [,rxsession=rxsession],txsession=txsession[,ipv6=on|off][,udp=on|off]\n"
+    "         [,cookie64=on|off][,counter][,pincounter][,txcookie=txcookie]\n"
     "         [,rxcookie=rxcookie][,offset=offset]\n"
     "                configure a network backend with ID 'str' connected to\n"
     "                an Ethernet over L2TPv3 pseudowire.\n"
@@ -2884,7 +2884,7 @@ SRST
                          -device e1000,netdev=n1,mac=52:54:00:12:34:56 \\
                          -netdev socket,id=n1,mcast=239.192.168.1:1102,localaddr=1.2.3.4
 
-``-netdev l2tpv3,id=id,src=srcaddr,dst=dstaddr[,srcport=srcport][,dstport=dstport],txsession=txsession[,rxsession=rxsession][,ipv6][,udp][,cookie64][,counter][,pincounter][,txcookie=txcookie][,rxcookie=rxcookie][,offset=offset]``
+``-netdev l2tpv3,id=id,src=srcaddr,dst=dstaddr[,srcport=srcport][,dstport=dstport],txsession=txsession[,rxsession=rxsession][,ipv6=on|off][,udp=on|off][,cookie64][,counter][,pincounter][,txcookie=txcookie][,rxcookie=rxcookie][,offset=offset]``
     Configure a L2TPv3 pseudowire host network backend. L2TPv3 (RFC3931)
     is a popular protocol to transport Ethernet (and other Layer 2) data
     frames between two systems. It is present in routers, firewalls and
-- 
2.29.2



