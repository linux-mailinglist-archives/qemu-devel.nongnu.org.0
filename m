Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CD64E50D5
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 11:58:49 +0100 (CET)
Received: from localhost ([::1]:33104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWyhU-00075P-0r
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 06:58:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWyeJ-00042M-0Q
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 06:55:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nWyeG-00025l-Ht
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 06:55:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648032927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tjBiS/Xy1q5D36qmztgR/uoqewnki6ErKWi/0ewv0XA=;
 b=aIPbwlA1qIWcn8JH8mptAOegnBL8JB27csUrRMxM8Nh88BG/tROQlW1wpi97zolQN6nbKC
 JRbhywOX/xiDZqe1QOeNOr5/VnlI56JkhkzmVXTaueRHqn4dFUbuaYMJpITMVbXigpiIv3
 y9Jw34LC4j4zwJxwW1UuoWsp7fAUK2c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-413-pHrWgBRdMNOF-9XIAXtFlw-1; Wed, 23 Mar 2022 06:55:24 -0400
X-MC-Unique: pHrWgBRdMNOF-9XIAXtFlw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7200883395F;
 Wed, 23 Mar 2022 10:55:24 +0000 (UTC)
Received: from localhost (unknown [10.39.195.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 26F747774;
 Wed, 23 Mar 2022 10:55:24 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 0/3] iotests: Check for zstd support
Date: Wed, 23 Mar 2022 11:55:19 +0100
Message-Id: <20220323105522.53660-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

v1 cover letter:
https://lists.nongnu.org/archive/html/qemu-devel/2022-02/msg04592.html

v2 cover letter:
https://lists.nongnu.org/archive/html/qemu-block/2022-03/msg00041.html

Thanks a lot for the review and testing on v2; but I missed that I’d
have to send v3 because qemu_img_pipe_and_status() has just been
removed, which was used in patch 1 of v2. :/


v3:
- Patch 1: Use qemu_img(check=False) instead of
           qemu_img_pipe_and_status()
- Patch 2: Rebase-caused import conflict


git backport-diff against v2:

Key:
[----] : patches are identical
[####] : number of functional differences between upstream/downstream patch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively

001/3:[0011] [FC] 'iotests.py: Add supports_qcow2_zstd_compression()'
002/3:[0004] [FC] 'iotests/065: Check for zstd support'
003/3:[----] [--] 'iotests/303: Check for zstd support'


Hanna Reitz (3):
  iotests.py: Add supports_qcow2_zstd_compression()
  iotests/065: Check for zstd support
  iotests/303: Check for zstd support

 tests/qemu-iotests/065        | 24 ++++++++++++++++++------
 tests/qemu-iotests/303        |  4 +++-
 tests/qemu-iotests/iotests.py | 20 ++++++++++++++++++++
 3 files changed, 41 insertions(+), 7 deletions(-)

-- 
2.35.1


