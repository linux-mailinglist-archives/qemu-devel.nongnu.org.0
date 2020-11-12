Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CF32B0C4F
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 19:08:05 +0100 (CET)
Received: from localhost ([::1]:40746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdH0u-00023C-AX
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 13:08:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdGt4-0001DA-6Z
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 12:59:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kdGsp-0000mG-Q3
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 12:59:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605203981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IqXnhdcvtX4p12iBkfena14urLce3IoFtPM5/yBK+XM=;
 b=CBmKUEs5ET8I8APXh3DWmtIKS5/FgoEV+g+yuwilhJXdI0l39oOiYG3cnBXOnjbggHbxTY
 EyW95AqAWuUyygJWPR+ynfj9WfwyuCdyMU0fzU6+FtQp2EUUnjsWUqRBxpQuUg3Au//XIg
 9s+MC/kgBrm/0/lQAdIMRWfk+3uB8bs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-2uGxDk7MOcStp3cIPbhaBA-1; Thu, 12 Nov 2020 12:59:40 -0500
X-MC-Unique: 2uGxDk7MOcStp3cIPbhaBA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1062BAF061
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 17:59:39 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-57.ams2.redhat.com [10.36.115.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 879021002C13;
 Thu, 12 Nov 2020 17:59:34 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/13] qemu-storage-daemon: QAPIfy --chardev
Date: Thu, 12 Nov 2020 18:59:01 +0100
Message-Id: <20201112175905.404472-10-kwolf@redhat.com>
In-Reply-To: <20201112175905.404472-1-kwolf@redhat.com>
References: <20201112175905.404472-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, armbru@redhat.com, dgilbert@redhat.com,
 pbonzini@redhat.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make use of the QAPIfied command line interface of the chardev
subsystem. With this, --chardev supports QMP-like syntax (i.e.
chardev-add mapped to the command line) as well as the legacy
syntax that it already supported and which is shared with the
system emulator.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 storage-daemon/qemu-storage-daemon.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
index e419ba9f19..149d08ad6d 100644
--- a/storage-daemon/qemu-storage-daemon.c
+++ b/storage-daemon/qemu-storage-daemon.c
@@ -128,8 +128,6 @@ enum {
     OPTION_OBJECT,
 };
 
-extern QemuOptsList qemu_chardev_opts;
-
 static QemuOptsList qemu_object_opts = {
     .name = "object",
     .implied_opt_name = "qom-type",
@@ -207,18 +205,15 @@ static void process_options(int argc, char *argv[])
             }
         case OPTION_CHARDEV:
             {
-                /* TODO This interface is not stable until we QAPIfy it */
-                QemuOpts *opts = qemu_opts_parse_noisily(&qemu_chardev_opts,
-                                                         optarg, true);
-                if (opts == NULL) {
-                    exit(EXIT_FAILURE);
-                }
+                ChardevOptions *options;
 
-                if (!qemu_chr_new_from_opts(opts, NULL, &error_fatal)) {
-                    /* No error, but NULL returned means help was printed */
+                options = qemu_chr_parse_cli_str(optarg, &error_fatal);
+                if (!options) {
+                    /* Help was printed */
                     exit(EXIT_SUCCESS);
                 }
-                qemu_opts_del(opts);
+                qemu_chr_new_cli(options, &error_fatal);
+                qapi_free_ChardevOptions(options);
                 break;
             }
         case OPTION_EXPORT:
-- 
2.28.0


