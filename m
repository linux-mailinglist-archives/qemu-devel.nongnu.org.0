Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3033CE8B3
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 19:29:09 +0200 (CEST)
Received: from localhost ([::1]:60914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5X4m-0007nC-5v
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 13:29:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m5X2s-000546-0l
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 13:27:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m5X2p-0003Tm-GL
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 13:27:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626715625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6a0MiiI8HeRFhumnVydZuePwwfbxAUaGy2nFiJX77JE=;
 b=G9J1MJbp2irfaGTOURU9qWoT2oobT0LOlO9uzX75NOu432A7vRhUbeeTl0b6ZfaX/09Vt8
 AsSNJgH0FoBR/WOLvzrfJALG77r8C3ko+J2UmLra9r1QEHp+nClfMa7mMH7QNBuXRHyp7D
 EC5WLbWVJZxy4UG0tLmAlHYVowSG1mw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-575-66db0o9AOpmdrj6LXDbeRA-1; Mon, 19 Jul 2021 13:27:01 -0400
X-MC-Unique: 66db0o9AOpmdrj6LXDbeRA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4408362FB;
 Mon, 19 Jul 2021 17:27:00 +0000 (UTC)
Received: from localhost (ovpn-112-59.ams2.redhat.com [10.36.112.59])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F23B19C44;
 Mon, 19 Jul 2021 17:27:00 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 0/6] Block patches for 6.1-rc0
Date: Mon, 19 Jul 2021 19:26:52 +0200
Message-Id: <20210719172658.715442-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIMWL_WL_HIGH=-1.469, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 7457b407edd6e8555e4b46488aab2f13959fccf8:

  Merge remote-tracking branch 'remotes/thuth-gitlab/tags/pull-request-2021-07-19' into staging (2021-07-19 11:34:08 +0100)

are available in the Git repository at:

  https://github.com/XanClic/qemu.git tags/pull-block-2021-07-19

for you to fetch changes up to 36109bff171ba0811fa4c723cecdf6c3561fa318:

  blkdebug: protect rules and suspended_reqs with a lock (2021-07-19 17:38:38 +0200)

----------------------------------------------------------------
Block patches for 6.1-rc0:
- Make blkdebug's suspend/resume handling robust (and thread-safe)

----------------------------------------------------------------
Emanuele Giuseppe Esposito (6):
  blkdebug: refactor removal of a suspended request
  blkdebug: move post-resume handling to resume_req_by_tag
  blkdebug: track all actions
  blkdebug: do not suspend in the middle of QLIST_FOREACH_SAFE
  block/blkdebug: remove new_state field and instead use a local
    variable
  blkdebug: protect rules and suspended_reqs with a lock

 block/blkdebug.c | 136 ++++++++++++++++++++++++++++++++---------------
 1 file changed, 92 insertions(+), 44 deletions(-)

-- 
2.31.1


