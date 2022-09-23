Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A046E5E7B7C
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 15:12:00 +0200 (CEST)
Received: from localhost ([::1]:43182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obiTH-00058s-IT
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 09:11:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1obiBx-00040K-4c
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 08:54:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1obiBu-0004JE-7Z
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 08:54:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663937640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Zz569WJEubvpPwJ+/KedVaVljupcbLCXPMoPviUWJn0=;
 b=fogz9xShH5UIoDWdUziXUUCc6LL4s4rqPvgn3XD47fmEoOXoZ+lEMt9RjV7lx1wU21+UWY
 nVq/p07O1AcXSW5UHaWOKQDJDuil8skWGoqVuC1ug5vqhluhx8dd55qHlsxqPN3NiIJ5Wn
 wzhjSEApKNvi1QXRfvQCD+x9ICBpJz4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-F1Yq7LehN-aZv_AotDgFfA-1; Fri, 23 Sep 2022 08:52:29 -0400
X-MC-Unique: F1Yq7LehN-aZv_AotDgFfA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D1D9882820;
 Fri, 23 Sep 2022 12:52:29 +0000 (UTC)
Received: from localhost (unknown [10.39.194.96])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D2A142166B26;
 Fri, 23 Sep 2022 12:52:28 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH 0/3] blcok: Start/end drain on correct AioContext
Date: Fri, 23 Sep 2022 14:52:24 +0200
Message-Id: <20220923125227.300202-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

bdrv_replace_child_noperm() drains the child via
bdrv_parent_drained_{begin,end}_single().  When it removes a child, the
bdrv_parent_drained_end_single() at its end will be called on an empty
child, making the BDRV_POLL_WHILE() in it poll the main AioContext
(because c->bs is NULL).

That’s wrong, though, because it’s supposed to operate on the parent.
bdrv_parent_drained_end_single_no_poll() will have scheduled any BHs in
the parents’ AioContext, which may be anything, not necessarily the main
context.  Therefore, we must poll the parent’s context.

Patch 3 does this for both bdrv_parent_drained_{begin,end}_single().
Patch 1 ensures that we can legally call
bdrv_child_get_parent_aio_context() from those functions (currently
marked as GLOBAL_STATE_CODE(), which I don’t think it is), and patch 2
fixes blk_do_set_aio_context() to not cause an assertion failure if it
beginning a drain can end up in blk_get_aio_context() before blk->ctx
has been updated.


Hanna Reitz (3):
  block: bdrv_child_get_parent_aio_context is not GS
  block-backend: Update ctx immediately after root
  block: Start/end drain on correct AioContext

 block.c               | 2 +-
 block/block-backend.c | 4 +++-
 block/io.c            | 6 ++++--
 3 files changed, 8 insertions(+), 4 deletions(-)

-- 
2.36.1


