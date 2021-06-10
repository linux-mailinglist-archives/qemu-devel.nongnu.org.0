Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 934413A298C
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 12:42:02 +0200 (CEST)
Received: from localhost ([::1]:53104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrI8P-00087l-LM
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 06:42:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lrHjY-0006ly-Mb
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 06:16:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lrHjX-0001Fo-29
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 06:16:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623320178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cfgtaH/HM6+H83R0TQ/toxuT27gEHyThvA+yYQ5q8jc=;
 b=jAgGSJUHyBzNjdFMvHpgPMjycuPnz2bUHY1saQnO1oVptOo0IR6Hw/0lv+xo0J2ieN/Mm1
 BGhyLmSvcMeaedKSGk7z1sF+gpwGsY+DfC9mKdQnA49aO8YKY4iSrwYL0ybehgWG9IVPmg
 J7QAxkSOPHha1hT0nKABYbXASTRPw1c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-TVcnvtrFP1mvkhxtnaHtpQ-1; Thu, 10 Jun 2021 06:16:15 -0400
X-MC-Unique: TVcnvtrFP1mvkhxtnaHtpQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03095100CF69;
 Thu, 10 Jun 2021 10:16:14 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-69.ams2.redhat.com
 [10.36.113.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A634260E3A;
 Thu, 10 Jun 2021 10:16:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2076A1800937; Thu, 10 Jun 2021 12:15:53 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] modules: check arch on qom lookup
Date: Thu, 10 Jun 2021 12:15:51 +0200
Message-Id: <20210610101553.943689-3-kraxel@redhat.com>
In-Reply-To: <20210610101553.943689-1-kraxel@redhat.com>
References: <20210610101553.943689-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 cfontana@suse.de, jose.ziviani@suse.com, pbonzini@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With target-specific modules we can have multiple modules implementing
the same object.  Therefore we have to check the target arch on lookup
to find the correct module.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 util/module.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/util/module.c b/util/module.c
index 860c257fc56e..35ba3f17cc5f 100644
--- a/util/module.c
+++ b/util/module.c
@@ -380,6 +380,9 @@ void module_load_qom_one(const char *type)
         if (!modlist->value->has_objs) {
             continue;
         }
+        if (!module_check_arch(modlist->value)) {
+            continue;
+        }
         for (sl = modlist->value->objs; sl != NULL; sl = sl->next) {
             if (strcmp(type, sl->value) == 0) {
                 module_load_one("", modlist->value->name, false);
@@ -403,6 +406,9 @@ void module_load_qom_all(void)
         if (!modlist->value->has_objs) {
             continue;
         }
+        if (!module_check_arch(modlist->value)) {
+            continue;
+        }
         module_load_one("", modlist->value->name, false);
     }
     module_loaded_qom_all = true;
-- 
2.31.1


