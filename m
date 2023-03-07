Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2D86AFAB6
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 00:49:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZh1i-0008Nz-SJ; Tue, 07 Mar 2023 18:47:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZh1f-0008NH-67
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 18:47:24 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZh1d-0002ea-IA
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 18:47:22 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 l7-20020a05600c4f0700b003e79fa98ce1so155419wmq.2
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 15:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678232840;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0ZS9Hm8J7/tF46vAhSaD/WOKp+pKvbrSu7YOys7K80I=;
 b=P7g+FLLz4AJ2opVR43X9JdFJbtL+N2SE1dGOBVQn+KkSwYDAxSqfyalHC8/23Ci48j
 Oa/UqZsWee535+I0qpr0MnHbnRVj+pLShDI7PCNerkhFy5wy9zBVKbEsdYWuc7oIx+5o
 r4EOjnY4wGXfn73Dx9yqhP4BTKyJS7nX/kmXfK5aq9OgjTW1yW/CmTtOs3pCDEy7sC7w
 vWAzbBa+mIKnfmA7sgPr4EcLwAb97ZImSySLQbu3Yl2aXHhXkPDPMKDdfxcZBOF23qja
 Sc6dSSKw8/0KEXJzTH841qqlXeSNJBZMC89GjMZG5lrvdGgd1xTZ0ZSrGWwEYBk/w/P2
 mhfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678232840;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0ZS9Hm8J7/tF46vAhSaD/WOKp+pKvbrSu7YOys7K80I=;
 b=Gw58PjCI23N6MF3SGwIHSrLc9DW5DwCpCQuPwOeZIU174Ar8uNp7SfjUYJ8CK1cN4Z
 J/TE9esnfhDkddbZ2doVNzp8Wzf38acFN9DhCLj7I0K18ArfYmwIjA3Gfrlxcw5dzriC
 SrQ4JkSKeQYrMm3xAbNPnvMjDVowzy+Ip+LjLihw5Tbn77DJizUudwnAuyp64JZCUHsk
 vtuC1kss64oBJ8CUnY78MjmJMQlkUrUO9s/tjYWJHOqYdTYtNh/MsuKzuf7G/l9bxk+Z
 MUzv9zwcUepOZnwPG0Z05r8G2SpvmuJGAkwgr1BbgJ90uDGQ3KSpUItZZPjwvlenoH1M
 jbZw==
X-Gm-Message-State: AO0yUKU2fpQQINBl+18uRyGZbbq4gjfrG0MJLMNioszoX/QB3jX3JwAM
 0ppI365ux1k6iTlosG+OOIc6eTPEHdHnlVTTJkM=
X-Google-Smtp-Source: AK7set8Iw1icsQw3OgpBNHBCVFh9HTpfKk8VAMygAiFo/jc4lCuZR/5OgzEfw89nIrqUsOIMc/2hAw==
X-Received: by 2002:a05:600c:3b10:b0:3eb:399d:ab18 with SMTP id
 m16-20020a05600c3b1000b003eb399dab18mr15059809wms.35.1678232839786; 
 Tue, 07 Mar 2023 15:47:19 -0800 (PST)
Received: from localhost.localdomain (57.red-88-29-179.dynamicip.rima-tde.net.
 [88.29.179.57]) by smtp.gmail.com with ESMTPSA id
 l8-20020a05600c4f0800b003b47b80cec3sm20355206wmq.42.2023.03.07.15.47.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Mar 2023 15:47:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 01/20] docs/system: Remove "mips" board from target-mips.rst
Date: Wed,  8 Mar 2023 00:46:52 +0100
Message-Id: <20230307234711.55375-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230307234711.55375-1-philmd@linaro.org>
References: <20230307234711.55375-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

From: Jiaxun Yang <jiaxun.yang@flygoat.com>

This board had been removed long ago in commit f169413c27
("hw/mips: Remove the 'r4k' machine")

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230202132138.30945-2-jiaxun.yang@flygoat.com>
[PMD: Mention commit f169413c27]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 docs/system/target-mips.rst | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/docs/system/target-mips.rst b/docs/system/target-mips.rst
index 138441bdec..83239fb9df 100644
--- a/docs/system/target-mips.rst
+++ b/docs/system/target-mips.rst
@@ -8,8 +8,6 @@ endian options, ``qemu-system-mips``, ``qemu-system-mipsel``
 ``qemu-system-mips64`` and ``qemu-system-mips64el``. Five different
 machine types are emulated:
 
--  A generic ISA PC-like machine \"mips\"
-
 -  The MIPS Malta prototype board \"malta\"
 
 -  An ACER Pica \"pica61\". This machine needs the 64-bit emulator.
@@ -19,18 +17,6 @@ machine types are emulated:
 -  A MIPS Magnum R4000 machine \"magnum\". This machine needs the
    64-bit emulator.
 
-The generic emulation is supported by Debian 'Etch' and is able to
-install Debian into a virtual disk image. The following devices are
-emulated:
-
--  A range of MIPS CPUs, default is the 24Kf
-
--  PC style serial port
-
--  PC style IDE disk
-
--  NE2000 network card
-
 The Malta emulation supports the following devices:
 
 -  Core board with MIPS 24Kf CPU and Galileo system controller
-- 
2.38.1


