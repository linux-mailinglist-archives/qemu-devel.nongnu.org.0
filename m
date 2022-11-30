Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B97663D741
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 14:53:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0NWu-0004pM-8p; Wed, 30 Nov 2022 08:53:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0NWp-0004lx-MZ
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 08:53:35 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0NWi-0003bY-Vi
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 08:53:35 -0500
Received: by mail-wr1-x42d.google.com with SMTP id z4so27227120wrr.3
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 05:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oOTQltOdTxtnQ/3wWM8lgpKU0ST3q4Ht7vQjM64PuTE=;
 b=xKB9jpvIH26ooj6X1ObxsqHtEJAdFPHxaUalDlqUf7ikQXQVmAwoaJZOf3PJSnWADm
 vi3aP0hlaUbiTooJ3P+8RHIGr9/ffPE9rDQQk3Lu9RXP3YuEQw+PpLulC+sJQtqRukK0
 37/9D6T0CGm/1Jy9cmHR69MmJV8R6xTIhFqqHyW6KNzMnCMX3B6f5VUmhERSUARYvidr
 KtzMvNLxXrj8zjczUw6yNmSbI1lxeEt3jdAKnC3By8uYDF5kQCAxLTdYSF2Xe5TeYWnu
 7QgqVsprSi+D/K3VfjGAsX52uCllDGHBaNLgxL7OYxRnMyE9pTZyAxT+LWyqpoydn9lB
 nHoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oOTQltOdTxtnQ/3wWM8lgpKU0ST3q4Ht7vQjM64PuTE=;
 b=o+uW8zaKiXNKnIjPaXSTfuosm6khl7eOz6vewKHNoSneMF26GpeRloSx8mdpAC3PaU
 9YqDQdN1pdAXsyiM7gMYCj6mNC65PJWX03M8kdA+S5GHMgxfl/r3aC7zfZubWXkl8KaV
 DZaUJpF4/MPTlda+cPs6dTdGD5CLxUSIfZC2sh2Ei4HRMT9y2SAOIzGdEhbWKhAxIkpK
 mr9Wel09z9fDnGvqo45ljTiZXoShAyaB8Y+F2RRvI4Q7AadvQ8FWv5Mp20NknHeIvlI2
 tjEzaC6lIAG8GIeaTzC92+NoVjZxxiC0rWrv0b3v1wurlIOzUP027amH0gN3vevEQVWk
 mWZA==
X-Gm-Message-State: ANoB5pn/9ekqQ2kLnHcNTZStXTHFN4GKGyXGa0u0Tt2mrpVD+lmfAdau
 98aj+dPpD2GrZO8f0zHROmEiDA8MI2U3AR3I
X-Google-Smtp-Source: AA0mqf4mD1t7/acOrMCec8qZxnEJrg/gkJRu3DeGb570KpWMGUGZHnflOTnSq5nMt951udK5qCD7KA==
X-Received: by 2002:adf:eb8a:0:b0:22e:31b2:ecb9 with SMTP id
 t10-20020adfeb8a000000b0022e31b2ecb9mr38594604wrn.693.1669816369110; 
 Wed, 30 Nov 2022 05:52:49 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 n29-20020a05600c3b9d00b003c21ba7d7d6sm2402263wms.44.2022.11.30.05.52.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 30 Nov 2022 05:52:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH-for-8.0 1/5] cpu: Remove capstone meson dependency
Date: Wed, 30 Nov 2022 14:52:37 +0100
Message-Id: <20221130135241.85060-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221130135241.85060-1-philmd@linaro.org>
References: <20221130135241.85060-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Only disas.c requires capstone CFLAGS, not cpu.c.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 5c6b5a1c75..92d449f854 100644
--- a/meson.build
+++ b/meson.build
@@ -3097,11 +3097,12 @@ if have_block
 endif
 
 common_ss.add(files('cpus-common.c'))
+specific_ss.add(files('cpu.c'))
 
 subdir('softmmu')
 
 common_ss.add(capstone)
-specific_ss.add(files('cpu.c', 'disas.c'), capstone)
+specific_ss.add(files('disas.c'), capstone)
 
 # Work around a gcc bug/misfeature wherein constant propagation looks
 # through an alias:
-- 
2.38.1


