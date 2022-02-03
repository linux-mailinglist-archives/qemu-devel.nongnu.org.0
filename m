Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAAB4A8637
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 15:32:45 +0100 (CET)
Received: from localhost ([::1]:41832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFdAD-0007fz-1l
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 09:32:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1nFcvL-0005Nq-QI
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 09:17:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1nFcv9-00067G-VT
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 09:17:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643897741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=okABvDlU0FhLccio0qWqIEs7gYeV0tz3RmyGhhd0r4U=;
 b=Am2DaD6gaSI/USzctPcgZJVOwUOJnYp0ttRFo6zf6mdh4UdzpxUD7XI2GY7cRbnOq5e4Zp
 ZQt89VyobHzOxI2t3mPbsuPF8Zzfp8E0c4kYg8JuIfbINxHoyavg99srCvv7RK+zQgfuVq
 qp/LmzyeoXsSDvJ+iae5zGAvD7wg+jA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-279-PdKdwLYXOuKIwEXc1pf72g-1; Thu, 03 Feb 2022 09:15:40 -0500
X-MC-Unique: PdKdwLYXOuKIwEXc1pf72g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92D941006AA0
 for <qemu-devel@nongnu.org>; Thu,  3 Feb 2022 14:15:39 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.193.0])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6021A108647C;
 Thu,  3 Feb 2022 14:15:38 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/7] tests/qtest: add some tests for virtio-net failover (part
 2)
Date: Thu,  3 Feb 2022 15:15:30 +0100
Message-Id: <20220203141537.972317-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series adds more qtest test cases to test virtio-net failover feature.=
=0D
=0D
New tests are focused on the behavior when the feature is not available.=0D
=0D
Laurent Vivier (7):=0D
  tests/qtest: failover: clean up pathname of tests=0D
  tests/qtest: failover: use a macro for check_one_card()=0D
  tests/qtest: failover: check the feature is correctly provided=0D
  tests/qtest: failover: check missing guest feature=0D
  tests/qtest: failover: check migration with failover off=0D
  tests/qtest: failover: test migration if the guest doesn't support=0D
    failover=0D
  tests/qtest: failover: migration abort test with failover off=0D
=0D
 tests/qtest/virtio-net-failover.c | 911 +++++++++++++++++++++++-------=0D
 1 file changed, 716 insertions(+), 195 deletions(-)=0D
=0D
--=20=0D
2.34.1=0D
=0D


