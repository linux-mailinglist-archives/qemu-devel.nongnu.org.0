Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7DE6A7BA2
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 08:07:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXd23-0002iz-0O; Thu, 02 Mar 2023 02:07:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pXd1x-0002gS-5b
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 02:07:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pXd1v-0005TG-Km
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 02:07:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677740826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ANQjlRaq4vQYioAcyRImwl/RWb73DqBd2Kh2Xk2HLqc=;
 b=Uoo5iO5U5kCJXWe2/pqb8Sa1wavYA7/eHgYCng8hPtsS/5656P3WOKlo9qKsXcnx2vBmWu
 e8PDDHprl6py9YIaHMWML7ffBE/MpGFPYyH3NoKl2Te0ZA9Xnz7cWxImy/NSRUX9XlEuu0
 imZa9DgWAnu7Zjkxjtnfvz8i7THfaXA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597-hPyL4I23OraF1bofFaAoog-1; Thu, 02 Mar 2023 02:07:01 -0500
X-MC-Unique: hPyL4I23OraF1bofFaAoog-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D3463C0DDCA;
 Thu,  2 Mar 2023 07:07:01 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.92])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 34C6D140EBF4;
 Thu,  2 Mar 2023 07:07:01 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 094BA21E6A23; Thu,  2 Mar 2023 08:07:00 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Dongli Zhang <dongli.zhang@oracle.com>,
 Joe Jin <joe.jin@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: [PULL 1/5] readline: fix hmp completion issue
Date: Thu,  2 Mar 2023 08:06:56 +0100
Message-Id: <20230302070700.2998086-2-armbru@redhat.com>
In-Reply-To: <20230302070700.2998086-1-armbru@redhat.com>
References: <20230302070700.2998086-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Dongli Zhang <dongli.zhang@oracle.com>

The auto completion does not work in some cases.

Case 1.

1. (qemu) info reg
2. Press 'Tab'.
3. It does not auto complete.

Case 2.

1. (qemu) block_resize flo
2. Press 'Tab'.
3. It does not auto complete 'floppy0'.

Since the readline_add_completion_of() may add any completion when
strlen(pfx) is zero, we remove the check with (name[0] == '\0') because
strlen() always returns zero in that case.

Fixes: 52f50b1e9f8f ("readline: Extract readline_add_completion_of() from monitor")
Cc: Joe Jin <joe.jin@oracle.com>
Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
Message-Id: <20230207045241.8843-1-dongli.zhang@oracle.com>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 monitor/hmp.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/monitor/hmp.c b/monitor/hmp.c
index 2aa85d3982..fee410362f 100644
--- a/monitor/hmp.c
+++ b/monitor/hmp.c
@@ -1189,9 +1189,7 @@ static void cmd_completion(MonitorHMP *mon, const char *name, const char *list)
         }
         memcpy(cmd, pstart, len);
         cmd[len] = '\0';
-        if (name[0] == '\0') {
-            readline_add_completion_of(mon->rs, name, cmd);
-        }
+        readline_add_completion_of(mon->rs, name, cmd);
         if (*p == '\0') {
             break;
         }
@@ -1335,9 +1333,7 @@ static void monitor_find_completion_by_table(MonitorHMP *mon,
             /* block device name completion */
             readline_set_completion_index(mon->rs, strlen(str));
             while ((blk = blk_next(blk)) != NULL) {
-                if (str[0] == '\0') {
-                    readline_add_completion_of(mon->rs, str, blk_name(blk));
-                }
+                readline_add_completion_of(mon->rs, str, blk_name(blk));
             }
             break;
         case 's':
-- 
2.39.0


