Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E134A8B80
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 19:23:17 +0100 (CET)
Received: from localhost ([::1]:54916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFglH-0005rO-5F
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 13:23:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFg0V-0005Qo-Px
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:34:55 -0500
Received: from [2a00:1450:4864:20::62b] (port=41881
 helo=mail-ej1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFg0L-0008Jb-Db
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 12:34:55 -0500
Received: by mail-ej1-x62b.google.com with SMTP id a8so10957611ejc.8
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 09:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ufXaIgVNPolYyUpa8J8biBE8BH8vg1JIJ6yf2tBGb4k=;
 b=eYEwAz/VLkDoHZIuoRcYRv0gJMwoYZv+FF4J/T1q3NxhbdJ04u5VGlh3MqcFvI6foF
 tL27MXCpEb/kbUUnIt5FiJ8GFqJqM/DbJqVnO/Fim0dyQLtBKjVzyDKyMK25MHE9Odyj
 Rvwa9FDzTGfuGZejHyJsq/ic9a4BECxeegMMLtYOQ/hbFk4IvyoSW+EKgtcgNdfd4boc
 HCZ6T4wMgy6PoPL/yKyGqxGDek/+oYvjB3vBb3FG85eHUOEyczHia8vyVMVszcTAA6aT
 b7jtksxEzVyYUUmbm2MjRWT+sFAupYYY2alP72ZofQwxMZWRzHh4Lwqxy+A6MTyXkjai
 TX3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ufXaIgVNPolYyUpa8J8biBE8BH8vg1JIJ6yf2tBGb4k=;
 b=dBK6lhUADa4fLszNuDPV4NqACY9hVLGQp7kkdx1CqdtGUUaeEQEZX2hGq7XjG7vW12
 pUijrjBcA/j+93Iu3t3C15NiAmF3XX/4Ida4QxeA6BHSRlTNqxCO7+MN8FHHrpRX8oby
 FT7N+q4Q1MKKzuPZHTwSv7TK5Epk0Uf9F0GVa7PkrHg6GZnNs2F694qUIfO7/PsoulTl
 gvoAOqsgUVt++kO1MixkNwWLvjFoVRa8POkP6lrsk8C5kZ2FNLQUX39rAk4uOVrabhyb
 a64tf4lFMr2kQ+WgouIJD7snfZfnF0IoRsCaEhTe/IdhiRUjxtVGnulyQgHcSeL9yXGE
 jvOQ==
X-Gm-Message-State: AOAM532LJem/ILlv/6UKvG1dEUYBH24XRQgfdJCCIxcaraRxpKsfI0l9
 FjRO7+l8igwlMeMScQI0l+HTiqlwUfk=
X-Google-Smtp-Source: ABdhPJxtxG52YlCHh/fHvvIw7k58NVDDvojytmJoMyUpYIFIs3z+2SDyEtxAnGmqhgz94PUefexJxA==
X-Received: by 2002:a17:906:7308:: with SMTP id
 di8mr30793707ejc.464.1643909659628; 
 Thu, 03 Feb 2022 09:34:19 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id a25sm6665279ejs.149.2022.02.03.09.34.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 09:34:19 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 25/27] meson: require dynamic linking for VSS support
Date: Thu,  3 Feb 2022 18:33:57 +0100
Message-Id: <20220203173359.292068-26-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203173359.292068-1-pbonzini@redhat.com>
References: <20220203173359.292068-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The glib_dynamic detection does not work because the dependency is
overridden in the main meson.build.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
[Rewritten commit message, added requirement in qga/meson.build - Paolo]
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qga/meson.build           | 2 ++
 qga/vss-win32/meson.build | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/qga/meson.build b/qga/meson.build
index 804cc842dc..8c177435ac 100644
--- a/qga/meson.build
+++ b/qga/meson.build
@@ -22,6 +22,8 @@ have_qga_vss = get_option('qga_vss') \
     Then run configure with: --extra-cxxflags="-isystem /path/to/vss/inc"''') \
   .require(midl.found() or widl.found(),
            error_message: 'VSS support requires midl or widl') \
+  .require(not enable_static,
+           error_message: 'VSS support requires dynamic linking with GLib') \
   .allowed()
 
 all_qga = []
diff --git a/qga/vss-win32/meson.build b/qga/vss-win32/meson.build
index c064a4e245..71c50d0866 100644
--- a/qga/vss-win32/meson.build
+++ b/qga/vss-win32/meson.build
@@ -1,4 +1,3 @@
-glib_dynamic = dependency('glib-2.0', static: false)
 link_args = cc.get_supported_link_arguments([
   '-fstack-protector-all',
   '-fstack-protector-strong',
@@ -14,7 +13,8 @@ qga_vss = shared_module(
   link_args: link_args,
   vs_module_defs: 'qga-vss.def',
   dependencies: [
-    glib_dynamic, socket,
+    glib,
+    socket,
     cc.find_library('ole32'),
     cc.find_library('oleaut32'),
     cc.find_library('shlwapi'),
-- 
2.34.1



