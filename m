Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C9D40275E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 12:47:15 +0200 (CEST)
Received: from localhost ([::1]:42730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNYdG-0000AI-Nd
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 06:47:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNYbW-0007AA-K9
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 06:45:26 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:39431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mNYbU-0005pP-2g
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 06:45:25 -0400
Received: by mail-ed1-x531.google.com with SMTP id r7so13257336edd.6
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 03:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=W6nkUTduml/1nQ1y3YWlDYA5jPHtMeFK1UZSpWA0WGg=;
 b=aaEbem1grHdT5zU9BHOvU8xyhE/HEGK8ABCuCQ8STRKhYqwoPFQ/d7tMRywk7Ia77x
 zdn0psAT7LEBsqfkeiKGf9datBhtxx+EUpI0mNc/rMgZHnzhYujRBADzJlABRYxQm7iu
 glQKEhErZcQToBa6W+sowFv0x85AU+d8Y6TZs3/l4a0yMRvRuvMWXaCk5BRybxx2DhEH
 J47I/uDEec6BP9WEPyaUBhKQlMxXo0v3NKZJW9YagmD04JxVdaUNkXRnp2AsiSQleUV7
 6S+TP1cPnu8R4Piz0CSVpyahJ0y3WSrFRtFmxQJgoqcximy3gr436LdyFTVJgK5jCpkC
 t2jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=W6nkUTduml/1nQ1y3YWlDYA5jPHtMeFK1UZSpWA0WGg=;
 b=ZXejm6smMxyoI1eqS7+uKHCzuv0cJWvaUxZ8EUUzcycTvGX7FZZHpdCiYbw8MtJihw
 WklhVjMkEWcDDMv6PJ/amks6xeq/Ibk9+PryF0Y+3emU1DZuIvi00YwVsAYhUsOD38hS
 T/Mkc+QcfPTezPQAD8V5aVIkiine9NwVGfVRNqNqeEwy1fRGFCN0YZdVnxMdItExfpl9
 kwAM1s06EwrrVwzrJchPmTaKuouT4+OEcvlJMW2KF0BtdVQaMXEr+6U8E160QGORxbCq
 FPhYltj552JGL7amU4IYT3OnCUvNNeFB0KIxWK8peMxRYX6oRGg+DQCaA+Oox4MIlC67
 MxTw==
X-Gm-Message-State: AOAM533MDQGTeJZrE/6K3V93f1GoD10MgnsDozJhcGSJHkfhNwd8RdkA
 YIerFjTJp8km0kezHH8mp+eJr2xAvKU=
X-Google-Smtp-Source: ABdhPJywyovBsm/jrn0tVkdduPijqlK5netAM9BJTvYCIfeQh4iz208BYISoL3L5leH/vV3hCjrD1Q==
X-Received: by 2002:a05:6402:31b9:: with SMTP id
 dj25mr18151202edb.180.1631011522548; 
 Tue, 07 Sep 2021 03:45:22 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id lm21sm5294316ejb.58.2021.09.07.03.45.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 03:45:22 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] ebpf: only include in system emulators
Date: Tue,  7 Sep 2021 12:45:12 +0200
Message-Id: <20210907104512.129103-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: yuri.benditovich@daynix.com, jasowang@redhat.com, andrew@daynix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

eBPF files are being included in system emulators, which is useless and
also breaks compilation because ebpf/trace-events is only processed
if a system emulator is included in the build.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/566
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 ebpf/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ebpf/meson.build b/ebpf/meson.build
index 9cd0635370..2dd0fd8948 100644
--- a/ebpf/meson.build
+++ b/ebpf/meson.build
@@ -1 +1 @@
-common_ss.add(when: libbpf, if_true: files('ebpf_rss.c'), if_false: files('ebpf_rss-stub.c'))
+softmmu_ss.add(when: libbpf, if_true: files('ebpf_rss.c'), if_false: files('ebpf_rss-stub.c'))
-- 
2.31.1


