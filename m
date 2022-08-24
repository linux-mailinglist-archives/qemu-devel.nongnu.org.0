Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 429D459F720
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 12:09:57 +0200 (CEST)
Received: from localhost ([::1]:54666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQnKe-0005VJ-DX
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 06:09:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmtu-00033q-Rm
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:42:19 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:34553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmtt-0001Xc-At
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:42:18 -0400
Received: by mail-pl1-x635.google.com with SMTP id io24so1898254plb.1
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 02:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=I101fY0zL7gfjmjMvi0/DEXFe1fki2ZjtkZJncbRgy4=;
 b=aX2TUiM6ZvCN6gi+QHlW0SMzkdq6x3JWRI51+KGX0SorWyt9KF/VA5AJbFAnODK8Oq
 KI2IJPTdwu1J0hVuV18B0ZVlXULMPP4Zq6//HlaOH6+3ET4MTK2vgauIoiS30IGatYxA
 jmOAsh0tEXNi+zcSdIOOfMT7dLahpZicQUMFmHsyqEAxGQWjo//Ou6EuZZhOJeeFxUZb
 N3IzsoKWR5yxHiuXc8a/2i+gJh7MphnfhatP7/v/nICCGWVF2wMYo5XOoA4FXE76xUm8
 TOpPK7ty4P6Gd6cDsyzsNY6kHRei3r3PmVvDjXkHhYXD52//M5TT4gEgmJO4VySOkOEs
 588A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=I101fY0zL7gfjmjMvi0/DEXFe1fki2ZjtkZJncbRgy4=;
 b=EaVQYGXBNW4AnrzIX+j632Vl2ZAc/GcmKoGeHGpfYoj02HuHxE87a1ZPA6NQ9Zq8Sc
 EOy89uPG7I135zZyBUQvi1UP8JRa6wSK74XALad4/JDN11Oq95e7w8EGi9svx7ex7gFO
 zkqtyfQD1useV7yG1buDolTu2DSpkEVb3x5WGd8d+whtGEffEK5bzoO7AXI9SQetV3TI
 h0Fh+ttyBcxWKJ+GZtqU9RxzMKuToMWSekQcvvQPM404I2ABISTAFC+OpaeQNj2mu7E8
 28qcAmRT1KKKrD1iOGF4EuHvBcGXX2i3SuZ+MIJx+IpI9gOMIn92vXjGfz+uz9+VS7M0
 Y0Ag==
X-Gm-Message-State: ACgBeo1MWifLEAjwVr/FK/VjEOkHTXITAonsa6VXGXpfvTrI7E0F3nG1
 GAlOMr/XiD4GTU5YtXUlPvKDsfrkp5k=
X-Google-Smtp-Source: AA6agR7S6SmhP2v1S0VLmCZGnwWF8Moc0TZj0F7jbXTzZ8fHjZ2FE4nv1bHR5hJ7bKZYPP0ny5VhzA==
X-Received: by 2002:a17:903:2450:b0:173:9fe:70e5 with SMTP id
 l16-20020a170903245000b0017309fe70e5mr4859801pls.148.1661334136437; 
 Wed, 24 Aug 2022 02:42:16 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a170903228e00b001728eb339e2sm12165972plh.286.2022.08.24.02.42.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 02:42:16 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH 16/51] tests/qtest: Build e1000e-test for posix only
Date: Wed, 24 Aug 2022 17:39:54 +0800
Message-Id: <20220824094029.1634519-17-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824094029.1634519-1-bmeng.cn@gmail.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

The whole e1000e-test test case relies on socketpair() which does
not exist on win32.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 tests/qtest/meson.build | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index be4b30dea2..9d0f82bf1c 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -239,7 +239,6 @@ qos_test_ss.add(
   'adm1272-test.c',
   'ds1338-test.c',
   'e1000-test.c',
-  'e1000e-test.c',
   'eepro100-test.c',
   'es1370-test.c',
   'ipoctal232-test.c',
@@ -267,6 +266,9 @@ qos_test_ss.add(
   'virtio-iommu-test.c',
   'vmxnet3-test.c',
 )
+if config_host.has_key('CONFIG_POSIX')
+  qos_test_ss.add(files('e1000e-test.c'))
+endif
 if have_virtfs
   qos_test_ss.add(files('virtio-9p-test.c'))
 endif
-- 
2.34.1


