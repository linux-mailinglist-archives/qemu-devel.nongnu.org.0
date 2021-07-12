Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B483C5EFB
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 17:19:59 +0200 (CEST)
Received: from localhost ([::1]:58004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2xiw-0007Kd-6r
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 11:19:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m2xhO-0005bE-1s
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:18:22 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:35478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m2xhM-0000vi-Cx
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 11:18:21 -0400
Received: by mail-ej1-x62d.google.com with SMTP id gn32so35354750ejc.2
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 08:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/SAXFNA/1s+ZeRNYn9VksnHzieaXJmvKa23Uh2ebwHc=;
 b=lHeFH+gwzpuLAKQwbrW8Eh6IU0609oAkbkONe2FR/EdCLnIwI9wsKVkmf0FunX0KAR
 YJm5dCAC+3DEdYxxADi6TIB0JzDQW8IYEyKqeVT8fXETn0QlvFLhG0V17KK/ysU6+zDn
 LGPBosnnrA7UbsVtdgMZWXSJaKkvDBv4LqL8BZx+HG+ttOai3cFMU+ANG8h/+A9R49OI
 JnjqSN10sWIedfr29zQrDMZ0gVVLRqsbxYQc/+13+BiGhklwLXChBMHuf2PMWoH0kKQk
 b6fZ/pLwzRsNAYJpcSIeU+exHVTb2iHym0eAa14/RQVqn9nX0z5Jnyo3reeuBLkCjm2L
 d2WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=/SAXFNA/1s+ZeRNYn9VksnHzieaXJmvKa23Uh2ebwHc=;
 b=pUh+cil6/4xCtOmwz4sgB8CTgsHQcKm3yeSBIqjlmMDNnzHbSCs1e/HN7XaziEtGhn
 UlmJIIRwbJBR4wU626JyQYeseRTy4aPeHfb+3XV8brXWAHxc4Zz2zq/oALIwvjghwUXe
 PO0xntxSFMYAHLG+R8SSzh7WV43z8AOKdYZC4W+amDJR78G6eMnZe3Nv0W3rolrfxhbn
 xEr9BNH0JSV/NQTZV2StVEqPSutMdW/GAwnvS9DYvOLLEJDZMCr3tOYRKwTMhwO/6qjZ
 +TGbRc80q+adSQxLnknKIY47PSO/kxvVSy+Yu24rFhynhGofFpzmMqTW7iMXK7mOGFdw
 9AGQ==
X-Gm-Message-State: AOAM533GST8yIdCioBzT060ZqdfhQ9s1kcQhpXd/y74+9Kh4ydphpNFr
 5I8GJIf6mF3xVLIMHDPcMFVdQqQOiXk=
X-Google-Smtp-Source: ABdhPJw3o1HeY5zOSPVmyr9+/6Awjt6xgHTNp+G6GVR3BD7hZkjaFRxJyN7+hBLbY8If7yWZonsFRQ==
X-Received: by 2002:a17:906:d10c:: with SMTP id
 b12mr16618817ejz.395.1626103099012; 
 Mon, 12 Jul 2021 08:18:19 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k21sm8007029edo.41.2021.07.12.08.18.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 08:18:18 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] meson: fix condition for io_uring stubs
Date: Mon, 12 Jul 2021 17:18:10 +0200
Message-Id: <20210712151810.508249-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CONFIG_LINUX_IO_URING is not included in config-host.mak and therefore is
not usable in "when" clauses.  Check the availability of the library,
which matches the condition for the non-stubbed version block/io_uring.c.

At this point, the difference between libraries that have config-host.mak
entries and those that do not is quite confusing.  The remaining ~dozen
should be converted in 6.2.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 stubs/meson.build | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/stubs/meson.build b/stubs/meson.build
index 2e79ff9f4d..d3fa8646b3 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -15,7 +15,9 @@ stub_ss.add(files('fdset.c'))
 stub_ss.add(files('fw_cfg.c'))
 stub_ss.add(files('gdbstub.c'))
 stub_ss.add(files('get-vm-name.c'))
-stub_ss.add(when: 'CONFIG_LINUX_IO_URING', if_true: files('io_uring.c'))
+if linux_io_uring.found()
+  stub_ss.add(files('io_uring.c'))
+endif
 stub_ss.add(files('iothread-lock.c'))
 stub_ss.add(files('isa-bus.c'))
 stub_ss.add(files('is-daemonized.c'))
-- 
2.31.1


