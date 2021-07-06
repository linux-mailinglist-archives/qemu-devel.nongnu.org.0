Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BBD3BC9E9
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 12:28:06 +0200 (CEST)
Received: from localhost ([::1]:53388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0iJB-0000mU-S0
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 06:28:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0hu1-0001Dy-4k
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:02:05 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:43871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0htv-0002Mc-N4
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:02:04 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 q18-20020a1ce9120000b02901f259f3a250so1828585wmc.2
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 03:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fDz5tkFjEMWh1jGsn5Uv286sF3P/RJ6lk3yQfzYfsNw=;
 b=RdtGfiDBq+nlTne5lHiymGXZP1pksuK+okc3yQ9lkZ6srgjaEmbxA0nMWADUcsQjRQ
 7DRZ7q/PcMg5B7/eoFqnlAAKYm3Uc4If8AjpZwy7UW9pTcl6enwmS0XaprkHTn6wgykH
 iG5tw5lyHv6hoaW4xuNc4Cne3DjfLPzio73J5sg/NokNF2dBpTloKY4dqkPfUZnc9lVd
 CN5qpL9C/Ub4dIx7GGMXN5AnhL+1P3pxIw/DfiNLaSQIByPI25PWHzXiWLpGIGlkKybw
 cVktDAA4fD4CBUgkbk94Zd7cdcCZmrCfkgpDjDDxwOD0BA8iz3UdpuDKL+Ak2gaN96Nm
 yHgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fDz5tkFjEMWh1jGsn5Uv286sF3P/RJ6lk3yQfzYfsNw=;
 b=gzRlkQ8vV6G4+mypJn/PEkedaeoKMvAFu32WTY23ikaUUv3QVsy6yLtu+QgKACAEpC
 AYgXbTfq6ungELLQQfCjaKaoD4JtW4v1wboIWiflA+vMOUSfsRhNOAoUyd3ooipB39VD
 TRPTi94uTxuR+BzgiQ4ONlJnGmNLaFbDrXUSWHNBj/4ImLzlyhqVQc+u1MTXptBCXGRe
 rWivkj/YFzTuKApmFQC5WuTEjzHPArpa1hl+kgAmMwxAbKuxMjWeezeEn53EMRkmXJ0F
 CeeroFe0gHRw/2DNTnzOl5wdQJ8AIk4ELahCvlXiwAcOMsJcmXIclLg3fjR/uH5MV7gP
 JINw==
X-Gm-Message-State: AOAM533FJBTv8h0LHtWpNp3nArY8RB9D6MuyQVZdKjtr2qtJ/dBCYUtH
 y1TWzuWh2LFXP+govGxxj5kYpeYoOyM=
X-Google-Smtp-Source: ABdhPJwg9k67IBOuQWZe3aWMqKBQXLYSUjO9v/wQWRg4swhUV8knoZPu9AGSIPVg5lZs8781wdy+jA==
X-Received: by 2002:a1c:cc02:: with SMTP id h2mr19165342wmb.39.1625565718421; 
 Tue, 06 Jul 2021 03:01:58 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v15sm2331268wmj.39.2021.07.06.03.01.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 03:01:58 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 24/40] meson: store dependency('threads') in a variable
Date: Tue,  6 Jul 2021 12:01:25 +0200
Message-Id: <20210706100141.303960-25-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210706100141.303960-1-pbonzini@redhat.com>
References: <20210706100141.303960-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32d.google.com
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It can be useful for has_function checks.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build      | 3 ++-
 util/meson.build | 1 -
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meson.build b/meson.build
index 53dfc2b4c6..e288e4c21c 100644
--- a/meson.build
+++ b/meson.build
@@ -164,6 +164,7 @@ endif
 multiprocess_allowed = targetos == 'linux' and not get_option('multiprocess').disabled()
 
 libm = cc.find_library('m', required: false)
+threads = dependency('threads')
 util = cc.find_library('util', required: false)
 winmm = []
 socket = []
@@ -1999,7 +2000,7 @@ util_ss.add_all(trace_ss)
 util_ss = util_ss.apply(config_all, strict: false)
 libqemuutil = static_library('qemuutil',
                              sources: util_ss.sources() + stub_ss.sources() + genh,
-                             dependencies: [util_ss.dependencies(), libm, glib, socket, malloc, pixman])
+                             dependencies: [util_ss.dependencies(), libm, threads, glib, socket, malloc, pixman])
 qemuutil = declare_dependency(link_with: libqemuutil,
                               sources: genh + version_res)
 
diff --git a/util/meson.build b/util/meson.build
index 97fad44105..6af05a5716 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -1,4 +1,3 @@
-util_ss.add(dependency('threads'))
 util_ss.add(files('osdep.c', 'cutils.c', 'unicode.c', 'qemu-timer-common.c'))
 util_ss.add(when: 'CONFIG_ATOMIC64', if_false: files('atomic64.c'))
 util_ss.add(when: 'CONFIG_POSIX', if_true: files('aio-posix.c'))
-- 
2.31.1



