Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC563379EB
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 17:49:19 +0100 (CET)
Received: from localhost ([::1]:39970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKOUw-0008Iu-OY
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 11:49:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKOOu-0002WF-QZ
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 11:43:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lKOOt-0003Pe-8i
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 11:43:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615480982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LRey4bitkkYyhiUZTEMn512FqF2s37ChbuUhqzmA0sY=;
 b=JDJeV5UO0W9awl+00mIJ64C9Zgh4n9qiOL8z8EW7bId9WvWrJrzKfog/MJDlDnffpVcVZo
 yZK6UTIhidP4iJTjAzmGpS9EDuMsMIc/iVNa1KRjDayvxnHsIUknt8KagoUY7d+51mmAMg
 u7atiEvLlTrm8KvRGO//vCJAkk9pFbI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-xEslmMHzMG6tjR2zUJRgTw-1; Thu, 11 Mar 2021 11:43:00 -0500
X-MC-Unique: xEslmMHzMG6tjR2zUJRgTw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77DD65140
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 16:42:59 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-112.ams2.redhat.com [10.36.114.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7341D5D9F0;
 Thu, 11 Mar 2021 16:42:58 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] char: Deprecate backend aliases
Date: Thu, 11 Mar 2021 17:42:50 +0100
Message-Id: <20210311164253.338723-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, pbonzini@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A small series from November that has fallen through the cracks...

These aliases only work the command line, but not in QMP. Command line
QAPIfication involves writing some compatibility glue for them, which
I'm doing, but I think it's desirable to unify accepted values of both
paths. So deprecate the aliases so that we can drop the compatibility
glue later.

v2:
- Don't mention deprecated options in the help [Markus]

- Added third patch to simplify the code again. Markus had suggested
  not complicating it in the first place, but then I would have to merge
  patches 1 and 2 even though they address different points, so this
  didn't feel very desirable.

Kevin Wolf (3):
  char: Skip CLI aliases in query-chardev-backends
  char: Deprecate backend aliases 'tty' and 'parport'
  char: Simplify chardev_name_foreach()

 docs/system/deprecated.rst |  6 ++++++
 chardev/char.c             | 19 +++++++++++--------
 2 files changed, 17 insertions(+), 8 deletions(-)

-- 
2.29.2


