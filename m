Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E4F32F988
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 12:01:17 +0100 (CET)
Received: from localhost ([::1]:55440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIUgO-00062T-Ds
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 06:01:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lIUZn-0005l1-AU
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 05:54:27 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:56100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lIUZl-00083v-7p
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 05:54:27 -0500
Received: by mail-wm1-x331.google.com with SMTP id w7so3214254wmb.5
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 02:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wVC6tth3XwFnUOWbvHvtT7wr9HJeuUJEHogDmeiKguI=;
 b=CpsxRRqNIhs3Tt3qBYyJx5bU1sp3DsLPY/2vOLJ7xu+6wj+YUh1E9gcRlzC8ybfhYN
 4dMrr+6/v3Z8Yu8kx5h2k4KYClHnqV+Ths1usQ6oarThNS/05vNvEsnTKsd1zmg40Pf0
 xxcFoOhIYdEqSIGKqCHfnVOUP0s2XrWtKZLysqErfeaBAwLzulHRUCL3wEA2t5Jce4kE
 NUNlVcNYRsR8lF5VTOlqzVAwq1gNxX8Lw9b/bxQte5/IEIMMbet7MM54lUWJm0phaiUR
 2vqkAs0++LYr/Ii+Kj6IEJRFgT9ls68cVT8UMLPpyCC112rzSj6YaVYZQpWB5Dg1SEEl
 5iYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wVC6tth3XwFnUOWbvHvtT7wr9HJeuUJEHogDmeiKguI=;
 b=ajwBdzU3CdJxmxCe0zl50o/4vEw2MLMujF21AOwGw76QenEosW+P+cBK/3vdCYe8D3
 EO314XcvXqcpmc0ayJlXIPKEYFkrv2md4I1f1UBkuTE+ZO4v4TrlKPMvaqs1zDrLPgiX
 ZvyrCtcTIAvVMmNJhlVWAeKEkDjbvE+ra+72fiRUYV/e4j9bXgClPHtrsX1kjSAiSLQd
 4CBIQJ2d5DQwe1GQZ70q2QIDWr+O/ET2kO3kTIECAAMV7EX6lTL8843BgHYX7kGIJ3hN
 xUlqDW9oX3I5HuHQD+KTUbjVD7oQfMxnpt57B7bX3X5lqZdrYHAGBlW40jMU7ZQ2bNRg
 9Kjw==
X-Gm-Message-State: AOAM531LQwBEXnHUOSfTJ3mg+ur7dLMjQpup7nEivNhlitlRBjS5kKrj
 mojqy09Br8fp0Gc+bqJ5Y8Qhd1412mw=
X-Google-Smtp-Source: ABdhPJxs3+lGh39+sV4o1GEnOqAX8OdCe+y2HShm9cQqnwOHStHjeN/Fc8lRsMef+NFZobWEqzjMAA==
X-Received: by 2002:a05:600c:190c:: with SMTP id
 j12mr13373725wmq.133.1615028064064; 
 Sat, 06 Mar 2021 02:54:24 -0800 (PST)
Received: from avogadro.redhat.com ([93.56.170.5])
 by smtp.gmail.com with ESMTPSA id i26sm9326472wmb.18.2021.03.06.02.54.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 02:54:23 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/23] qga-vss: Use dynamic linking for GLib
Date: Sat,  6 Mar 2021 11:53:59 +0100
Message-Id: <20210306105419.110503-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210306105419.110503-1-pbonzini@redhat.com>
References: <20210306105419.110503-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Kostiantyn Kostiuk <konstantin@daynix.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kostiantyn Kostiuk <konstantin@daynix.com>

The current GLib version implements the DllMain function. DllMain is also
present in the provider.cpp code. So in the case of static linking, the
DllMain redefinition error occurs. For now, just switch to dynamic linking
and revert this patch when the issue will be solved.

See Glib issue for more details https://gitlab.gnome.org/GNOME/glib/-/issues/692

Signed-off-by: Kostiantyn Kostiuk <konstantin@daynix.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qga/vss-win32/meson.build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qga/vss-win32/meson.build b/qga/vss-win32/meson.build
index 780c461432..90825edef3 100644
--- a/qga/vss-win32/meson.build
+++ b/qga/vss-win32/meson.build
@@ -1,5 +1,5 @@
 if add_languages('cpp', required: false)
-  glib_static = dependency('glib-2.0', static: true)
+  glib_dynamic = dependency('glib-2.0', static: false)
   link_args = cc.get_supported_link_arguments(['-fstack-protector-all', '-fstack-protector-strong',
                                                '-Wl,--add-stdcall-alias', '-Wl,--enable-stdcall-fixup'])
 
@@ -8,7 +8,7 @@ if add_languages('cpp', required: false)
                 cpp_args: ['-Wno-unknown-pragmas', '-Wno-delete-non-virtual-dtor', '-Wno-non-virtual-dtor'],
                 link_args: link_args,
                 vs_module_defs: 'qga-vss.def',
-                dependencies: [glib_static, socket,
+                dependencies: [glib_dynamic, socket,
                                cc.find_library('ole32'),
                                cc.find_library('oleaut32'),
                                cc.find_library('shlwapi'),
-- 
2.29.2



