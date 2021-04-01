Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBAD351570
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 15:59:00 +0200 (CEST)
Received: from localhost ([::1]:55378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRxqd-0001Zm-4Y
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 09:58:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lRxpP-0000XY-UG
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 09:57:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lRxpO-0005T6-En
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 09:57:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617285461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qRJFwlQvu86YI8T8dlzXZeNPFjmZWIQaodQ3a3oFlC0=;
 b=Fr2Fv/Y9dbRpng2SRNItvN3gOFz93CxAukfKX/7aeJ/pdvqGa2gaBzSfcuDw0Gt8B0p3X4
 deKrAZo9Noroz5tXo+dkNurZsGj79l7ljYdrizSGAxo8ZYLZD+hR32frAQV/f8OR5jOFsy
 yi56uD02UNn9/qB8J7WZ2/9ZfM8WDRQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-Z7FD9dSNMGGT-ZcasyxYEw-1; Thu, 01 Apr 2021 09:57:39 -0400
X-MC-Unique: Z7FD9dSNMGGT-ZcasyxYEw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1FB35B362;
 Thu,  1 Apr 2021 13:57:38 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-113-128.ams2.redhat.com
 [10.36.113.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A5FAD5D6D1;
 Thu,  1 Apr 2021 13:57:36 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH 0/3] qemu-iotests: attach gdbserver to qemu instance
Date: Thu,  1 Apr 2021 15:57:30 +0200
Message-Id: <20210401135733.32177-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series adds the option to attach gdbserver to the qemu_system_*
instance running in the qemu-iotests. 

Patch 1 adds the possibility to set a custom timer for the QMP socket,
necessary otherwise the connection will just drop after 15 seconds,
making the use of gdb very hard. Patch 2 adds the flag in the python
tests (or in general when a test is invoked with the check script),
patch 3 adds the same option for the tests done in bash.

This series is tested on the previous serie
"qemu-iotests: quality of life improvements"
but independent from it, so it can be applied separately.

Emanuele Giuseppe Esposito (3):
  python: qemu: add timer parameter for qmp.accept socket
  qemu-iotests: add option to attach gdbserver
  qemu-iotests: add gdbserver option to script tests too

 python/qemu/machine.py        |  8 +++++---
 python/qemu/qtest.py          |  8 +++++---
 tests/qemu-iotests/check      |  5 ++++-
 tests/qemu-iotests/common.rc  |  8 +++++++-
 tests/qemu-iotests/iotests.py |  7 ++++++-
 tests/qemu-iotests/testenv.py | 15 +++++++++++++--
 6 files changed, 40 insertions(+), 11 deletions(-)

-- 
2.30.2


