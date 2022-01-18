Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0404492C1C
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 18:16:45 +0100 (CET)
Received: from localhost ([::1]:36898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9s68-0008Bh-Ft
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 12:16:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n9rzJ-0004ZK-LA
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 12:09:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n9rzD-00030Q-Ez
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 12:09:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642525773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wEjnUm5PjpUXKVlO+C62JjzdFBaaY0Pe/f7kaiaTRTk=;
 b=QqN15f4sDDCp1UkAHBqcoA+t6Zd0C4UuZ5rm4IxVsYzNypjMcBMsdH5FVMEnMl76K56ErZ
 Jp3TW7eHz9Z8BYZOf6u28EMtnJHaANWLTcpUh9zO/2rK8AZN40DiImx/LJ7uBPF/YSn/ao
 fmrdYlLSsaUY75/VnGmdFOkRSfQwcXk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-CcWr8y4SM6iQdApgnw407w-1; Tue, 18 Jan 2022 12:09:28 -0500
X-MC-Unique: CcWr8y4SM6iQdApgnw407w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32C628B8581;
 Tue, 18 Jan 2022 17:00:09 +0000 (UTC)
Received: from localhost (unknown [10.39.194.149])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C17E884D23;
 Tue, 18 Jan 2022 17:00:02 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 0/2] block/io: Update BSC only if want_zero is true
Date: Tue, 18 Jan 2022 17:59:58 +0100
Message-Id: <20220118170000.49423-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Nir Soffer <nsoffer@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Cover letter from v1:
https://lists.nongnu.org/archive/html/qemu-block/2022-01/msg00314.html

In v2, I’ve added a comment to the new test explaining why we need to
pass --allocation-depth to qemu-nbd, as requested by Nir; and as he has
implied, using the short options is kind of silly because they are
anything but self-explanatory, so in v2, I’ve switched to exclusively
using long options for the qemu-nbd invocation.

(Also, added “Cc: qemu-stable” tag in patch 1.)

git-backport-diff against v1:

Key:
[----] : patches are identical
[####] : number of functional differences between upstream/downstream patch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively

001/2:[----] [--] 'block/io: Update BSC only if want_zero is true'
002/2:[0013] [FC] 'iotests/block-status-cache: New test'


Hanna Reitz (2):
  block/io: Update BSC only if want_zero is true
  iotests/block-status-cache: New test

 block/io.c                                    |   6 +-
 tests/qemu-iotests/tests/block-status-cache   | 139 ++++++++++++++++++
 .../qemu-iotests/tests/block-status-cache.out |   5 +
 3 files changed, 149 insertions(+), 1 deletion(-)
 create mode 100755 tests/qemu-iotests/tests/block-status-cache
 create mode 100644 tests/qemu-iotests/tests/block-status-cache.out

-- 
2.33.1


