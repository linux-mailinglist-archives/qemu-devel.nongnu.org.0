Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD85B673CEA
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 16:00:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIWNO-00062R-Ki; Thu, 19 Jan 2023 09:58:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIWNN-00061w-7g
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 09:58:49 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIWNK-0003XB-PB
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 09:58:48 -0500
Received: by mail-wr1-x435.google.com with SMTP id b7so2144137wrt.3
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 06:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lp7QBocGltbT5Ch7Xv6lzQ/CjEgDd3cHtWRpI2qpHEo=;
 b=Yw0+mx5LwzWzLqJ65ihZ/F0XociSAqdvsH9CUtFT8zxSAZwHDKKtQPZvOkIT71MloN
 mi3AcikjmPT4Ir59uwycmOBYAjNJbU2OjAn08tOjgbDFWPdBKzi/R9SKheCOYNrYzQ0z
 48viT7/et5oIehZUboxHDeK/nDV/OpXDGrNeE3GjFGRjWvl4CDbNdlnOuWCDWoDwcLOQ
 QsoEOpIXeWjjMYb0TSHZdhQ1+9SYhhyU/TpkkM8E2ZLtuocus3HaOnKlxKpR/T0L4ci8
 sQJExcmh6obfAlITQNo87MGz5C5EriP24LjeCQJbK5XD1L60hoABtRa7hPiGf4Mo1D8a
 cy4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lp7QBocGltbT5Ch7Xv6lzQ/CjEgDd3cHtWRpI2qpHEo=;
 b=lk89xQT+CWajy8OCdbrIIqCvkuwdJzalC8rvZq2y5j7pKVxV8SyZ/J6yvCjFiyyvWl
 IpT8220ExVSN50kVVlYgx0aO9D+d0Qa6z2iVRZfwgdivW5hQxQJIB33zUrRCOCABtFXm
 Q6IFLhA9YsWTh5E3O/f1jK10ki6wu1RHtBtq7VuSwdEVrY0bTXKv288mYaW5R0u0ojwb
 T7g/NkWmbongh0j6Q63PNGM2nREVmTficGHVemQh6NhGKbYajjCvbEUv3tK6YdTdRmU0
 qWHdOMwJlva9hXO/2PWJ9AlWCvLlud/ClBxDuvSO2duFUmMb8DMpq0+fz3Eo8q36aNHo
 rv3A==
X-Gm-Message-State: AFqh2kpwEnHyMim4/ryT+8pvFocciDiR7wTMAvernR2ve3h8ZkcQq9fC
 IjofFt+QEHoMVxaRaQx+HMjF3QMk+9A30Nxe
X-Google-Smtp-Source: AMrXdXv6BCV9EzljVRscx2XY4L4QOLEYJEh+/3A+skTge4lu/gHW5VarGdcUFHvnqTLZbsFdi725Vw==
X-Received: by 2002:adf:f642:0:b0:2bc:846a:8ea2 with SMTP id
 x2-20020adff642000000b002bc846a8ea2mr10492523wrp.4.1674140325209; 
 Thu, 19 Jan 2023 06:58:45 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 u18-20020adff892000000b002bded7da2b8sm14136235wrp.102.2023.01.19.06.58.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Jan 2023 06:58:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 01/11] tests/qtest/boot-serial-test: Constify tests[] array
Date: Thu, 19 Jan 2023 15:58:28 +0100
Message-Id: <20230119145838.41835-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230119145838.41835-1-philmd@linaro.org>
References: <20230119145838.41835-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/boot-serial-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
index b216519b62..3aef3a97a9 100644
--- a/tests/qtest/boot-serial-test.c
+++ b/tests/qtest/boot-serial-test.c
@@ -139,7 +139,7 @@ typedef struct testdef {
     const uint8_t *bios;    /* Set in case we use our own mini bios */
 } testdef_t;
 
-static testdef_t tests[] = {
+static const testdef_t tests[] = {
     { "alpha", "clipper", "", "PCI:" },
     { "avr", "arduino-duemilanove", "", "T", sizeof(bios_avr), NULL, bios_avr },
     { "avr", "arduino-mega-2560-v3", "", "T", sizeof(bios_avr), NULL, bios_avr},
-- 
2.38.1


