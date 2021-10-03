Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 175B0420088
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 09:51:04 +0200 (CEST)
Received: from localhost ([::1]:37536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWwH1-0005Ap-4E
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 03:51:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw9E-0003Du-Hs
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:43:00 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:36731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mWw9D-0000nq-4P
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 03:43:00 -0400
Received: by mail-ed1-x536.google.com with SMTP id l7so28172044edq.3
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 00:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FWjVtE1T0s2M/PhRXdlUzw1YZjKSI7qerdNFlVrMk9c=;
 b=QIKAUVqzhvP/1EiWHZhaNMAde2GBescSgYQSmUX35jhV5VhB/k9t/ElEgnaQGCtK3A
 2VKcYjbMR4pU9LVkAt75+Cjf2inYwDDrEEc/TztCWbJ0j90k4skpa/KA4gXa7oMjFJ6j
 HVBwnotYNTMbzioYohCac7L3Yq3Iau0vn/iYLrLKBKeHLGdVl04EkRZ1h50p7WJsl+mt
 /uqVI3q3b+Ku2DqVOMLmviQaKPM5U8rixyCcN8HNkr1bHyg4qCdSOKaYos5JuzDEHEwy
 U2QFp592dPbXk3ydCeeHhINuxn07JOwCLKgUnULRVdU6/bBEw4GF1GJKWsp/XeM9A9y/
 /uJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=FWjVtE1T0s2M/PhRXdlUzw1YZjKSI7qerdNFlVrMk9c=;
 b=rAlvpEEqvdEuzC4Q4q2IYoERywnzrOOpBi9bGw5J24NO94UMc9tjOYaRG9NHvrZc/r
 OdlxpbH6xMipYnjWjPN1G3oYPbMCDwQTqXuIiROQqGnocMztP57hXIvmHjMNiw4ZUwaO
 SQah7QVLxMGo9HNQfuj50SvDKjmsu6ppQOre2qK03rwOGBzbijzQQ0wKBwOPGV9Vq9NU
 GHIlGiU2G982URXo4dkgyISK463IUXz630DAVOj76IEzLQ1d7xetF+/IAHv2pfg1abDw
 O1EaRyZKvAMdwa9WwPI3HaJ2zFNn/I8q/gbCwnhOb/wEX8J1BJbO32BWty/XW0nA8Mk1
 xUGQ==
X-Gm-Message-State: AOAM531xtR3/WXDam2If6Mggi/Alzz7geGAimk2wgewLS/UCuyGKbnbo
 kVY4CUxrKX13+Sy7l03kL06fdU3iBDU=
X-Google-Smtp-Source: ABdhPJwsB6HQpCEkAl5mTOY6aRsm/brDO2sauYJ3rPU1AITEHe9GKvQjnu6Ov3FWgfHD7/CMSsMYHg==
X-Received: by 2002:a05:6402:5252:: with SMTP id
 t18mr9329144edd.13.1633246977804; 
 Sun, 03 Oct 2021 00:42:57 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n6sm5560856eds.10.2021.10.03.00.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 00:42:57 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/30] qtest/numa-test: Use detailed -smp CLIs in
 pc_dynamic_cpu_cfg
Date: Sun,  3 Oct 2021 09:42:27 +0200
Message-Id: <20211003074250.60869-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211003074250.60869-1-pbonzini@redhat.com>
References: <20211003074250.60869-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yanan Wang <wangyanan55@huawei.com>

Since commit 80d7835749 (qemu-options: rewrite help for -smp options),
the preference of sockets/cores in -smp parsing is considered liable
to change, and actually we are going to change it in a coming commit.
So it'll be more stable to use detailed -smp CLIs in testing if we
have strong dependency on the parsing results.

pc_dynamic_cpu_cfg currently assumes/needs that there will be 2 CPU
sockets with "-smp 2". To avoid breaking the test because of parsing
logic change, now explicitly use "-smp 2,sockets=2".

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210929025816.21076-8-wangyanan55@huawei.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/qtest/numa-test.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/numa-test.c b/tests/qtest/numa-test.c
index c677cd63c4..fd7a2e80a0 100644
--- a/tests/qtest/numa-test.c
+++ b/tests/qtest/numa-test.c
@@ -265,7 +265,8 @@ static void pc_dynamic_cpu_cfg(const void *data)
     QTestState *qs;
     g_autofree char *cli = NULL;
 
-    cli = make_cli(data, "-nodefaults --preconfig -machine smp.cpus=2");
+    cli = make_cli(data, "-nodefaults --preconfig "
+                         "-machine smp.cpus=2,smp.sockets=2");
     qs = qtest_init(cli);
 
     /* create 2 numa nodes */
-- 
2.31.1



