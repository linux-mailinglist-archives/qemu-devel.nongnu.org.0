Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 729543245D8
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 22:36:56 +0100 (CET)
Received: from localhost ([::1]:42726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF1q3-0006ef-Fx
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 16:36:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lF1oc-00061q-QT
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 16:35:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lF1oZ-0006tM-KV
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 16:35:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614202521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PtX1TCnTgmg+bkmCAtuPRGuNfWsxmSCauPwct3/3KoU=;
 b=HK96E9YGzgcOv6EEVI4yati3sApNtuNOAhGpAQgz4nz/dMGAT7/ptRaUJLyvGUt8yKjs1m
 6CC5G3CCaSr3T+fK5R00TYVeVguwMRRQAVtiJnnfRi73XP1NN9smEhq2qetLuMpQB70s32
 1aKgn8BYMV1/12gWk++O0/LmNsqODl8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-bH3SjIyrPF6-kkVnEsoEYg-1; Wed, 24 Feb 2021 16:35:18 -0500
X-MC-Unique: bH3SjIyrPF6-kkVnEsoEYg-1
Received: by mail-wr1-f70.google.com with SMTP id k5so1619281wrw.14
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 13:35:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PtX1TCnTgmg+bkmCAtuPRGuNfWsxmSCauPwct3/3KoU=;
 b=Ovg4LGt6ogKEWXCiklziLfT4PIC8CHN2KfGIILOTGKlL2V/W7nO0jbn+Feh34GpNWL
 IAylAFhWNZ8km0JQFt4j4CXWmB4Y2IUXTReNqQXhk8GMDxSK/HQnu9LZKti2N3wXsLLu
 wgQZbnaS+y5J6L9k378VSGrYtHIzj8+IcPVYCYMor/sbXXNTeYUgQhp796zydHsdVQXF
 9QyLrULb8lA/BdwJeLjWM9qtNbMwdOlfO/mhi1dpL9OERwrIm5RISAJEN9WfsZdhhZWP
 W9j6lM8jV0W2aQ3jRb/L15W/lAHm0Yhc5r5jeqXtD2RGmqeG1I1qK9QWHrKeFLCJdtMY
 16RA==
X-Gm-Message-State: AOAM533+fMzvfe2KUoW9040Y81jgMbhsbZ22u6zKEc8e8EJF3s8ttfG8
 UcWoPvo0oSIccBJNE5UDXAWmVm7/kPnX7ERGCesA6Wofs+MsK1vToyfRZp+RSzDPWHzprgRF8uy
 srAOwmCfuw2e4HUowg6R84NIbIXgxNDwQFx3NPU5jFG2is9Y3EZkpcfseag5yvSlB
X-Received: by 2002:a1c:3c02:: with SMTP id j2mr77967wma.92.1614202517433;
 Wed, 24 Feb 2021 13:35:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxO9/9xufwT2TVTsC3JnBiIzJME0ddAUWTCX93FcAk3MmLFtEFUFfE0/QdT+NmPU/QFkawQJA==
X-Received: by 2002:a1c:3c02:: with SMTP id j2mr77949wma.92.1614202517256;
 Wed, 24 Feb 2021 13:35:17 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id f14sm4163565wmf.7.2021.02.24.13.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 13:35:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2] meson: Only generate trace files for selected targets
Date: Wed, 24 Feb 2021 22:35:15 +0100
Message-Id: <20210224213515.3331631-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We don't need to generate trace files for targets we
are not building. Restrict the the ones selected.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 meson.build | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meson.build b/meson.build
index 05a67c20d93..8503aa1b628 100644
--- a/meson.build
+++ b/meson.build
@@ -1826,16 +1826,16 @@
   trace_events_subdirs += [
     'accel/tcg',
     'hw/core',
-    'target/arm',
-    'target/hppa',
-    'target/i386',
     'target/i386/kvm',
-    'target/mips',
-    'target/ppc',
-    'target/riscv',
-    'target/s390x',
-    'target/sparc',
   ]
+  foreach target : target_dirs
+    arch = config_target_mak[target]['TARGET_BASE_ARCH']
+    target_trace_events_subdir = 'target' / arch
+    if fs.exists(meson.current_source_dir() / target_trace_events_subdir / 'trace-events') and \
+        target_trace_events_subdir not in trace_events_subdirs
+      trace_events_subdirs += [target_trace_events_subdir]
+    endif
+  endforeach
 endif
 
 vhost_user = not_found
-- 
2.26.2


