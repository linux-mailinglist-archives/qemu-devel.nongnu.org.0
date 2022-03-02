Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 593664CADE8
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 19:49:54 +0100 (CET)
Received: from localhost ([::1]:44096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPU2q-0008Bj-PH
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 13:49:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nPTkI-00012J-Iz
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:30:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nPTkG-0000Fb-Jt
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:30:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646245839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MNNzTCJ3sfh4FYEl4UDc8P7LoIeeXaET9qa+h0rnd9s=;
 b=Xfp/S+9tQyqynfiV0XJ+iZigf3B2rDErFH7hH/R45+frodovgZZ1xVE5QniiubkUq0Azpw
 7IN4JmuVu/mUYXlrgkRYSK+BC6zhIkX4U34aIYc8LOYnPrCD7RI6OxJL2fOTgEy7D1Ym2B
 qgJpHuRrK0zEOiR95eTNBkK1Ptdliko=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-aCHn19NWOvCVhY18waJ1SQ-1; Wed, 02 Mar 2022 13:30:36 -0500
X-MC-Unique: aCHn19NWOvCVhY18waJ1SQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 56C7083DC07;
 Wed,  2 Mar 2022 18:30:35 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B7255105B1FD;
 Wed,  2 Mar 2022 18:30:33 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, f.ebner@proxmox.com, hreitz@redhat.com,
 jinpu.wang@ionos.com, peter.maydell@linaro.org, peterx@redhat.com,
 s.reiter@proxmox.com
Subject: [PULL 03/18] monitor/hmp: add support for flag argument with value
Date: Wed,  2 Mar 2022 18:29:21 +0000
Message-Id: <20220302182936.227719-4-dgilbert@redhat.com>
In-Reply-To: <20220302182936.227719-1-dgilbert@redhat.com>
References: <20220302182936.227719-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Reiter <s.reiter@proxmox.com>

Adds support for the "-xs" parameter type, where "-x" denotes a flag
name and the "s" suffix indicates that this flag is supposed to take
an arbitrary string parameter.

These parameters are always optional, the entry in the qdict will be
omitted if the flag is not given.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
[FE: fixed typo pointed out by Eric Blake
     use s instead of V to indicate string parameter]
Signed-off-by: Fabian Ebner <f.ebner@proxmox.com>
Message-Id: <20220225084949.35746-2-f.ebner@proxmox.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 monitor/hmp.c              | 19 ++++++++++++++++++-
 monitor/monitor-internal.h |  3 ++-
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/monitor/hmp.c b/monitor/hmp.c
index b20737e63c..569066036d 100644
--- a/monitor/hmp.c
+++ b/monitor/hmp.c
@@ -981,6 +981,7 @@ static QDict *monitor_parse_arguments(Monitor *mon,
             {
                 const char *tmp = p;
                 int skip_key = 0;
+                int ret;
                 /* option */
 
                 c = *typestr++;
@@ -1003,11 +1004,27 @@ static QDict *monitor_parse_arguments(Monitor *mon,
                     }
                     if (skip_key) {
                         p = tmp;
+                    } else if (*typestr == 's') {
+                        /* has option with string value */
+                        typestr++;
+                        tmp = p++;
+                        while (qemu_isspace(*p)) {
+                            p++;
+                        }
+                        ret = get_str(buf, sizeof(buf), &p);
+                        if (ret < 0) {
+                            monitor_printf(mon, "%s: value expected for -%c\n",
+                                           cmd->name, *tmp);
+                            goto fail;
+                        }
+                        qdict_put_str(qdict, key, buf);
                     } else {
-                        /* has option */
+                        /* has boolean option */
                         p++;
                         qdict_put_bool(qdict, key, true);
                     }
+                } else if (*typestr == 's') {
+                    typestr++;
                 }
             }
             break;
diff --git a/monitor/monitor-internal.h b/monitor/monitor-internal.h
index 3da3f86c6a..caa2e90ef2 100644
--- a/monitor/monitor-internal.h
+++ b/monitor/monitor-internal.h
@@ -63,7 +63,8 @@
  * '.'          other form of optional type (for 'i' and 'l')
  * 'b'          boolean
  *              user mode accepts "on" or "off"
- * '-'          optional parameter (eg. '-f')
+ * '-'          optional parameter (eg. '-f'); if followed by a 's', it
+ *              specifies an optional string param (e.g. '-fs' allows '-f foo')
  *
  */
 
-- 
2.35.1


