Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6639648B61F
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 19:51:55 +0100 (CET)
Received: from localhost ([::1]:34964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7MFN-0006c6-Kc
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 13:51:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7M76-0003lx-40; Tue, 11 Jan 2022 13:43:21 -0500
Received: from [2a00:1450:4864:20::429] (port=38825
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7M74-0005uG-9B; Tue, 11 Jan 2022 13:43:19 -0500
Received: by mail-wr1-x429.google.com with SMTP id a5so30745605wrh.5;
 Tue, 11 Jan 2022 10:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=16X6YPXfQYq3LeBUyprEXLgjHcskW+mAxX1ULb+aP4w=;
 b=NxNoLECDYRzxUMSiaH6KN9l5tPRGURj1dLj/NJigSZK1nrkmUoUyRLFZg+E1J749XN
 50Jqo7zxXGo83El80U+zq6wS1s8XMT4v+FHC4L9R20X5hbXlgzCFONw8aT4y4+drjqs7
 ptmWdnRi1ZHP3aegoe1TprDssMpv1eKHED2IfTMBjlO2mhP4N/kzn6jPrOe3o7l24H7G
 jTKnJKL11o4NEvOiO1yO0e08NBWWcwtKgluPSSIBug9sGbwid9xcm1X8nSl/0EJuFeiK
 xXRuLyyktbzUC6b2Fyh1CoOChUl+/aJfry9k17uLre/qAI752kmiVH3+FuteOZRAQ1oU
 ntuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=16X6YPXfQYq3LeBUyprEXLgjHcskW+mAxX1ULb+aP4w=;
 b=Ov1Hdq0iK9U1JsEInrRcBle/dVrg4jzStQyMy1/vxs+Uw4zXMFfYk/LGbm8Km7GS+b
 /w82SXXWfWRkQtV/8yfVdMyz9Nqp/dxgT4AypULBucPgVNNikbJkXLn/URgiTieMAVoT
 7gV9cV4Fok+pSrDM9q5Vm0NU4B37HjfO7t+wfIQR9BiOXpJ9S7N4eLMb9Of5gk1+9G6b
 x6Tp13kdVlmvjyFhucb5Efic9kRBnjVFwGmE1QzjnELO8j+4KRCET6aOOvLEAOfyRkI1
 A4tcmsdgWp70lGkBx7rL7iuQkpfL3lqU7Z2ak9LGO0pOjKP91Y70L+liwQHuS8bXior/
 l8ew==
X-Gm-Message-State: AOAM532gqnCqn+8Weadix8Bztj8Jbeor8GcqF3PmLrf50atDoTN7KQ3W
 ztIGiqEkYw1caXcyW8g7O5BqtZuhYSuCVg==
X-Google-Smtp-Source: ABdhPJzbru5/Y5K9K9xfkICEU7jqIZci4y3V44ua8Bc4f8Ko6KxHDvT4j0WeMfVke68w6HfL887grA==
X-Received: by 2002:a05:6000:1449:: with SMTP id
 v9mr4879243wrx.280.1641926596273; 
 Tue, 11 Jan 2022 10:43:16 -0800 (PST)
Received: from nuc.. (83.red-83-50-87.dynamicip.rima-tde.net. [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id b1sm11121019wrd.92.2022.01.11.10.43.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 10:43:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/10] stubs: Restrict fw_cfg to system emulation
Date: Tue, 11 Jan 2022 19:43:00 +0100
Message-Id: <20220111184309.28637-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220111184309.28637-1-f4bug@amsat.org>
References: <20220111184309.28637-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

fw_cfg_arch_key_name() stub is only required for sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 stubs/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/stubs/meson.build b/stubs/meson.build
index 71469c1d50a..363f6fa785d 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -11,7 +11,6 @@
 stub_ss.add(files('dump.c'))
 stub_ss.add(files('error-printf.c'))
 stub_ss.add(files('fdset.c'))
-stub_ss.add(files('fw_cfg.c'))
 stub_ss.add(files('gdbstub.c'))
 stub_ss.add(files('get-vm-name.c'))
 if linux_io_uring.found()
@@ -51,6 +50,7 @@
   stub_ss.add(files('replay-tools.c'))
 endif
 if have_system
+  stub_ss.add(files('fw_cfg.c'))
   stub_ss.add(files('semihost.c'))
   stub_ss.add(files('usb-dev-stub.c'))
   stub_ss.add(files('xen-hw-stub.c'))
-- 
2.34.1


