Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E87B3B45E8
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 16:39:18 +0200 (CEST)
Received: from localhost ([::1]:52716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwmzF-00078A-La
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 10:39:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lwmju-0006Gz-Vk
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 10:23:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lwmjr-0005SO-VU
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 10:23:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624631002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZJuYIyBSmOqzwDHIyKi6i1osE99L7F4Ttrkz12tMebE=;
 b=JnXGfGovceunoqo1xIIBsuK8X7qAbMhifAOEZR2z69eGpHUQp4qE56BxwrKyRF1wUn/iq4
 0Z98oU8e7rzDYoXvpWPSggL+pMNP1avrKWaMnCfvzcdzUsne50RKgJtM2z1UZkRPJADZwu
 JwfsgJ55BTimACxAJDnbN2I8B4nr2OM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-ltilaBRsNGClQcDMfiR4-Q-1; Fri, 25 Jun 2021 10:23:20 -0400
X-MC-Unique: ltilaBRsNGClQcDMfiR4-Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EFA92100CF6E;
 Fri, 25 Jun 2021 14:23:19 +0000 (UTC)
Received: from localhost (ovpn-113-54.ams2.redhat.com [10.36.113.54])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 94B2160C05;
 Fri, 25 Jun 2021 14:23:19 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 0/6] export/fuse: Allow other users access to the export
Date: Fri, 25 Jun 2021 16:23:11 +0200
Message-Id: <20210625142317.271673-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

The v1 cover letter is here:
https://lists.nongnu.org/archive/html/qemu-block/2021-06/msg00730.html

In v2, I changed the following:
- default_permissions is now passed always.  This is the right thing to
  do regardless of whether allow_other is active or not.

- allow_other is no longer a bool, but an off/on/auto enum.  `auto` is
  the default, in which case we will try to mount the export with
  allow_other first, and then fall back to mounting it without.

- Changing the file mode is now possible even without allow_other
  (because default_permissions is always active now), but only for the
  user/owner.  Giving the group or others any permissions only makes
  sense with allow_other, the same applies to changing the UID or GID.
  Giving a read-only export +w makes no sense and hence yields an EROFS
  error now.

- I decided just testing some default_permission quirks is boring.  So
  the new fuse-allow-other iotest does rely on `sudo -n -u nobody`
  working now, and actually tests what allow_other is supposed to do.
  (Also, it is skipped if allow_other does not work.)


git-backport-diff against v1:

Key:
[----] : patches are identical
[####] : number of functional differences between upstream/downstream patch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively

001/6:[down] 'export/fuse: Pass default_permissions for mount'
002/6:[0089] [FC] 'export/fuse: Add allow-other option'
003/6:[----] [--] 'export/fuse: Give SET_ATTR_SIZE its own branch'
004/6:[0039] [FC] 'export/fuse: Let permissions be adjustable'
005/6:[down] 'iotests/308: Test +w on read-only FUSE exports'
006/6:[down] 'iotests/fuse-allow-other: Test allow-other'


Max Reitz (6):
  export/fuse: Pass default_permissions for mount
  export/fuse: Add allow-other option
  export/fuse: Give SET_ATTR_SIZE its own branch
  export/fuse: Let permissions be adjustable
  iotests/308: Test +w on read-only FUSE exports
  iotests/fuse-allow-other: Test allow-other

 qapi/block-export.json                        |  33 +++-
 block/export/fuse.c                           | 121 +++++++++---
 tests/qemu-iotests/308                        |  20 +-
 tests/qemu-iotests/308.out                    |   6 +-
 tests/qemu-iotests/common.rc                  |   6 +-
 tests/qemu-iotests/tests/fuse-allow-other     | 175 ++++++++++++++++++
 tests/qemu-iotests/tests/fuse-allow-other.out |  88 +++++++++
 7 files changed, 421 insertions(+), 28 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/fuse-allow-other
 create mode 100644 tests/qemu-iotests/tests/fuse-allow-other.out

-- 
2.31.1


