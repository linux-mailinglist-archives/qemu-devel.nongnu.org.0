Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 241F94B8641
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 11:56:25 +0100 (CET)
Received: from localhost ([::1]:37870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKHyy-0001cX-8I
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 05:56:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nKHwm-0006if-V7
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 05:54:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nKHwi-0001lB-Pd
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 05:54:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645008843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IsbYHWu9b1cpBmsKSBqa69x7B21ZHCIg2nmSpo7BAZI=;
 b=dGaoRv7P/u/oqaMSfMEbTFVjyL91aqcArj0HOoyh5b9jI4Z0vbVJWVooOtCXUzy1LpfZGh
 xa3slANcJwSex3XnUGp0Cj2+8MRCRcOcOGk5MSG6/dkE1pMwhlzwAihm+swt2/6Ut+ZPjA
 EktL1HR/vDRsdy91uLygs+HkPF9vwu0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638--Byhz5IGNU-KWZc1V4NHtA-1; Wed, 16 Feb 2022 05:53:58 -0500
X-MC-Unique: -Byhz5IGNU-KWZc1V4NHtA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D2F96802924;
 Wed, 16 Feb 2022 10:53:57 +0000 (UTC)
Received: from localhost (unknown [10.39.195.8])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 718FB60C2E;
 Wed, 16 Feb 2022 10:53:57 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 0/3] block: Make bdrv_refresh_limits() non-recursive
Date: Wed, 16 Feb 2022 11:53:52 +0100
Message-Id: <20220216105355.30729-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

v1 with detailed reasoning:
https://lists.nongnu.org/archive/html/qemu-block/2022-02/msg00508.html

This series makes bdrv_refresh_limits() non-recursive so that it is
sufficient for callers to ensure that the node on which they call it
will not receive concurrent I/O requests (instead of ensuring the same
for the whole subtree).

We need to ensure such I/O does not happen because bdrv_refresh_limits()
is not atomic and will produce intermediate invalid values, which will
break concurrent I/O requests that read these values.


v2:
- Use separate `try` block to clean up in patch 2 instead of putting the
  `os.remove()` in the existing one (which would cause the second
  `os.remove()` to be skipped if the first one failed)


git-backport-diff against v1:

Key:
[----] : patches are identical
[####] : number of functional differences between upstream/downstream patch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively

001/3:[----] [--] 'block: Make bdrv_refresh_limits() non-recursive'
002/3:[0005] [FC] 'iotests: Allow using QMP with the QSD'
003/3:[----] [--] 'iotests/graph-changes-while-io: New test'


Hanna Reitz (3):
  block: Make bdrv_refresh_limits() non-recursive
  iotests: Allow using QMP with the QSD
  iotests/graph-changes-while-io: New test

 block/io.c                                    |  4 -
 tests/qemu-iotests/iotests.py                 | 32 ++++++-
 .../qemu-iotests/tests/graph-changes-while-io | 91 +++++++++++++++++++
 .../tests/graph-changes-while-io.out          |  5 +
 4 files changed, 127 insertions(+), 5 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/graph-changes-while-io
 create mode 100644 tests/qemu-iotests/tests/graph-changes-while-io.out

-- 
2.34.1


