Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8D755D440
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 15:13:43 +0200 (CEST)
Received: from localhost ([::1]:34726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6B2E-0007Mg-40
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 09:13:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o6AzI-0003xj-Mb
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 09:10:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o6AzG-0008AV-J7
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 09:10:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656421837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b1KrxkmPCVlLsg9oQZhgPzYsgKGoxYoco1+fbIIQaVk=;
 b=g6oBkQ0IOvWznKKh5fCXjBO8NMIAYWkM5tq5dXGXUNb8enh8+0046yRwW43uXo1BqnlYt9
 33C8NZ5o9MRIhpziZ8uIwjTdEj8IQ2fZvCvBp/3roRb1fzMPDcvuLrf+CMSOLUBfCM16ns
 RVk/JDsWTZ8cIU+u4UpHo4vK19tbWb0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-480-OFVckUV-NKKGKdTiD2tb2Q-1; Tue, 28 Jun 2022 09:10:36 -0400
X-MC-Unique: OFVckUV-NKKGKdTiD2tb2Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C6444802E5C;
 Tue, 28 Jun 2022 13:10:35 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E2FD0492CA3;
 Tue, 28 Jun 2022 13:10:34 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>
Cc: qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Janosch Frank <frankja@linux.ibm.com>
Subject: [PATCH 01/12] pc-bios/s390-ccw: Add a proper prototype for main()
Date: Tue, 28 Jun 2022 15:10:21 +0200
Message-Id: <20220628131032.213986-2-thuth@redhat.com>
In-Reply-To: <20220628131032.213986-1-thuth@redhat.com>
References: <20220628131032.213986-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Older versions of Clang complain if there is no prototype for main().
Add one, and while we're at it, make sure that we use the same type
for main.c and netmain.c - since the return value does not matter,
declare the return type of main() as "void".

Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 pc-bios/s390-ccw/s390-ccw.h | 1 +
 pc-bios/s390-ccw/main.c     | 3 +--
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/pc-bios/s390-ccw/s390-ccw.h b/pc-bios/s390-ccw/s390-ccw.h
index 79db69ff54..b88e0550ab 100644
--- a/pc-bios/s390-ccw/s390-ccw.h
+++ b/pc-bios/s390-ccw/s390-ccw.h
@@ -57,6 +57,7 @@ void write_subsystem_identification(void);
 void write_iplb_location(void);
 extern char stack[PAGE_SIZE * 8] __attribute__((__aligned__(PAGE_SIZE)));
 unsigned int get_loadparm_index(void);
+void main(void);
 
 /* sclp.c */
 void sclp_print(const char *string);
diff --git a/pc-bios/s390-ccw/main.c b/pc-bios/s390-ccw/main.c
index 5d2b7ba94d..835341457d 100644
--- a/pc-bios/s390-ccw/main.c
+++ b/pc-bios/s390-ccw/main.c
@@ -281,7 +281,7 @@ static void probe_boot_device(void)
     sclp_print("Could not find a suitable boot device (none specified)\n");
 }
 
-int main(void)
+void main(void)
 {
     sclp_setup();
     css_setup();
@@ -294,5 +294,4 @@ int main(void)
     }
 
     panic("Failed to load OS from hard disk\n");
-    return 0; /* make compiler happy */
 }
-- 
2.31.1


