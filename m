Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B924139A1DA
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 15:09:33 +0200 (CEST)
Received: from localhost ([::1]:55444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lon6K-0008O3-OE
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 09:09:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lon4d-0006kb-U6; Thu, 03 Jun 2021 09:07:47 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:44612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lon4b-0004Lo-Aa; Thu, 03 Jun 2021 09:07:47 -0400
Received: by mail-ej1-x62d.google.com with SMTP id c10so9084108eja.11;
 Thu, 03 Jun 2021 06:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qqYqnrlenFog4cY4zspWeuI8Xg7nEVqv+lvAE9Po+qM=;
 b=OoMvNTKhucnOUqAdhn/j15ZlkIP7p9TJanasWD2IGr+JlGgu+TNfpTWT0b4d/Dl6oT
 LFYrYRAmH4eJZO6VFD94OgQH4GuNl7LzGZ/VVQfMx4xPzsZuMo+l7+VjKjb8h1TDlPvt
 ttHR/RPK8IanwHf/UB3F3dcXJZvIDjbS0PD1cxqXH+YTVzJzP9H2oTgcpdwEjFDsGdLO
 AXKe7lO1kktcvkrkKO5stopuOKoiaeZSpy4oARKl1iYnZE4AzD8H0X9kIUVlUz7tXWjN
 tcwWucZETujmVTxh+1h90aKlYSv0/3S8pLa3HOl1bjJC1ZOsslsLT392Nxdr8axvYJhH
 za6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qqYqnrlenFog4cY4zspWeuI8Xg7nEVqv+lvAE9Po+qM=;
 b=QT3qxNncjV5QIfS+I0XEdz13KAUF8Lkop5MfA2vLHjM38KvZJo1Li0BaFM3p+TFbEH
 8dWLI9O36TcakYbPlMGXuy6Jpk0C8J1wy4z0aIVzDu7ysTLwKMFnm7sTHbkl3mhFPGB7
 R1i8IgfpUbxtRXhYHUTHnsurtd8r7H8MgwaIY6j2RNES6yt1ZeQ7809O6ohf/GQAVmx0
 QTWO5ztokam89K5v4iWStsKMwwWVllP+tZ3laLMz7yiDmdg4BQu//3jBIE0+ZdOqg1Vl
 ZoqmCikDxmwyd+yswRrK7EjX3RSyhCZkuQfBQ5uIkXT6NCU9oDwFs8XH5Ny1AEhvnW+F
 ZePw==
X-Gm-Message-State: AOAM533N7Z0OePbPJNNApIRRMFK6uGaKXbWc1P4O+2+qycXgh2RNndEU
 mfjmUaErjMFcg0hODLmIasik/n7yWpSPnw==
X-Google-Smtp-Source: ABdhPJwPLLEf2K7Eh31/9LJFiFut+emH9D9XtFjXIVXm8nzgWNdYLe8NbUvMgukLNU0CJ5iR6XcLFQ==
X-Received: by 2002:a17:906:7f0e:: with SMTP id
 d14mr26181760ejr.103.1622725663553; 
 Thu, 03 Jun 2021 06:07:43 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id dh18sm1734855edb.92.2021.06.03.06.07.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 06:07:43 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] iscsi: link libm into the module
Date: Thu,  3 Jun 2021 15:07:32 +0200
Message-Id: <20210603130732.208065-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603130732.208065-1-pbonzini@redhat.com>
References: <20210603130732.208065-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: kwolf@redhat.com, Yi Sun <yisun@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Depending on the configuration of QEMU, some binaries might not need libm
at all.  In that case libiscsi, which uses exp(), will fail to load.
Link it in the module explicitly.

Reported-by: Yi Sun <yisun@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/meson.build | 2 +-
 meson.build       | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/block/meson.build b/block/meson.build
index 9e3388f633..01861e1545 100644
--- a/block/meson.build
+++ b/block/meson.build
@@ -73,7 +73,7 @@ modsrc = []
 foreach m : [
   [curl, 'curl', files('curl.c')],
   [glusterfs, 'gluster', files('gluster.c')],
-  [libiscsi, 'iscsi', files('iscsi.c')],
+  [libiscsi, 'iscsi', [files('iscsi.c'), libm]],
   [libnfs, 'nfs', files('nfs.c')],
   [libssh, 'ssh', files('ssh.c')],
   [rbd, 'rbd', files('rbd.c')],
diff --git a/meson.build b/meson.build
index a45f1a844f..913cf2a41a 100644
--- a/meson.build
+++ b/meson.build
@@ -163,7 +163,7 @@ if targetos != 'linux' and get_option('multiprocess').enabled()
 endif
 multiprocess_allowed = targetos == 'linux' and not get_option('multiprocess').disabled()
 
-m = cc.find_library('m', required: false)
+libm = cc.find_library('m', required: false)
 util = cc.find_library('util', required: false)
 winmm = []
 socket = []
@@ -1899,7 +1899,7 @@ util_ss.add_all(trace_ss)
 util_ss = util_ss.apply(config_all, strict: false)
 libqemuutil = static_library('qemuutil',
                              sources: util_ss.sources() + stub_ss.sources() + genh,
-                             dependencies: [util_ss.dependencies(), m, glib, socket, malloc, pixman])
+                             dependencies: [util_ss.dependencies(), libm, glib, socket, malloc, pixman])
 qemuutil = declare_dependency(link_with: libqemuutil,
                               sources: genh + version_res)
 
-- 
2.31.1


