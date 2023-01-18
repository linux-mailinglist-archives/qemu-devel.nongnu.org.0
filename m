Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCD4671C6F
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 13:45:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI7nW-0006IW-VY; Wed, 18 Jan 2023 07:44:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pI7nS-0006Gw-6C
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 07:44:08 -0500
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pI7nQ-0006vb-HX
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 07:44:05 -0500
Received: by mail-ot1-x334.google.com with SMTP id
 cm26-20020a056830651a00b00684e5c0108dso5839292otb.9
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 04:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=izrPO1t7qk2QErTGet6agoTah6eGiWvkSVHu+2Q1hXw=;
 b=kT040hH5gk22DsJypcyf/7mc5DmGDQKPxUW6VbGXXjD7AIbnfCoK5iQzfj0CMYYg6Y
 Y2gJsj+ULSBh3iRTonB7n6hnbwJd27f//sd29kgKLwsIZb4Uu6cKtn+HO1HWW/oDvmOD
 i6RLQ0/Z6EMOP8fTFokDaq6ibiX6av7uG5PIGNxS9Q3u4x6enUx2u5LPHOxewMdEzCWT
 k+37pcXyTvE6rYAUGjpdvY9MZ7IPS/rwyGBrp3nR7MI0AA59ezUQorMklQspCvMkMwLG
 sUFHiqynWwWZcUifa+l/LZBRotBSx3pReVNHBQV8kSNwDw+oI+fhfiN20zBALeAUHZHf
 5A1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=izrPO1t7qk2QErTGet6agoTah6eGiWvkSVHu+2Q1hXw=;
 b=LD6FC0tyy44A2tO9fGrlgETs7d09OATx9VSPuSWGIC+0n5s6saRjq0x2RPw2recERQ
 DLtNnhJNEN8e950bWZB3V68Roe98hzn2guINM2FMLFfSiZ74yDS3vYJ+s5o/Pt/nKKEP
 gjZ3piVQG4NvaoDUakl/tuQNA3wsWUgO5stp3xtM/i7AcVVCkb3K2YRZafMQBp41A2Za
 cCgU6IFwxqkYPpcYifK0eJFNz4v8pOaQ1bjn1C+nwt6wC3RuiCzKXwcO5OvTNsfMk9Yb
 lqA7A7GdSZruUfA+31MIz9lhwUHLaWVT1+JzoSHt1KZgvxV3I+BjMtRoT3avE2LlRkSr
 6K3g==
X-Gm-Message-State: AFqh2koZOpcskYvYmuyHWDOczBHnBI/G1wZnhZZwQCR/TmOlYm3Ekqeo
 S9cY1+MsL9wJwZ3VGWCX+Uvw0EYjfM68Z7kX39U=
X-Google-Smtp-Source: AMrXdXvB5Eq4MH7x3lcIFkcfnnoKnHrYFADRYpWQKvOGS2tHhQCUF+okoymMTtzTvJx7xwdr5dNYgg==
X-Received: by 2002:a9d:7849:0:b0:684:98c9:36ea with SMTP id
 c9-20020a9d7849000000b0068498c936eamr3640134otm.2.1674045842655; 
 Wed, 18 Jan 2023 04:44:02 -0800 (PST)
Received: from grind.. ([191.17.222.2]) by smtp.gmail.com with ESMTPSA id
 cb2-20020a056830618200b0068460566f4bsm18158432otb.30.2023.01.18.04.44.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 04:44:02 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH 3/3] avocado_qemu: add AVOCADO_DEFAULT_MACHINE
Date: Wed, 18 Jan 2023 09:43:48 -0300
Message-Id: <20230118124348.364771-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118124348.364771-1-dbarboza@ventanamicro.com>
References: <20230118124348.364771-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-ot1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Allow users to control which machine to use in tests where no particular
machine is specified. This is a good way to run tests in a machine
that's not the arch default, e.g. for qemu-system-x86_64 tests can be
run using a machine other than pc-i440fx.

This env var has greater effect when used together with the recently
added AVOCADO_DEFAULT_ARCH, allowing full control of what the tests
should use if no default arch/machine is given. In this example, a
check-avocado run will use the RISC-V 'virt' machine if no default
arch/machine is set:

AVOCADO_DEFAULT_ARCH=riscv64 AVOCADO_DEFAULT_MACHINE=virt make check-avocado

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 docs/devel/testing.rst                 | 8 +++++---
 tests/avocado/avocado_qemu/__init__.py | 3 +++
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 95d0a3e626..128b6ae964 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -1178,9 +1178,11 @@ The machine type that will be set to all QEMUMachine instances created
 by the test.
 
 The ``machine`` attribute will be set to the test parameter of the same
-name.  If one is not given explicitly, it will either be set to
-``None``, or, if the test is tagged with one (and only one)
-``:avocado: tags=machine:VALUE`` tag, it will be set to ``VALUE``.
+name.  If one is not given explicitly, an env variable
+AVOCADO_DEFAULT_MACHINE can be used as default value if set.  Otherwise
+it will either be set to ``None``, or, if the test is tagged with one
+(and only one) ``:avocado: tags=machine:VALUE`` tag, it will be set to
+``VALUE``.
 
 qemu_bin
 ''''''''
diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index bc42985cbb..75eaaa9265 100644
--- a/tests/avocado/avocado_qemu/__init__.py
+++ b/tests/avocado/avocado_qemu/__init__.py
@@ -282,6 +282,9 @@ def setUp(self):
         self.machine = self.params.get('machine',
                                        default=self._get_unique_tag_val('machine'))
 
+        if self.machine is None:
+            self.machine = os.getenv('AVOCADO_DEFAULT_MACHINE')
+
     def require_accelerator(self, accelerator):
         """
         Requires an accelerator to be available for the test to continue
-- 
2.39.0


