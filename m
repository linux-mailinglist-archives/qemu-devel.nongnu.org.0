Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD5B6867C2
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 14:58:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNDcn-0006Yj-Iy; Wed, 01 Feb 2023 08:58:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1pNDcl-0006US-50
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 08:58:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1pNDcj-00030R-OE
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 08:58:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675259885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=WAQmCv/hikr9WcEhcbFx2TiSB5mzzF0mr4V+771Qf+Y=;
 b=I/4uZBgURSqQkHj0Uoo3JoWHfuslP56T5AxvRIXzluBpggpQb3hfXZPPmQikJdmnJDxF7K
 vNlYXF+f7exWnA1k9/bjMXm22pEdBfkzF4UtEsFz0g0ij9ijlomHLeRJQaM2Q6B47CJsnC
 fbcS8W6snZdFwF6xsCZdFB53424AIu4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-OdGhjbe6M3-wSB4HU7yuoQ-1; Wed, 01 Feb 2023 08:58:01 -0500
X-MC-Unique: OdGhjbe6M3-wSB4HU7yuoQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7D0B138123B1;
 Wed,  1 Feb 2023 13:58:01 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3045240C141B;
 Wed,  1 Feb 2023 13:58:01 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Maxim Levitsky <mlevitsk@redhat.com>,
 Yang Zhong <yang.zhong@linux.intel.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Jing Liu <jing2.liu@intel.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 0/2] target/i386: add support for cpu FLUSH_L1D feature and
 FB_CLEAR capability
Date: Wed,  1 Feb 2023 08:57:57 -0500
Message-Id: <20230201135759.555607-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
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

QEMU should be able to show the guest the above feature/capability,
otherwise we risk to have false vulnerability reports in the guest like in
/sys/devices/system/cpu/vulnerabilities/mmio_stale_data
because the mitigation is present only if the guest supports
(FLUSH_L1D and MD_CLEAR) or FB_CLEAR.

Emanuele

Emanuele Giuseppe Esposito (2):
  target/i386: add support for FLUSH_L1D feature
  target/i386: add support for FB_CLEAR feature

 target/i386/cpu.h | 3 +++
 target/i386/cpu.c | 4 ++--
 2 files changed, 5 insertions(+), 2 deletions(-)

-- 
2.39.1


