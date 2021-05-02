Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 271F3370E44
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 19:50:18 +0200 (CEST)
Received: from localhost ([::1]:43212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldGES-0001Om-Jy
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 13:50:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ldGD1-00008E-I7
 for qemu-devel@nongnu.org; Sun, 02 May 2021 13:48:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ldGCy-0000Q1-21
 for qemu-devel@nongnu.org; Sun, 02 May 2021 13:48:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619977722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Z3OXn9sVgcZ+PRgm/BQjB/ONJArgV7QJ7B3rZWCzKHU=;
 b=P5zf73+Q3hE/auCMjgufpcTNgZ/YV8PzkF7OmxVq3zSVPPB65w0EGSnZPGKvZLplaWzGVG
 ARl4wFJj8QT/kmA3h3VLTwimmyj6MeFu9odCokYvsTN17Cg9zi1PZKcGRQfsypzyjj1nIz
 oLbbo75I4JXOmui81tdG6qYgWFtcqzg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-Hn-xIAEuMtChFNPnq_fvZQ-1; Sun, 02 May 2021 13:48:41 -0400
X-MC-Unique: Hn-xIAEuMtChFNPnq_fvZQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D86E3107ACC7;
 Sun,  2 May 2021 17:48:39 +0000 (UTC)
Received: from thuth.com (ovpn-112-16.ams2.redhat.com [10.36.112.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB3A4189B6;
 Sun,  2 May 2021 17:48:38 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-s390x@nongnu.org,
	Christian Borntraeger <borntraeger@de.ibm.com>
Subject: [PATCH 0/4] pc-bios/s390-ccw: Allow building with Clang, too
Date: Sun,  2 May 2021 19:48:32 +0200
Message-Id: <20210502174836.838816-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Clang can provide some additional warnings compared to GCC which can
sometimes help to catch some more bugs. So it would be good to be
able to build the s390-ccw bios with Clang, too. Only caveat: Clang
does not support the z900 anymore which is the lowest guest CPU that
could be used in QEMU, so when compiling the firmware with Clang,
it is only possible to use guest CPUs >= z10. Since the additional
compiler test coverage is worth the effort, allow it anyway and just
emit a warning in the configure step.

Philippe Mathieu-Daudé (1):
  pc-bios/s390-ccw: Silence GCC 11 stringop-overflow warning

Thomas Huth (3):
  pc-bios/s390-ccw: Silence warning from Clang by marking panic() as
    noreturn
  pc-bios/s390-ccw: Fix the cc-option macro in the Makefile
  pc-bios/s390-ccw: Allow building with Clang, too

 configure                   | 9 ++++++++-
 pc-bios/s390-ccw/Makefile   | 8 +++++---
 pc-bios/s390-ccw/s390-ccw.h | 1 +
 3 files changed, 14 insertions(+), 4 deletions(-)

-- 
2.27.0


