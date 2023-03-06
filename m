Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BED6AB8D2
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 09:50:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ6VZ-00070L-UG; Mon, 06 Mar 2023 03:47:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pZ6V3-0006ux-1E
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 03:47:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pZ6Ux-00066w-AJ
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 03:47:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678092428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tCsKG0wad2kO1KKnqRl1WoTNl9pW94eSqEiurkcIzhg=;
 b=WsiT/FQuS/inI7Y+rWJgid3sdapcChrttwN9U3XS6qF+qBcFVpe5Q5+lqAgqPPHD+fLHPI
 lWluwP+2VlR4NaIBihv0bHhVTwK1yIY7HN9ahppr3UHRZ9+OKxCUZBiAEVkM3wPkeQ3VPy
 +14RHBgiAF3QYoR2aLB6KqVaED2VA+0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-141-iFMUPCcmN3aMIcATWsDMhw-1; Mon, 06 Mar 2023 03:47:03 -0500
X-MC-Unique: iFMUPCcmN3aMIcATWsDMhw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D705D85C6F4;
 Mon,  6 Mar 2023 08:47:02 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 664C3175AD;
 Mon,  6 Mar 2023 08:47:00 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
 libvir-list@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: [PATCH v4 0/5] Deprecate system emulation support for 32-bit x86 and
 arm hosts
Date: Mon,  6 Mar 2023 09:46:53 +0100
Message-Id: <20230306084658.29709-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

We're struggling quite badly with our CI minutes on the shared
gitlab runners, so we urgently need to think of ways to cut down
our supported build and target environments. Hardly anybody uses
QEMU system emulation on 32-bit x86 and arm hosts anymore, so it's
time to deprecate these environments now.

This is a follow-up patch series from the previous discussion here:

 https://lore.kernel.org/qemu-devel/20230130114428.1297295-1-thuth@redhat.com/

where people still mentioned that there is still interest in certain
support for 32-bit host hardware. But as far as I could see, there is
no real need for system emulation on 32-bit x86 host and 32-bit arm
hosts anymore, so it should be fine if we drop these host environments
soon (these are also the two architectures that contribute the most to
the long test times in our CI, so we would benefit a lot by dropping
those).

v4:
- Drop the patch that deprecated qemu-system-arm since it still
  might be required to enforce 32-bit guests with TCG
- Only deprecate system emulation on 32-bit x86 hosts since user-mode
  emulation might still be useful in certain scenarios
- Add a sentence how to enforce 32-bit mode with qemu-system-x86_64

v3:
- Update some commit descriptions according to the suggestions in v2
- Added the Reviewed-bys from v2

v2:
- Split binary and host deprecation into separate patches
- Added patches to immediately drop the jobs from the CI

Thomas Huth (5):
  docs/about/deprecated: Deprecate 32-bit x86 hosts for system emulation
  docs/about/deprecated: Deprecate the qemu-system-i386 binary
  gitlab-ci.d/crossbuilds: Drop the i386 system emulation job
  docs/about/deprecated: Deprecate 32-bit arm hosts for system emulation
  gitlab-ci.d/crossbuilds: Drop the 32-bit arm system emulation jobs

 docs/about/deprecated.rst    | 34 ++++++++++++++++++++++++++++++++++
 .gitlab-ci.d/crossbuilds.yml | 24 ------------------------
 2 files changed, 34 insertions(+), 24 deletions(-)

-- 
2.31.1


