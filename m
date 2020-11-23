Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B7C2C0D12
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 15:19:06 +0100 (CET)
Received: from localhost ([::1]:33898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khCgL-0007ys-Hj
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 09:19:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1khCc7-0002oU-80
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 09:14:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1khCc4-0007h1-FK
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 09:14:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606140879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A7PITbbM/y0wH2qCdH4g5YJyUpSQrKfKhfPCdLQGsx0=;
 b=BEmZBEQ9LGT0Qoq2yohU922UU5Gz/x93aCe2wAymQsn3gp45DBU6yw8/L7TXw+K5/A3e0S
 6svnNfgJaloQ08g5PFs7eLzc0RM7I8rC5Rn0QHPg1F73LoH01KAQTwZJ5efYSMYmWcskKx
 XIAgnPZQ7E1iQQ/vh2bP7Q/CVwCNy+s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-862exOt-NeeetqA6Kzj0Qg-1; Mon, 23 Nov 2020 09:14:37 -0500
X-MC-Unique: 862exOt-NeeetqA6Kzj0Qg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8CA418B9ECC
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 14:14:36 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8B4395D6D3;
 Mon, 23 Nov 2020 14:14:36 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/36] vl: remove bogus check
Date: Mon, 23 Nov 2020 09:14:01 -0500
Message-Id: <20201123141435.2726558-3-pbonzini@redhat.com>
In-Reply-To: <20201123141435.2726558-1-pbonzini@redhat.com>
References: <20201123141435.2726558-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is no reason to prevent -preconfig -daemonize.  Of course if
no monitor is defined there will be no way to start the VM,
but that is a user error.

Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 softmmu/vl.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index fae72a9071..c45a99a2bf 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -4028,12 +4028,6 @@ void qemu_init(int argc, char **argv, char **envp)
     }
 
     if (is_daemonized()) {
-        if (!preconfig_exit_requested) {
-            error_report("'preconfig' and 'daemonize' options are "
-                         "mutually exclusive");
-            exit(EXIT_FAILURE);
-        }
-
         /* According to documentation and historically, -nographic redirects
          * serial port, parallel port and monitor to stdio, which does not work
          * with -daemonize.  We can redirect these to null instead, but since
-- 
2.26.2



