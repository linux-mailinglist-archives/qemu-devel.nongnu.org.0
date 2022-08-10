Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DAB58ECF9
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 15:20:34 +0200 (CEST)
Received: from localhost ([::1]:50210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLldR-0007P5-Ik
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 09:20:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oLlH7-0008Sf-A9
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 08:57:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oLlH5-0000Zg-Cw
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 08:57:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660136246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=ifXbzSwIkN101PDcGluhCSFW9hJ6zGs8QTCI7ai4F+Q=;
 b=ZcPKi0lthJRE0celXNB1JIShSXd2QVRK6Wof5qWSjwwLmnwZRK0onrz+dIPucf0ZH9gh5W
 m+cMtl92SiR7FQvn97s7TCxSEt81+AvCQtBS8DObJIZCcLhBlG1+YkgOBy97Pq36jkOHtd
 8cwMpUSCHyxcj122BjJjhD8ljhd2b5A=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-196-MHI3kexDODetKXTrx6MtKg-1; Wed, 10 Aug 2022 08:57:25 -0400
X-MC-Unique: MHI3kexDODetKXTrx6MtKg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 071BC3826A45;
 Wed, 10 Aug 2022 12:57:25 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2FC53492C3B;
 Wed, 10 Aug 2022 12:57:23 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Cc: David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-s390x@nongnu.org, Claudio Imbrenda <imbrenda@linux.ibm.com>
Subject: [PATCH v2 0/3] Fix hugepages with memfd on s390x and clean up related
 code
Date: Wed, 10 Aug 2022 14:57:17 +0200
Message-Id: <20220810125720.3849835-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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

The first patch fixes the problem that hugepages cannot be used via
the "memory-backend-memfd" object on s390x. The second and third patch
are some clean-ups that can be done after generalizing the code in the
first patch.

v2:
 - Use qemu_ram_pagesize(memdev->mr.ram_block) instead of adding
   additional code for the memfd object
 - Added the two clean-up patches on top to simplify the code

Thomas Huth (3):
  backends/hostmem: Fix support of memory-backend-memfd in
    qemu_maxrampagesize()
  softmmu/physmem: Remove the ifdef __linux__  around the pagesize
    functions
  util/mmap-alloc: Remove qemu_mempath_getpagesize()

 include/qemu/mmap-alloc.h |  2 --
 backends/hostmem.c        | 14 ++------------
 softmmu/physmem.c         | 17 -----------------
 util/mmap-alloc.c         | 31 -------------------------------
 4 files changed, 2 insertions(+), 62 deletions(-)

-- 
2.31.1


