Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F523C5D0E
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 15:18:46 +0200 (CEST)
Received: from localhost ([::1]:53502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2vpd-0005WB-J1
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 09:18:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m2vDd-0000cW-Qg
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:39:29 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:34789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m2vDb-0004Kn-Qc
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:39:29 -0400
Received: by mail-ej1-x629.google.com with SMTP id hr1so34326548ejc.1
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 05:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t2WzP6NLQLmPKLfdDV5pnhzDjjv9Kss8E+YkvBAh4jU=;
 b=U9+t0h5dDz90ZKDmWZsL+JDxAcQ7w0zmKIrlc8J8exUqNDk8HkehZbhhGcTE+Jbu2f
 upFppgxDxHkS2rWG9vqPOj7sY7ulxNugSpFI+dveNbr2eozZE9/VW185P6LbQf4Zd/gC
 0DfQkcjPtRPWMC4tMnvwvU+NWXf/8h01Qai9n7TGwVTSSO4fZZLKyS8vstHGy1k6u4Hj
 1gIzQ+wU9sMvpK2/NBRk9L3KqaV78jdKjkcMvU0Vs09dVkx2uZSLzH3VTysTvlpj5ZEc
 w4d3d/hJHMWmMxon7jQaMJ/Iw7xRqmNPDG4PIt+j479UaVBLBjMlQhcoO6rUYB23Vrzm
 2L8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=t2WzP6NLQLmPKLfdDV5pnhzDjjv9Kss8E+YkvBAh4jU=;
 b=EdnKipuctRc6EjDI3Ho14FEDEJEXGGTfYQ/P33tEO2S4/klN2UHzxDBtIyI8Cz4kuI
 m8Gb4QfFraQqIYGGMcHMtt0wznymp/M/elhCk+h8qIMqfzkLOWaXTUGxxd/oZ/riWEfK
 KQzQnzIDCN/3Pyt2CcQ8NC+69QIit3uMF3+3mw+/GKg0Pbw/i0p2T5aWbIId5109reUR
 9+rOutjWe6p5Jj2zNGLDMWKqC80HKpbIhUuB2Mqc0CUAfrwZCU8drtQ3Ov2i2cL8WtYL
 E1FeIYs5YTuwMhQAl4MareJkQYo91I2cJpUiWJvtzfsUcUmmCepKHL7rP6uxJju7aUwR
 m1/A==
X-Gm-Message-State: AOAM530tZBHBdGe35bXyk6iQtAa45kbXR2/8DhP9ABVKX5h9VNAkOzXb
 EdHdvxgWJBpB5L2u7dSAL2BViqOZ63o=
X-Google-Smtp-Source: ABdhPJwZEYXVQbP/EPplU5Qp2PVEBi5JpcW7FTUG3CqseQ2GhdQWuP9d9SeFh9nGnkWW415+ppcXmA==
X-Received: by 2002:a17:906:2287:: with SMTP id
 p7mr29374954eja.181.1626093566388; 
 Mon, 12 Jul 2021 05:39:26 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id q23sm7860644edt.22.2021.07.12.05.39.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 05:39:26 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] meson: fix condition for io_uring stubs
Date: Mon, 12 Jul 2021 14:39:17 +0200
Message-Id: <20210712123917.463123-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x629.google.com
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CONFIG_LINUX_IO_URING is not included in config-host.mak and therefore is
not usable in "when" clauses.  Just include it unconditionally, it will
be quietly elided by the linker if liburing is not available (including
on non-Linux).

At this point, the difference between libraries that have config-host.mak
entries and those that do not is quite confusing.  The remaining ~dozen
should be converted in 6.2.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 stubs/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/stubs/meson.build b/stubs/meson.build
index 2e79ff9f4d..42e81ab5c3 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -15,7 +15,7 @@ stub_ss.add(files('fdset.c'))
 stub_ss.add(files('fw_cfg.c'))
 stub_ss.add(files('gdbstub.c'))
 stub_ss.add(files('get-vm-name.c'))
-stub_ss.add(when: 'CONFIG_LINUX_IO_URING', if_true: files('io_uring.c'))
+stub_ss.add(files('io_uring.c'))
 stub_ss.add(files('iothread-lock.c'))
 stub_ss.add(files('isa-bus.c'))
 stub_ss.add(files('is-daemonized.c'))
-- 
2.31.1


