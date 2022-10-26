Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F60660DD9E
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 10:58:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oncDg-0004TB-2I; Wed, 26 Oct 2022 04:57:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oncCq-0000Xc-HE
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 04:56:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1oncCp-0000Lc-28
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 04:56:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666774568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jt5RhjTPCv0y0JGg/yBx6JZsS3LnJt8Wjc04GdqPNPo=;
 b=fj4P+LscLWoIxCYN2KNVjVXws9x6HPzqqOARb1JyMV6n6f8/obq8e3S37snt77q+g+FbmX
 SUf+WBdXzuXkko/dpIQn8Tjz6eReC0SxhANUcWfj9eGRqx3+k0xRJMTf41SsQBsrJAsDQV
 EEM/1DedTtBhFOjQGws2rOFpDH8refU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-8-q6qyemr7Ps-0jLondsLKqg-1; Wed, 26 Oct 2022 04:56:03 -0400
X-MC-Unique: q6qyemr7Ps-0jLondsLKqg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A64D41C09040;
 Wed, 26 Oct 2022 08:56:02 +0000 (UTC)
Received: from localhost (unknown [10.39.208.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 583FD40C94AD;
 Wed, 26 Oct 2022 08:56:00 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Janosch Frank <frankja@linux.ibm.com>
Subject: [PULL v3 04/11] dump: Reintroduce memory_offset and section_offset
Date: Wed, 26 Oct 2022 12:55:32 +0400
Message-Id: <20221026085540.254253-5-marcandre.lureau@redhat.com>
In-Reply-To: <20221026085540.254253-1-marcandre.lureau@redhat.com>
References: <20221026085540.254253-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Janosch Frank <frankja@linux.ibm.com>

section_offset will later be used to store the offset to the section
data which will be stored last. For now memory_offset is only needed
to make section_offset look nicer.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20221017083822.43118-5-frankja@linux.ibm.com>
---
 dump/dump.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/dump/dump.c b/dump/dump.c
index b168a25321..626f7b2fd0 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -1876,6 +1876,8 @@ static void dump_init(DumpState *s, int fd, bool has_format,
         s->phdr_offset = s->shdr_offset + sizeof(Elf32_Shdr) * s->shdr_num;
         s->note_offset = s->phdr_offset + sizeof(Elf32_Phdr) * s->phdr_num;
     }
+    s->memory_offset = s->note_offset + s->note_size;
+    s->section_offset = s->memory_offset + s->total_size;
 
     return;
 
-- 
2.37.3


