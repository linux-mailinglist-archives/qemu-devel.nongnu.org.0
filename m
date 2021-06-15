Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2369F3A81A5
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 16:01:58 +0200 (CEST)
Received: from localhost ([::1]:48400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt9dc-0001oG-VT
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 10:01:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lt9Hv-0006DA-JV
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:39:31 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:43871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lt9Hs-0002sE-4v
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 09:39:31 -0400
Received: by mail-ej1-x62d.google.com with SMTP id nb6so2472155ejc.10
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 06:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mwlb91Bq0n0L0KzBlNI9L4RP30x6/A2tSce+bkWzLWw=;
 b=u0ni/tplNLkkEZQVdqH2h6e1Um/O2k9L/c+XbQ+rG7a42lDlhAjm5y8Rk7gaLKzMD0
 U7uNCNNKgzJnK0K5WIsEYqbLLRSQe7Ru04zAgXLnNlwXpOQ2KMvvu0uNo5DT0Esf5A31
 RBsFQau8T+Eeh+C5d+5Qxw6M27PW2H3EmXWV/lFZ2NrJCdywnxlc++7pmS4op11LdR/6
 zcWN3rDz/5VG8OasBRsEvG2q0MHCCRRrDYIj5u7bZ62B6kkfxtVpzonK5y54sVziYJio
 KFNJ8swWPymW6I9AaHEsZ3Fy3OEZWeEfyc9kuCn2RhBHrakPD/ugMWeHU7wcj3gikPt5
 8O8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Mwlb91Bq0n0L0KzBlNI9L4RP30x6/A2tSce+bkWzLWw=;
 b=EAr8INgl38NUTKDII6+zQkwjdZjtoxrY/kzfyzaXfEuPXwc7sthu8TfpOkkeIZxX9D
 T/cO8esAQkJxfd6bvdS0oLvQxQtYvq1jwwHzfRQypEPRN1ptyBUBVK2CC7XjNrPvAnrb
 U52qy+zXaBpcVcmeu6oQa/GEnl4B4tRnKKiH6VXjfv6mSiqgBBh7AFtmhWCIcaOrXUCo
 EFLzx8TFdlQS0Hsr1gt93pC5nlk1/YZAKvaUY22pJI2RFRAAZ9/2RfHdhT1ntAu3kqhX
 nXkhRKDRT7DxJzsKrM3aXThrEjTfZDPUHZJcsE6DQqOyb2u4gJUxfae5fjA8q4bdYynf
 jXQg==
X-Gm-Message-State: AOAM532Yt2qbe2RmoxF9VURZOEi+zHTCNQjKy4KlObRIPB/ZpRxCPsoT
 3regYf3Ik2rRPvdVLf2QVQMH3jHMWcc=
X-Google-Smtp-Source: ABdhPJwZ6tDDj18T0Ago+BwqEUsb/OqYbrAjC60PCJL5xf6oCWrdq22fqVE3K9WtXir9c2aSVIkLnQ==
X-Received: by 2002:a17:906:33c8:: with SMTP id
 w8mr21328756eja.46.1623764365834; 
 Tue, 15 Jun 2021 06:39:25 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r17sm11843769edt.33.2021.06.15.06.39.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 06:39:25 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 31/33] qmp: Include "reserve" property of memory backends
Date: Tue, 15 Jun 2021 15:38:53 +0200
Message-Id: <20210615133855.775687-32-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615133855.775687-1-pbonzini@redhat.com>
References: <20210615133855.775687-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62d.google.com
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

Let's include the new property. Instead of relying on CONFIG_LINUX,
let's try to unconditionally grab the property and treat errors as
"does not exist".

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Acked-by: Eduardo Habkost <ehabkost@redhat.com> for memory backend and machine core
Cc: Eric Blake <eblake@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210510114328.21835-15-david@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/machine-qmp-cmds.c | 7 +++++++
 qapi/machine.json          | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
index a36ceaf4f3..216fdfaf3a 100644
--- a/hw/core/machine-qmp-cmds.c
+++ b/hw/core/machine-qmp-cmds.c
@@ -157,6 +157,7 @@ void qmp_set_numa_node(NumaOptions *cmd, Error **errp)
 
 static int query_memdev(Object *obj, void *opaque)
 {
+    Error *err = NULL;
     MemdevList **list = opaque;
     Memdev *m;
     QObject *host_nodes;
@@ -173,6 +174,12 @@ static int query_memdev(Object *obj, void *opaque)
         m->dump = object_property_get_bool(obj, "dump", &error_abort);
         m->prealloc = object_property_get_bool(obj, "prealloc", &error_abort);
         m->share = object_property_get_bool(obj, "share", &error_abort);
+        m->reserve = object_property_get_bool(obj, "reserve", &err);
+        if (err) {
+            error_free_or_abort(&err);
+        } else {
+            m->has_reserve = true;
+        }
         m->policy = object_property_get_enum(obj, "policy", "HostMemPolicy",
                                              &error_abort);
         host_nodes = object_property_get_qobject(obj,
diff --git a/qapi/machine.json b/qapi/machine.json
index 1395742a4a..e4d0f9b24f 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -798,6 +798,12 @@
 #
 # @share: whether memory is private to QEMU or shared (since 6.1)
 #
+# @reserve: whether swap space (or huge pages) was reserved if applicable.
+#           This corresponds to the user configuration and not the actual
+#           behavior implemented in the OS to perform the reservation.
+#           For example, Linux will never reserve swap space for shared
+#           file mappings. (since 6.1)
+#
 # @host-nodes: host nodes for its memory policy
 #
 # @policy: memory policy of memory backend
@@ -812,6 +818,7 @@
     'dump':       'bool',
     'prealloc':   'bool',
     'share':      'bool',
+    '*reserve':    'bool',
     'host-nodes': ['uint16'],
     'policy':     'HostMemPolicy' }}
 
-- 
2.31.1



