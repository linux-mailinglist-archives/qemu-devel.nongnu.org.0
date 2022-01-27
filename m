Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9C149E0A0
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 12:21:37 +0100 (CET)
Received: from localhost ([::1]:44652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD2qO-0001Kj-SG
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 06:21:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nD2ft-0006li-SM
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 06:10:47 -0500
Received: from [2a00:1450:4864:20::436] (port=41900
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nD2fp-00066t-Uh
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 06:10:44 -0500
Received: by mail-wr1-x436.google.com with SMTP id h21so4043692wrb.8
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 03:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RhCZzX1SzaShlFvgBIqzU1rna1BkC/vhcmJziKa4KaE=;
 b=WpAidGiGzPfJCTSqS+TONjOp1Gq1MEr1yuTZ4JEU8e2PzYhc79Vpu/lfw5iSbtPWJf
 4SaNbX6oBLBzkWmjKGuc95lynZs1Fxtjqjr9+ETyvIhou14mPuy35b51upULBAjbOIR0
 5T01jPEp+QlsPmuWmZMQs1EhwCF0CvRWEmEVy6n7bK75aumZxtpGlgrtLqRImDXjZd3t
 n0aEkMkPuvI1ggb2Hzx291CVpjJRFwTcJJG5i94zdxC637zz64xVIzZQ2wBMO4P57rZO
 wSQQbnfRk6qGz4MGZq4/tt+BMnPUBNzB90vweefSdo5LLte5Bh/5f5L3aurgrxNnQY0F
 Z7nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=RhCZzX1SzaShlFvgBIqzU1rna1BkC/vhcmJziKa4KaE=;
 b=PUXbs/gQJsIE96yYI9zuNxj0yzboitCQF+KAGJyD+FZ2+HXEjVGbSQPo45iG+tKNDX
 gpB+m+M+a9Czc/nfphu/2/k/IaFFuZbJTKWTkZgymlXdrVtnaY3BRCqFFlPIKdad/q82
 MiH4JGjRErElDERYBMzdtvl5aV/EmijFTZk2RK+voXjUqOI9gwyOIHK+oeXl6IXs3PVh
 I810z+SUEYe6S0a7HwCLTiqJBFh5DzyomMMfQCKeAEmcHgTNZgYcxFEm+p6nEPU8qUli
 yvUqlJ1SYgXlMosTyY3fRou4qUW+R5lmRDOOd6TMg5eaimE6fgyPTMpwC3QKam6PmNsD
 4FzA==
X-Gm-Message-State: AOAM531ry+YlwNrU208Fkv4AMs1HmolZrMGMOcnn6+9kfet7I21u8si1
 eUVRg4CQfwpxo7AgcSRdwaxzzKkPsUU=
X-Google-Smtp-Source: ABdhPJxS7SedTGpagY6fq/8Aa8pXyKiLUpGpSy+dSgVCw2lVuQq2ftAt+qj1NKygiRpHpshycwUDwg==
X-Received: by 2002:a5d:4cc7:: with SMTP id c7mr2517950wrt.233.1643281840009; 
 Thu, 27 Jan 2022 03:10:40 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id s17sm1825742wrm.62.2022.01.27.03.10.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 03:10:39 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/14] build-sys: fix a meson deprecation warning
Date: Thu, 27 Jan 2022 12:10:24 +0100
Message-Id: <20220127111037.457901-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220127111037.457901-1-pbonzini@redhat.com>
References: <20220127111037.457901-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

WARNING: Deprecated features used:
 * 0.56.0: {'meson.source_root'}

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220113162148.3621818-1-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/qtest/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 26937deb6d..842b1df420 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -103,7 +103,7 @@ if dbus_daemon.found() and config_host.has_key('GDBUS_CODEGEN')
   #qtests_i386 += ['dbus-vmstate-test']
   dbus_vmstate1 = custom_target('dbus-vmstate description',
                                 output: ['dbus-vmstate1.h', 'dbus-vmstate1.c'],
-                                input: meson.source_root() / 'backends/dbus-vmstate1.xml',
+                                input: meson.project_source_root() / 'backends/dbus-vmstate1.xml',
                                 command: [config_host['GDBUS_CODEGEN'],
                                           '@INPUT@',
                                           '--interface-prefix', 'org.qemu',
-- 
2.34.1



