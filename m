Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 864D42B2676
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 22:20:51 +0100 (CET)
Received: from localhost ([::1]:59840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdgV0-0003OD-1d
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 16:20:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kdgRk-00022A-8t
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 16:17:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kdgRh-0005Pt-S8
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 16:17:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605302244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=p4aD7K7xBDXe8GbBRo5ZZ+xQ41kzvzeyAmKsYzMYNN4=;
 b=frEdmfLaUcxhZbZpSL3/vz0klfy3GWyCBjmPQ0zVdRhUxJQwZkGtvDK/wM99zG7LtuPfoj
 U4cjqfS1ypidLLIc7ePNt3lgR7kKSqIYGm4Z9fKwKcX5XrspD+xJOSLmYbVEnMwWGdy9aR
 sH37vK1qtXCZUmwxXffDlBNH9eAbD/Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-l_VwiPz3O_e3XsqbqfcWXw-1; Fri, 13 Nov 2020 16:17:22 -0500
X-MC-Unique: l_VwiPz3O_e3XsqbqfcWXw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C6F9802B74;
 Fri, 13 Nov 2020 21:17:21 +0000 (UTC)
Received: from localhost (ovpn-114-96.ams2.redhat.com [10.36.114.96])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A0E035B4A4;
 Fri, 13 Nov 2020 21:17:20 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/3] quorum: Require WRITE perm with rewrite-corrupted
Date: Fri, 13 Nov 2020 22:17:15 +0100
Message-Id: <20201113211718.261671-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 16:09:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Alberto Garcia <berto@igalia.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

While reviewing Berto’s block-status/write-zeroes series for quorum, I
wondered how quorum’s permission code handles rewrite-corrupted.  It
turns out it doesn’t, and so qemu with a read-only rewrite-corrupted
quorum node simply crashes once there is a mismatch that leads to a
rewrite.

It looks to me like this bug has existed for quite some time, so I don’t
think this series must go into 5.2.  OTOH, it’s a simple bug fix, so I
suppose it might as well.


Max Reitz (3):
  quorum: Require WRITE perm with rewrite-corrupted
  iotests/081: Filter image format after testdir
  iotests/081: Test rewrite-corrupted without WRITE

 block/quorum.c             |  5 ++++
 tests/qemu-iotests/081     | 61 ++++++++++++++++++++++++++++++++++++--
 tests/qemu-iotests/081.out | 27 +++++++++++++++++
 3 files changed, 90 insertions(+), 3 deletions(-)

-- 
2.28.0


