Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB7514412B
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 17:01:37 +0100 (CET)
Received: from localhost ([::1]:57216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itvyB-00058p-Hn
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 11:01:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60627)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1itvw5-0003os-Ii
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 10:59:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1itvw4-0004Xw-MM
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 10:59:25 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:20288
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1itvw4-0004Xm-JE
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 10:59:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579622364;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lTxR05kIy8LiGtaiLolGLwddHRVVZOUG24ah9/CeLEw=;
 b=JH/8nUIkOGTL+km2K/GVjmEXUfbmcZwhD3NLO3/9krZKhFTnn5hyHLNl5PANWMDKNiPiBt
 9cY9yCpz854alM5tHlyTKE0QlxeTnts2mYF03EDwAtwo2cfKyKq0Kp2SLicZDjri9ZdqWJ
 DuOLmXi7KH0gfvS/KnxhPBm4RtIqIdk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-Qgcf8PQCN72Bv2CTnFO1vg-1; Tue, 21 Jan 2020 10:59:19 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90A58801F91;
 Tue, 21 Jan 2020 15:59:18 +0000 (UTC)
Received: from localhost (ovpn-117-116.ams2.redhat.com [10.36.117.116])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6041610098FB;
 Tue, 21 Jan 2020 15:59:17 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/2] qemu-img: Fix convert -n -B for backing-less targets
Date: Tue, 21 Jan 2020 16:59:13 +0100
Message-Id: <20200121155915.98232-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: Qgcf8PQCN72Bv2CTnFO1vg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-stable@nongnu.org,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

When reviewing David=E2=80=99s series to add --target-is-zero convert, I lo=
oked
for a case to show that the current implementation will crash if
-n --target-is-zero is used together with -B.  It then turned out that
-B will always crash when combined with -n and the target image does not
have a backing file set in its image header.

This series fixes that.


Max Reitz (2):
  qemu-img: Fix convert -n -B for backing-less targets
  iotests: Test convert -n -B to backing-less target

 qemu-img.c                 |  2 +-
 tests/qemu-iotests/122     | 14 ++++++++++++++
 tests/qemu-iotests/122.out |  5 +++++
 3 files changed, 20 insertions(+), 1 deletion(-)

--=20
2.24.1


