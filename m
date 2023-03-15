Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 476996BB005
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 13:14:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcQ0r-0007i4-8N; Wed, 15 Mar 2023 08:13:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pcQ0h-0007gN-EY
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 08:13:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pcQ0f-0001th-Gb
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 08:13:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678882415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4IfwXf4ivFeuYSvXrU+8saAT0xR6L5ded85wZNjAqmg=;
 b=jHwyOkrfuWExUcoDoOv7yoFOE0ptzjuR+I5PR21XmGqpMYrZQsxcJFAr4iXcc5SnGBydlV
 +yXSlFalnF9tbBX0B+OhLwhJx7dHKdVxoGA36Le4lVEKT8Y5u3fopeufbu/vU9H+6DfRYI
 I6PpeB9WbOuqHMwUg8huu2ehDpSiqU0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-90A9GnehOxCNBMrsTf3Sag-1; Wed, 15 Mar 2023 08:13:32 -0400
X-MC-Unique: 90A9GnehOxCNBMrsTf3Sag-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E9E57101A531;
 Wed, 15 Mar 2023 12:13:31 +0000 (UTC)
Received: from localhost (unknown [10.39.193.219])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 393052A68;
 Wed, 15 Mar 2023 12:13:31 +0000 (UTC)
From: Hanna Czenczek <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Hanna Czenczek <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: [RFC 0/2] Split padded I/O vectors exceeding IOV_MAX
Date: Wed, 15 Mar 2023 13:13:28 +0100
Message-Id: <20230315121330.29679-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Hi,

We accept I/O vectors with up to 1024 (IOV_MAX) elements from guests.
When a guest request does not conform to the underlying storage's
alignment requirements, we pad it with head and/or tail buffers as
necessary, which are simply appended to the I/O vector.

As of 4c002cef, we (sensibly) check that such-padded vectors do not then
exceed IOV_MAX.  However, there seems to be no sensible error handling;
instead, the guest simply receives an I/O error.

That’s a problem, because it submitted a perfectly sensible I/O request
(which adhered to the alignment the guest device has announced), but
receives an error back.  That shouldn’t happen.

I think we need to handle such excess lengths internally, but I’m not
sure how exactly.  What I can think of is either breaking up the request
into two (which seems like it might cause side effects) or to join up to
three vector elements into one, using a bounce buffer.  The latter
seemed simpler to me, so this RFC does that.  Still, it’s an RFC because
I don’t know whether that’s the ideal solution.


Hanna Czenczek (2):
  block: Split padded I/O vectors exceeding IOV_MAX
  iotests/iov-padding: New test

 block/io.c                               | 139 ++++++++++++++++++++++-
 util/iov.c                               |   4 -
 tests/qemu-iotests/tests/iov-padding     |  85 ++++++++++++++
 tests/qemu-iotests/tests/iov-padding.out |  59 ++++++++++
 4 files changed, 277 insertions(+), 10 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/iov-padding
 create mode 100644 tests/qemu-iotests/tests/iov-padding.out

-- 
2.39.1


