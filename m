Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F272B4B701E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 17:29:31 +0100 (CET)
Received: from localhost ([::1]:59624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK0hm-00064Y-SH
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 11:29:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nK0f5-0003dW-7K
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 11:26:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nK0f2-0001Z4-7u
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 11:26:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644942397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=f6bo/GW5t5A/Owl9rZwvgfjVe13aOBMBWE6RvCnUV5A=;
 b=CYRRgYMTtxR8I/ceb4NS8mscjhwE+Lh+W5oK4x/exHZp/PGlxsYqLpOzZkwATLcVbsGSMa
 s8VVmL7gMTLN43Oc9RDj99jd71xlLYEufcvi+hWmcG6n/qgk7GJ6y7w3GEPX+YqGjBzhk0
 ydPJ3ISv2DEZs4IyUI+6Jz32Ol+8Gao=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-324-2-aF4cPJNySpXiXa64M4_g-1; Tue, 15 Feb 2022 11:26:36 -0500
X-MC-Unique: 2-aF4cPJNySpXiXa64M4_g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 743681006AA4;
 Tue, 15 Feb 2022 16:26:35 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.195.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F408310A48D2;
 Tue, 15 Feb 2022 16:25:42 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net,
 mst@redhat.com, thuth@redhat.com, berrange@redhat.com, quintela@redhat.com
Subject: [PATCH 0/3] x86: Switch over to q35 as the default machine type
Date: Tue, 15 Feb 2022 16:25:30 +0000
Message-Id: <20220215162537.605030-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

We've been using q35 heavily for a while now and it generally works
quite nicely; downstream in RH we prefer it as our default, and I wanted
to see what people think of making it the default.

The only pain really is that it requires some more setup for hotplug;
so for now I've forced hotplug tests to stay on i440fx aka pc.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>


Dr. David Alan Gilbert (3):
  tests/x86: Use 'pc' machine type for old hardware tests
  tests/x86: Use 'pc' machine type for hotplug tests
  x86: Switch to q35 as the default machine type

 hw/i386/pc_piix.c              | 12 +-----------
 hw/i386/pc_q35.c               |  2 ++
 tests/qtest/device-plug-test.c | 20 +++++++++++++++++--
 tests/qtest/drive_del-test.c   | 35 +++++++++++++++++++++++++++++-----
 tests/qtest/fdc-test.c         |  2 +-
 tests/qtest/hd-geo-test.c      | 16 +++++++++++-----
 tests/qtest/i440fx-test.c      |  2 +-
 tests/qtest/ide-test.c         |  3 ++-
 tests/qtest/ivshmem-test.c     |  7 ++++++-
 9 files changed, 72 insertions(+), 27 deletions(-)

-- 
2.35.1


