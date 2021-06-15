Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAE83A8199
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 15:59:02 +0200 (CEST)
Received: from localhost ([::1]:39960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt9an-0004YN-Rc
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 09:59:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lt9Hv-0006DB-J7
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:39:31 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:39922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lt9Hs-0002s7-0M
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:39:30 -0400
Received: by mail-ej1-x62b.google.com with SMTP id l1so22571011ejb.6
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 06:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+EFladb3eqe0vt+VFB7TILa1exqZV921bqMeigXL0sY=;
 b=Teuw6AyrzF9Q6H2ApR8gtN0HTWnFui/lCx7SOzpTww1LkSiaISYpm/vzd7FBvclvSE
 LJH9M+FKfEHx3EsObnyU2TOJL4iHRl0h64lxdm6y55a/VpH46dN37XpFTZOYS4h3SKe/
 Z8f31Wik9/ZQH5rwv4f7gFpcC08cvqCikVr8hg12teFY+juSylxLhP0W8yMr7WaNJCth
 bBEIYXLiCsntVQJ3zNvNoQreoHEh0bp4fYAoU9EG2cVFoVoWc52+avpOQvjstewoTi1e
 NA5OoNTF/fCu+W5JvysXCdl6bUjTyuQZYBr2T9VuRRfj0n1EcvfyD0XYVzPcRp1ywTCb
 WMkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+EFladb3eqe0vt+VFB7TILa1exqZV921bqMeigXL0sY=;
 b=oHmsZTooM3Q6+loDTTwk3SNdouvpaZxcxHqQzYJdQOqMBci9L2UQxALvX+cMY3+o8F
 IvdwRSX7LbMTi3AiNuZDD1GaFa0+umq7bhCaJxQozK0LsU3nARg/VAIsV/vKQKk4AQqh
 SuoGnKzRZ/aW5mZIFnCBgy8KcxkNyk1tzPcdVoOBjifVft9bAGo1VGy961z5vTF+frwQ
 x/Q4LNWVLz2LboN+du6K6tZaw6848S/8LEcvgoTn8GIdzp02FuCY2bPcwLQnsq7h82qh
 anLQbhh6UQiZLeAfKim7aUdIq3e5fsPi81+nxEdEEoVot160P6mt9Ct9XLeX1UZugzrk
 WF4A==
X-Gm-Message-State: AOAM530HqMXhZC3v0O6g5V0CokEA6B6RMkw79LrycJ8zmR8mjwz38kW8
 hZrNkHpny39ZEcfL1dGxFM+KiyKlnaU=
X-Google-Smtp-Source: ABdhPJww8Dq98qXjqvnSLkqJNWsIiSR+D2OjESwXbRaZXEdgMa5+7LCfLbo4PD/4TeuHUMZbp41uWQ==
X-Received: by 2002:a17:907:2bfa:: with SMTP id
 gv58mr2887690ejc.529.1623764364968; 
 Tue, 15 Jun 2021 06:39:24 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r17sm11843769edt.33.2021.06.15.06.39.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 06:39:24 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 30/33] hmp: Print "share" property of memory backends with
 "info memdev"
Date: Tue, 15 Jun 2021 15:38:52 +0200
Message-Id: <20210615133855.775687-31-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615133855.775687-1-pbonzini@redhat.com>
References: <20210615133855.775687-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62b.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

Let's print the property.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Acked-by: Eduardo Habkost <ehabkost@redhat.com> for memory backend and machine core
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Eric Blake <eblake@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210510114328.21835-14-david@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/machine-hmp-cmds.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/core/machine-hmp-cmds.c b/hw/core/machine-hmp-cmds.c
index 58248cffa3..004a92b3d6 100644
--- a/hw/core/machine-hmp-cmds.c
+++ b/hw/core/machine-hmp-cmds.c
@@ -110,6 +110,8 @@ void hmp_info_memdev(Monitor *mon, const QDict *qdict)
                        m->value->dump ? "true" : "false");
         monitor_printf(mon, "  prealloc: %s\n",
                        m->value->prealloc ? "true" : "false");
+        monitor_printf(mon, "  share: %s\n",
+                       m->value->share ? "true" : "false");
         monitor_printf(mon, "  policy: %s\n",
                        HostMemPolicy_str(m->value->policy));
         visit_complete(v, &str);
-- 
2.31.1



