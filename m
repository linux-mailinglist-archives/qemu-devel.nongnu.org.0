Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3389427132E
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Sep 2020 11:32:47 +0200 (CEST)
Received: from localhost ([::1]:42570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJvi9-0000Lp-1J
	for lists+qemu-devel@lfdr.de; Sun, 20 Sep 2020 05:32:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kJvft-00071i-AC
 for qemu-devel@nongnu.org; Sun, 20 Sep 2020 05:30:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kJvfr-0002kr-Jf
 for qemu-devel@nongnu.org; Sun, 20 Sep 2020 05:30:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600594223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=n2el0CQ+LOWCabCqrJ8eCVEDCMcCQO3OzmR6JzMGy3w=;
 b=CVmlBIQCWZ+iSail5WDe6WPPcnVaGyR6TUS12gOk9bT+8gWDdW7/DJp6nfYtiN9o+0yK33
 wFypYHMfIDCo0IGHvbubFsd0k4n274lNnJwWBT4eoOaFGC1X62cJ5Tm7rgcqhFI70Xuq3f
 4BI+YIjUX8nWCdz8C7Yhj+OEW0VZ4Bs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-nuoFvBGEPlemw_qcVoMq1Q-1; Sun, 20 Sep 2020 05:30:18 -0400
X-MC-Unique: nuoFvBGEPlemw_qcVoMq1Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43EB3802B47
 for <qemu-devel@nongnu.org>; Sun, 20 Sep 2020 09:30:17 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 11EF1100164C
 for <qemu-devel@nongnu.org>; Sun, 20 Sep 2020 09:30:16 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] configure: bugfixes and cleanups for CFLAGS
Date: Sun, 20 Sep 2020 05:30:12 -0400
Message-Id: <20200920093016.1150346-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/20 03:58:12
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Meson is placing -pie after -shared rather than before, and this
causes linking to fail while building the ArchLinux package for
QEMU?

But why is -pie ending up in the flags?  Because LDFLAGS is an
environment variable, and changes to environment variables propagate
when configure does

  LDFLAGS="-pie $LDFLAGS"

This happens without having to export the env. var again.

The solution is to simply rename the CFLAGS and LDFLAGS variables
used for flags that Meson takes care of by itself.  The CFLAGS
variable was previously used for submodules as well, so patches
1 and 2 fix that as well.

Paolo Bonzini (4):
  configure: cleanup invocation of submodule Make
  configure: cleanup CFLAGS and LDFLAGS for submodules
  configure: do not clobber environment CFLAGS/CXXFLAGS/LDFLAGS
  configure: consistently pass CFLAGS/CXXFLAGS/LDFLAGS to meson

 Makefile    | 23 ++++++++++++++---------
 configure   | 47 ++++++++++++++++++++++++++++++-----------------
 meson.build | 13 ++++++++++++-
 3 files changed, 56 insertions(+), 27 deletions(-)

-- 
2.26.2


