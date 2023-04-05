Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 870946D835A
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 18:15:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk5m9-0007mW-US; Wed, 05 Apr 2023 12:14:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk5m3-0007kZ-B9
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 12:14:19 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk5lz-0006ZP-LP
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 12:14:13 -0400
Received: by mail-wr1-x42a.google.com with SMTP id y14so36786161wrq.4
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 09:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680711250;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AeQZJldIaB/1zbNu3DV9kzUmDswJpW46rk6Q7NupZW4=;
 b=Jj6PRM82WrwNk30qUgHPYkD/CupV2v9dtjKlKSBDUTiqD/HY1boMe0z16ZthvltKrI
 6OBlRem4em2riWVCMinDtCGa74F0CPJxw4gn19+eIta0Ld+562Wtqb8ZymvxntgwjOYG
 jsiSachkDUS3JDBRSQAvFCYFygDbXZP5toRT1yfzg6Tz6tXaINtbnKY8SDoJyeu+5v8A
 9PKx52iYbL4AwfUTmTNH6ACdvU6IyabBBtG/LDB/Teyi72wAMxjoQNYxcCt5HSJXaV6O
 Bb8418Qrxzp/8s33AXF2RYDjazr8bgDkfM7b04aSps79FwhecISdEc0k9ztLsOKwThM+
 mB7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680711250;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AeQZJldIaB/1zbNu3DV9kzUmDswJpW46rk6Q7NupZW4=;
 b=vhW13bkfXKQ3nwhRak5P9/0VToz0vwhNvsCcBeZ9OtGKFEdAyOYVYebhBefhE/+mbI
 xAlHad6FJGRyU8+X1jTrcw29k61BvKJDcKFtIon9GL35y+uTYLWA6GShOsY2sgX3JhEU
 aXAXOaeDAPd2kQps1RfU9X7B5l57hE4f/IpfiZBuvEthC9ppgZ5yxlCtCjsPS+EqUlpX
 kLD5JRvB/rm2zNtZBS2X4tL4hUjmUEfg4BM9nVVsWaSAcyuol7kha9Av9RstTzE38ZpB
 FRctaaIYbzeji6CY0sSLPqALDXiwMvZGoev5V31+YcS6z/OtC8wyLqybEvXLx+NR7I3j
 FrlQ==
X-Gm-Message-State: AAQBX9d5GHIg9mAkF4JH+YV1ajX/Q3NBiN+xsSVyXOxyloRtQi9DBofl
 j/UBin5u/UVqP7J04Ku0120zeA==
X-Google-Smtp-Source: AKy350Y6ALMh7Z7Kp0IY6mnGdmB+FjCWSj2doTPrJmE3yfwWgU0aUMSZwESpTe+CWuF918MaRYtvgg==
X-Received: by 2002:a5d:452f:0:b0:2c7:cdf:e548 with SMTP id
 j15-20020a5d452f000000b002c70cdfe548mr4108119wra.71.1680711250196; 
 Wed, 05 Apr 2023 09:14:10 -0700 (PDT)
Received: from localhost.localdomain
 (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr. [176.184.52.81])
 by smtp.gmail.com with ESMTPSA id
 z17-20020a5d4d11000000b002da75c5e143sm15277695wrt.29.2023.04.05.09.14.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 05 Apr 2023 09:14:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 kvm@vger.kernel.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/2] accel/stubs: Build HAX/KVM/XEN stubs once
Date: Wed,  5 Apr 2023 18:13:56 +0200
Message-Id: <20230405161356.98004-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230405161356.98004-1-philmd@linaro.org>
References: <20230405161356.98004-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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

These stub files don't require any target-specific bit.
(TCG stubs do, so this file is left in specific_ss[]).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/stubs/meson.build | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/accel/stubs/meson.build b/accel/stubs/meson.build
index 0249b9258f..a67f21a964 100644
--- a/accel/stubs/meson.build
+++ b/accel/stubs/meson.build
@@ -1,7 +1,9 @@
+sysemu_stubs_specific_ss = ss.source_set()
+sysemu_stubs_specific_ss.add(when: 'CONFIG_TCG', if_false: files('tcg-stub.c'))
+specific_ss.add_all(when: ['CONFIG_SOFTMMU'], if_true: sysemu_stubs_specific_ss)
+
 sysemu_stubs_ss = ss.source_set()
 sysemu_stubs_ss.add(when: 'CONFIG_HAX', if_false: files('hax-stub.c'))
-sysemu_stubs_ss.add(when: 'CONFIG_XEN', if_false: files('xen-stub.c'))
 sysemu_stubs_ss.add(when: 'CONFIG_KVM', if_false: files('kvm-stub.c'))
-sysemu_stubs_ss.add(when: 'CONFIG_TCG', if_false: files('tcg-stub.c'))
-
-specific_ss.add_all(when: ['CONFIG_SOFTMMU'], if_true: sysemu_stubs_ss)
+sysemu_stubs_ss.add(when: 'CONFIG_XEN', if_false: files('xen-stub.c'))
+softmmu_ss.add_all(when: ['CONFIG_SOFTMMU'], if_true: sysemu_stubs_ss)
-- 
2.38.1


