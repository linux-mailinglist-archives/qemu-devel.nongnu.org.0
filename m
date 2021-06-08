Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B1039F535
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 13:38:12 +0200 (CEST)
Received: from localhost ([::1]:47324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqa3f-0002sY-C7
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 07:38:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqZpM-0006qZ-NM
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:23:24 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:43909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqZpK-00084n-Vp
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 07:23:24 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 3-20020a05600c0243b029019f2f9b2b8aso1601917wmj.2
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 04:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QDkAahc/7Evrh6Gg+jrUeAT0alx/Ii7bF4bgVCdmccM=;
 b=lkuEc1bAMWkzY/qiUNjxODgEJn6+AaXEneKPL5EQ4XFMm1MiiEzB0G0CdPWix3KEkk
 rQ52iNfyH7rMerdk1tRswkgK4txBXpm6BUdYE+JONxs1NFNdrhpGV6CyyvBlTtQWfFXk
 zO2S4oK3Qw8o8FknBSnO8hE+BQbK0q1X9ffUlpHWUT9htwlq9KHg2fo0Wrfhnqbs4fOM
 5gIM5PXGWwY6YWjJV2g8x0MZFu/CUaWYVyWC4PHxMTXIMZf3YxKX9RxkCBt2RRm7a4tv
 YebKPmqmHCR462/3RnaegKtvQf9PmJC68/A70MKMpVdTPuUA5RKLltr14OSINDl1qYY/
 /Pcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=QDkAahc/7Evrh6Gg+jrUeAT0alx/Ii7bF4bgVCdmccM=;
 b=K6iecGMsK/bP1Z2K0V3nYe7IIdFDiMtgerDRAe7eDPrSD6eCyTOxZn3qd+ewnbMP+g
 O1Qy+wHjO2sI7Ag0IB3dARy+XAMgPyUTCmrbeT7tvll8cxVRBBN6bD/b6AnyYdqH3ZJJ
 fkuOV6rRy1Rot6VrrIzjqBbsFOuCLaObESqn6EFJrQy7dmU5HHLvh+Tj6hPn+5xVwUsu
 pp7JGTS0o7qTN2us6ziJFg9a/x7FOZeSLJLdOT7E7Z3XQjKvaGzUOSFffBFi9hxOzZkw
 i+tVEIXJY1+jaDjvv1VMcCuDxRJYwrVeC4D8gcb6jn6sKpNR/vVKx0GdhClm1GA1lW2O
 8QPA==
X-Gm-Message-State: AOAM533W1j/jkKsX/j66DdNPPk0O8GRAHTJqLnOXvq/B3nrIKpPuIcy5
 M1ig+CAqk4NW6q/AIVCFQdCuFHGIz+NRQA==
X-Google-Smtp-Source: ABdhPJyLYQYLeGIsTc0tw+96Lpyp/F193xC4mcWAgwTGUyUlhssxqD3fNBTTH5Dn3iFPh+aN3JSmmA==
X-Received: by 2002:a05:600c:410c:: with SMTP id
 j12mr21180805wmi.117.1623151401076; 
 Tue, 08 Jun 2021 04:23:21 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id i9sm15388621wrn.54.2021.06.08.04.23.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 04:23:20 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 20/26] meson: store dependency('threads') in a variable
Date: Tue,  8 Jun 2021 13:22:55 +0200
Message-Id: <20210608112301.402434-21-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608112301.402434-1-pbonzini@redhat.com>
References: <20210608112301.402434-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It can be useful for has_function checks.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build      | 3 ++-
 util/meson.build | 1 -
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meson.build b/meson.build
index fe8f64763b..0f2b05eef6 100644
--- a/meson.build
+++ b/meson.build
@@ -164,6 +164,7 @@ endif
 multiprocess_allowed = targetos == 'linux' and not get_option('multiprocess').disabled()
 
 libm = cc.find_library('m', required: false)
+threads = dependency('threads')
 util = cc.find_library('util', required: false)
 winmm = []
 socket = []
@@ -2045,7 +2046,7 @@ util_ss.add_all(trace_ss)
 util_ss = util_ss.apply(config_all, strict: false)
 libqemuutil = static_library('qemuutil',
                              sources: util_ss.sources() + stub_ss.sources() + genh,
-                             dependencies: [util_ss.dependencies(), libm, glib, socket, malloc, pixman])
+                             dependencies: [util_ss.dependencies(), libm, threads, glib, socket, malloc, pixman])
 qemuutil = declare_dependency(link_with: libqemuutil,
                               sources: genh + version_res)
 
diff --git a/util/meson.build b/util/meson.build
index 7fe9da60ab..0ffd7f4bde 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -1,4 +1,3 @@
-util_ss.add(dependency('threads'))
 util_ss.add(files('osdep.c', 'cutils.c', 'unicode.c', 'qemu-timer-common.c'))
 util_ss.add(when: 'CONFIG_ATOMIC64', if_false: files('atomic64.c'))
 util_ss.add(when: 'CONFIG_POSIX', if_true: files('aio-posix.c'))
-- 
2.31.1



