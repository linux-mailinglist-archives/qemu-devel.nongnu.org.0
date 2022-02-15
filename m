Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 305714B68DE
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 11:10:51 +0100 (CET)
Received: from localhost ([::1]:60426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJunJ-00022x-OW
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 05:10:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJuCV-0004dA-3X
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:32:47 -0500
Received: from [2a00:1450:4864:20::62e] (port=43843
 helo=mail-ej1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJuCT-0008Ud-E1
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 04:32:46 -0500
Received: by mail-ej1-x62e.google.com with SMTP id d10so42877615eje.10
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 01:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6lnp+y1CQ1+VKM1AP6R8y5Kq7ZQ0qg3S2I5gAaWaIHc=;
 b=gJw8JFwoaK+rs5T3MQNqqV9Njaj+BBqB1JHupYzUAaL6oW/VX7OPudWQrNv5b1NHaW
 k/9A0+Gf0YdCZuXkrLfzBOMXpWDpdgmPSjOZ1NWKL609b5krnoF1Xo03eExwolQmmpDT
 EF/+4mJbjGCGY123qRb4RrYSDDmipfrkO7opkBDtUQbW256F8eZHL47uk7DthaakmxDn
 rztE1Z8GJrMgnvFM9ODCodx0RDc9yN2O9TCx/UdOkt9YLUaNoSlWnpUCbdDYQ8LBUlri
 Tf8wD+HPIBo2qEO63uWeiUrD2DuN3g5zKfRMHd7mZaITPl3pSfzb55ie983B9fjxAXVh
 JIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6lnp+y1CQ1+VKM1AP6R8y5Kq7ZQ0qg3S2I5gAaWaIHc=;
 b=53dQA8FbSmT5s0mZ+zsHnLdQ3fhA8mhf7MNGeWjPwIzvNcuMJ71WFjdvHI0a6ii+fS
 cVgZoXQ2kSE1Fkj7mYt/oq/DS210SyPKjfAsnXGgOBYMrhyFnjQXvlqwGHaKVbMz5SzD
 a88x3uGSFrnKbMAdSxaCI8AfYj2UjUvLgBpCdwSw4SkQRAGAaRlRoo6g7gFw7icUCrVt
 Az0IL/f34la9VxPcSBW+rfLxO+FyYa7Wd5bRPSV7kWshhQ1ArlyAnfV+I7FEOMrg97NC
 PVyY0Y7yCmdDEOYHiYR3nmGDoD+XaTj+sFniQ+t68bqInR4MGb+9O+AqZcpwcqaBnHf5
 bPEA==
X-Gm-Message-State: AOAM5330EDf/BB+203TQkaLXV+w3CCLRdn4BIO40VpjH2XjD6Bi0yc16
 PlHv8w3oT82IMqoC+WoSekqkStseZzk=
X-Google-Smtp-Source: ABdhPJwsbkjJt/aa2KS/1wHK7oiwU9DsGdyNO3r+dlA/LdGAic089LQCnkPqrHvXBIzMcNrlNTM4lg==
X-Received: by 2002:a17:906:779b:: with SMTP id
 s27mr2180749ejm.389.1644917564089; 
 Tue, 15 Feb 2022 01:32:44 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m4sm6634308ejl.45.2022.02.15.01.32.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 01:32:43 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 28/30] meson: require dynamic linking for VSS support
Date: Tue, 15 Feb 2022 10:32:21 +0100
Message-Id: <20220215093223.110827-29-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215093223.110827-1-pbonzini@redhat.com>
References: <20220215093223.110827-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, PDS_HP_HELO_NORDNS=0.904,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Konstantin Kostiuk <kkostiuk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The glib_dynamic detection does not work because the dependency is
overridden in the main meson.build.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
[Rewritten commit message, added requirement in qga/meson.build - Paolo]
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qga/meson.build           | 2 ++
 qga/vss-win32/meson.build | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/qga/meson.build b/qga/meson.build
index 4ac781cb33..d22ecb4187 100644
--- a/qga/meson.build
+++ b/qga/meson.build
@@ -22,6 +22,8 @@ have_qga_vss = get_option('qga_vss') \
     Then run configure with: --extra-cxxflags="-isystem /path/to/vss/inc/win2003"''') \
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



