Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CD16137C7
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:22:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUhr-0002Y1-V5; Mon, 31 Oct 2022 09:20:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1opUhf-0002G1-SR
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:19:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1opUhe-0005M1-2k
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:19:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667222384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bMxg/z/rcJumv45Hf181Nm71m6gaDQxrIqno15iXZFg=;
 b=KlXWyGOQ3+afmByaEF006cLHbwveCplOvj1i+XgNDETRoloahPWmAMVm5dvzJsm9DVMeHA
 vKmqBpXX1sx8G1w5uM/iZgMhR0aSEgj6xrkE8yzHC5ZYP++NIezq4eNcLGxS8HvcNWJOMK
 IxU5I+Ej+PNPtVt0WQqnUTr0ynIQtdQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-X2mK-0FPOLOMDqMWASR45w-1; Mon, 31 Oct 2022 09:19:41 -0400
X-MC-Unique: X2mK-0FPOLOMDqMWASR45w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C22F3800C24;
 Mon, 31 Oct 2022 13:19:41 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF2B7477F5F;
 Mon, 31 Oct 2022 13:19:37 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 0/4] hw: make TCO watchdog actually work by default for Q35
Date: Mon, 31 Oct 2022 13:19:30 +0000
Message-Id: <20221031131934.425448-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

The TCO watchdog is unconditionally integrated into the Q35 machine
type by default, but at the same time is unconditionally disabled
from firing by a host config option that overrides guest OS attempts
to enable it. People have to know to set a magic -global to make
it non-broken

IOW we're exposing a broken watchdog by default to all Q35 machines,
but which to the guest OS & its apps looks fully functional :-(

This behaviour was set in response to feedback from Michael:

  https://lists.gnu.org/archive/html/qemu-devel/2015-06/msg07128.html

    "I think sample high is a safer default."

but as explained in the commit message in the last patch, I think the
watchdog defaults were already safe without that pin strap setting.
The guest OS needs to take explicit action to clear the guest visible
'no reboot' flag, and so we don't need a second guest hidden 'no reboot'
flag to override that choice IMHO. Am I missing something ?

NB, I'm toggling this for 7.2 machine type since that's the current
git latest machine. Since this has already been "broken" for 7 years
though, I am ambivalent about whether we try todo this for 7.2, vs
just wait until the 8.0 machine types arrive.

Daniel P. Berrangé (4):
  hw/acpi: add trace events for TCO watchdog register access
  hw/isa: add trace events for ICH9 LPC chip config access
  hw/watchdog: add trace events for watchdog action handling
  hw/isa: enable TCO watchdog reboot pin strap by default

 hw/acpi/tco.c            | 41 +++++++++++++++++++++++++++-------------
 hw/acpi/trace-events     |  2 ++
 hw/i386/pc.c             |  4 +++-
 hw/isa/lpc_ich9.c        |  5 ++++-
 hw/isa/trace-events      |  4 ++++
 hw/watchdog/trace-events |  4 ++++
 hw/watchdog/watchdog.c   |  4 ++++
 tests/qtest/tco-test.c   |  2 +-
 8 files changed, 50 insertions(+), 16 deletions(-)

-- 
2.37.3


