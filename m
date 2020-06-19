Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6772012C9
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jun 2020 17:56:48 +0200 (CEST)
Received: from localhost ([::1]:41878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jmJNn-0001O6-Vd
	for lists+qemu-devel@lfdr.de; Fri, 19 Jun 2020 11:56:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mgamal@redhat.com>) id 1jmJMS-0008V1-GQ
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 11:55:24 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:25549
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mgamal@redhat.com>) id 1jmJMQ-00080s-R3
 for qemu-devel@nongnu.org; Fri, 19 Jun 2020 11:55:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592582122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=to2CQWKmk1BHkNF1i45gKO63shrPi4wxU7I0QHSWvYE=;
 b=a+xwZIkenr5eM9mZOG51JuItsg69frI3vkFMkiPC6q07YiZcfoV1EsF7OluS0xPSvJSwLg
 sGy4e4g9VeZMgShLOsSCbl6YpG9OXPPjmVBQpxco11iVCzhwmt8/8GXX/dSDcFkt0jQgzU
 gRVfwoaojHmBRBN0sgCyvui3Jt2Ee1o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-CVn1DvXPMHOb91P4X9CdmA-1; Fri, 19 Jun 2020 11:54:00 -0400
X-MC-Unique: CVn1DvXPMHOb91P4X9CdmA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55711108BD09;
 Fri, 19 Jun 2020 15:53:52 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-254.ams2.redhat.com
 [10.36.112.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 96C9E5BAD3;
 Fri, 19 Jun 2020 15:53:47 +0000 (UTC)
From: Mohammed Gamal <mgamal@redhat.com>
To: qemu-devel@nongnu.org,
	pbonzini@redhat.com
Subject: [PATCH 0/2] kvm: x86/cpu: Support guest MAXPHYADDR < host MAXPHYADDR
Date: Fri, 19 Jun 2020 17:53:42 +0200
Message-Id: <20200619155344.79579-1-mgamal@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Received-SPF: pass client-ip=205.139.110.61; envelope-from=mgamal@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/19 02:45:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: mtosatti@redhat.com, Mohammed Gamal <mgamal@redhat.com>,
 ehabkost@redhat.com, kvm@vger.kernel.org, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series adds support for KVM_CAP_HAS_SMALLER_MAXPHYADDR to QEMU.
Some processors might not handle GUEST_MAXPHYADDR < HOST_MAXPHYADDR in
the expected manner. Hence, we added KVM_CAP_HAS_SMALLER_MAXPHYADDR to
KVM.
In this implementation KVM is queried for KVM_CAP_HAS_SMALLER_MAXPHYADDR
when setting vCPU physical bits, and if the CPU doesn't support 
KVM_CAP_HAS_SMALLER_MAXPHYADDR the ,phys-bits is ignore and host phyiscal
bits are used. A warning message is printed to the user.

Mohammed Gamal (2):
  kvm: Add support for KVM_CAP_HAS_SMALLER_MAXPHYADDR
  x86/cpu: Handle GUEST_MAXPHYADDR < HOST_MAXPHYADDR for hosts that
    don't support it

 linux-headers/linux/kvm.h |  1 +
 target/i386/cpu.c         | 11 +++++++++++
 target/i386/kvm.c         |  5 +++++
 target/i386/kvm_i386.h    |  1 +
 4 files changed, 18 insertions(+)

-- 
2.26.2


