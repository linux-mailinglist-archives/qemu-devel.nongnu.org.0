Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E226BF027
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 18:51:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdEDo-0003Gv-Jh; Fri, 17 Mar 2023 13:50:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pdEDk-0003ES-KE
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 13:50:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pdEDi-0001p8-5L
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 13:50:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679075425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hsGELcEcEnCiildjT61r2BOMNFrmRkZcplakb6UsXu0=;
 b=SP7OP2uxr0SJqJvlRPijNA/k05bXTaHE/JGyOfYQRMnyue2LztRePICX/OMnfKE90K15Ms
 RTKFtIYRXAqslBNBudT/YUO7vJ6szJdmcPG9JsduLP1X6rAmO4lAhoVzRK+2hOn8AeOwhO
 o4PI8R2QUHOqq85skOqXbxrITLfyNWQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-NZLkeOG_PDyxLSwj-rLuww-1; Fri, 17 Mar 2023 13:50:21 -0400
X-MC-Unique: NZLkeOG_PDyxLSwj-rLuww-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6A72D3C1834B;
 Fri, 17 Mar 2023 17:50:21 +0000 (UTC)
Received: from localhost (unknown [10.39.193.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 00E9740D1C8;
 Fri, 17 Mar 2023 17:50:20 +0000 (UTC)
From: Hanna Czenczek <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Hanna Czenczek <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: [PATCH 0/4] block: Split padded I/O vectors exceeding IOV_MAX
Date: Fri, 17 Mar 2023 18:50:15 +0100
Message-Id: <20230317175019.10857-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

RFC:
https://lists.nongnu.org/archive/html/qemu-block/2023-03/msg00446.html

Thanks for the feedback on the RFC!  Sounds like we agree that this is
the right way to fix the bug.

Here in v1, I’ve followed Vladimir’s suggestion to inline the
functionality of qemu_iovec_init_extended() in block/io.c, which, I
think (hope), also addresses much of the feedback of Eric and Stefan.

The test is unchanged, the rest is pretty much rewritten (though in
spirit stays the same).


Hanna Czenczek (4):
  util/iov: Make qiov_slice() public
  block: Split padded I/O vectors exceeding IOV_MAX
  util/iov: Remove qemu_iovec_init_extended()
  iotests/iov-padding: New test

 include/qemu/iov.h                       |   8 +-
 block/io.c                               | 153 +++++++++++++++++++++--
 util/iov.c                               |  89 +++----------
 tests/qemu-iotests/tests/iov-padding     |  85 +++++++++++++
 tests/qemu-iotests/tests/iov-padding.out |  59 +++++++++
 5 files changed, 306 insertions(+), 88 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/iov-padding
 create mode 100644 tests/qemu-iotests/tests/iov-padding.out

-- 
2.39.1


