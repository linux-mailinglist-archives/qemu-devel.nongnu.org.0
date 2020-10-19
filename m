Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E76A3292BA7
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Oct 2020 18:40:39 +0200 (CEST)
Received: from localhost ([::1]:47204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUYD9-0004jB-1D
	for lists+qemu-devel@lfdr.de; Mon, 19 Oct 2020 12:40:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kUY9v-0001go-1P
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 12:37:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kUY9s-0006E6-RA
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 12:37:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603125433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=X8E/KM0mtklf+p626VqlC8I3RPcRzt2S/nbwzM5B67k=;
 b=fCNLLQ/xg8bgyjJLQ1bRYgoG30eP98DlDojMp/yEGkDQWJYgCnHT1ZzFFD/QGEgnR3Lk8B
 3y89IRtfVjIiuVvu9IteFBeMT/cQXW7qmtPu/mWfk2ENMKNaJa9saY/s1zf+YLnJKmeAtB
 E4FPSTjmBkzf/XMiA2LhwseffrmfMig=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-Y62x-3RENw-kAy363_nKdQ-1; Mon, 19 Oct 2020 12:37:11 -0400
X-MC-Unique: Y62x-3RENw-kAy363_nKdQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE2298049C1;
 Mon, 19 Oct 2020 16:37:10 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.206.118])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B65355B4B4;
 Mon, 19 Oct 2020 16:37:03 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] Assorted fixes to tests that were broken by recent scsi
 changes
Date: Mon, 19 Oct 2020 19:36:58 +0300
Message-Id: <20201019163702.471239-1-mlevitsk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 02:32:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just few fixes, for some stuff that slipped thorough.=0D
=0D
Tested with make check, and qcow2/raw/nbd iotests.=0D
=0D
Best regards,=0D
=09Maxim Levitsky=0D
=0D
Maxim Levitsky (4):=0D
  qdev: Fix two typos=0D
  libqtest: fix the order of buffered events=0D
  libqtest: fix memory leak in the qtest_qmp_event_ref=0D
  iotests: rewrite iotest 240 in python=0D
=0D
 include/hw/qdev-core.h     |   4 +-=0D
 tests/qemu-iotests/240     | 228 ++++++++++++++++---------------------=0D
 tests/qemu-iotests/240.out |  76 ++++++++-----=0D
 tests/qtest/libqtest.c     |  13 +--=0D
 4 files changed, 150 insertions(+), 171 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


