Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD87842415A
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 17:29:01 +0200 (CEST)
Received: from localhost ([::1]:46304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY8qq-00005F-SU
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 11:29:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mY8iT-0002EX-ML
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:20:21 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:34535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mY8iQ-0007bV-A8
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 11:20:21 -0400
Received: by mail-pl1-x62c.google.com with SMTP id b22so1920319pls.1
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 08:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YLTXsjKR5/Fp+NMNhjCMgTJMRXBC11wjMG3hfEw3URE=;
 b=L2sc489iZBykEKxxMnXTEEVuFUzkNAreFzQJ0g+nrFJup3n2CaLM06oQoqoRb3QO0+
 O9sQNq+mwwlMyLhXythvogw2Ig8UWis39jwbXEbC3kqXdhFXWEMcfk65pvu/RHdYwa4V
 EQmwW+8abiqMnM4DzUmMM4hVH6rcDMY3O1By45SwP/GkMlpTX/HmXFt4pNdbUv9o/Nuk
 DMqEVAUshfXmnPSJj0YuZ+LZyxYFa/ingWDc9vw96NcStTVEIJpBfToceLMVLA60eVTe
 PHORP8uqxwBtb/lbph1Gv3YU22R0cLblmdi6FpqxEyAKnWhM47IXMhxSwG/HAHmNWana
 xhcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YLTXsjKR5/Fp+NMNhjCMgTJMRXBC11wjMG3hfEw3URE=;
 b=4F5iIpgcivTsXuA/opy7Fp9pi+KWPboXE2N3tVWTXomS98CuL5/e5e1h9+halhMsyV
 N870NZ1FCFXJhjtYj/VXXQTErjACkFcubg1lbY9vgG/HYiWHkBisbnq6Jnms8d2USqb/
 6vLN+PRlrQFbE0355D5feB7yiwtIQShpBCXqccnsilAANgRJh7h6IA+D/QbR3bfZ4ZHP
 cP2+UQXE+w8kaXhxzfQ11enaNHuLvlJHviJUKcGhqfLVfYVYbuZrvsal58Ybe9MQincm
 YZStXEKnuzD3qRxlVf0eJe9WpNJ45o5ocrK89oKQAiIaMnp56a02uqJdokOwmU85kuQZ
 EHfg==
X-Gm-Message-State: AOAM532pzncAIPicSTV1uqYgiibtl9bUOvucGDDISorqWJax8yAPNSVH
 ZLEkUyg0mMQSq8Hb5iHgnQJyJ5LQtqExLw==
X-Google-Smtp-Source: ABdhPJwEs3v/8gtD7PZlgCqXMPOZyZ+bJXGJAvkemegUszOvH11bdAYd6sBT5xtohPGuEqSHUbCXQA==
X-Received: by 2002:a17:90a:a88a:: with SMTP id
 h10mr11491592pjq.226.1633533616657; 
 Wed, 06 Oct 2021 08:20:16 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id 130sm22239256pfz.77.2021.10.06.08.20.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 08:20:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/28] tests/docker: Fix fedora-i386-cross cross-compilation
Date: Wed,  6 Oct 2021 08:19:48 -0700
Message-Id: <20211006152014.741026-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006152014.741026-1-richard.henderson@linaro.org>
References: <20211006152014.741026-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Richard W . M . Jones" <rjones@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

By using PKG_CONFIG_PATH instead of PKG_CONFIG_LIBDIR,
we were still including the 64-bit packages.  Install
pcre-devel.i686 to fill a missing glib2 dependency.

By using --extra-cflags instead of --cpu, we incorrectly
use the wrong probing during meson.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard W.M. Jones <rjones@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210930163636.721311-3-richard.henderson@linaro.org>
---
 tests/docker/dockerfiles/fedora-i386-cross.docker | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/docker/dockerfiles/fedora-i386-cross.docker b/tests/docker/dockerfiles/fedora-i386-cross.docker
index 84f2697b6c..f62a71ce22 100644
--- a/tests/docker/dockerfiles/fedora-i386-cross.docker
+++ b/tests/docker/dockerfiles/fedora-i386-cross.docker
@@ -18,13 +18,14 @@ ENV PACKAGES \
     glibc-static.i686 \
     gnutls-devel.i686 \
     nettle-devel.i686 \
+    pcre-devel.i686 \
     perl-Test-Harness \
     pixman-devel.i686 \
     sysprof-capture-devel.i686 \
     zlib-devel.i686
 
-ENV QEMU_CONFIGURE_OPTS --extra-cflags=-m32 --disable-vhost-user
-ENV PKG_CONFIG_PATH /usr/lib/pkgconfig
+ENV QEMU_CONFIGURE_OPTS --cpu=i386 --disable-vhost-user
+ENV PKG_CONFIG_LIBDIR /usr/lib/pkgconfig
 
 RUN dnf update -y && dnf install -y $PACKAGES
 RUN rpm -q $PACKAGES | sort > /packages.txt
-- 
2.25.1


