Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F11B3D233B
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 14:18:16 +0200 (CEST)
Received: from localhost ([::1]:36700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6XeZ-00062x-6e
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 08:18:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1m6Xc1-0003IB-I1
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 08:15:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1m6Xby-0001gt-K8
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 08:15:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626956133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wSYB9hELwjkwE0ADBuZ5MUXkW5KQ31n/UmYBsh5fiyo=;
 b=Jlds1b9AtpIEb2o/HLuxJR7G8Y+vhb+08rUPb7kgfkY7RSXt9cewtMnQeyfcT5QVChyNxr
 t8m4fjc0Fd99Iz5uD0ucHjykK9Vw7eySgC/Vj36E8V6/ngcs26FYthy+/Vge5CRliqkzDs
 FrAgBUSvAS95bNb/rRRQceyI6+Axv9s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-gW6gu2FWOsmDqEa2rLGfzQ-1; Thu, 22 Jul 2021 08:15:32 -0400
X-MC-Unique: gW6gu2FWOsmDqEa2rLGfzQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A114180FCCB
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 12:15:31 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.40.195.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CD3655C22B;
 Thu, 22 Jul 2021 12:15:29 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH 0/3] i386/kvm: Paravirtualized features usage enforcement
Date: Thu, 22 Jul 2021 14:15:25 +0200
Message-Id: <20210722121528.258426-1-vkuznets@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[I know this is probably too late for 6.1 but maybe the first patch of the
series is good as it just adds a missing doc?]

By default, KVM doesn't limit the usage of paravirtualized feature (neither
native KVM nor Hyper-V) to what was exposed to the guest in CPUIDs making
it possible to use all of them. KVM_CAP_HYPERV_ENFORCE_CPUID and
KVM_CAP_ENFORCE_PV_FEATURE_CPUID features were recently introduced making
it possible to limit available features to what was actually exposed. Add
support for these to QEMU.

While on it, document all currently supported KVM PV features in
docs/kvm-pv.txt.

Vitaly Kuznetsov (3):
  docs: Briefly describe KVM PV features
  i386: Support KVM_CAP_ENFORCE_PV_FEATURE_CPUID
  i386: Support KVM_CAP_HYPERV_ENFORCE_CPUID

 docs/hyperv.txt       |  17 +++++--
 docs/kvm-pv.txt       | 103 ++++++++++++++++++++++++++++++++++++++++++
 target/i386/cpu.c     |   3 ++
 target/i386/cpu.h     |   4 ++
 target/i386/kvm/kvm.c |  19 ++++++++
 5 files changed, 143 insertions(+), 3 deletions(-)
 create mode 100644 docs/kvm-pv.txt

-- 
2.31.1


