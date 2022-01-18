Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2404925A9
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 13:24:36 +0100 (CET)
Received: from localhost ([::1]:60392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9nXQ-0006H7-1r
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 07:24:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9nES-0006Cg-Lp; Tue, 18 Jan 2022 07:05:03 -0500
Received: from [2a00:1450:4864:20::32f] (port=39623
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9nEI-0005sg-T6; Tue, 18 Jan 2022 07:04:57 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 d18-20020a05600c251200b0034974323cfaso5171933wma.4; 
 Tue, 18 Jan 2022 04:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7PQJvTm7D5iEMygal/TsZr37XrHXS89Xmn4EjxuRMgQ=;
 b=XsqplmIn3VH2aVKdkQVVyyo0QLMnUs0a+t6Lz9a9endCE994teWrbcLmkOzeu0oaWj
 zl2fxLML17U78GCOJiAQr5SQh5hJ2i28RKABPTAkCo0C+klYxM/HWix23p++N6euQPH0
 9+v1VWfqRRunTGgNwBXFitBQPGLv9lZ5gqaxEL9R6oKr++/3EYe3v5e7vRZehc/hx4DM
 2o5ye6qO7ZWeNB02JzoV5KK9+VFhCFm48gOyPMlqqIsNSgisaauwXaq5jMlknwOUnETv
 MRli6t9kHB8K6bTKHKTcEBdtjcHEGsV0TnACHsnxYN1bLAXqKnJyETjJ/VbDL/1IS0fv
 zjzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=7PQJvTm7D5iEMygal/TsZr37XrHXS89Xmn4EjxuRMgQ=;
 b=r0D2Dp4732sCtCAsFPTzBv57IAWzYPM5oemy+AXYrFjgTTxgFSiYnHvVxZLQsRBg1w
 ZCiBPXQp4ln5vwzA+FJ7cReZ9ltcQj+1vsejeVScyJkkZ6n4/mbswunEX3KrkbJ32I1x
 WmCGsacC96/eO4yEQQqu8FZTxDxX3yfBPVEO+XEqq3H4Gx56LbPHsK74+b7aoHPBD/sM
 UKlAfqNY7YcxxfsIGrLTqvNQrRIk29F9B4i69UpqYtn8/sTMa8QJKAsx4ugoeuSMH/Tw
 8zBPVehnqNGU5FQeCUQlpZR448pk99uB7fm5iiTeuNBa6fMa1zafT4R3T7na+Io6T40k
 Supw==
X-Gm-Message-State: AOAM531GJ2pmPiK5EIaIRcNSy1pLa1jDbQEfuMLZeUnqI7dFcztyXGPc
 q/0J4DcQt/D7UbkiAcgexTHgZnL53PA=
X-Google-Smtp-Source: ABdhPJw+ZMoFQnolu4O7utNWFNT9s3ZaOb9h9VZh4fcHKMRkgIXWUf3GGH7eOkBjgXNJ7Z+LOA3aBQ==
X-Received: by 2002:a5d:548b:: with SMTP id h11mr23471378wrv.12.1642507399490; 
 Tue, 18 Jan 2022 04:03:19 -0800 (PST)
Received: from nuc.. (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id
 r3sm8081621wrz.92.2022.01.18.04.03.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 04:03:19 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 10/19] hw/pci: Restrict pci-bus stub to sysemu
Date: Tue, 18 Jan 2022 13:02:20 +0100
Message-Id: <20220118120229.196337-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118120229.196337-1-f4bug@amsat.org>
References: <20220118120229.196337-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Neither tools nor user-mode emulation require the PCI bus stub.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20220111184309.28637-4-f4bug@amsat.org>
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


