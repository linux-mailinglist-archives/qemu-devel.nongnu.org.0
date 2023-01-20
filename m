Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B2F674B55
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 05:51:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIjMB-0005i1-Q0; Thu, 19 Jan 2023 23:50:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mtosatti@redhat.com>)
 id 1pIjM5-0005gg-Ba
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 23:50:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mtosatti@redhat.com>)
 id 1pIjM0-0005WH-9q
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 23:50:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674190215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc; bh=Ja5jRaAjvA6A1qFpRyfbC8gO+Uf0HTRd1uhGwFrvQrA=;
 b=Ix+C+wyuqzilNuFGvQVedBvq0LP1u0dAP8Qo6GLhto51srfMm5cZ2wDA++Rvbww+5hVgmp
 13W6Ozn0RSVB35CtazJiOhQIOdqR6Xjy1FR8k+KhzGEmJImmljjRiXFM1e//IdMQ8p0GO2
 deKzUHPKES3YUPXA6vIqzJw6AoNz47o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-297-IlHSVlbQP0ecRt23RKQ8VQ-1; Thu, 19 Jan 2023 23:48:50 -0500
X-MC-Unique: IlHSVlbQP0ecRt23RKQ8VQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 131BE85CBE0;
 Fri, 20 Jan 2023 04:48:50 +0000 (UTC)
Received: from tpad.localdomain (ovpn-112-2.gru2.redhat.com [10.97.112.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DC7EE40C2064;
 Fri, 20 Jan 2023 04:48:49 +0000 (UTC)
Received: by tpad.localdomain (Postfix, from userid 1000)
 id ED2F340517E51; Thu, 19 Jan 2023 22:15:17 -0300 (-03)
Message-ID: <20230120011116.134437211@redhat.com>
User-Agent: quilt/0.67
Date: Thu, 19 Jan 2023 22:11:16 -0300
From: Marcelo Tosatti <mtosatti@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 kvm@vger.kernel.org
Subject: [PATCH 0/2] read kvmclock from guest memory if !correct_tsc_shift
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mtosatti@redhat.com;
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

Before kernel commit 78db6a5037965429c04d708281f35a6e5562d31b,
kvm_guest_time_update() would use vcpu->virtual_tsc_khz to calculate
tsc_shift value in the vcpus pvclock structure written to guest memory.

For those kernels, if vcpu->virtual_tsc_khz != tsc_khz (which can be the
case when guest state is restored via migration, or if tsc-khz option is
passed to QEMU), and TSC scaling is not enabled (which happens if the
difference between the frequency requested via KVM_SET_TSC_KHZ and the
host TSC KHZ is smaller than 250ppm), then there can be a difference
between what KVM_GET_CLOCK would return and what the guest reads as
kvmclock value.

The effect is that the guest sees a jump in kvmclock value
(either forwards or backwards) in such case.

To fix incoming migration from pre-78db6a5037965 hosts,
read kvmclock value from guest memory.

Unless the KVM_CLOCK_CORRECT_TSC_SHIFT bit indicates
that the value retrieved by KVM_GET_CLOCK on the source
is safe to be used.



