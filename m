Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7035A7E0A
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 14:54:12 +0200 (CEST)
Received: from localhost ([::1]:51008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTNER-0006Pl-6a
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 08:54:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oTNBa-00038T-Pm
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 08:51:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oTNBV-0000kw-3A
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 08:51:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661950264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3SyWGJ1mzR9fPTQBfCSE21gwkrtS3xR2GumngAPW6F0=;
 b=PwYr49B4hyvsu5WT/aX/EttKz1u6XkAc8irFgg8lfueh08fX0JtaCSS56V2SkUSwtcQrVf
 TuQgLTGXwwbsuIXp+yYmB8uOZ7VhJuEaTxfj/fekOGcpPoc38e4ctTFVxx2Zk3D1hNcsrE
 r1abV/7fEBzxBLB5iZe8vuZpBp/RITk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-300-EavAyjzoO-KZPkIOpW_lig-1; Wed, 31 Aug 2022 08:51:01 -0400
X-MC-Unique: EavAyjzoO-KZPkIOpW_lig-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B7EB81C0BC69;
 Wed, 31 Aug 2022 12:51:00 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B0402026D64;
 Wed, 31 Aug 2022 12:51:00 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2440018000A3; Wed, 31 Aug 2022 14:50:59 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, Marcelo Tosatti <mtosatti@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 0/2] expose host-phys-bits to guest
Date: Wed, 31 Aug 2022 14:50:57 +0200
Message-Id: <20220831125059.170032-1-kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When the guest (firmware specifically) knows how big
the address space actually is it can be used better.

Some more background:
  https://bugzilla.redhat.com/show_bug.cgi?id=2084533

This is a RfC series exposes the information via cpuid.

take care,
  Gerd

Gerd Hoffmann (2):
  [hack] reserve bit KVM_HINTS_HOST_PHYS_BITS
  [RfC] expose host-phys-bits to guest

 include/standard-headers/asm-x86/kvm_para.h | 3 ++-
 target/i386/cpu.h                           | 3 ---
 hw/i386/microvm.c                           | 6 +++++-
 target/i386/cpu.c                           | 3 +--
 target/i386/host-cpu.c                      | 4 +++-
 target/i386/kvm/kvm.c                       | 1 +
 6 files changed, 12 insertions(+), 8 deletions(-)

-- 
2.37.2


