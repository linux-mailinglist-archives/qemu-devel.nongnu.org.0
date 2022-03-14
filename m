Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BB14D8915
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 17:29:09 +0100 (CET)
Received: from localhost ([::1]:57540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTnZE-0003CJ-J4
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 12:29:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nTnXb-0001Kz-2D
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 12:27:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nTnXY-0005kY-1s
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 12:27:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647275242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MpZkeulPKK4cwI9KGG5VN1JO3r9i4lHu6D+Y0Zn1RgM=;
 b=QEQWH7eD3+KrgdiHqNXInONArt8k36n72Ib6c/JfgwLZ42NYzB+FHypDPHzFmKTfM6wfBg
 ya61qN3xvt8knCi3BdRrpJoHpXQjyadpMGq+RFBpjfGDISs7OlKfCSWL6Ne1YagAie3vqC
 ueOrHISLwwSoKdzsUzla5nuK9t0bieE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-319-HAXGIJDDP8OrhFXnHbRXWQ-1; Mon, 14 Mar 2022 12:27:21 -0400
X-MC-Unique: HAXGIJDDP8OrhFXnHbRXWQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 02781803DDA;
 Mon, 14 Mar 2022 16:27:21 +0000 (UTC)
Received: from localhost (unknown [10.39.194.97])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B43EF2156A4F;
 Mon, 14 Mar 2022 16:27:20 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH for-7.0 0/2] block/vmdk: Fix reopening bs->file
Date: Mon, 14 Mar 2022 17:27:17 +0100
Message-Id: <20220314162719.65384-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

A couple of months ago I noticed that changing a vmdk node’s file child
through blockdev-reopen would crash qemu.  I started writing a fix at
some point, got distracted, but now here it is.


Hanna Reitz (2):
  block/vmdk: Fix reopening bs->file
  iotests/reopen-file: Test reopening file child

 block/vmdk.c                             | 56 ++++++++++++++-
 tests/qemu-iotests/tests/reopen-file     | 88 ++++++++++++++++++++++++
 tests/qemu-iotests/tests/reopen-file.out |  5 ++
 3 files changed, 148 insertions(+), 1 deletion(-)
 create mode 100755 tests/qemu-iotests/tests/reopen-file
 create mode 100644 tests/qemu-iotests/tests/reopen-file.out

-- 
2.35.1


