Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AC637CE59
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 19:19:02 +0200 (CEST)
Received: from localhost ([::1]:53846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgsVh-00076j-Fa
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 13:19:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lgsSu-0004Ps-MH
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:16:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lgsSm-0007Tv-8a
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:16:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620839759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZkKt9d5aCe1vFTDc8+oN5JrHEzuTRVb2OtrFGIHNSeo=;
 b=WBf51eejGhkTq35SncuCLoe+fe1mGhY1OoQMSyNULZmB4gBYaKx2ORpA37gqAgFgBdZWbF
 3MFjOA+zULD+06jJ8DJDHIvTH0EyF0TyzFTLsQTfpfRsTdTyrwJ7tnrRXB3Kf5QyX9mitx
 X5VxLMfZ7vcX8wsUu2OCWL3uO6vlT0Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-VysyjTu_MuOsA9JOKoHYhQ-1; Wed, 12 May 2021 13:15:55 -0400
X-MC-Unique: VysyjTu_MuOsA9JOKoHYhQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 431948030CF;
 Wed, 12 May 2021 17:15:54 +0000 (UTC)
Received: from thuth.com (ovpn-112-6.ams2.redhat.com [10.36.112.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 785C961094;
 Wed, 12 May 2021 17:15:52 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
Subject: [PATCH 0/3] Fix Travis-CI / compiling with older versions of Clang
Date: Wed, 12 May 2021 19:15:47 +0200
Message-Id: <20210512171550.476130-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

My last pull request enabled compiling the s390-ccw bios with Clang.
However, I only tested it with Clang version 11, and older versions
of Clang are a little bit more picky. Fix those issues now, too, so
that the corresponding job with Clang on s390x in the Travis-CI works
correctly again.

Thomas Huth (3):
  pc-bios/s390-ccw: Fix inline assembly for older versions of Clang
  pc-bios/s390-ccw/Makefile: Check more compiler flags for Clang
  pc-bios/s390-ccw: Add a proper prototype for main()

 pc-bios/s390-ccw/Makefile   | 7 ++++---
 pc-bios/s390-ccw/helper.h   | 2 +-
 pc-bios/s390-ccw/jump2ipl.c | 4 ++--
 pc-bios/s390-ccw/main.c     | 3 +--
 pc-bios/s390-ccw/menu.c     | 8 ++++----
 pc-bios/s390-ccw/s390-ccw.h | 1 +
 pc-bios/s390-ccw/virtio.c   | 2 +-
 7 files changed, 14 insertions(+), 13 deletions(-)

-- 
2.27.0


