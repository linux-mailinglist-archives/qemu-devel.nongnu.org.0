Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 568834E3EB9
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 13:45:55 +0100 (CET)
Received: from localhost ([::1]:45130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWdta-0003Vp-BQ
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 08:45:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nWday-0005Cb-OP
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 08:26:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nWdaY-0002Ve-In
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 08:26:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647951973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VxJTWnqlCGYEcyHtvk8jwR1mIf9VhaoUil9WFvmz+lU=;
 b=gGdiJUbF3VErD1pLRtZr+L+lhFIBMFxHAfo9159gp7sUgrhzlk5nuXzGM2xiQ+/IeLEGm5
 WoHJlgil1ZUm+E4qwxNMM3jKcyquBs/c5YSkoAHmzpcvINzWD4iVv8+fH0a3HMyEuoY4Te
 dSI7vimA5/Oo/JEG7j3j0rppr3VRi28=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-380-DuxjJyOjMcaLf9nKfHeT-Q-1; Tue, 22 Mar 2022 08:26:10 -0400
X-MC-Unique: DuxjJyOjMcaLf9nKfHeT-Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 479591C0EDC3;
 Tue, 22 Mar 2022 12:26:10 +0000 (UTC)
Received: from localhost (unknown [10.39.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5F093401E80;
 Tue, 22 Mar 2022 12:26:09 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 01/21] qemu-options: define -spice only #ifdef CONFIG_SPICE
Date: Tue, 22 Mar 2022 16:25:41 +0400
Message-Id: <20220322122601.927238-2-marcandre.lureau@redhat.com>
In-Reply-To: <20220322122601.927238-1-marcandre.lureau@redhat.com>
References: <20220322122601.927238-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Fixes:
https://bugzilla.redhat.com/show_bug.cgi?id=1982600

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 softmmu/vl.c    | 2 ++
 qemu-options.hx | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 0b81f6153548..f7d7c9550d7e 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3537,6 +3537,7 @@ void qemu_init(int argc, char **argv, char **envp)
             case QEMU_OPTION_readconfig:
                 qemu_read_config_file(optarg, qemu_parse_config_group, &error_fatal);
                 break;
+#ifdef CONFIG_SPICE
             case QEMU_OPTION_spice:
                 olist = qemu_find_opts_err("spice", NULL);
                 if (!olist) {
@@ -3549,6 +3550,7 @@ void qemu_init(int argc, char **argv, char **envp)
                 }
                 display_remote++;
                 break;
+#endif
             case QEMU_OPTION_writeconfig:
                 {
                     FILE *fp;
diff --git a/qemu-options.hx b/qemu-options.hx
index 58f2f76775c9..34e9b32a5c00 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2097,6 +2097,7 @@ SRST
     Enable SDL.
 ERST
 
+#ifdef CONFIG_SPICE
 DEF("spice", HAS_ARG, QEMU_OPTION_spice,
     "-spice [port=port][,tls-port=secured-port][,x509-dir=<dir>]\n"
     "       [,x509-key-file=<file>][,x509-key-password=<file>]\n"
@@ -2118,6 +2119,7 @@ DEF("spice", HAS_ARG, QEMU_OPTION_spice,
     "   enable spice\n"
     "   at least one of {port, tls-port} is mandatory\n",
     QEMU_ARCH_ALL)
+#endif
 SRST
 ``-spice option[,option[,...]]``
     Enable the spice remote desktop protocol. Valid options are
-- 
2.35.1.273.ge6ebfd0e8cbb


