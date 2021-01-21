Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2822FE6EF
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 11:01:03 +0100 (CET)
Received: from localhost ([::1]:44720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Wly-0006vw-CB
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 05:01:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2WiM-000351-4S
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 04:57:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2WiK-0007vC-08
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 04:57:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611223035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tGrTqOJFJX/9xwS1isGKD0PSe9tKB51Kc36jkDQ9rMw=;
 b=PEm+bQfgWiqrA4++qLL9GYPsThYfEkoo6YXFUumzW9hPUvNOn4AIOl+rjwGD4X5jnM6ajg
 QbLrtTXAUjOzwGVm0OOtGuXlMkljK6mywiVSBByVZlAp9hVDhU0exK6BwMxMWub8lGtmsa
 7ky7WdeCl5dpXR6XJhzIhZCRYJKAUFA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-75-qfnYmxAmOoiBkm9q87DaNw-1; Thu, 21 Jan 2021 04:57:13 -0500
X-MC-Unique: qfnYmxAmOoiBkm9q87DaNw-1
Received: by mail-ed1-f72.google.com with SMTP id k5so820612edk.15
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 01:57:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tGrTqOJFJX/9xwS1isGKD0PSe9tKB51Kc36jkDQ9rMw=;
 b=Yrql1xal4zIg39YVcibY9STHuhWikpy7+C2N6yH8Hk1Ac1GdKYn5FfQxj6oy6WYGTw
 587eeZp2mVSYPZ7Jd3rByOqxFI3LG+lmyX1JEdHBSa/tBafB9pyhHcb1CRH8XfHS/VjT
 B8rN4gUmDltom4/URaU+kQtGcNhjZf+e0At/njJ9EJq7FPuPgJoaLHnVfgc2ozMzaOxp
 xodesk0PSp1YeGNBaAt6zCN1NOFvhHiaV+XDwB7AmbSq0/RfI58i9RytgiXckLtDXIt/
 vwC7UuMemJ1hFomxLLB4aPbBpj+UgNxEWIX2vJwK4ZJi0jANAj1ak1p81KAQxPw8m+SW
 I3sA==
X-Gm-Message-State: AOAM5308g9o9BnUkRSJubJQnxqC8TK6hQCEhkiSPLD6/ZKfBj2/H0iGp
 0VJwXidItqtJSlUQDlV7yKRM4av8/2fSAXd8I9+FOAAVyT5Q8k8JhJTKZDmpiPMP+OIhHUyacls
 0kROiVwkPV5/DkEwmmVvo8rDn0JQhVjscUVG/uFM+9/l9f1t1dqlt3Wb+gE0VwP2U
X-Received: by 2002:aa7:d304:: with SMTP id p4mr4368568edq.144.1611223031708; 
 Thu, 21 Jan 2021 01:57:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx/Ng1v7j/qeRZqcwa2/Ngs2SB4mtguaWXAQrCf7MA/N/37O7WNJtSQq0n6LroiyP+zDFSo7g==
X-Received: by 2002:aa7:d304:: with SMTP id p4mr4368554edq.144.1611223031461; 
 Thu, 21 Jan 2021 01:57:11 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id da26sm2499829edb.36.2021.01.21.01.57.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 01:57:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 7/8] meson: Display cryto-related information altogether
Date: Thu, 21 Jan 2021 10:56:15 +0100
Message-Id: <20210121095616.1471869-8-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210121095616.1471869-1-philmd@redhat.com>
References: <20210121095616.1471869-1-philmd@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Cc: Daniel P. Berrange <berrange@redhat.com>
---
 meson.build | 34 +++++++++++++++++++---------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/meson.build b/meson.build
index e372b69f163..9274775a81a 100644
--- a/meson.build
+++ b/meson.build
@@ -2453,19 +2453,8 @@
 endif
 summary(summary_info, bool_yn: true, section: 'Block layer support')
 
+# Crypto
 summary_info = {}
-summary_info += {'sparse enabled':    sparse.found()}
-if targetos == 'darwin'
-  summary_info += {'Cocoa support':   cocoa.found()}
-endif
-# TODO: add back version
-summary_info += {'SDL support':       sdl.found()}
-summary_info += {'SDL image support': sdl_image.found()}
-# TODO: add back version
-summary_info += {'GTK support':       gtk.found()}
-summary_info += {'pixman':            pixman.found()}
-# TODO: add back version
-summary_info += {'VTE support':       config_host.has_key('CONFIG_VTE')}
 summary_info += {'TLS priority':      config_host['CONFIG_TLS_PRIORITY']}
 summary_info += {'GNUTLS support':    config_host.has_key('CONFIG_GNUTLS')}
 # TODO: add back version
@@ -2479,6 +2468,24 @@
 if config_host.has_key('CONFIG_NETTLE')
    summary_info += {'  XTS':             not config_host.has_key('CONFIG_QEMU_PRIVATE_XTS')}
 endif
+summary_info += {'crypto afalg':      config_host.has_key('CONFIG_AF_ALG')}
+summary_info += {'rng-none':          config_host.has_key('CONFIG_RNG_NONE')}
+summary_info += {'Linux keyring':     config_host.has_key('CONFIG_SECRET_KEYRING')}
+summary(summary_info, bool_yn: true, section: 'Crypto')
+
+summary_info = {}
+summary_info += {'sparse enabled':    sparse.found()}
+if targetos == 'darwin'
+  summary_info += {'Cocoa support':   cocoa.found()}
+endif
+# TODO: add back version
+summary_info += {'SDL support':       sdl.found()}
+summary_info += {'SDL image support': sdl_image.found()}
+# TODO: add back version
+summary_info += {'GTK support':       gtk.found()}
+summary_info += {'pixman':            pixman.found()}
+# TODO: add back version
+summary_info += {'VTE support':       config_host.has_key('CONFIG_VTE')}
 summary_info += {'libtasn1':          config_host.has_key('CONFIG_TASN1')}
 summary_info += {'PAM':               config_host.has_key('CONFIG_AUTH_PAM')}
 summary_info += {'iconv support':     iconv.found()}
@@ -2531,7 +2538,6 @@
   summary_info += {'QGA MSI support':   config_host.has_key('CONFIG_QGA_MSI')}
 endif
 summary_info += {'seccomp support':   seccomp.found()}
-summary_info += {'crypto afalg':      config_host.has_key('CONFIG_AF_ALG')}
 summary_info += {'GlusterFS support': glusterfs.found()}
 summary_info += {'TPM support':       config_host.has_key('CONFIG_TPM')}
 summary_info += {'libssh support':    config_host.has_key('CONFIG_LIBSSH')}
@@ -2547,8 +2553,6 @@
 summary_info += {'libpmem support':   config_host.has_key('CONFIG_LIBPMEM')}
 summary_info += {'libdaxctl support': config_host.has_key('CONFIG_LIBDAXCTL')}
 summary_info += {'libudev':           libudev.found()}
-summary_info += {'rng-none':          config_host.has_key('CONFIG_RNG_NONE')}
-summary_info += {'Linux keyring':     config_host.has_key('CONFIG_SECRET_KEYRING')}
 summary(summary_info, bool_yn: true, section: 'Misc')
 
 if not supported_cpus.contains(cpu)
-- 
2.26.2


