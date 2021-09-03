Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40330400482
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 20:06:09 +0200 (CEST)
Received: from localhost ([::1]:47162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMDZn-0002cV-SA
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 14:06:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDGb-0008PA-OG
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:46:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDGY-0001Mc-Ij
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:46:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630691174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nAmVr0P2f5a4xc1MIJOvBsewcON3KB/MGRqhcdH2gFU=;
 b=Y3M3JnIzwWQQwZdGYMg22DiPbe4yk+Fzi74/tZYWphKTEI/CJWKV+69ZqnglHlFAMEwnA/
 lqhVtKCvpoIEg2s+SHaaUuUl9rCFFwwT/cloY0khnfFhvnJ1xCbzDS/3e4TWlXsMt626/z
 O/7OzthjdXdLEVAK9hHMQWEMOcZQGMo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-dNm54HY-N32ZkRAiCCqAPw-1; Fri, 03 Sep 2021 13:46:12 -0400
X-MC-Unique: dNm54HY-N32ZkRAiCCqAPw-1
Received: by mail-wr1-f71.google.com with SMTP id
 v6-20020adfe4c6000000b001574f9d8336so1817402wrm.15
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 10:46:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nAmVr0P2f5a4xc1MIJOvBsewcON3KB/MGRqhcdH2gFU=;
 b=su7KO4yNx2LgQOiStN8m5RaZmuQZ2on/07YLMrAf3wkF/tDEP0QaSc5bIhsXQgQu+n
 b/nkCGEBJ3CsVbopASThKVE5MBdz8nowvAf7CFXconzJ0yd/ll5eXdNlh4O92XiWJRrE
 tAkwUCC4oDAaS6icApg/9ZGNn/7P3vPw27YDGYMpl/q2v6pEqiYvqg5xTk07F04lZEwN
 nXYK8FS29ssrMEicyKsG6pOvFhfhkALsVQzblkXNfJG8R1SYNMOjVyF9wVX1AeCHunMa
 v7KtA8YWxOr4TjHri8eEqodoad1DVLF5QVkVHiNAy8YjpqGe07i9H2uRyjmGP3popfgj
 eRYg==
X-Gm-Message-State: AOAM532dXZvWYh9svWa5KFOTuyIKjVcMl4NT36V6k/oLUvMzhCmmi5k4
 yszwxorMgnBA9QFE3RcrAjwFpujTRedHlyayOLQWTRuFXnjEps9rKLwFZJpfw0MfxMEWsEkWAua
 NNG1PvcnrZyVf3xpa23S3eBN5whUapZbuPBfl/pX4oJ7WA+TsGTjZvTZnJ2PRzEII
X-Received: by 2002:adf:e645:: with SMTP id b5mr305992wrn.34.1630691171568;
 Fri, 03 Sep 2021 10:46:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxnAlDIyHr7FCqFrbe2m3zVeuBgEVlR8Qzxh3PTd82qXbinY8ZxqTS/s06WTpnyHk4xTdjyJA==
X-Received: by 2002:adf:e645:: with SMTP id b5mr305964wrn.34.1630691171380;
 Fri, 03 Sep 2021 10:46:11 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id j18sm5525383wrd.56.2021.09.03.10.46.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 10:46:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/28] hw/hppa/machine: Replace g_memdup() by g_memdup2()
Date: Fri,  3 Sep 2021 19:44:53 +0200
Message-Id: <20210903174510.751630-12-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903174510.751630-1-philmd@redhat.com>
References: <20210903174510.751630-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538

  The old API took the size of the memory to duplicate as a guint,
  whereas most memory functions take memory sizes as a gsize. This
  made it easy to accidentally pass a gsize to g_memdup(). For large
  values, that would lead to a silent truncation of the size from 64
  to 32 bits, and result in a heap area being returned which is
  significantly smaller than what the caller expects. This can likely
  be exploited in various modules to cause a heap buffer overflow.

Replace g_memdup() by the safer g_memdup2() wrapper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/hppa/machine.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index 2a46af5bc9b..e602e863a7d 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -101,19 +101,19 @@ static FWCfgState *create_fw_cfg(MachineState *ms)
 
     val = cpu_to_le64(MIN_SEABIOS_HPPA_VERSION);
     fw_cfg_add_file(fw_cfg, "/etc/firmware-min-version",
-                    g_memdup(&val, sizeof(val)), sizeof(val));
+                    g_memdup2(&val, sizeof(val)), sizeof(val));
 
     val = cpu_to_le64(HPPA_TLB_ENTRIES);
     fw_cfg_add_file(fw_cfg, "/etc/cpu/tlb_entries",
-                    g_memdup(&val, sizeof(val)), sizeof(val));
+                    g_memdup2(&val, sizeof(val)), sizeof(val));
 
     val = cpu_to_le64(HPPA_BTLB_ENTRIES);
     fw_cfg_add_file(fw_cfg, "/etc/cpu/btlb_entries",
-                    g_memdup(&val, sizeof(val)), sizeof(val));
+                    g_memdup2(&val, sizeof(val)), sizeof(val));
 
     val = cpu_to_le64(HPA_POWER_BUTTON);
     fw_cfg_add_file(fw_cfg, "/etc/power-button-addr",
-                    g_memdup(&val, sizeof(val)), sizeof(val));
+                    g_memdup2(&val, sizeof(val)), sizeof(val));
 
     fw_cfg_add_i16(fw_cfg, FW_CFG_BOOT_DEVICE, ms->boot_order[0]);
     qemu_register_boot_set(fw_cfg_boot_set, fw_cfg);
-- 
2.31.1


