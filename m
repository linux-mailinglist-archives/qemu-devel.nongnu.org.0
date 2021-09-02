Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14ED93FEB7D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 11:44:21 +0200 (CEST)
Received: from localhost ([::1]:58882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLjGe-0007mB-31
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 05:44:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1mLj9b-000321-2E
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 05:37:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1mLj9Z-0005VE-Ip
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 05:37:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630575420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KvW05yH8spBrLwR8RdPEuUUbj5CUCFgUkAOlaj/5Fhs=;
 b=Zhy8nnJjGE59yxqj8MljpUOff+JqVDMBgCFv6Xi+k7f38wc6gC5VtMkuCd7t2pBlo65EsS
 s152hMKwijFQ5GJr7w+nIbhxScudpvxUx6wEORml2UyBUHyZg6ts+CFDhBjTySI6vVY871
 PwvhKA7Otx9Wz/FLIxIFbPjyl0sbgWw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-2cGm6gjFMCqU3P-aU9Laqw-1; Thu, 02 Sep 2021 05:35:34 -0400
X-MC-Unique: 2cGm6gjFMCqU3P-aU9Laqw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A04D684A5E0
 for <qemu-devel@nongnu.org>; Thu,  2 Sep 2021 09:35:33 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.194.92])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D63256A05B;
 Thu,  2 Sep 2021 09:35:31 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/8] i386: Assorted KVM PV and Hyper-V feature improvements
Date: Thu,  2 Sep 2021 11:35:22 +0200
Message-Id: <20210902093530.345756-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 Vadim Rozenfeld <vrozenfe@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a continuation of "[PATCH 0/3] i386/kvm: Paravirtualized features usage 
enforcement" series, thus v2.

This series implements several unrelated features but as there are code
dependencies between them I'm sending it as one series.

PATCH1 adds empty 6.2 machine types and the required compat infrastructure
(to be used by PATCH8)
PATCH2 adds documentation for KVM PV features
PATCH3 adds support for KVM_CAP_ENFORCE_PV_FEATURE_CPUID
PATCH4 adds support for KVM_CAP_HYPERV_ENFORCE_CPUID
PATCHes5-6 add 'hv-avic' feature
PATCH7 makes Hyper-V version info settable
PATCH8 changes the default Hyper-V version to 2016

Vitaly Kuznetsov (8):
  i386: Add 6.2 machine types
  i386: docs: Briefly describe KVM PV features
  i386: Support KVM_CAP_ENFORCE_PV_FEATURE_CPUID
  i386: Support KVM_CAP_HYPERV_ENFORCE_CPUID
  i386: Move HV_APIC_ACCESS_RECOMMENDED bit setting to
    hyperv_fill_cpuids()
  i386: Implement pseudo 'hv-avic' ('hv-apicv') enlightenment
  i386: Make Hyper-V version id configurable
  i386: Change the default Hyper-V version to match WS2016

 docs/hyperv.txt                |  41 +++++++++++--
 docs/kvm-pv.txt                | 103 +++++++++++++++++++++++++++++++++
 hw/core/machine.c              |   3 +
 hw/i386/pc.c                   |   7 +++
 hw/i386/pc_piix.c              |  14 ++++-
 hw/i386/pc_q35.c               |  13 ++++-
 include/hw/boards.h            |   3 +
 include/hw/i386/pc.h           |   3 +
 target/i386/cpu.c              |  22 +++++--
 target/i386/cpu.h              |  12 +++-
 target/i386/kvm/hyperv-proto.h |   1 +
 target/i386/kvm/kvm.c          |  62 +++++++++++++++-----
 12 files changed, 260 insertions(+), 24 deletions(-)
 create mode 100644 docs/kvm-pv.txt

-- 
2.31.1


