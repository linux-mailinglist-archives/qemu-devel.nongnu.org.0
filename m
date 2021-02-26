Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AE332634C
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 14:30:12 +0100 (CET)
Received: from localhost ([::1]:56100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFdC7-0007Q5-IB
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 08:30:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFd9c-0006T5-GC
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 08:27:40 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:33680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFd9Y-0002LK-U6
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 08:27:34 -0500
Received: by mail-wr1-x42e.google.com with SMTP id 7so8598212wrz.0
 for <qemu-devel@nongnu.org>; Fri, 26 Feb 2021 05:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JWgGy7fjXHRska01RAxi8f5jwvzVQO+35Bzk4lClyhI=;
 b=BFYakLPfP8bYHYnSz0erQd9XvQpO8Lr35tVsvFzx/YwKD0oHUcTwUh7Sur72UZSC3y
 l/1AmmksttburX2ZfCDmZJqiqxaNQUJSWP22baxDhYEdCA+TG2ZqjvhjRxM3PoSFDnSb
 WDr1+gxshOydXPAy7bYQlRxTJ/uMkiKXGlu3CTb0TL2c/uUvqJRWzf2gBPqQjv6qZS6A
 jpTSjQhYuEaF2hJZUvUQU3PPbbnt8C3SMaCnMgTzxbwZF03p0plL4zffcoEaRWbgFxfF
 9e8JxFe5YnGkbpGoQcsieKz+rzd6rJRBliMegeeZOyQKy/Fi+AwkRS+WSZhBZBBIEA+w
 euYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=JWgGy7fjXHRska01RAxi8f5jwvzVQO+35Bzk4lClyhI=;
 b=CgSLVal+hAZ0l+4MnOBurGw/NdeAHu2En5WEI6XSoXtef/lCa/s49rfFqVWdkQsh98
 Nc2S0wrO7/iOcHIU6YcS4m4mw0qeQmvvBGkS3EVGqOt0T6l3NiVYvzbfO6H1BzhpUyOu
 mlYFBbWDVMIawAQVHRG63bytabA5Mi9ZK0xOdFraxI4tmSZjDVI3WUG+Ag2Etv+VfTvZ
 KM2Z6EctiAvBbV1MdUpr/Yxc8R3vRrBwG/K3KxhhBYXo5+rtN6mc3J4uCDn+NDANnQSG
 awUijwsHy9+n1i9TCevFmDGPr+OpFwHrKkPEQ8PGp0HePF+sPV3DuCqoG2zWkWE2H9KQ
 yEgw==
X-Gm-Message-State: AOAM531tmf3krX5A/2ofM3hrTsGYKwQ0xmhDP5kHdiBj76VNjfF8McmH
 nTIM7BrnEM5WMS5Fd3UCYwIctpsk4lE=
X-Google-Smtp-Source: ABdhPJzgGE4SjcJpwZn9nMKk9g3CRsk5SYEw9p1mk8n2U3fIy35dDpG34+zXzLyPhviMFpXpdzZNkw==
X-Received: by 2002:adf:a4d1:: with SMTP id h17mr3246775wrb.57.1614346050965; 
 Fri, 26 Feb 2021 05:27:30 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id f7sm13086841wre.78.2021.02.26.05.27.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 05:27:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 1/2] hw/mips/meson: Restrict emulated machines to TCG
 accelerator
Date: Fri, 26 Feb 2021 14:27:22 +0100
Message-Id: <20210226132723.3969650-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210226132723.3969650-1-f4bug@amsat.org>
References: <20210226132723.3969650-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ideally this should solved by Kconfig "depends on TCG", but we
are not there yet:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg777710.html
https://www.mail-archive.com/qemu-devel@nongnu.org/msg777632.html

As a kludge, use meson to only include emulated machines
when TCG accelerator is selected.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/mips/meson.build | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/hw/mips/meson.build b/hw/mips/meson.build
index 1195716dc73..d172eee6e7d 100644
--- a/hw/mips/meson.build
+++ b/hw/mips/meson.build
@@ -1,12 +1,15 @@
 mips_ss = ss.source_set()
 mips_ss.add(files('bootloader.c', 'mips_int.c'))
 mips_ss.add(when: 'CONFIG_FW_CFG_MIPS', if_true: files('fw_cfg.c'))
-mips_ss.add(when: 'CONFIG_FULOONG', if_true: files('fuloong2e.c'))
 mips_ss.add(when: 'CONFIG_LOONGSON3V', if_true: files('loongson3_bootp.c', 'loongson3_virt.c'))
-mips_ss.add(when: 'CONFIG_JAZZ', if_true: files('jazz.c'))
 mips_ss.add(when: 'CONFIG_MALTA', if_true: files('gt64xxx_pci.c', 'malta.c'))
-mips_ss.add(when: 'CONFIG_MIPSSIM', if_true: files('mipssim.c'))
-mips_ss.add(when: 'CONFIG_MIPS_BOSTON', if_true: [files('boston.c'), fdt])
 mips_ss.add(when: 'CONFIG_MIPS_CPS', if_true: files('cps.c'))
 
+if 'CONFIG_TCG' in config_all
+mips_ss.add(when: 'CONFIG_FULOONG', if_true: files('fuloong2e.c'))
+mips_ss.add(when: 'CONFIG_JAZZ', if_true: files('jazz.c'))
+mips_ss.add(when: 'CONFIG_MIPSSIM', if_true: files('mipssim.c'))
+mips_ss.add(when: 'CONFIG_MIPS_BOSTON', if_true: [files('boston.c'), fdt])
+endif
+
 hw_arch += {'mips': mips_ss}
-- 
2.26.2


