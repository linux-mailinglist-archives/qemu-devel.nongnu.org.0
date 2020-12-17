Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B79DA2DD63E
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 18:30:52 +0100 (CET)
Received: from localhost ([::1]:51020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpx75-0005bO-9I
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 12:30:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kpwmJ-00051l-C8
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 12:09:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kpwmH-0005WS-6d
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 12:09:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608224953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1MRlvnHgW8RQPYxjhnKNEeMKk4jM3ixCkDOikyLpQvs=;
 b=CNAFWn+VJH0/ArCMe5HLpe7eRTiKXRSKS+xumpsytxeiINR8vBUnpN4rNcoqnKXIlLqSk0
 IAtWz7RcWk2Rc8NalJFdQQteGpWt9ExCTxQ967GY4MP4OnKySc5nL+IYFQuFZRK88yuCL8
 AzDYtmJgacsB+TPQ8xbn+lWBc1/IpbY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-69-3QcCKKw_Mp68GMiTCDveEA-1; Thu, 17 Dec 2020 12:09:09 -0500
X-MC-Unique: 3QcCKKw_Mp68GMiTCDveEA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4DE6800D62;
 Thu, 17 Dec 2020 17:09:07 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.206.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F14D260C15;
 Thu, 17 Dec 2020 17:09:05 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 0/3] qcow2: don't leave partially initialized file on image
 creation
Date: Thu, 17 Dec 2020 19:09:01 +0200
Message-Id: <20201217170904.946013-1-mlevitsk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the bdrv_co_delete_file interface to delete the underlying=0D
file if qcow2 initialization fails (e.g due to bad encryption secret)=0D
=0D
This makes the qcow2 driver behave the same way as the luks driver behaves.=
=0D
=0D
Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=3D1845353=0D
=0D
V3: addressed review feedback and reworked commit messages=0D
=0D
V4: got rid of code duplication by adding bdrv_co_delete_file_noerr=0D
and made the qcow2 driver use this function to delete=0D
both the main and the data file.=0D
=0D
V5: addresssed review feedback on reworked version.=0D
=0D
V6: addressed most of the review feedback.=0D
=0D
Best regards,=0D
=09Maxim Levitsky=0D
=0D
Maxim Levitsky (3):=0D
  crypto: luks: Fix tiny memory leak=0D
  block: add bdrv_co_delete_file_noerr=0D
  block: qcow2: remove the created file on initialization error=0D
=0D
 block.c               | 22 ++++++++++++++++++++++=0D
 block/crypto.c        | 13 ++-----------=0D
 block/qcow2.c         |  8 +++++---=0D
 include/block/block.h |  1 +=0D
 4 files changed, 30 insertions(+), 14 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


