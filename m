Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCE94E3265
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 22:46:12 +0100 (CET)
Received: from localhost ([::1]:55842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWPqt-00018h-Dr
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 17:46:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nWPmi-00050B-Kg
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 17:41:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nWPmc-0006IQ-7O
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 17:41:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647898900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sda3LhiB+Wt19BJMTKF6mps9v1Eg491361+yysqUe3c=;
 b=c2vAeaIe0pyLqgV0G+uOonvpKFta88eJPsug1lOqcuCKWCI51pYbu9I3whowS1CkTAhSKl
 oO90ez+EaUApVzHvuxG8tFhJ/1jWxfqXV4s3QrbHuCIG7HeE4WKZ7sg/MzuHjFue6fC71a
 nTY7C0uTcghLtPv+Igv45hf9If4tGfA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-244-ec6KxbJDOQyWkn2HC3MOvA-1; Mon, 21 Mar 2022 17:41:37 -0400
X-MC-Unique: ec6KxbJDOQyWkn2HC3MOvA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 532E23C00128
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 21:41:37 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1BCB943E3BD
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 21:41:37 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/3] NBD patches for -rc1
Date: Mon, 21 Mar 2022 16:41:31 -0500
Message-Id: <20220321214134.597006-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 2028ab513bf0232841a909e1368309858919dbcc:

  Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into staging (2022-03-21 15:27:13 +0000)

are available in the Git repository at:

  https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2022-03-21

for you to fetch changes up to 6690302b848e5b55e3e3da34f0ee7fd9f8602e23:

  block/nbd.c: Fixed IO request coroutine not being wakeup when kill NBD server (2022-03-21 15:21:09 -0500)

One bug fix, and two patches that don't impact the binary but might as
well be included.

----------------------------------------------------------------
nbd patches for 2022-03-21

- Rao Lei: fix nbd client hang on server death
- Vladimir Sementsov-Ogievskiy: email address update
- Eric Blake: qemu-nbd documentation tweak

----------------------------------------------------------------
Eric Blake (1):
      docs: Consistent typography for options of qemu-nbd

Rao Lei (1):
      block/nbd.c: Fixed IO request coroutine not being wakeup when kill NBD server

Vladimir Sementsov-Ogievskiy (1):
      MAINTAINERS: change Vladimir's email address

 docs/tools/qemu-nbd.rst | 12 ++++++------
 block/nbd.c             |  2 +-
 MAINTAINERS             | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

-- 
2.35.1


