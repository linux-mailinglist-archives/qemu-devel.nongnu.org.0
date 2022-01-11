Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA58C48B67D
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 20:08:07 +0100 (CET)
Received: from localhost ([::1]:60688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7MV4-0000Na-QL
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 14:08:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7M7G-0003ra-IW; Tue, 11 Jan 2022 13:43:30 -0500
Received: from [2a00:1450:4864:20::42d] (port=44849
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n7M7E-0005wE-Dl; Tue, 11 Jan 2022 13:43:30 -0500
Received: by mail-wr1-x42d.google.com with SMTP id k18so34640915wrg.11;
 Tue, 11 Jan 2022 10:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pVCkQBogdod12tDiJmcawodJWct1WKObHrq2vHnhIuA=;
 b=JvDcYi3ve3d3TsOdBVFIRDTvTUXXR7WUSICVt+U/lAngtRrRbNbPLmT4x5YY7iUm5U
 2nQWHvVayJ7i8B2tf8G2wqi722xTdKegSYN32DdUZuJ9/uOkeze989C1M9UoHIBSI2yl
 QukgxNJgU2WW2aayalWbbxep6olwIabh0jFwmbRTukdKjcLt9g2KVmgIHUcOMzhIji0D
 EL0CLkm7W+YeosEjWINkIdDARW1GnJRFhDWAfJB9bjHPsEhZjy2/IwBazzsFvdV+Jd3+
 WbhZvxEoFJczuQQzNHEwvpq/wYUIb1KYwYw4w8cbcalHKaAr0mlKCH0pHDpFpQzJIqFx
 aClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=pVCkQBogdod12tDiJmcawodJWct1WKObHrq2vHnhIuA=;
 b=6ki0sqzUh3AAnBLyuiYLBAdCJAObGxDR+SISt11UOTyioeQpZmaTNKpMbeObPnLGGb
 486k2qeIk9oQPCqdHrC4cbCceunAPT4fqBmoKppt9oW8n9TIqo/pZArocWf9cY9/tmEO
 wvTyg1ZxQrBDN6j/GYZ0hdQhbx7WsxpLoYmsU+Ry8pBHds7DCmwCu/THivNDbpSSksub
 ZMdlyh/V36eAyWif5eW1FH3hF4AlH/G0T53dG6Fl1HMwFogJzRLoSrFH+IRFEI3jXBfz
 ztvqeXh+881Bn6UHuXUp0f0dEaacEsVCdv8Bbx3E1W+JVNCLNgCRH8q9lCvNKbsQWhiC
 RucA==
X-Gm-Message-State: AOAM530UBIqaYuiGPIDiDzfkHNU2BwoEvjNdw5fedxJnp1sXFRZH4OFg
 +FdFTYqKqIknJ5CfkTFkuYfkRabCdSaPzQ==
X-Google-Smtp-Source: ABdhPJyEjXuhE3+CuRtUJhXN0W8JAVjShvy5WWMKemcn2zsxz3yS2Oc1abgfM8imL3eOr/w/tEIUWw==
X-Received: by 2002:a5d:6210:: with SMTP id y16mr4700274wru.454.1641926606338; 
 Tue, 11 Jan 2022 10:43:26 -0800 (PST)
Received: from nuc.. (83.red-83-50-87.dynamicip.rima-tde.net. [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id bi24sm2550816wmb.9.2022.01.11.10.43.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 10:43:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/10] hw/pci: Restrict pci-bus stub to sysemu
Date: Tue, 11 Jan 2022 19:43:02 +0100
Message-Id: <20220111184309.28637-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220111184309.28637-1-f4bug@amsat.org>
References: <20220111184309.28637-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Neither tools nor user-mode emulation require the PCI bus stub.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 stubs/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/stubs/meson.build b/stubs/meson.build
index 363f6fa785d..d359cbe1ad7 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -26,7 +26,6 @@
 stub_ss.add(files('module-opts.c'))
 stub_ss.add(files('monitor.c'))
 stub_ss.add(files('monitor-core.c'))
-stub_ss.add(files('pci-bus.c'))
 stub_ss.add(files('qemu-timer-notify-cb.c'))
 stub_ss.add(files('qmp_memory_device.c'))
 stub_ss.add(files('qmp-command-available.c'))
@@ -51,6 +50,7 @@
 endif
 if have_system
   stub_ss.add(files('fw_cfg.c'))
+  stub_ss.add(files('pci-bus.c'))
   stub_ss.add(files('semihost.c'))
   stub_ss.add(files('usb-dev-stub.c'))
   stub_ss.add(files('xen-hw-stub.c'))
-- 
2.34.1


