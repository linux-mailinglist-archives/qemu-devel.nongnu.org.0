Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BBB3515BE
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 16:50:18 +0200 (CEST)
Received: from localhost ([::1]:47276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRyeH-0006mf-H6
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 10:50:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1lRyaJ-0002s7-2I
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 10:46:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1lRyaG-0000bE-Gy
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 10:46:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617288366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=caF8NNgeAw+4v4t8bg5Tp1fnSjzea1gBUcStxuTikxY=;
 b=GbkfRDiPzw1nIFFwCFv9vXSw88Qs+gd/x7bf/HbI4cYFRsZTRlvhrqJIrHMWvo9zIBuNwu
 3WTIA5kxVR/MeMW26lRiWj8uKM/C+cw7dh701zvPyxpt5opwcI470OjjX776SeDe4dlqYz
 47dVm58ZCRe+tjFTiBCknXnJV5P7kNE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-h6n7w6QxOSCSux_680o51w-1; Thu, 01 Apr 2021 10:46:04 -0400
X-MC-Unique: h6n7w6QxOSCSux_680o51w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40D2D1087C67;
 Thu,  1 Apr 2021 14:45:49 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.206.58])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE51E5C233;
 Thu,  1 Apr 2021 14:45:46 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] kvm: use KVM_{GET|SET}_SREGS2 when available
Date: Thu,  1 Apr 2021 17:45:43 +0300
Message-Id: <20210401144545.1031704-1-mlevitsk@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Cornelia Huck <cohuck@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Maxim Levitsky <mlevitsk@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

clone of "starship_unstable"=0D
=0D
Maxim Levitsky (2):=0D
  kvm: update kernel headers for KVM_{GET|SET}_SREGS2=0D
  KVM: use KVM_{GET|SET}_SREGS2 when supported by kvm.=0D
=0D
 accel/kvm/kvm-all.c         |   4 ++=0D
 include/sysemu/kvm.h        |   4 ++=0D
 linux-headers/asm-x86/kvm.h |  13 +++++=0D
 linux-headers/linux/kvm.h   |   5 ++=0D
 target/i386/cpu.h           |   1 +=0D
 target/i386/kvm/kvm.c       | 101 +++++++++++++++++++++++++++++++++++-=0D
 target/i386/machine.c       |  33 ++++++++++++=0D
 7 files changed, 159 insertions(+), 2 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D


