Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AF13FFF21
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 13:25:46 +0200 (CEST)
Received: from localhost ([::1]:42270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM7KL-00040c-LO
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 07:25:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mM73D-0005sL-UL
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:08:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mM739-0000iw-PL
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 07:08:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630667279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jdbGO9h9jnqrOlFY+xUPTR+ImPF+i+blj+6DLU+L+so=;
 b=Kps/7ugDjxtyTCdW8xTjS1hPapwN//3dW7TJZaSHIOGdoeGpnV+bozJ3Z/T+TVp8IIaopN
 inj2grkGyDXjNjJoG8Hh5p1IrYiXg8NFMZNxLG5onWRc6zQiZlyY1zNsO0WyhhiPBgBY8N
 X+Am8CikF9Iy7wqaJ42ycSfr2lB6F1I=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-jhywmdGRPLStobP4eiDbww-1; Fri, 03 Sep 2021 07:07:58 -0400
X-MC-Unique: jhywmdGRPLStobP4eiDbww-1
Received: by mail-wm1-f69.google.com with SMTP id
 f19-20020a1c1f13000000b002e6bd83c344so1844847wmf.3
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 04:07:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jdbGO9h9jnqrOlFY+xUPTR+ImPF+i+blj+6DLU+L+so=;
 b=AFZbHCT5B4QhSGb/SbefJCpI9S19zhTqiffldjaV/i5EBgY0K86Qa+7DUaBpYfakx9
 BfHdkWeJA999xCm8NALqrO7Ys2CNEeLuh7cxgyjkCc4BlTkgRRuHep0igCMv+wQkz/E9
 tPErcF/u79LxpXEgP/6+up3X6SMOvCwUW/Vm3uKj5NawXk20WYxZqgpWsAHTp0sb0Pe9
 ewOpgZNWLBJ1pjXd+DUG+l/LOeq36O/QzxntyBqC8t6xF9bzT0Xg1ua+GdemduYW5z7H
 B78rNaFqrKrpWNnWvEmvVZ9rZbEuRS47jpdwKTuDw0bmWNpES//0cm8nUg8r9XqORbBy
 uIzA==
X-Gm-Message-State: AOAM533mkjMjq/lumZ1FsixEsgZX/xWeWD0nHmXe8FNKOCzrTwo4tlLW
 RH8XyF6HdlhYVSJeg4gJ1YINUq1fZA3SLuSGRbO1JgAnjX9Law+bSKreHk8iRTxsbk2M3W9FfIc
 Q8gvN1HKVDS7ZkoW72aabrYVXLld0kd6yE+wnLgw/Q7QrXxNR0i3kO2U/+IvRYSSa
X-Received: by 2002:a05:600c:230c:: with SMTP id
 12mr2762197wmo.41.1630667276931; 
 Fri, 03 Sep 2021 04:07:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyaAweBFiZwGaMpvEF57j+Ip2CFlgT7mOREgnEpdZoNjDiORDuB5ABI4Md7tnxGgAvNN6sfhA==
X-Received: by 2002:a05:600c:230c:: with SMTP id
 12mr2762155wmo.41.1630667276703; 
 Fri, 03 Sep 2021 04:07:56 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 l124sm4039567wml.8.2021.09.03.04.07.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 04:07:56 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/28] hw/acpi: Replace g_memdup() by g_memdup2_qemu()
Date: Fri,  3 Sep 2021 13:06:43 +0200
Message-Id: <20210903110702.588291-10-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903110702.588291-1-philmd@redhat.com>
References: <20210903110702.588291-1-philmd@redhat.com>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org,
 Zhang Chen <chen.zhang@intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Helge Deller <deller@gmx.de>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Laurent Vivier <laurent@vivier.eu>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>
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

Replace g_memdup() by the safer g_memdup2_qemu() wrapper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/acpi/core.c       | 3 ++-
 hw/i386/acpi-build.c | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/acpi/core.c b/hw/acpi/core.c
index 1e004d0078d..9dd2cf09a0b 100644
--- a/hw/acpi/core.c
+++ b/hw/acpi/core.c
@@ -637,7 +637,8 @@ void acpi_pm1_cnt_init(ACPIREGS *ar, MemoryRegion *parent,
         suspend[3] = 1 | ((!disable_s3) << 7);
         suspend[4] = s4_val | ((!disable_s4) << 7);
 
-        fw_cfg_add_file(fw_cfg, "etc/system-states", g_memdup(suspend, 6), 6);
+        fw_cfg_add_file(fw_cfg, "etc/system-states",
+                        g_memdup2_qemu(suspend, 6), 6);
     }
 }
 
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index aa269914b49..54494ca1f65 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2785,7 +2785,7 @@ void acpi_setup(void)
          */
         unsigned rsdp_size = acpi_data_len(tables.rsdp);
 
-        build_state->rsdp = g_memdup(tables.rsdp->data, rsdp_size);
+        build_state->rsdp = g_memdup2_qemu(tables.rsdp->data, rsdp_size);
         fw_cfg_add_file_callback(x86ms->fw_cfg, ACPI_BUILD_RSDP_FILE,
                                  acpi_build_update, NULL, build_state,
                                  build_state->rsdp, rsdp_size, true);
-- 
2.31.1


