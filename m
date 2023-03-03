Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A33776A9507
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 11:17:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY2Rp-00067B-4e; Fri, 03 Mar 2023 05:15:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pY2RN-0005w2-IH
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 05:15:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pY2RL-0000Z6-0K
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 05:15:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677838501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TpIlf9psPSTZKBaw+RSYYsCEkerCEPwHUsx9lr/nHA8=;
 b=hCV7oNSmLc+VC7Qfysn6/EWrFpHsO+HFe6AayZ+T8fp9fqghhFcJFjTpfhf3X5wpSbjsQY
 0uy+vXeUOZBcu1MycPa+saLGW8ncHbv2XNR+N2XH6UKU9VfDwUodc9DVc4DV5ZgersBzIh
 LM7Pucqn6x++ll/zo2o6yXLp3T7AQSA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-61-AerQz7NuMbiiz8u1ijZjjQ-1; Fri, 03 Mar 2023 05:14:57 -0500
X-MC-Unique: AerQz7NuMbiiz8u1ijZjjQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E93A5802C18;
 Fri,  3 Mar 2023 10:14:56 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 84169492C14;
 Fri,  3 Mar 2023 10:14:54 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
 libvir-list@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [PATCH v3 0/6] Deprecate support for 32-bit x86 and arm hosts
Date: Fri,  3 Mar 2023 11:14:46 +0100
Message-Id: <20230303101452.769367-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
our supported build and target environments. qemu-system-i386 and
qemu-system-arm are not really required anymore, since nobody uses
KVM on the corresponding systems for production anymore, and the
-x86_64 and -arch64 variants are a proper superset of those binaries.
So it's time to deprecate them and the corresponding 32-bit host
environments now (32-bit arm for system emulation, and 32-bit x86
completely).

This is a follow-up patch series from the previous discussion here:

 https://lore.kernel.org/qemu-devel/20230130114428.1297295-1-thuth@redhat.com/

where people still mentioned that there is still interest in certain
support for 32-bit host hardware. But as far as I could see, there is
no real need for 32-bit x86 host support and for system emulation on
32-bit arm hosts anymore, so it should be fine if we drop these host
environments soon (these are also the two architectures that contribute
the most to the long test times in our CI, so we would benefit a lot by
dropping those).

v3:
- Update some commit descriptions according to the suggestions in v2
- Added the Reviewed-bys from v2

v2:
- Split binary and host deprecation into separate patches
- Added patches to immediately drop the jobs from the CI

Thomas Huth (6):
  docs/about/deprecated: Deprecate 32-bit x86 hosts
  docs/about/deprecated: Deprecate the qemu-system-i386 binary
  gitlab-ci.d/crossbuilds: Drop the i386 jobs
  docs/about/deprecated: Deprecate 32-bit arm hosts for system emulation
  docs/about/deprecated: Deprecate the qemu-system-arm binary
  gitlab-ci.d/crossbuilds: Drop the 32-bit arm system emulation jobs

 docs/about/deprecated.rst    | 43 ++++++++++++++++++++++++++++++++++++
 .gitlab-ci.d/crossbuilds.yml | 34 ----------------------------
 2 files changed, 43 insertions(+), 34 deletions(-)

-- 
2.31.1


