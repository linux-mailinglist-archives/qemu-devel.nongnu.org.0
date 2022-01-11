Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6383248AE3F
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 14:15:39 +0100 (CET)
Received: from localhost ([::1]:57444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Gzy-0003KQ-7Y
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 08:15:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1n7GXl-0005n6-Gi
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 07:46:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1n7GXj-00038V-L4
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 07:46:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641905186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=79M3LSnRPxITLiYV1clTJ3Tn4sHSSQXSmwjEyGiCEUs=;
 b=dJiQPaZQ1myibSUzWdPdZgfrz4Kn1ZhJ6pyz3yYCAhIbimfKCg2IQ9dX1gGUiBW5wMkuIG
 nGn9HpPPqk07ZX+3w8WRihLXVlSN7oojtK5HNCSlHBKPakmEgLaFVd0C4l8fBRdgrbQkpC
 IWcFTPtknPbmO8VbTu+3n+OxoS08+/8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-387-giq1Sig0NVKc7YXQ4LcwFA-1; Tue, 11 Jan 2022 07:46:20 -0500
X-MC-Unique: giq1Sig0NVKc7YXQ4LcwFA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75A3A1083F69
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 12:46:19 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 419932B45E;
 Tue, 11 Jan 2022 12:45:56 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/6] migration: misc cleanups
Date: Tue, 11 Jan 2022 13:45:50 +0100
Message-Id: <20220111124556.4892-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: Leonardo Bras <leobras@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi=0D
=0D
Changes since v2:=0D
- rebase=0D
- address comments=0D
- use TARGET_PAGE_SIZE and remove casts=0D
- remove TARGET_PAGE_MASK from compression code.=0D
  Nothing else use them.  And if offsets are not aligned,=0D
  we are in big trouble.=0D
=0D
Please, review.=0D
=0D
Changes since v1:=0D
- Add reviewed tags for reviewed patches=0D
- Change comment about last_stage (philmd)=0D
- Change cast to 1ULL for ram_release_page()=0D
- remove TARGET_PAGE_MASK mask.  It was used only for compression,=0D
  and offset should be page aligned already=0D
=0D
Please, review.=0D
=0D
Thanks, Juan.=0D
=0D
[v1]=0D
This series do several cleanups:=0D
- Dave found that I was using "%d" for unsigned, fix all uses.=0D
- We pass last_stage left and right, but we only use it in two places=0D
  Just move it to RAMState.=0D
- do_compress_page() used a goto when not needed.=0D
- ram_release_pages() was always used with one page=0D
- And put it when we detect zero pages, instead of everywhere we have find =
a zero page.=0D
=0D
Please, review.=0D
=0D
Juan Quintela (6):=0D
  migration: All this fields are unsigned=0D
  migration: We only need last_stage in two places=0D
  migration: ram_release_pages() always receive 1 page as argument=0D
  migration: Remove masking for compression=0D
  migration: simplify do_compress_ram_page=0D
  migration: Move ram_release_pages() call to save_zero_page_to_file()=0D
=0D
 migration/multifd-zlib.c | 20 +++++------=0D
 migration/multifd-zstd.c | 24 ++++++-------=0D
 migration/multifd.c      | 16 ++++-----=0D
 migration/ram.c          | 73 +++++++++++++++++-----------------------=0D
 migration/trace-events   | 26 +++++++-------=0D
 5 files changed, 74 insertions(+), 85 deletions(-)=0D
=0D
--=20=0D
2.34.1=0D
=0D


