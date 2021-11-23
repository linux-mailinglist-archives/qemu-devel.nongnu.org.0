Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 974AF45A412
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 14:45:38 +0100 (CET)
Received: from localhost ([::1]:56222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpW77-0001YP-Ns
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 08:45:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mpW4t-0007zU-2K
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 08:43:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mpW4r-0003pP-95
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 08:43:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637674996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GAeSd6NqS4AgcI23Y9PUxEQe83xrYuQoyRXCzeIm9TU=;
 b=TK2eOjV01uy4MwL/ntWewiqcN7Z9c9AFHai8/3t5uCFUfmXsQAx74VnNhISc7vxPRH6YCk
 1R7cXZgoD5Hw5Od0EOufIyuJqZucZWsa3xVUm6hWV9il9Mud3rW84XLJwrE4vghO0G/Spi
 ISAW7Pr/sDiEMwcgnB3pI2VwCNixPlU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-352-DuLrpDvdMWmv92G5aWRQiw-1; Tue, 23 Nov 2021 08:43:14 -0500
X-MC-Unique: DuLrpDvdMWmv92G5aWRQiw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B391180573D
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 13:43:13 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 153A45F4EA;
 Tue, 23 Nov 2021 13:43:03 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2 for 6.2] Fix compiler warnings on Fedora 35 / CLang
Date: Tue, 23 Nov 2021 13:43:00 +0000
Message-Id: <20211123134302.45741-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Current QEMU git master caused compiler warnings on Fedora 35 when using=0D
CLang. It is expected to affect any distro with CLang >=3D 13.0.0=0D
=0D
Since QEMU builds with -Werror by default we should fix these warnings=0D
before release, as this version of QEMU will increasing trigger the=0D
warnings as more distros pull in CLang >=3D 13.0.0=0D
=0D
The spice patch was from John's series at=0D
=0D
  https://lists.gnu.org/archive/html/qemu-devel/2021-11/msg01056.html=0D
=0D
I pulled out this patch on its own as the above series isn't likely=0D
suitable for merging as a whole during freeze.=0D
=0D
The clipboard patch is an alternative impl to what John posted.=0D
=0D
Daniel P. Berrang=C3=A9 (1):=0D
  ui: avoid compiler warnings from unused clipboard info variable=0D
=0D
John Snow (1):=0D
  spice: Update QXLInterface for spice >=3D 0.15.0=0D
=0D
 hw/display/qxl.c        | 14 +++++++++++++-=0D
 include/ui/qemu-spice.h |  6 ++++++=0D
 ui/clipboard.c          |  3 +--=0D
 ui/spice-display.c      | 11 +++++++++++=0D
 4 files changed, 31 insertions(+), 3 deletions(-)=0D
=0D
--=20=0D
2.33.1=0D
=0D


