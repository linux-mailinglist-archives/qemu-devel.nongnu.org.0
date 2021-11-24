Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B6245CD66
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 20:39:31 +0100 (CET)
Received: from localhost ([::1]:32910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpy78-0002jW-5x
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 14:39:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mpxvF-0003g6-3D
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 14:27:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mpxvB-0007e8-Q8
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 14:27:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637782028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lAgGbxVCeyTmIDeyZ+YWYCMIvjAwkEcRBPiUwRdN2bQ=;
 b=RCBvIb7vJKQuweydyO3wEM+Ww+84SOhdncivzIfS3eYaGjErQRsjG+5CW5975JyiHw3ep0
 PSo8jSSfu/FLiIvL8rQfDn0gVFzZGskLn5I6AJ91P+o+gGdqoFCxZOauQgbhT5/LFg8/ky
 4KEeqmmjUDKgGwblryuwsrXJ5KHVmI8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-35-PUKEbZRBNzCEe97XLFYg4g-1; Wed, 24 Nov 2021 14:27:05 -0500
X-MC-Unique: PUKEbZRBNzCEe97XLFYg4g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 435C8102C8D8;
 Wed, 24 Nov 2021 19:27:01 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 47A4F4180;
 Wed, 24 Nov 2021 19:27:00 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/23] scripts/cpu-x86-uarch-abi: fix CLI parsing
Date: Wed, 24 Nov 2021 14:26:06 -0500
Message-Id: <20211124192617.3396403-13-jsnow@redhat.com>
In-Reply-To: <20211124192617.3396403-1-jsnow@redhat.com>
References: <20211124192617.3396403-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/cpu-x86-uarch-abi.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/cpu-x86-uarch-abi.py b/scripts/cpu-x86-uarch-abi.py
index 08acc52a81..8963d90f0b 100644
--- a/scripts/cpu-x86-uarch-abi.py
+++ b/scripts/cpu-x86-uarch-abi.py
@@ -9,7 +9,7 @@
 from qemu import qmp
 import sys
 
-if len(sys.argv) != 1:
+if len(sys.argv) != 2:
     print("syntax: %s QMP-SOCK\n\n" % __file__ +
           "Where QMP-SOCK points to a QEMU process such as\n\n" +
           " # qemu-system-x86_64 -qmp unix:/tmp/qmp,server,nowait " +
@@ -66,7 +66,6 @@
 
 
 sock = sys.argv[1]
-cmd = sys.argv[2]
 shell = qmp.QEMUMonitorProtocol(sock)
 shell.connect()
 
-- 
2.31.1


