Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8020484FB4
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 10:02:29 +0100 (CET)
Received: from localhost ([::1]:42040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n52Bg-0001o2-H6
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 04:02:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1n527i-00005t-1M
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 03:58:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1n527e-000529-VH
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 03:58:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641373095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AqM6mXr2ukCF3nPtokg1+ItcTU/xmxU+rFTFaoYuUGo=;
 b=UAdTgM3akx8UQzFgh9EafiyMAIMqk7tg1cmBK4MDs2bwMkWGxMXamzOgUN6MRyxotdzZue
 mI1YdBs23PV6pKhcisQFd6VhVNCNjoeV8TDOxiFIVrnVNGUtYjmzQetxBcJdyy4LMOcams
 5jawS8xgQqw035ticfudpmIdrxO2Z1w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-39-iPMsuEApOo2o8fRrtrja4w-1; Wed, 05 Jan 2022 03:57:08 -0500
X-MC-Unique: iPMsuEApOo2o8fRrtrja4w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D798760C0
 for <qemu-devel@nongnu.org>; Wed,  5 Jan 2022 08:57:07 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.40.194.48])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 33E4370D39;
 Wed,  5 Jan 2022 08:57:05 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] i386: Add support for Hyper-V Enlightened MSR-Bitmap
 feature
Date: Wed,  5 Jan 2022 09:57:02 +0100
Message-Id: <20220105085704.1267530-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The new nested specific enlightenment speeds up L2 vmexits by avoiding
unnecessary updates to L2 MSR-Bitmap. Support for both VMX and SVM is
coming to KVM:
https://lore.kernel.org/kvm/20211129094704.326635-1-vkuznets@redhat.com/
https://lore.kernel.org/kvm/20211220152139.418372-1-vkuznets@redhat.com/

Vitaly Kuznetsov (2):
  i386: Use hv_build_cpuid_leaf() for HV_CPUID_NESTED_FEATURES
  i386: Hyper-V Enlightened MSR bitmap feature

 docs/hyperv.txt                | 10 ++++++++++
 target/i386/cpu.c              |  2 ++
 target/i386/cpu.h              |  2 +-
 target/i386/kvm/hyperv-proto.h |  5 +++++
 target/i386/kvm/kvm.c          | 30 ++++++++++++++++++++++--------
 5 files changed, 40 insertions(+), 9 deletions(-)

-- 
2.33.1


