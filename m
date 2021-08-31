Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A553FCC9A
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 19:52:14 +0200 (CEST)
Received: from localhost ([::1]:37952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL7vX-0000fG-Ak
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 13:52:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mL7uM-0008Gs-QM
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 13:50:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mL7uC-0004Al-NA
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 13:50:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630432239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Aju63MUO+3yNJjxVBq0dPLyOv8P7tmYFDrobU3ANbYc=;
 b=EzVA2xDjqm90HRQtM64dME4Yl2pgiKAc50ACZTAFr3w7q6i28LtE4CvCMyoPjqGP6g8L1U
 M+6sdbxtk6cfvl5V/zMBYGtV0Wpi85+vPmak/MyPe3zxM2XjGdS67tFuGFPbAljYJ/QUTd
 rajUKbJ2CB9J26sub093HlSr2VV+Wrk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-523-AORJWFfPPtWWtZcuFZDq7g-1; Tue, 31 Aug 2021 13:50:37 -0400
X-MC-Unique: AORJWFfPPtWWtZcuFZDq7g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 301F8871807;
 Tue, 31 Aug 2021 17:50:36 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.192.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B55ED60936;
 Tue, 31 Aug 2021 17:50:34 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/i386: add missing bits to CR4_RESERVED_MASK
Date: Tue, 31 Aug 2021 18:50:33 +0100
Message-Id: <20210831175033.175584-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Lara Lazier <laramglazier@gmail.com>, Richard Jones <rjones@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Booting Fedora kernels with -cpu max hangs very early in boot. Disabling
the la57 CPUID bit fixes the problem. git bisect traced the regression to

  commit 213ff024a2f92020290296cb9dc29c2af3d4a221 (HEAD, refs/bisect/bad)
  Author: Lara Lazier <laramglazier@gmail.com>
  Date:   Wed Jul 21 17:26:50 2021 +0200

    target/i386: Added consistency checks for CR4

    All MBZ bits in CR4 must be zero. (APM2 15.5)
    Added reserved bitmask and added checks in both
    helper_vmrun and helper_write_crN.

    Signed-off-by: Lara Lazier <laramglazier@gmail.com>
    Message-Id: <20210721152651.14683-2-laramglazier@gmail.com>
    Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

In this commit CR4_RESERVED_MASK is missing CR4_LA57_MASK and
two others. Adding this lets Fedora kernels boot once again.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 target/i386/cpu.h | 1 +
 1 file changed, 1 insertion(+)

I don't know the implications of CR4_VMXE_MASK and CR4_SMXE_MASK
being missing in CR4_RESERVED_MASK. It didn't cause any ill effects
either way, but I added them on the assumption that CR4_RESERVED_MASK
was supposed to contain all define bits.

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 6c50d3ab4f..ce85f1a29d 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -257,6 +257,7 @@ typedef enum X86Seg {
                 | CR4_DE_MASK | CR4_PSE_MASK | CR4_PAE_MASK \
                 | CR4_MCE_MASK | CR4_PGE_MASK | CR4_PCE_MASK \
                 | CR4_OSFXSR_MASK | CR4_OSXMMEXCPT_MASK |CR4_UMIP_MASK \
+                | CR4_LA57_MASK | CR4_VMXE_MASK | CR4_SMXE_MASK \
                 | CR4_FSGSBASE_MASK | CR4_PCIDE_MASK | CR4_OSXSAVE_MASK \
                 | CR4_SMEP_MASK | CR4_SMAP_MASK | CR4_PKE_MASK | CR4_PKS_MASK))
 
-- 
2.31.1


