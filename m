Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 961483F93D2
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 06:55:49 +0200 (CEST)
Received: from localhost ([::1]:38238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJTu6-0008Aa-47
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 00:55:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mJTpT-0008Qu-VF
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 00:51:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mJTpQ-0000xu-GV
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 00:50:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630039855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LIM17xFZhebV2HY1K8i3sriwSQcdwZ09oJbtV/tEBYE=;
 b=Yzk4Rf2hXc8Lol+mVmQf2MUQpjjK0AtjK58aI5hZ/+GCPj+knsslZXcQMxzDsPiebQD8A4
 miXroKy/4MxGG1uyXSWbf74Z/ucoJRtIUsq1Pc3M01rb4et+YDqypDLJhQgSry/ztS2+6A
 QoPd+6lRfKcECcrYQKCxwh1+08flg2M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-tfkuu6DrNcS9Q4AJSvY_nQ-1; Fri, 27 Aug 2021 00:50:54 -0400
X-MC-Unique: tfkuu6DrNcS9Q4AJSvY_nQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44A011853027;
 Fri, 27 Aug 2021 04:50:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1273A5D9C6;
 Fri, 27 Aug 2021 04:50:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AEFCE1136421; Fri, 27 Aug 2021 06:50:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/15] vl: Clean up -smp error handling
Date: Fri, 27 Aug 2021 06:50:44 +0200
Message-Id: <20210827045044.388748-16-armbru@redhat.com>
In-Reply-To: <20210827045044.388748-1-armbru@redhat.com>
References: <20210827045044.388748-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
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
Cc: peter.maydell@linaro.org, "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
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
Message-Id: <20210720125408.387910-16-armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
[Rebased, conflict with commit a3c2f128306 resolved]
---
 softmmu/vl.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 6227f8f10e..bdeb17809d 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -1550,20 +1550,17 @@ machine_merge_property(const char *propname, QDict *prop, Error **errp)
 
 static void
 machine_parse_property_opt(QemuOptsList *opts_list, const char *propname,
-                           const char *arg, Error **errp)
+                           const char *arg)
 {
     QDict *prop = NULL;
     bool help = false;
 
-    prop = keyval_parse(arg, opts_list->implied_opt_name, &help, errp);
+    prop = keyval_parse(arg, opts_list->implied_opt_name, &help, &error_fatal);
     if (help) {
         qemu_opts_print_help(opts_list, true);
         exit(0);
     }
-    if (!prop) {
-        return;
-    }
-    machine_merge_property(propname, prop, errp);
+    machine_merge_property(propname, prop, &error_fatal);
     qobject_unref(prop);
 }
 
@@ -3343,7 +3340,8 @@ void qemu_init(int argc, char **argv, char **envp)
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


