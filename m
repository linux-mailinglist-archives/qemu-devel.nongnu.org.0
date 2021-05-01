Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C374C370938
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 00:41:17 +0200 (CEST)
Received: from localhost ([::1]:57340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcyIW-0000e0-R6
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 18:41:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lcyEg-0004kK-BZ
 for qemu-devel@nongnu.org; Sat, 01 May 2021 18:37:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lcyEb-0008QQ-R9
 for qemu-devel@nongnu.org; Sat, 01 May 2021 18:37:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619908633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cVrcRnyBOkjPEo/icx3S79OKNawcTbdRmhevRRnT37M=;
 b=heipv+jjCUKC/pGkJX+IvuEUqOwA2t0cp5r+acuG0vwo0HKmSG7cW/4+YibXth1mccIQqT
 gyjcF9hMyxDzgL53oh6m4iqYlGUC1XjqcoyD9nkEgNWCgILwKwNbOxGOKFlnAusBUDa57+
 Mi2ZMnNzPn9akS/btCZAh4sR19TcEgA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-lgT5DAd9PeyKCBkBX6DsVA-1; Sat, 01 May 2021 18:37:11 -0400
X-MC-Unique: lgT5DAd9PeyKCBkBX6DsVA-1
Received: by mail-wr1-f70.google.com with SMTP id
 j72-20020adf914e0000b02901073cdd9d65so1330735wrj.0
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 15:37:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cVrcRnyBOkjPEo/icx3S79OKNawcTbdRmhevRRnT37M=;
 b=L6bLBuGIhwBM/ngn+F0SCNvlCcbnJ/BItc3XT8eQotH0PXGpVx9ZJGFF5YkdjyAC++
 5PRh+Epxhh/FrnKUrH/iU+oUiqcg1yYsVAdaOqozIWd9USqj1EyxpasSijLCvTN6eX9M
 HvtdBHqCifxMo5ekx5SnrUY1hrGuahi3peqCcUcdYgpQbMWQabeWO7TvqlSFwwQ20F8I
 6HDzMf3jiOufFx54fjoVIIwgn3cVVtQ73TsydJPZ1RLK81q95Pgp5kUBa0+mdOYGVhQ1
 y+FsDV2ay0NvMNeYfZWPGCHa6wnMsAAWxFgnCze9PZrI3DzqqzF0SXPGNGszZfQ7mUO6
 Jy+w==
X-Gm-Message-State: AOAM532+mmQF/NFf19K6hJdS4T8A40mpELtqn5kBCRp7LLcBLr8gj7rl
 BpOR23givVCBENjdokgbQul6SvOeW5T6QZw1zzbGhEHYO17TenU5Tl85n0Y7Le21oQaGgx5tj2B
 Jl0s2UhVoE53YgBEQ8rOhrpJmthk1CacJkGOnFlhJz9smeWWcncvdQ0J5UI+Fqhtd
X-Received: by 2002:a5d:6207:: with SMTP id y7mr14238818wru.39.1619908630433; 
 Sat, 01 May 2021 15:37:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9v5mswuMzteBCTgaVe2vlEq7AxFtWvYuq70E2LGx7bEUYBWXWPDrDLwZCnIyKLfshUbHP0g==
X-Received: by 2002:a5d:6207:: with SMTP id y7mr14238787wru.39.1619908630241; 
 Sat, 01 May 2021 15:37:10 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id c2sm6658948wmr.22.2021.05.01.15.37.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 15:37:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 06/10] qtest/arm-cpu-features: Remove TCG fallback to KVM
 specific tests
Date: Sun,  2 May 2021 00:36:34 +0200
Message-Id: <20210501223638.510712-7-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210501223638.510712-1-philmd@redhat.com>
References: <20210501223638.510712-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

sve_tests_sve_off_kvm() and test_query_cpu_model_expansion_kvm()
tests are now only being run if KVM is available. Drop the TCG
fallback.

Suggested-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/arm-cpu-features.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index 66300c3bc20..b1d406542f7 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -21,7 +21,7 @@
 #define SVE_MAX_VQ 16
 
 #define MACHINE     "-machine virt,gic-version=max -accel tcg "
-#define MACHINE_KVM "-machine virt,gic-version=max -accel kvm -accel tcg "
+#define MACHINE_KVM "-machine virt,gic-version=max -accel kvm "
 #define QUERY_HEAD  "{ 'execute': 'query-cpu-model-expansion', " \
                     "  'arguments': { 'type': 'full', "
 #define QUERY_TAIL  "}}"
-- 
2.26.3


