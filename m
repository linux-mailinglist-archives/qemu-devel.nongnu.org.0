Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A5E3934AF
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 19:22:45 +0200 (CEST)
Received: from localhost ([::1]:52576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmJiW-0000zb-A0
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 13:22:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lmJgR-0007Ae-O8
 for qemu-devel@nongnu.org; Thu, 27 May 2021 13:20:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lmJgP-0004pw-Ge
 for qemu-devel@nongnu.org; Thu, 27 May 2021 13:20:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622136032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=S3tkpY12MCHqeAMQUVpdhEx8SS/5xe/mlTGy7iMq80s=;
 b=Fhbe15dYLKXzOyTJ5Zmmjz+CXWuznw9z8pBVvTAmAVVpQjFckQ3/99sMM+UPu3buMBDpGa
 LCu2YqGiTZER0RO2n/90sKtRlrezk1PlnkG90W/IbzujwVPq5CLOpri8lQln650E1fQHeK
 j07G42hO7JJoazTbClyyA8OrEW/RtMQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-Fg95o66aMHyz1Fh8nJx4FA-1; Thu, 27 May 2021 13:20:26 -0400
X-MC-Unique: Fg95o66aMHyz1Fh8nJx4FA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 337EC6D500;
 Thu, 27 May 2021 17:20:25 +0000 (UTC)
Received: from thuth.com (ovpn-112-76.ams2.redhat.com [10.36.112.76])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 310BD687C6;
 Thu, 27 May 2021 17:20:22 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Subject: [PATCH 0/2] Improve the fallocate() EINVAL in
 handle_aiocb_write_zeroes()
Date: Thu, 27 May 2021 19:20:18 +0200
Message-Id: <20210527172020.847617-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>,
 Viktor Mihajlovski <mihajlov@linux.ibm.com>, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On buggy file systems, fallocate() can return EINVAL for unaligned accesses.
Improve the situation by ignoring this for PUNCH_HOLE, too (but we also
print out an error message in this case now, since PUNCH_HOLE should really
never return EINVAL according to the man page). The second patch reworks
the handling for ZERO_RANGE a little bit so that we now also try the other
fallbacks in this case now.

Thomas Huth (2):
  block/file-posix: Fix problem with fallocate(PUNCH_HOLE) on GPFS
  block/file-posix: Try other fallbacks after invalid
    FALLOC_FL_ZERO_RANGE

 block/file-posix.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

-- 
2.27.0


