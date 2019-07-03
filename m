Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BD05E89C
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jul 2019 18:17:15 +0200 (CEST)
Received: from localhost ([::1]:37276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hihwY-0002OU-Cs
	for lists+qemu-devel@lfdr.de; Wed, 03 Jul 2019 12:17:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55027)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mlevitsk@redhat.com>) id 1hihgC-0007Rk-8k
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 12:00:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1hihgA-0002PL-6G
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 12:00:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60768)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>)
 id 1hihg2-00027i-Ut; Wed, 03 Jul 2019 12:00:14 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8731159441;
 Wed,  3 Jul 2019 15:59:53 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (dhcp-4-67.tlv.redhat.com
 [10.35.4.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 06EAC4262;
 Wed,  3 Jul 2019 15:59:46 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  3 Jul 2019 18:59:38 +0300
Message-Id: <20190703155944.9637-1-mlevitsk@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Wed, 03 Jul 2019 15:59:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 0/6] Few fixes for userspace NVME driver
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Compared to last submission, this series adds another patch,
which implements support for image creation over the nvme drive like that:

qemu-img create -f qcow2 nvme://0000:06:00.0/1 10G -o preallocation=metadata

I also addressed the review comments.

Best regards,
	Maxim Levitsky

Maxim Levitsky (6):
  block/nvme: don't touch the completion entries
  block/nvme: fix doorbell stride
  block/nvme: support larger that 512 bytes sector devices
  block/nvme: add support for image creation
  block/nvme: add support for write zeros
  block/nvme: add support for discard

 block/nvme.c         | 310 +++++++++++++++++++++++++++++++++++++++++--
 block/trace-events   |   3 +
 include/block/nvme.h |  19 ++-
 3 files changed, 320 insertions(+), 12 deletions(-)

-- 
2.17.2


