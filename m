Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B89CE36D9F3
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 16:54:54 +0200 (CEST)
Received: from localhost ([::1]:38786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lblaX-0006B2-Rq
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 10:54:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lblUI-0000Oc-Kj
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 10:48:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lblUG-0005Jt-Sq
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 10:48:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619621303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WeY203+P5NVvUR+HqtO0eHSRfFihkq9FUk8m472HInQ=;
 b=XEbwJ15c+uamLxzx4WHu8YRobo9fFS1nzKtkcYmUfLWFSBlNvInFQULiGJbiUJ1dIYgr40
 5lRx3BKYMOOubVUXPkosPxel3XQQvk56XShSItK6jM7RWbIlCdtP/WcK/skVaSTXeD62QX
 6xFIYQxWzQoWl16qRBVbzLlPU+z3ngI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-95-FcgmsuC7MpKCVh-4zjP8jQ-1; Wed, 28 Apr 2021 10:48:22 -0400
X-MC-Unique: FcgmsuC7MpKCVh-4zjP8jQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 65-20020adf82c70000b0290107593a42c3so10913747wrc.5
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 07:48:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WeY203+P5NVvUR+HqtO0eHSRfFihkq9FUk8m472HInQ=;
 b=A4U3IJc+jdd38izpn+f2q/qG5vwEmP729Hsp6WxHZG2G0l4B2bFPYbsF8prrztvLq2
 OvhQGEL8IdaWraF6fprQvJ6+n2MpwvHReDpi6wXU29UkIOTJF0X0glXvQAxN5RlNMtB4
 PL9UvEKm8w7ScC5ZOoZS54nN4WeD09PGujzVe1+qbAWrQ89iF4RCJDQ/iXn6RRwE44Dq
 r5e2l0HB9c/clvP5mnU36buZaHQeh4LoZbDGVNHNDU8BMgijBtv04CMGvn/HbqsHV7A7
 DfCYnJaR9tu/ZDOYr0uMLSyjk9PbVeUN9Pi+CZ4GsxLll1owJeMohdO7cBIYgOumkVEj
 YYdA==
X-Gm-Message-State: AOAM530LtJ4yjH+faklwSWIGEudffnQWnEUkJcNhsFoDA93XeiQQ9i/a
 GtFnTu4EpG9MWll977kzyzKtHNBQfNlDYLFNK0f5n2NPGt2Xks0Pp+0L0Jv088ilkOooXd9PTpc
 yORxEFnpP0hrjMKFiypeUXox8yhg67S6dsBZcasazNib2LK4by+ATuPo/SFN13HG9
X-Received: by 2002:a1c:c910:: with SMTP id f16mr5066513wmb.136.1619621300552; 
 Wed, 28 Apr 2021 07:48:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNqXKjxYXdQcCY7V7uF9rGUWRL5xXh+xxzGf8gqlsKV2yGNov5KW3UJDSfdBBuZFh+E0Ztuw==
X-Received: by 2002:a1c:c910:: with SMTP id f16mr5066481wmb.136.1619621300280; 
 Wed, 28 Apr 2021 07:48:20 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id j15sm262777wrt.17.2021.04.28.07.48.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 07:48:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] meson: Check for seccomp/cap-ng libraries if virtiofsd is
 enabled
Date: Wed, 28 Apr 2021 16:48:12 +0200
Message-Id: <20210428144813.417170-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210428144813.417170-1-philmd@redhat.com>
References: <20210428144813.417170-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, virtio-fs@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When not explicitly select a sysemu target and building virtiofsd,
the seccomp/cap-ng libraries are not resolved, leading to this error:

  $ configure --target-list=i386-linux-user --disable-tools --enable-virtiofsd
  tools/meson.build:12:6: ERROR: Problem encountered: virtiofsd requires libcap-ng-devel and seccomp-devel

Fix by checking the seccomp/cap-ng libraries if virtiofsd is built.

Reported-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 meson.build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meson.build b/meson.build
index c6f4b0cf5e8..b466b418fed 100644
--- a/meson.build
+++ b/meson.build
@@ -393,14 +393,14 @@
 endif
 
 seccomp = not_found
-if not get_option('seccomp').auto() or have_system or have_tools
+if not get_option('seccomp').auto() or have_system or have_tools or not get_option('virtiofsd').auto()
   seccomp = dependency('libseccomp', version: '>=2.3.0',
                        required: get_option('seccomp'),
                        method: 'pkg-config', kwargs: static_kwargs)
 endif
 
 libcap_ng = not_found
-if not get_option('cap_ng').auto() or have_system or have_tools
+if not get_option('cap_ng').auto() or have_system or have_tools or not get_option('virtiofsd').auto()
   libcap_ng = cc.find_library('cap-ng', has_headers: ['cap-ng.h'],
                               required: get_option('cap_ng'),
                               kwargs: static_kwargs)
-- 
2.26.3


