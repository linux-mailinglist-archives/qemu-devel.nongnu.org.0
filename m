Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 379BE400477
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 20:02:54 +0200 (CEST)
Received: from localhost ([::1]:37432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMDWf-0004XI-9y
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 14:02:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDGV-0008HI-IV
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:46:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mMDGT-0001Fm-Mc
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:46:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630691168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gZ88+NQf7Dpg62xRnIhpn8RZKl/GOm/FncpeFehqzR4=;
 b=BwYsLPNrnL1gbKGonIZp4VWtOfSbgy7WAb0EG13m6zfeDanMAV5X35e4WdG/6D8x1jvT1U
 f/CxUWhAjtqQocusKq5HHwLJCQfKKn2T6crsoVuTvbKJBOSdk/+eV2PGMSLb41SD1WQSOG
 gxI9b5OUrXaVLAbl7HjVRZ4awHwLFkY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-xUHYecLuMvCOuKvJAw4oNQ-1; Fri, 03 Sep 2021 13:46:07 -0400
X-MC-Unique: xUHYecLuMvCOuKvJAw4oNQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 102-20020adf82ef000000b001576e345169so1815714wrc.7
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 10:46:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gZ88+NQf7Dpg62xRnIhpn8RZKl/GOm/FncpeFehqzR4=;
 b=Lo82yLqwghjVJiFXKshR833JZCLE0lMkFMBT4690JWRLkuyI30zziMgUgl4wQaTPH2
 4ZJpoahzCnNAEVZt45PM7Kr/ByykGPgWzWg9uxeqoWRDfE4so2rUlvvny+zJgX9hfclk
 oO9jmIbhA+Km271KiyOfTJC178G/2NJxiAkiG0EpYppbOfrnozyOOYHrFIg1/T2elYXZ
 NvAclmmejN+eeqi+LNORdSegXweMDiFHRlwnbF8dP8jnnJiqIks4cTE7JTmTF39aGd1x
 l4kexh77sTLKUcgXd5Q/pG2dHrgKH0G/EA3/3nLJcFRPnf5dEe580ctYnu7q0TA1QpE6
 r5qg==
X-Gm-Message-State: AOAM531NeuPDZBOF+u9ygjhy6djJWiutCIT4BhyDwASlusAiXbnOZhBB
 zb+VSsSCtrd87N/WRLWl5vgVQe3eBr2DJK3Djw17eXOyTpvl9UFScmrROdRH8O4cTy74PAFYfSF
 jC7XwdYyeIxmiOjG+jEZDOrz+TB7k8ogvtIbLbi3z44SyX7wbpA/gxk0ijMzQXkpc
X-Received: by 2002:a7b:c351:: with SMTP id l17mr37223wmj.120.1630691166062;
 Fri, 03 Sep 2021 10:46:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxnbGb/5PdPXDZwKEbmMehtIJPJlaA2azMtdkAgAUsjA6nXV46GChTvnD9r0KoEWU2HymBibw==
X-Received: by 2002:a7b:c351:: with SMTP id l17mr37191wmj.120.1630691165825;
 Fri, 03 Sep 2021 10:46:05 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id z2sm17928wma.45.2021.09.03.10.46.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 10:46:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/28] hw/core/machine: Replace g_memdup() by g_memdup2()
Date: Fri,  3 Sep 2021 19:44:52 +0200
Message-Id: <20210903174510.751630-11-philmd@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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
 hw/core/machine.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 067f42b528f..c3e5371b177 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -615,8 +615,8 @@ HotpluggableCPUList *machine_query_hotpluggable_cpus(MachineState *machine)
 
         cpu_item->type = g_strdup(machine->possible_cpus->cpus[i].type);
         cpu_item->vcpus_count = machine->possible_cpus->cpus[i].vcpus_count;
-        cpu_item->props = g_memdup(&machine->possible_cpus->cpus[i].props,
-                                   sizeof(*cpu_item->props));
+        cpu_item->props = g_memdup2(&machine->possible_cpus->cpus[i].props,
+                                    sizeof(*cpu_item->props));
 
         cpu = machine->possible_cpus->cpus[i].cpu;
         if (cpu) {
-- 
2.31.1


