Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA62B3CFA11
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 15:06:33 +0200 (CEST)
Received: from localhost ([::1]:44618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5pSC-0007i6-MK
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 09:06:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m5pGU-00052Y-R5
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 08:54:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m5pGN-0008Hd-01
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 08:54:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626785658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1W55TDbA6w0lNfwPGSJWgrGEpkj82bG0uWUcGoXhooU=;
 b=imZ5dT3ynsahlfUuOQL+vaYUp/VqpFjBo2pGwxVIIVisFdF9C16Aa3ksqG1tVwyL7Nh+3M
 Zm2l924AAk1qp6ZqvJiSaXBG754DwpsI4ptpKs10OoOvlpXUk60zEuqa7obROSb5EE7V4k
 5fTl4Mk6YM4DSvBuVSox9l1TL0E94Ag=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-QqgJcHFMMpSZBxywSO41Rw-1; Tue, 20 Jul 2021 08:54:17 -0400
X-MC-Unique: QqgJcHFMMpSZBxywSO41Rw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A25A34657
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 12:54:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-187.ams2.redhat.com
 [10.36.114.187])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DFEED5D6A1;
 Tue, 20 Jul 2021 12:54:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 22835112D855; Tue, 20 Jul 2021 14:54:09 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/16] vl: Clean up -smp error handling
Date: Tue, 20 Jul 2021 14:54:07 +0200
Message-Id: <20210720125408.387910-16-armbru@redhat.com>
In-Reply-To: <20210720125408.387910-1-armbru@redhat.com>
References: <20210720125408.387910-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Error ** argument must be NULL, &error_abort, &error_fatal, or a
pointer to a variable containing NULL.  Passing an argument of the
latter kind twice without clearing it in between is wrong: if the
first call sets an error, it no longer points to NULL for the second
call.

machine_parse_property_opt() is wrong that way: it passes @errp to
keyval_parse() without checking for failure, then passes it to
keyval_merge().  Harmless, since the only caller passes &error_fatal.

Clean up: drop the parameter, and use &error_fatal directly.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 softmmu/vl.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index f9ffeb8d4d..ce0ecc736b 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1535,19 +1535,19 @@ static void machine_help_func(const QDict *qdict)
 
 static void
 machine_parse_property_opt(QemuOptsList *opts_list, const char *propname,
-                           const char *arg, Error **errp)
+                           const char *arg)
 {
     QDict *opts, *prop;
     bool help = false;
 
-    prop = keyval_parse(arg, opts_list->implied_opt_name, &help, errp);
+    prop = keyval_parse(arg, opts_list->implied_opt_name, &help, &error_fatal);
     if (help) {
         qemu_opts_print_help(opts_list, true);
         return;
     }
     opts = qdict_new();
     qdict_put(opts, propname, prop);
-    keyval_merge(machine_opts_dict, opts, errp);
+    keyval_merge(machine_opts_dict, opts, &error_fatal);
     qobject_unref(opts);
 }
 
@@ -3321,7 +3321,8 @@ void qemu_init(int argc, char **argv, char **envp)
                 }
                 break;
             case QEMU_OPTION_smp:
-                machine_parse_property_opt(qemu_find_opts("smp-opts"), "smp", optarg, &error_fatal);
+                machine_parse_property_opt(qemu_find_opts("smp-opts"),
+                                           "smp", optarg);
                 break;
             case QEMU_OPTION_vnc:
                 vnc_parse(optarg);
-- 
2.31.1


