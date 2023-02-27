Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B436A40E3
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 12:40:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWboC-0005WF-SD; Mon, 27 Feb 2023 06:36:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWbo9-0005UL-50
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:36:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWbo7-0005fP-Mg
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:36:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677497797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y8hPVKS129O4OqRumpSDuzuvxgt1IK9M7brEl9I5epE=;
 b=h0itrQfW5/8A9nxiHK/14Vmylo4l2v1uD9kCxt6lLE57oh2oQgq+YhmmJ/t5bcNHD15oVn
 KUs2QnMYJE9g0j0MtpmRSnfCF4P3F2kRQUotKpcPJzrac5oIi774djDQ7dCxPGO5XxYGut
 K8CKLm5nutRNXh+EFEEFPa5QI+zasT0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-552-gjFhKlkYMAqcDc-QmrxZ_A-1; Mon, 27 Feb 2023 06:36:33 -0500
X-MC-Unique: gjFhKlkYMAqcDc-QmrxZ_A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 65C5C830F82;
 Mon, 27 Feb 2023 11:36:33 +0000 (UTC)
Received: from thuth.com (unknown [10.45.227.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5DFD11121314;
 Mon, 27 Feb 2023 11:36:32 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Sebastian Mitterle <smitterl@redhat.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 08/33] target/s390x/arch_dump: Fix memory corruption in
 s390x_write_elf64_notes()
Date: Mon, 27 Feb 2023 12:35:56 +0100
Message-Id: <20230227113621.58468-9-thuth@redhat.com>
In-Reply-To: <20230227113621.58468-1-thuth@redhat.com>
References: <20230227113621.58468-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

"note_size" can be smaller than sizeof(note), so unconditionally calling
memset(notep, 0, sizeof(note)) could cause a memory corruption here in
case notep has been allocated dynamically, thus let's use note_size as
length argument for memset() instead.

Reported-by: Sebastian Mitterle <smitterl@redhat.com>
Fixes: 113d8f4e95 ("s390x: pv: Add dump support")
Message-Id: <20230214141056.680969-1-thuth@redhat.com>
Reviewed-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/s390x/arch_dump.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/s390x/arch_dump.c b/target/s390x/arch_dump.c
index a2329141e8..a7c44ba49d 100644
--- a/target/s390x/arch_dump.c
+++ b/target/s390x/arch_dump.c
@@ -248,7 +248,7 @@ static int s390x_write_elf64_notes(const char *note_name,
             notep = g_malloc(note_size);
         }
 
-        memset(notep, 0, sizeof(note));
+        memset(notep, 0, note_size);
 
         /* Setup note header data */
         notep->hdr.n_descsz = cpu_to_be32(content_size);
-- 
2.31.1


