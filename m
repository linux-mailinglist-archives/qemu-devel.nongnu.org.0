Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A96113AB069
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 11:55:20 +0200 (CEST)
Received: from localhost ([::1]:52306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltok3-0002df-NS
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 05:55:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNW-0002xy-0i
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:32:02 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:33464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNS-0006Hg-Rr
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:32:01 -0400
Received: by mail-ed1-x52c.google.com with SMTP id d7so3137018edx.0
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 02:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xr8JhkOLb64+1jwZzCOyibuOvNn/q3bYsD1RfjM0chQ=;
 b=ue1hY4y+EDL3w6JhNV13IGzjilZW1cqp5lXOL6RNQfpUPgh6FDLYPto5ol0BIXzNvh
 EfTTpR858+/TnG6fc8klQywmQIzLNoV0NETI3gok2ZMDEbL/OeapQ6n44UFi+xPJAe3W
 4ZmB/H/XNZnKys8t3N6Vxe4YSETsjdTOY570kPJBQceYpM/tbfmdsfUEnCHNp2MgdbyY
 3Ts5dxmLhRduVQJKzhsn08sX4Ee9LVinIP27qb8Q64uQ6xQUbGZJtJQYweHkLB6cL0Ob
 PDycMAtSaBwvoYG6OL5NxAo+vzy2FXTFqIMs0CI/m8B0henhHKFNiLsbGgH1ypMIbtST
 lDbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Xr8JhkOLb64+1jwZzCOyibuOvNn/q3bYsD1RfjM0chQ=;
 b=qmDXCHJBXkNTdxmvap645EXwzkL0ff1nyK9Q/HIwBbRsOTC2qlJXlaKG13uT1wztoZ
 57oMFMR201R4tIq6galsuKriH2WyKXCPXjK6zyrQHE/yHojv4F1XQglfGiZ5AuwAj99G
 VDkhMcIsH1hJf1MX5oJb93JUvgqAbXsWWikLawQ7KCzhLcraVPuyjpsEgqxjcpwW2Wqb
 4k0UOJ8ZV1feV3uImJ0wUEVufwE+dJHPrDhIM4EOqL/GgZyA/Kv2xBDg7NMo8inUg1z5
 TJ5Sp93LRguYpAmn5pwpIaTU4g3ay3pgbVMin7Fea6f3cmjXCgTy8xOFs/aSBeuv/8B4
 Z3qQ==
X-Gm-Message-State: AOAM5328QrpcvDONYamUdZCvWiJEFumCwR7CE1zx8a8tStxFwLXURyW0
 4Fxxh5A7L8b4wXNF72n6KoQJk0LbCi8=
X-Google-Smtp-Source: ABdhPJyuxW3XdfTxpmX0aUTK2P4/UiGHTiQivd1ntNHUPf4PaLjq2GL2xu+Eib8N+43JSFA5fDL84Q==
X-Received: by 2002:a05:6402:4248:: with SMTP id
 g8mr3896682edb.368.1623922317058; 
 Thu, 17 Jun 2021 02:31:57 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m18sm3328140ejx.56.2021.06.17.02.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 02:31:56 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 29/45] qmp: Include "share" property of memory backends
Date: Thu, 17 Jun 2021 11:31:18 +0200
Message-Id: <20210617093134.900014-30-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617093134.900014-1-pbonzini@redhat.com>
References: <20210617093134.900014-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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



