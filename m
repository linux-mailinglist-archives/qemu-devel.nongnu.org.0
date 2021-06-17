Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 665803AB0F5
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 12:08:56 +0200 (CEST)
Received: from localhost ([::1]:35096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltoxD-0003hP-3H
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 06:08:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNX-00030D-57
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:32:03 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:45597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoNU-0006Ij-2t
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:32:02 -0400
Received: by mail-ed1-x52c.google.com with SMTP id r7so3016724edv.12
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 02:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mwlb91Bq0n0L0KzBlNI9L4RP30x6/A2tSce+bkWzLWw=;
 b=C/53WgfxlzItSEcnj3GNqbaLfqsfYV2eLvE5bz0hrBUbpp0w7j6I592TDUF7y71QOl
 7zMGZGLNxb8F1uxYBsbAGhBscEAkILiz8pUxCfreqMUHa8mPMZyfRkeU0atsguz2VurC
 Xn9CW6JnZ257WnnXgKpCvVXVYrB+Zklq+j5Z5EctgtfKWmoCiPmTAy8jUwGgeMy+nZE4
 vQK8IlVsIA53qD9b0RWrgVnPzXf46F8pqaBTrl2oTCPG9tEv2KnpymZQ2pXRueoLOgP6
 AfVE5QsJJdCVXaq99HROyLtjrErwS2sdnZmlGlXMp4zQ/XlgdXvueyaXkKicXHmLism+
 MnkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Mwlb91Bq0n0L0KzBlNI9L4RP30x6/A2tSce+bkWzLWw=;
 b=LW+v32ZzVC5HtC3G6D2YvAY5EIFJxdqAgbfdUXQZNE9dQllDvQ6krJBjtsv2K5yXXA
 Ou3ZBzHakbKxvnjdUvMgtqICRz5rF8G3rl3Xq6i37xyaYDypckOmRued72qhL5X/Zs8O
 RTeQaY35r/C9bjRxsPMpXn/VEb+yy/FdRArtwnSx1/QtS00Ws1OlM4VhMoGpnoFEJH+e
 /oCzh6ZPmsFSgG29hEj3MyMzJRmymN/6Fb6MO/OV1aO+uTe0B4cLAq055bsG1vWrFKzp
 KIoVVwaKOU2N0MJ3pdB9wBiN2WZpi75qNswBDU/mw+/x6fSu4BPXIN22hA342QxEEona
 H4Mg==
X-Gm-Message-State: AOAM532Cjs3AA1aA5p+Pen4NDbpqPmli4mavKqWRH9IAedvQSsFjyyh7
 vA19WdIwbjdNe/T+AhVazd2Mv60Bbw0=
X-Google-Smtp-Source: ABdhPJzRUbG4geaLvEW/+rRaCL246mEi8XdczSCOoDMf41UHpMjvehpI60T4/IVUKxOHfwm3MFYhKQ==
X-Received: by 2002:a05:6402:28a:: with SMTP id
 l10mr5179951edv.365.1623922318859; 
 Thu, 17 Jun 2021 02:31:58 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m18sm3328140ejx.56.2021.06.17.02.31.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 02:31:58 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 31/45] qmp: Include "reserve" property of memory backends
Date: Thu, 17 Jun 2021 11:31:20 +0200
Message-Id: <20210617093134.900014-32-pbonzini@redhat.com>
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



