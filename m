Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE01F58A118
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 21:09:31 +0200 (CEST)
Received: from localhost ([::1]:35410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJgDq-00027C-V5
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 15:09:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oJg7g-0003rN-Tx
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 15:03:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1oJg7d-00084V-Ll
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 15:03:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659639784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1q86GJq9apJiAfHjWhEjeI/hLL0t/DJmkEUC9UDxRxc=;
 b=REracv12K/RnClY0PaR8NrUB7JN7IWMIo0QpA3O5X9mhpESMuWrjpDcUF/+rFnmYHM6yW8
 QUCnWDRAzbttll6GrPgjSTeRXPaDHFt/uu7pDuaTcmwgRs1tpIsqRJXtU3iaWC6zw5UJEM
 JeTiWBTRtXi9HfIy252bHFJnyn8DRvs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-316-mNQ_DJ0IO4eDEsG59HqAfg-1; Thu, 04 Aug 2022 15:03:01 -0400
X-MC-Unique: mNQ_DJ0IO4eDEsG59HqAfg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 359EA811E81;
 Thu,  4 Aug 2022 19:03:01 +0000 (UTC)
Received: from localhost (unknown [10.39.192.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE0291415122;
 Thu,  4 Aug 2022 19:03:00 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, virtio-fs@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PULL for-7.1 0/1] Block patches
Date: Thu,  4 Aug 2022 15:02:57 -0400
Message-Id: <20220804190258.20226-1-stefanha@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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

The following changes since commit 2480f3bbd03814b0651a1f74959f5c6631ee5819:

  Merge tag 'linux-user-for-7.1-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging (2022-08-03 08:32:44 -0700)

are available in the Git repository at:

  https://gitlab.com/stefanha/qemu.git tags/block-pull-request

for you to fetch changes up to 7b0ca313647532a2c7007379ff800c9a2415c95d:

  virtiofsd: Fix format strings (2022-08-04 14:44:25 -0400)

----------------------------------------------------------------
Pull request

- Format string portability fix in virtiofsd

----------------------------------------------------------------

Stefan Weil (1):
  virtiofsd: Fix format strings

 tools/virtiofsd/fuse_lowlevel.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.37.1


