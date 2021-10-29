Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A784405A9
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 01:06:59 +0200 (CEST)
Received: from localhost ([::1]:34222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgaxe-0004RC-3j
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 19:06:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mgatB-0005zm-9q
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 19:02:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mgat5-0006w7-7E
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 19:02:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635548534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vq+fC/d3R5UiDSG7Jt7xtQP8jc30+C5PYqqO1nlP6U8=;
 b=BnXw8JnraVFZE5nTApinZHHXCFd+zDAEr0+RhggwmAWiSe6jw1snzDPlVsLuEhgSeVOi/E
 WVLYbHnaCM5VnXVYAxz97lVqlir+VMBKblMiHi56E6kZDVO41XEvQ0kqJpCg9E2/s91Ten
 XMkeBNGdxRuydaB7W/IK8JrasLIV6IU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-7zF9hZwjPlaWNBaGTuDa9w-1; Fri, 29 Oct 2021 19:02:13 -0400
X-MC-Unique: 7zF9hZwjPlaWNBaGTuDa9w-1
Received: by mail-wr1-f71.google.com with SMTP id
 q7-20020adff507000000b0017d160d35a8so945867wro.4
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 16:02:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vq+fC/d3R5UiDSG7Jt7xtQP8jc30+C5PYqqO1nlP6U8=;
 b=qfwFNwwz7SEZyhturVi3Lv81faYCpRmA1WfBmbDKz6/sWe9fkuZQcdCbEZQ6qqfNuA
 sqkbm5qgmwr8JUlYuBTnet22Homkqi2AbP0DO8Unf9QQSdTUtHYYHtnQp0jLrnxR1H5V
 YnJn9VIhbaGK5yJlkLA1ezxSgFqN8xXmyyKJNjPRNlYWkGy6ww3hXE4msAoEKNAsaK33
 h7mOey7TXvyMxL64h3f2Opf+STX8UQcBCvj1RroIIRZUlUzrtY0km01sX5lC7dGNgdfa
 cHNpAZcC4Q3qA4HPKftvC1RFGUNaP9nUmJXGCbLuvwEoc9tPIZL+cxuOLtgWvLDeRWbK
 J5KA==
X-Gm-Message-State: AOAM5314pBYxPqNxII9wKFNxj0fZOH5KBXifh4S7bJBeS5TZKsobyqnK
 gyPiU2VoKnn/2zs8bclLT710TfHVJR5XTZLJj1T0oACP/k132KfLbR784AZK9ZTJ+W7CQnTv7CD
 R1QzmQ0lWAjGSB3qlHVaZUlL2tUOFwmrYufUyPpkqHHiPQLallwH288FXOfvE5DAs
X-Received: by 2002:a05:6000:10cb:: with SMTP id
 b11mr6321016wrx.71.1635548532062; 
 Fri, 29 Oct 2021 16:02:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwwOArmsAhWiKJ879Rn29c5YA1m9/W00kRbvTKdh/4JNiQCsXV3SAgs71ZhEOgZbapkG8OSMw==
X-Received: by 2002:a05:6000:10cb:: with SMTP id
 b11mr6320985wrx.71.1635548531789; 
 Fri, 29 Oct 2021 16:02:11 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id p19sm9638801wmg.29.2021.10.29.16.02.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 16:02:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/5] hw/core: Remove uses of QERR_INVALID_PARAMETER_VALUE
Date: Sat, 30 Oct 2021 01:01:47 +0200
Message-Id: <20211029230147.2465055-6-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211029230147.2465055-1-philmd@redhat.com>
References: <20211029230147.2465055-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QERR_INVALID_PARAMETER_VALUE definition is obsolete since 2015
(commit 4629ed1e989, "qerror: Finally unused, clean up").
Replace the definitions used in hw/core/.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/core/qdev-properties-system.c | 2 +-
 monitor/misc.c                   | 3 +--
 softmmu/cpus.c                   | 3 +--
 softmmu/qdev-monitor.c           | 7 +++----
 4 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index a91f60567aa..91b322fe372 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -749,7 +749,7 @@ static void set_pci_devfn(Object *obj, Visitor *v, const char *name,
             return;
         }
         if (value < -1 || value > 255) {
-            error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
+            error_setg(errp, "Parameter '%s' expects %s",
                        name ? name : "null", "a value between -1 and 255");
             return;
         }
diff --git a/monitor/misc.c b/monitor/misc.c
index ffe79668706..5a33458173e 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -125,8 +125,7 @@ char *qmp_human_monitor_command(const char *command_line, bool has_cpu_index,
     if (has_cpu_index) {
         int ret = monitor_set_cpu(&hmp.common, cpu_index);
         if (ret < 0) {
-            error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "cpu-index",
-                       "a CPU number");
+            error_setg(errp, "Parameter 'cpu-index' expects a CPU number");
             goto out;
         }
     }
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index 071085f840b..0e7f44154fa 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -741,8 +741,7 @@ void qmp_memsave(int64_t addr, int64_t size, const char *filename,
 
     cpu = qemu_get_cpu(cpu_index);
     if (cpu == NULL) {
-        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "cpu-index",
-                   "a CPU number");
+        error_setg(errp, "Parameter 'cpu-index' expects a CPU number");
         return;
     }
 
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 35a885a6623..27f3a1248ac 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -241,16 +241,15 @@ static DeviceClass *qdev_get_device_class(const char **driver, Error **errp)
     }
 
     if (object_class_is_abstract(oc)) {
-        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "driver",
-                   "a non-abstract device type");
+        error_setg(errp,
+                   "Parameter 'driver' expects a non-abstract device type");
         return NULL;
     }
 
     dc = DEVICE_CLASS(oc);
     if (!dc->user_creatable ||
         (phase_check(PHASE_MACHINE_READY) && !dc->hotpluggable)) {
-        error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "driver",
-                   "a pluggable device type");
+        error_setg(errp, "Parameter 'driver' expects a pluggable device type");
         return NULL;
     }
 
-- 
2.31.1


