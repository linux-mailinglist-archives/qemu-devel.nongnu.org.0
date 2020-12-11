Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9CE2D759E
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 13:30:16 +0100 (CET)
Received: from localhost ([::1]:55300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knhYr-0006Em-Fc
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 07:30:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1knhW5-0004VP-Ij
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 07:27:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1knhW2-00010x-GQ
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 07:27:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607689635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UKyzzLtqZJFm4h8Im1ZVsg40BKEllQ7/G6XBVDj7Wy4=;
 b=fjmUXlGYy5MDdfH5DdNVaMqKJfmlveIyiIunSa+bpkQmWBuGf67oBMYJhihBj/M0jQ0Lkj
 BhaT8V0RxTxVjiKPJE/FZf93iTI9vnh1RkLnBk0toah64VCHp00o8iOOKIEGbeKcfhFq0W
 LKbzwF6MlCGEFKGkB/zpj4nJdlTvDCc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-u1bNv1JYOgua12lUF7CwjA-1; Fri, 11 Dec 2020 07:27:13 -0500
X-MC-Unique: u1bNv1JYOgua12lUF7CwjA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8851F1012E67;
 Fri, 11 Dec 2020 12:27:12 +0000 (UTC)
Received: from gondolin.redhat.com (ovpn-112-240.ams2.redhat.com
 [10.36.112.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1C9411002393;
 Fri, 11 Dec 2020 12:27:10 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 4/6] tests/acceptance: verify s390x device detection
Date: Fri, 11 Dec 2020 13:26:56 +0100
Message-Id: <20201211122658.24481-5-cohuck@redhat.com>
In-Reply-To: <20201211122658.24481-1-cohuck@redhat.com>
References: <20201211122658.24481-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The kernel/initrd combination does not provide the virtio-net
driver; therefore, simply check whether the presented device type
is indeed virtio-net for the two virtio-net-{ccw,pci} devices.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
[re-formatted overlong lines]
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20201130180216.15366-3-cohuck@redhat.com>
---
 tests/acceptance/machine_s390_ccw_virtio.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/acceptance/machine_s390_ccw_virtio.py b/tests/acceptance/machine_s390_ccw_virtio.py
index c6812719728a..ebea1b755c81 100644
--- a/tests/acceptance/machine_s390_ccw_virtio.py
+++ b/tests/acceptance/machine_s390_ccw_virtio.py
@@ -82,3 +82,14 @@ class S390CCWVirtioMachine(Test):
         exec_command_and_wait_for_pattern(self,
                         'cat /sys/bus/ccw/devices/0.3.1234/virtio?/features',
                         virtio_rng_features)
+        # verify that we indeed have virtio-net devices (without having the
+        # virtio-net driver handy)
+        exec_command_and_wait_for_pattern(self,
+                                    'cat /sys/bus/ccw/devices/0.1.1111/cutype',
+                                    '3832/01')
+        exec_command_and_wait_for_pattern(self,
+                    'cat /sys/bus/pci/devices/0005\:00\:00.0/subsystem_vendor',
+                    '0x1af4')
+        exec_command_and_wait_for_pattern(self,
+                    'cat /sys/bus/pci/devices/0005\:00\:00.0/subsystem_device',
+                    '0x0001')
-- 
2.26.2


