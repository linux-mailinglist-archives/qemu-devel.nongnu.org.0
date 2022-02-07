Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4058F4AB680
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 09:22:22 +0100 (CET)
Received: from localhost ([::1]:52430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGzHw-0005hd-TS
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 03:22:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGyrA-0005gk-VY
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 02:54:41 -0500
Received: from [2a00:1450:4864:20::42e] (port=39550
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGyr9-0001rK-D8
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 02:54:40 -0500
Received: by mail-wr1-x42e.google.com with SMTP id v19so8221651wrv.6
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 23:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PVkRMBzSnCzUb/1YoxCR3lmLhVkUK13v7U39yfAjD14=;
 b=CrSn28STizFxqI9i4EF98kh4gj6bZ63KlRJzs7LNEEsBNR7IHedgWvKaNPFn5SVDen
 esT5Sk9DwxKeBDJZh5wlkwvR91gPX9zh7aM84Vhlxgfz1o5QMJeniypGv37qtsGvcYdg
 AIEUeAQYuV8WEnOeqM8gnJxC73rBYfG4lwalcIJxeYDUZkC2zdd4oEOuaHjU/CiE1coK
 gyexdiGt5C7cioQok44vfp6nxqfCa4lYY/jVdFTJz/WhWIR5+7s2wst7w9eUTZ/JF8Et
 H9aR5krJHju/ZtcYr7C6L2WSemcWuBNLVEbMPxxr0Q2a/HibsYF9t4FiZSf8pBXw+mCU
 wUBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=PVkRMBzSnCzUb/1YoxCR3lmLhVkUK13v7U39yfAjD14=;
 b=rW4hZ7mtkcWriWXjWa2J9p5vY3lu/oZGXFwRBf7JjIRh9YY8/ppAWNM7l9KtMp+xgk
 haVpjcAZTwkaRYMdeSrGHXYcb98m5+uj3c4UW1R0elq3nazowAW2oR554PPhjiOMRSpq
 UzX3ukqxjeFtDwaKrbWOze63RduIGNazw3YF29mC1ovAAZEgj5/ZMAVCJbRW7QTbdoOM
 Kn3q0/J9mggSKCJKiJGJcy9kUxqZISaARB0BHyeF4J4x24aj52HQ/jsvCzlSN1D8gVdL
 WObsuhL3qd7cJt0TRdAWAlRzH/8KlJ4X9Nwv+MR3UNVpmiq1Oh8Szpzv3uu6AXdCLffV
 Im7g==
X-Gm-Message-State: AOAM530Msgprm4jAoamYGPiutuYV9FHPslt9p5NwYgnA0149qa44zYIR
 pJ/GRd0PP+MIAdMsJ7iuJ+cQShzxO9s=
X-Google-Smtp-Source: ABdhPJxf+ABYj7/dhYku0RV0BVZcpcem7czn7cuIn7AwLesiG2/Xp+XSoy0KsLiZSrbXXV8KKnxZxw==
X-Received: by 2002:a5d:480c:: with SMTP id l12mr6813768wrq.540.1644220472825; 
 Sun, 06 Feb 2022 23:54:32 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id i3sm6351986wrq.72.2022.02.06.23.54.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 06 Feb 2022 23:54:32 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 01/21] accel: Restrict sysemu stubs to system emulation
Date: Mon,  7 Feb 2022 08:54:06 +0100
Message-Id: <20220207075426.81934-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207075426.81934-1-f4bug@amsat.org>
References: <20220207075426.81934-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/stubs/meson.build | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/accel/stubs/meson.build b/accel/stubs/meson.build
index 12dd1539af..0249b9258f 100644
--- a/accel/stubs/meson.build
+++ b/accel/stubs/meson.build
@@ -1,4 +1,7 @@
-specific_ss.add(when: 'CONFIG_HAX', if_false: files('hax-stub.c'))
-specific_ss.add(when: 'CONFIG_XEN', if_false: files('xen-stub.c'))
-specific_ss.add(when: 'CONFIG_KVM', if_false: files('kvm-stub.c'))
-specific_ss.add(when: 'CONFIG_TCG', if_false: files('tcg-stub.c'))
+sysemu_stubs_ss = ss.source_set()
+sysemu_stubs_ss.add(when: 'CONFIG_HAX', if_false: files('hax-stub.c'))
+sysemu_stubs_ss.add(when: 'CONFIG_XEN', if_false: files('xen-stub.c'))
+sysemu_stubs_ss.add(when: 'CONFIG_KVM', if_false: files('kvm-stub.c'))
+sysemu_stubs_ss.add(when: 'CONFIG_TCG', if_false: files('tcg-stub.c'))
+
+specific_ss.add_all(when: ['CONFIG_SOFTMMU'], if_true: sysemu_stubs_ss)
-- 
2.34.1


