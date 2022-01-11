Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B209048AE7B
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 14:33:35 +0100 (CET)
Received: from localhost ([::1]:58204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7HHK-0008A1-Pi
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 08:33:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1n7Gli-0004gq-RR
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 08:00:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1n7GlY-0005fM-NI
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 08:00:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641906044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Jq1XDq+/qjVweP4Wk1+PG6KZyzWZqagWKeC85g1Vddk=;
 b=g+GMbCFFnaB/8eXPKy5JuL1rQQLqfCo9O9zg6aPJi3HZr8Btpfp+a3vNp4dQIm395biK0+
 5BHP8OjWGyRd+WdiKEUrsJrfwSMD8WdceJL298axLQAl3zysXVqGEH54h3FkCyL1v1FHW9
 5q0n1Her2yuv1y1xTU14JZpSGECRZCw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-401-Qy8hGOY-MIWkJBt1WTnSXw-1; Tue, 11 Jan 2022 08:00:41 -0500
X-MC-Unique: Qy8hGOY-MIWkJBt1WTnSXw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A14B510247AB;
 Tue, 11 Jan 2022 13:00:39 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1805E1059179;
 Tue, 11 Jan 2022 13:00:25 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/23] Migration: Transmit and detect zero pages in the
 multifd threads
Date: Tue, 11 Jan 2022 14:00:01 +0100
Message-Id: <20220111130024.5392-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Leonardo Bras <leobras@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi=0D
=0D
In this version=0D
- Rebase to latest=0D
- Address all comments from previous versions=0D
- code cleanup=0D
=0D
Please review.=0D
=0D
[v2]=0D
This is a rebase against last master.=0D
=0D
And the reason for resend is to configure properly git-publish and=0D
hope this time that git-publish send all the patches.=0D
=0D
Please, review.=0D
=0D
[v1]=0D
Since Friday version:=0D
- More cleanups on the code=0D
- Remove repeated calls to qemu_target_page_size()=0D
- Establish normal pages and zero pages=0D
- detect zero pages on the multifd threads=0D
- send zero pages through the multifd channels.=0D
- reviews by Richard addressed.=0D
=0D
It pases migration-test, so it should be perfect O:+)=0D
=0D
ToDo for next version:=0D
- check the version changes=0D
  I need that 6.2 is out to check for 7.0.=0D
  This code don't exist at all due to that reason.=0D
- Send measurements of the differences=0D
=0D
Please, review.=0D
=0D
[=0D
=0D
Friday version that just created a single writev instead of=0D
write+writev.=0D
=0D
]=0D
=0D
Right now, multifd does a write() for the header and a writev() for=0D
each group of pages.  Simplify it so we send the header as another=0D
member of the IOV.=0D
=0D
Once there, I got several simplifications:=0D
* is_zero_range() was used only once, just use its body.=0D
* same with is_zero_page().=0D
* Be consintent and use offset insed the ramblock everywhere.=0D
* Now that we have the offsets of the ramblock, we can drop the iov.=0D
* Now that nothing uses iov's except NOCOMP method, move the iovs=0D
  from pages to methods.=0D
* Now we can use iov's with a single field for zlib/zstd.=0D
* send_write() method is the same in all the implementaitons, so use=0D
  it directly.=0D
* Now, we can use a single writev() to write everything.=0D
=0D
ToDo: Move zero page detection to the multifd thrteads.=0D
=0D
With RAM in the Terabytes size, the detection of the zero page takes=0D
too much time on the main thread.=0D
=0D
Last patch on the series removes the detection of zero pages in the=0D
main thread for multifd.  In the next series post, I will add how to=0D
detect the zero pages and send them on multifd channels.=0D
=0D
Please review.=0D
=0D
Later, Juan.=0D
=0D
Juan Quintela (23):=0D
  migration: All this fields are unsigned=0D
  migration: We only need last_stage in two places=0D
  migration: ram_release_pages() always receive 1 page as argument=0D
  migration: Remove masking for compression=0D
  migration: simplify do_compress_ram_page=0D
  migration: Move ram_release_pages() call to save_zero_page_to_file()=0D
  multifd: Use proper maximum compression values=0D
  multifd: Move iov from pages to params=0D
  multifd: Make zlib use iov's=0D
  multifd: Make zstd use iov's=0D
  multifd: Remove send_write() method=0D
  multifd: Use a single writev on the send side=0D
  multifd: Unfold "used" variable by its value=0D
  multifd: Use normal pages array on the send side=0D
  multifd: Use normal pages array on the recv side=0D
  multifd: recv side only needs the RAMBlock host address=0D
  multifd: Rename pages_used to normal_pages=0D
  migration: Make ram_save_target_page() a pointer=0D
  multifd: Add property to enable/disable zero_page=0D
  multifd: Support for zero pages transmission=0D
  multifd: Zero pages transmission=0D
  migration: Use multifd before we check for the zero page=0D
  migration: Export ram_release_page()=0D
=0D
 migration/migration.h    |   3 +=0D
 migration/multifd.h      |  50 +++++++---=0D
 migration/ram.h          |   2 +=0D
 hw/core/machine.c        |   4 +-=0D
 migration/migration.c    |  11 +++=0D
 migration/multifd-zlib.c |  61 +++++-------=0D
 migration/multifd-zstd.c |  63 +++++--------=0D
 migration/multifd.c      | 198 +++++++++++++++++++++++----------------=0D
 migration/ram.c          | 111 +++++++++++++---------=0D
 migration/trace-events   |  26 ++---=0D
 10 files changed, 301 insertions(+), 228 deletions(-)=0D
=0D
--=20=0D
2.34.1=0D
=0D


