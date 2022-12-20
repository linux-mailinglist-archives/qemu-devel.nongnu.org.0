Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4227965236E
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 16:05:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7eAP-0000Um-En; Tue, 20 Dec 2022 10:04:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7eAK-0000TS-LR
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 10:04:27 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7eAJ-0005vD-4V
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 10:04:24 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 131-20020a1c0289000000b003d35acb0f9fso1262901wmc.2
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 07:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=N5MKPnkKMOF2zElU9F+BUaj6NASlCAgcWBEAiMR6F1g=;
 b=JHRbfeTgO2uOXWLI8FdPjujFnWEf+vUl3LPPBodk9q0WxdM1cCMskWLYMiqVkcuZgH
 RMIFBy0Hd9iIxHhQMyVH7U6u/VmofMNGlFcn0XU/uu8qFHLgRI7CrRgtOdqpAkVFJIM+
 uQDH8H7xkV5UCZRXgyPlu/G+iAUvzBl45qk3P7YA4zKYYLpVTgL5k/iv4orTW9FCHqI7
 wYMSu9JCO0E/T/CLcjY9atig0CB6Nn0PPzLUeBQhRJEdvqm5Rz7tcLhEuIG1QRc2V3nw
 44p1mF2jUusN4rZaGpFWkHY5CqJxKye73hi+JfLYgm6JZSq7UNy1ATBIemH4CskJn5uD
 yOyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N5MKPnkKMOF2zElU9F+BUaj6NASlCAgcWBEAiMR6F1g=;
 b=iQRVjHrnxsKQ+W5uHDXre+v8KwI9rfYLRhGAC6ijJjbASClCJECcLr5T/WLgmB8yrP
 JH0faNLIcB2yDVAPrAh1C7UuVDSHPXfYNosr7S9XcpTE7IvDjLB64mljFjDVNGW33hoz
 QSsXNjz0MMaV14Up3spVryuUZ4DwMwoSEC+m2Vjnaib7W8dtHF2F4nxVDENTczO0TtPQ
 aKPnCxMAoSwDbzUMcVFSss1BLcJhmbqnXBEdjFXY1Yy+MQCfUDREYPQe9rUFId5MmECX
 BaKlwd3uLBmKAjytBgi7Msc4HKK07p8QvIF65bXVTPZkHvZrbfLe6Iq3/UqVDcMjCej3
 TDbw==
X-Gm-Message-State: ANoB5pkoOkuWfiH5G+ffMMA41iJJj7cXhLsr8S8Vv/MhoYrqgg9YOtue
 c96yWdfShCESbFIWZ62ev40YXggsbpF3lG343Xk=
X-Google-Smtp-Source: AA0mqf7fo0TnWzxvzR8Aa3Kji7LyIJvlekpJGi9Pysd9TbFaIoKEhwseLPz0z+v3+G9PJYaRUJCLBA==
X-Received: by 2002:a05:600c:22ca:b0:3d1:ee97:980 with SMTP id
 10-20020a05600c22ca00b003d1ee970980mr47115971wmg.7.1671548660860; 
 Tue, 20 Dec 2022 07:04:20 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 x8-20020a05600c21c800b003b47ff307e1sm15738748wmj.31.2022.12.20.07.04.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Dec 2022 07:04:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] trace: Do not try to include QMP commands in user emulation
 binaries
Date: Tue, 20 Dec 2022 16:04:17 +0100
Message-Id: <20221220150417.26751-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

QMP is not available on user emulation; there is not monitor.
Besides, since commit a0e61807a3 ("qapi: Remove QMP events
and commands from user-mode builds") we don't generate the
qapi-commands-trace.h header in a user-emulation-only build.

Remove the QMP trace commands from qemu-user binaries.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 trace/meson.build | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/trace/meson.build b/trace/meson.build
index 26b54714d5..4385afbff0 100644
--- a/trace/meson.build
+++ b/trace/meson.build
@@ -88,4 +88,6 @@ if 'ftrace' in get_option('trace_backends')
   trace_ss.add(files('ftrace.c'))
 endif
 trace_ss.add(files('control.c'))
-trace_ss.add(files('qmp.c'))
+if have_system or have_tools or have_ga
+  trace_ss.add(files('qmp.c'))
+endif
-- 
2.38.1


