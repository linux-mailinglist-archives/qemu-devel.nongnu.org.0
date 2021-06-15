Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0213A8217
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 16:12:53 +0200 (CEST)
Received: from localhost ([::1]:49048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt9oC-0004iJ-HZ
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 10:12:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lt9Hu-0006Cv-9V
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:39:31 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:36682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lt9Hq-0002rB-6t
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:39:29 -0400
Received: by mail-ej1-x62c.google.com with SMTP id nd37so14905521ejc.3
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 06:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xr8JhkOLb64+1jwZzCOyibuOvNn/q3bYsD1RfjM0chQ=;
 b=LmTHkLxI/4nSCFOyEXwcEpXWkOMP3YmN/xe11WhrRXgr8qPjgXYX24dZqt8g8acg3K
 C796VfF0p2FVqoJ/KzOr7B8c4RDSVP+qK5EiG4wdCi/1QcpijXe//7WS6v4wm5q/nUqB
 vpSggR0oQBzqFDdu8PV08G9ie3KqowxgT1W/gJJmUsgdrQdHwf5SiJOCUgw1dqrC04I2
 rVnjc/Jb0veZ+Wldo+EyMD9CLvmYl1a2Mu7so1mPDwPVKZ49fmA7jt7xikv0d7jMQl/S
 0CP+3XcB8tTZjs+1uea91lJTgdmnEg+IpQPFichnm/hvHadbWwAX1571Li6G/kPKgmAV
 EWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Xr8JhkOLb64+1jwZzCOyibuOvNn/q3bYsD1RfjM0chQ=;
 b=heeUC5Ljkc+Srb89QKIBHql32jqJWa5wU6atLarTNUtTt3QjJuwtxWA6zgSM0MLzYC
 6//XESZAuKQ+vs0PwWVCwl0ij9UKwn8EePlTgIj9ZcxuPumkIQggD06iL3Cp+IdC+qXL
 nbBqV9Ma5ghIvZ1m0wjBNwdvbnVQm11E+xuT8/N4SwIC2DZZ0OFBFy32MfEg6fkrr1Q2
 KU+AFvcBXqyj8SmpxwcBBPb4Ra4fgREANxyI5HNZOYhCgFRyvbJF0hxy1tMenMPOsvRT
 DfUtf3MhJi/zEhe8OalAi7yIKijVV012C1jT2zm6hMvIgjjCD6PDfdTZYejGaD8Q4GzA
 2yMw==
X-Gm-Message-State: AOAM531EP/uKa6oi/opxkk/49fdBrvJvQzlgWbwndE/uTDpLYgQoNKkn
 IVCy1WEGeUOmhBmm/hmhOHZdXvYWAuE=
X-Google-Smtp-Source: ABdhPJy6G1tr0kBX89FFsiHn3ENWu6/xnC4D0jWEkOnKG3Ju1o/ZOv25Z367u0jjW3auZ41YmQ+zHQ==
X-Received: by 2002:a17:906:7c4d:: with SMTP id
 g13mr21052942ejp.216.1623764364081; 
 Tue, 15 Jun 2021 06:39:24 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r17sm11843769edt.33.2021.06.15.06.39.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 06:39:23 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 29/33] qmp: Include "share" property of memory backends
Date: Tue, 15 Jun 2021 15:38:51 +0200
Message-Id: <20210615133855.775687-30-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615133855.775687-1-pbonzini@redhat.com>
References: <20210615133855.775687-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62c.google.com
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
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

Let's include the property, which can be helpful when debugging,
for example, to spot misuse of MAP_PRIVATE which can result in some ugly
corner cases (e.g., double-memory consumption on shmem).

Use the same description we also use for describing the property.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Acked-by: Eduardo Habkost <ehabkost@redhat.com> for memory backend and machine core
Cc: Eric Blake <eblake@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210510114328.21835-13-david@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/machine-qmp-cmds.c | 1 +
 qapi/machine.json          | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
index a36c96608f..a36ceaf4f3 100644
--- a/hw/core/machine-qmp-cmds.c
+++ b/hw/core/machine-qmp-cmds.c
@@ -172,6 +172,7 @@ static int query_memdev(Object *obj, void *opaque)
         m->merge = object_property_get_bool(obj, "merge", &error_abort);
         m->dump = object_property_get_bool(obj, "dump", &error_abort);
         m->prealloc = object_property_get_bool(obj, "prealloc", &error_abort);
+        m->share = object_property_get_bool(obj, "share", &error_abort);
         m->policy = object_property_get_enum(obj, "policy", "HostMemPolicy",
                                              &error_abort);
         host_nodes = object_property_get_qobject(obj,
diff --git a/qapi/machine.json b/qapi/machine.json
index eb14364819..1395742a4a 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -796,6 +796,8 @@
 #
 # @prealloc: whether memory was preallocated
 #
+# @share: whether memory is private to QEMU or shared (since 6.1)
+#
 # @host-nodes: host nodes for its memory policy
 #
 # @policy: memory policy of memory backend
@@ -809,6 +811,7 @@
     'merge':      'bool',
     'dump':       'bool',
     'prealloc':   'bool',
+    'share':      'bool',
     'host-nodes': ['uint16'],
     'policy':     'HostMemPolicy' }}
 
-- 
2.31.1



