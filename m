Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9298644FFB6
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 09:06:22 +0100 (CET)
Received: from localhost ([::1]:59610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmX0P-0005Nc-Mo
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 03:06:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mmWxj-0003Vg-Rh
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 03:03:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mmWxh-0007fQ-1P
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 03:03:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636963411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b+l1iK01Q/eySmpoZ8LkIdoLvLK8uTUqZR1R++yzoL8=;
 b=WCnqoC8ezhE49hHH1eOXRs4Z4TnSPUWmOhh4p4n06QLIKyfQfvBIkl9MhCjtwK2uGUbHOa
 WVsHn+S6I1SMPJ5FuWywk/VgX8aaX6U5wqSsEKirRUWaFZkiqfU/m0Q1HFw0uuKB+5P/he
 H6LGghsEQ0Gs4ZQxuyOc9V+4eiFB4PY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-RQhqFzN8O_uU27JDp14FVw-1; Mon, 15 Nov 2021 03:03:29 -0500
X-MC-Unique: RQhqFzN8O_uU27JDp14FVw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00A3C1006AA2
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 08:03:29 +0000 (UTC)
Received: from localhost (unknown [10.39.208.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 302BE5C22B;
 Mon, 15 Nov 2021 08:03:27 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] qemu-options: define -spice only #ifdef CONFIG_SPICE
Date: Mon, 15 Nov 2021 12:03:11 +0400
Message-Id: <20211115080312.64692-2-marcandre.lureau@redhat.com>
In-Reply-To: <20211115080312.64692-1-marcandre.lureau@redhat.com>
References: <20211115080312.64692-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, berrange@redhat.com, armbru@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Fixes:
https://bugzilla.redhat.com/show_bug.cgi?id=1982600

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 softmmu/vl.c    | 2 ++
 qemu-options.hx | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 1159a64bce4e..385465fbeb6d 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3538,6 +3538,7 @@ void qemu_init(int argc, char **argv, char **envp)
             case QEMU_OPTION_readconfig:
                 qemu_read_config_file(optarg, qemu_parse_config_group, &error_fatal);
                 break;
+#ifdef CONFIG_SPICE
             case QEMU_OPTION_spice:
                 olist = qemu_find_opts_err("spice", NULL);
                 if (!olist) {
@@ -3550,6 +3551,7 @@ void qemu_init(int argc, char **argv, char **envp)
                 }
                 display_remote++;
                 break;
+#endif
             case QEMU_OPTION_writeconfig:
                 {
                     FILE *fp;
diff --git a/qemu-options.hx b/qemu-options.hx
index 7749f59300b5..323913945a5d 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2017,6 +2017,7 @@ SRST
     Enable SDL.
 ERST
 
+#ifdef CONFIG_SPICE
 DEF("spice", HAS_ARG, QEMU_OPTION_spice,
     "-spice [port=port][,tls-port=secured-port][,x509-dir=<dir>]\n"
     "       [,x509-key-file=<file>][,x509-key-password=<file>]\n"
@@ -2038,6 +2039,7 @@ DEF("spice", HAS_ARG, QEMU_OPTION_spice,
     "   enable spice\n"
     "   at least one of {port, tls-port} is mandatory\n",
     QEMU_ARCH_ALL)
+#endif
 SRST
 ``-spice option[,option[,...]]``
     Enable the spice remote desktop protocol. Valid options are
-- 
2.33.0.721.g106298f7f9


