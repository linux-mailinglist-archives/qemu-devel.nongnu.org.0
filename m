Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9539645DBBD
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 14:56:24 +0100 (CET)
Received: from localhost ([::1]:33310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqFEc-0005M6-2u
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 08:56:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mqFBp-0002xm-Cp
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 08:53:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mqFBn-0000NQ-DI
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 08:53:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637848406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9pFbYHtpND+0h2govXGoHPW0JZidQ4YJj6zQIfZABvY=;
 b=QPnWHG2nWmVp/fprltUSBJnjtRIkMbk10eSzOhnsepQu+WyAUitlJgFoIn6/WTnK9HQG9k
 WvKw0/VZiqjPnnoQ7qr0ixYTBGc+kTTkj8VCUz9tARz7DnaO4ZXReSW0SgzxRuk6rKtqd5
 R8HiBD3Frz8BZj3fSY+u5lVVn/iAhd0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-17-irz7LKP6OVe7r7YgzqyY0g-1; Thu, 25 Nov 2021 08:53:22 -0500
X-MC-Unique: irz7LKP6OVe7r7YgzqyY0g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E4D564083;
 Thu, 25 Nov 2021 13:53:21 +0000 (UTC)
Received: from localhost (unknown [10.39.193.16])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2497D76606;
 Thu, 25 Nov 2021 13:53:18 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/2] block-backend: Retain permissions after migration
Date: Thu, 25 Nov 2021 14:53:15 +0100
Message-Id: <20211125135317.186576-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peng Liang <liangpeng10@huawei.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Peng Liang has reported an issue regarding migration of raw images here:
https://lists.nongnu.org/archive/html/qemu-block/2021-11/msg00673.html

It turns out that after migrating, all permissions are shared when they
weren’t before.  The cause of the problem is that we deliberately delay
restricting the shared permissions until migration is really done (until
the runstate is no longer INMIGRATE) and first share all permissions;
but this causes us to lose the original shared permission mask and
overwrites it with BLK_PERM_ALL, so once we do try to restrict the
shared permissions, we only again share them all.

Fix this by saving the set of shared permissions through the first
blk_perm_set() call that shares all; and add a regression test.


I don’t believe we have to fix this in 6.2, because I think this bug has
existed for four years now.  (I.e. it isn’t critical, and it’s no
regression.)


Hanna Reitz (2):
  block-backend: Retain permissions after migration
  iotests/migration-permissions: New test

 block/block-backend.c                         |  11 ++
 .../qemu-iotests/tests/migration-permissions  | 101 ++++++++++++++++++
 .../tests/migration-permissions.out           |   5 +
 3 files changed, 117 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/migration-permissions
 create mode 100644 tests/qemu-iotests/tests/migration-permissions.out

-- 
2.33.1


