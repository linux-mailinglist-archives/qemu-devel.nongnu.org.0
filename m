Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2743364EBB9
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 13:58:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6AHl-0007pX-Ku; Fri, 16 Dec 2022 07:57:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p6AHj-0007pJ-2i
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 07:57:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p6AHh-00063N-7H
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 07:57:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671195472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GlhEVRUKabh48g9vP5+k+qCmsY83jUbwSMAzvaMDj4c=;
 b=hb0R8NjxEqMwKawiaO2Oz8pQlBzc60RQnN9pAUHDFWFfZpQhO9er+Iu8SRHIsjVQclR/X5
 ut6/1q0RFeypzbDaUvB3qSwi4kn/QFkQIpY/od0DdG0Zlj0oo6VSp4Ylynw/kico/n8KbB
 YZryK5Rso8cA6Myb78jgdiu0Nejzkf0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-312-Zv1DOMEEMbijY6yttcrcSA-1; Fri, 16 Dec 2022 07:57:51 -0500
X-MC-Unique: Zv1DOMEEMbijY6yttcrcSA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B8731857A93;
 Fri, 16 Dec 2022 12:57:50 +0000 (UTC)
Received: from virtlab420.virt.lab.eng.bos.redhat.com
 (virtlab420.virt.lab.eng.bos.redhat.com [10.19.152.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4B2F9492C14;
 Fri, 16 Dec 2022 12:57:50 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Ani Sinha <ani@anisinha.ca>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 0/5] hw: make TCO watchdog actually work by default for Q35
Date: Fri, 16 Dec 2022 07:57:44 -0500
Message-Id: <20221216125749.596075-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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
git latest machine. Obviously this will need to be changed once
the 8.0 machine types are merged.

Changed in v2:

  - Added extra patch to honour the 'enable_tco' property

Daniel P. Berrangé (5):
  hw/acpi: add trace events for TCO watchdog register access
  hw/isa: add trace events for ICH9 LPC chip config access
  hw/watchdog: add trace events for watchdog action handling
  hw/isa: enable TCO watchdog reboot pin strap by default
  ich9: honour 'enable_tco' property

 hw/acpi/ich9.c           |  6 ++++--
 hw/acpi/tco.c            | 41 +++++++++++++++++++++++++++-------------
 hw/acpi/trace-events     |  2 ++
 hw/i386/pc.c             |  4 +++-
 hw/isa/lpc_ich9.c        |  5 ++++-
 hw/isa/trace-events      |  4 ++++
 hw/watchdog/trace-events |  4 ++++
 hw/watchdog/watchdog.c   |  4 ++++
 tests/qtest/tco-test.c   |  2 +-
 9 files changed, 54 insertions(+), 18 deletions(-)

-- 
2.38.1


