Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A196A3FAC
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 11:49:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWb2l-0001ef-QJ; Mon, 27 Feb 2023 05:47:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pWb2b-0001dB-HZ
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 05:47:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1pWb2Z-0005OJ-I2
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 05:47:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677494849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7pqlHsEIaPi0OpVpD9gFluzREyHPoVYmxyT6Ok2udgk=;
 b=haQqzUfivazbmM0MNbRyYjGAoF7GNPrIgaNmuzk9/85gO2w03Q7eT0EAb0cE8DHV2FgoPh
 wT4+W8019EMORi1shTYY5mH2VhTWI39s5aX08e4aPSyV9n2hx9dtTV2YwtYUay9Lay1iB8
 AhRMMr91/XrB9uktVaF2qCJLSXmD4uE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-223-EqEo7xrFPIGNMFIDsUJHsw-1; Mon, 27 Feb 2023 05:47:27 -0500
X-MC-Unique: EqEo7xrFPIGNMFIDsUJHsw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 723CC811E6E;
 Mon, 27 Feb 2023 10:47:27 +0000 (UTC)
Received: from localhost (unknown [10.45.228.208])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2943F18EC7;
 Mon, 27 Feb 2023 10:47:26 +0000 (UTC)
From: Hanna Czenczek <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Hanna Czenczek <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH 0/2] block/fuse: Let PUNCH_HOLE write zeroes
Date: Mon, 27 Feb 2023 11:47:23 +0100
Message-Id: <20230227104725.33511-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
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

Hi,

https://gitlab.com/qemu-project/qemu/-/issues/1507 reports a bug in FUSE
exports: fallocate(PUNCH_HOLE) is implemented with blk_pdiscard(), but
its man page documents that a successful call will result in the data
being read as zero.  blk_pdiscard() does not guarantee this, so we must
use blk_pwrite_zeroes() instead (with MAY_UNMAP | NO_FALLBACK, which
differentiates it from fallocate(ZERO_RANGE)).

Patch 2 adds a regression test.


Hanna Czenczek (2):
  block/fuse: Let PUNCH_HOLE write zeroes
  iotests/308: Add test for 'write -zu'

 block/export/fuse.c        | 11 +++++++++-
 tests/qemu-iotests/308     | 43 ++++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/308.out | 35 +++++++++++++++++++++++++++++++
 3 files changed, 88 insertions(+), 1 deletion(-)

-- 
2.39.1


