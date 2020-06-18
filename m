Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC231FEDD0
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jun 2020 10:39:28 +0200 (CEST)
Received: from localhost ([::1]:38292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlq51-0000CG-RX
	for lists+qemu-devel@lfdr.de; Thu, 18 Jun 2020 04:39:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jlq3e-0007RU-Ru
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 04:38:02 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:33903
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jlq3Z-0002R7-SX
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 04:38:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592469476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1ef9Gejv7DV88wixZ6R4FYsKYG24LVa9DQTsrsKQFjs=;
 b=EDFzwT5K9nXM7brkLK4qtyfh191CU70hXY132yelBkLFir6tFJ9kyVXdoyk7p/5iA2SP5u
 5giulWGS53ex2VJJKl6Vj5837fcoo/nmH4z+RG3apVY9zK+vH+u9NRcCi60znvlc9QzCGj
 35GW2qDkUtduxWR47GwepGJz8nHo3Bs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-6IinfS6aNSaFQ6h3PKon5w-1; Thu, 18 Jun 2020 04:37:51 -0400
X-MC-Unique: 6IinfS6aNSaFQ6h3PKon5w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC9F318FF665;
 Thu, 18 Jun 2020 08:37:49 +0000 (UTC)
Received: from localhost (ovpn-112-185.ams2.redhat.com [10.36.112.185])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D10719C79;
 Thu, 18 Jun 2020 08:37:49 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 0/2] iotests: Make _filter_img_create more active
Date: Thu, 18 Jun 2020 10:37:45 +0200
Message-Id: <20200618083747.8474-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=mreitz@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/18 01:47:12
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v1 cover letter:
https://lists.nongnu.org/archive/html/qemu-block/2020-06/msg00748.html

Hi,

Here in v2, I addressed Maxim’s comments for patch 1:
- Separate _filter_img_create_in_qmp from _filter_img_create
- Add a rough comment what the readarray invocation is for
- Use $SED everywhere


git-backport-diff against v1:

Key:
[----] : patches are identical
[####] : number of functional differences between upstream/downstream patch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively

001/2:[0064] [FC] 'iotests: Make _filter_img_create more active'
002/2:[----] [-C] 'iotests: filter few more luks specific create options'


Max Reitz (1):
  iotests: Make _filter_img_create more active

Maxim Levitsky (1):
  iotests: filter few more luks specific create options

 tests/qemu-iotests/087.out       |  6 +--
 tests/qemu-iotests/112.out       |  2 +-
 tests/qemu-iotests/134.out       |  2 +-
 tests/qemu-iotests/141           |  2 +-
 tests/qemu-iotests/153           |  9 ++--
 tests/qemu-iotests/158.out       |  4 +-
 tests/qemu-iotests/188.out       |  2 +-
 tests/qemu-iotests/189.out       |  4 +-
 tests/qemu-iotests/198.out       |  4 +-
 tests/qemu-iotests/263.out       |  4 +-
 tests/qemu-iotests/284.out       |  6 +--
 tests/qemu-iotests/common.filter | 91 +++++++++++++++++++++++---------
 12 files changed, 89 insertions(+), 47 deletions(-)

-- 
2.26.2


