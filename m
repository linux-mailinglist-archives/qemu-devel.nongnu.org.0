Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A947137093E
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 00:46:41 +0200 (CEST)
Received: from localhost ([::1]:44032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcyNk-0006k9-QG
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 18:46:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lcyEz-0005Xl-HT
 for qemu-devel@nongnu.org; Sat, 01 May 2021 18:37:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lcyEx-0000Dz-VN
 for qemu-devel@nongnu.org; Sat, 01 May 2021 18:37:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619908655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=piFQVJLRgYVAQ8rwlcVYLrCWu2jTvSW2z8Zq+W/DVsE=;
 b=Yb1QH1qSwsdbp2fzuR6iKWMk//t9lRqN75igNtay/69Slpr3WmWuCYFNJAUyyfxF7P6YgX
 DszwRfLjkOOr81H7HW4OV5Sy9CJHG/SFHy31WRgUSJacPpQWvTXNk7aIeNI59GcpYnvSxy
 Eq0QgNivuWZFOzS+tGHNG5IEqQUf558=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-27VZa760Psm6MaVyLXkJvw-1; Sat, 01 May 2021 18:37:31 -0400
X-MC-Unique: 27VZa760Psm6MaVyLXkJvw-1
Received: by mail-wr1-f72.google.com with SMTP id
 q18-20020adfc5120000b029010c2bdd72adso1288902wrf.16
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 15:37:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=piFQVJLRgYVAQ8rwlcVYLrCWu2jTvSW2z8Zq+W/DVsE=;
 b=kbEl580qx/sMfRSO8J5oyH1+ko7rNAo5hea8fDeayAmZjr/5vkrzK+8CVYUTwRCgeR
 yc8N0RxbyoD+1Vc4eAzc5lmSjxn8btLCrSZP914hT50Q3wuLz1dQXQTrDtCGhjkpR9Bh
 xrx66gs+243HyNuIF7D4pVMWzbZa7C2s9SNgl2GwNcASrhITqoNcZo11zaLV2EAXA6nI
 y7S+cgXwqitqe8p3SzPtV5A37gWMr9Au4t5e/l2z2ciq8pb2FJh6ZKG9Ros5AJ1wigi2
 7/J6VPxoiQ8wa7rmdAI7FwhzfFLrgEC6ckCcU8OOt3kcM2QZigVFC+AH12axETusiZ2x
 cttA==
X-Gm-Message-State: AOAM530uOUjbjSK46XTPlILmbMi/gTSYh0FfYR+g07M2jY/fQuiByAXP
 cxifb+0DPQf/D3ktC008XVvsgZvnJndjtpqGZYszq+TE8vnGxn0SqZIuxejj4UOYzeUIrwsi0uA
 BAPgS4H3jhFZ6NCSdD8aof1qulAn6iSUNXLOTG6lblVAkAlf+WnPNV8Q9OwK/OADt
X-Received: by 2002:a5d:6b50:: with SMTP id x16mr15538122wrw.379.1619908650331; 
 Sat, 01 May 2021 15:37:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFwrlaHEA237JOmKCBgcp6IzvH/BdWKY2+dp6D/AQCA6n/m/0lyvqUoX3ovM0rbtoqtFQCVg==
X-Received: by 2002:a5d:6b50:: with SMTP id x16mr15538086wrw.379.1619908650140; 
 Sat, 01 May 2021 15:37:30 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id m11sm44785wmq.33.2021.05.01.15.37.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 15:37:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 10/10] qtest: Do not restrict bios-tables-test to Aarch64
 hosts anymore
Date: Sun,  2 May 2021 00:36:38 +0200
Message-Id: <20210501223638.510712-11-philmd@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
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
Cc: Laurent Vivier <lvivier@redhat.com>, Andrew Jones <drjones@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since commit 82bf7ae84ce ("target/arm: Remove KVM support for
32-bit Arm hosts") we can remove the comment / check added in
commit ab6b6a77774 and directly run the bios-tables-test.

Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/meson.build | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 0c767389217..46de073d155 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -175,14 +175,13 @@
    'boot-serial-test',
    'hexloader-test']
 
-# TODO: once aarch64 TCG is fixed on ARM 32 bit host, make bios-tables-test unconditional
 qtests_aarch64 = \
-  (cpu != 'arm' ? ['bios-tables-test'] : []) +                                                  \
   (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-test'] : []) +        \
   (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-swtpm-test'] : []) +  \
   ['arm-cpu-features',
    'numa-test',
    'boot-serial-test',
+   'bios-tables-test',
    'xlnx-can-test',
    'migration-test']
 
-- 
2.26.3


