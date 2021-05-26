Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4958D39217B
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 22:28:35 +0200 (CEST)
Received: from localhost ([::1]:54568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm08j-0004wZ-Po
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 16:28:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lm00w-0006HK-4N
 for qemu-devel@nongnu.org; Wed, 26 May 2021 16:20:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lm00r-0000Pc-J6
 for qemu-devel@nongnu.org; Wed, 26 May 2021 16:20:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622060418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UpQuUZgQq0vTRIOSV9wnylj/ys8fRjcaaGyM+fDMRv0=;
 b=BxYyscThXbvEaX3XpVFIIGKKm0qyAochVtF2Kp6U3QNV1V47zLcPPv6bghUyBxMppHzCiS
 SHPYxw2U7wFBS+QGygbOe2qJ3QB3uJWCXtKKrx7RNvZamBbCYNeGhyR2euAQDreVRs2BMP
 fwwZ4FTneygc4qHYo4ZDL5WM28/OjnM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-1yWpCPZ8M8K4LY262rLu9w-1; Wed, 26 May 2021 16:20:16 -0400
X-MC-Unique: 1yWpCPZ8M8K4LY262rLu9w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9AEC6107ACE6
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 20:20:15 +0000 (UTC)
Received: from localhost (ovpn-114-21.rdu2.redhat.com [10.10.114.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4F4485D6D3;
 Wed, 26 May 2021 20:20:15 +0000 (UTC)
Date: Wed, 26 May 2021 16:20:14 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH v6 00/19] i386: KVM: expand Hyper-V features early
Message-ID: <20210526202014.tkeim3ofmsknbijy@habkost.net>
References: <20210422161130.652779-1-vkuznets@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210422161130.652779-1-vkuznets@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
 qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 22, 2021 at 06:11:11PM +0200, Vitaly Kuznetsov wrote:
> Vitaly Kuznetsov (19):
>   i386: keep hyperv_vendor string up-to-date
>   i386: invert hyperv_spinlock_attempts setting logic with
>     hv_passthrough
>   i386: always fill Hyper-V CPUID feature leaves from X86CPU data
>   i386: stop using env->features[] for filling Hyper-V CPUIDs
>   i386: introduce hyperv_feature_supported()
>   i386: introduce hv_cpuid_get_host()
>   i386: drop FEAT_HYPERV feature leaves
>   i386: introduce hv_cpuid_cache
>   i386: split hyperv_handle_properties() into
>     hyperv_expand_features()/hyperv_fill_cpuids()
>   i386: move eVMCS enablement to hyperv_init_vcpu()
>   i386: switch hyperv_expand_features() to using error_setg()
>   i386: adjust the expected KVM_GET_SUPPORTED_HV_CPUID array size
>   i386: prefer system KVM_GET_SUPPORTED_HV_CPUID ioctl over vCPU's one
>   i386: use global kvm_state in hyperv_enabled() check

I'm queueing patches 1-14 (the ones above) on my x86-next branch.
Thanks!

>   i386: expand Hyper-V features during CPU feature expansion time
>   i386: kill off hv_cpuid_check_and_set()
>   i386: HV_HYPERCALL_AVAILABLE privilege bit is always needed
>   i386: Hyper-V SynIC requires POST_MESSAGES/SIGNAL_EVENTS priviliges
>   qtest/hyperv: Introduce a simple hyper-v test


-- 
Eduardo


