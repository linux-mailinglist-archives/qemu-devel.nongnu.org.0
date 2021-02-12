Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3D631A069
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 15:14:53 +0100 (CET)
Received: from localhost ([::1]:34770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAZDg-0005Yy-EC
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 09:14:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lAZC5-0004WX-Dg
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 09:13:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lAZC3-0006lZ-Kw
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 09:13:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613139189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QOkaciXChLyUtxoj8LAxNUifh+cOdeyr2yzZQNdPl2E=;
 b=ZGyBtJX5RYDAU5Pi1bI5jzWDjshZSgXNdf/R0pZOghTEgdH2f3C7Bbc6SOt4qbADomPZos
 NnPBB09g/0V6eOV9Q3t4rfVJxLNweav3lylS4sIac8FP4UviPL0BTwxqWfMpAtMEgQ74Xl
 Q0hNRPB/ItL+6Y2R1oCAKEA/baTNXC0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-R_zCc5pZNWqjadGtzzIzWw-1; Fri, 12 Feb 2021 09:13:08 -0500
X-MC-Unique: R_zCc5pZNWqjadGtzzIzWw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B201CE647
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 14:13:07 +0000 (UTC)
Received: from localhost (unknown [10.40.208.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 085B51B5AB;
 Fri, 12 Feb 2021 14:13:01 +0000 (UTC)
Date: Fri, 12 Feb 2021 15:12:59 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH v4 16/21] i386: track explicit 'hv-*' features
 enablement/disablement
Message-ID: <20210212151259.3db7406f@redhat.com>
In-Reply-To: <87tuqhllmn.fsf@vitty.brq.redhat.com>
References: <20210210164033.607612-1-vkuznets@redhat.com>
 <20210210164033.607612-17-vkuznets@redhat.com>
 <20210211183555.2136b5c8@redhat.com>
 <87tuqhllmn.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, drjones@redhat.com,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 12 Feb 2021 09:45:52 +0100
Vitaly Kuznetsov <vkuznets@redhat.com> wrote:

> Igor Mammedov <imammedo@redhat.com> writes:
> 
> > On Wed, 10 Feb 2021 17:40:28 +0100
> > Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
> >  
> >> Sometimes we'd like to know which features were explicitly enabled and which
> >> were explicitly disabled on the command line. E.g. it seems logical to handle
> >> 'hv_passthrough,hv_feature=off' as "enable everything supported by the host
> >> except for hv_feature" but this doesn't seem to be possible with the current
> >> 'hyperv_features' bit array. Introduce 'hv_features_on'/'hv_features_off'
> >> add-ons and track explicit enablement/disablement there.
> >> 
> >> Note, it doesn't seem to be possible to fill 'hyperv_features' array during
> >> CPU creation time when 'hv-passthrough' is specified and we're running on
> >> an older kernel without KVM_CAP_SYS_HYPERV_CPUID support. To get the list
> >> of the supported Hyper-V features we need to actually create KVM VCPU and
> >> this happens much later.  
> >
> > seems to me that we are returning back to +-feat parsing, this time only for
> > hyperv.
> > I'm not sure I like it back, especially considering we are going to
> > drop "-feat" priority for x86.
> >
> > now about impossible, see arm/kvm/virt, they create a 'sample' VCPU at KVM
> > init time to probe for some CPU features in advance. You can use similar
> > approach to prepare value for hyperv_features.
> >  
> 
> KVM_CAP_SYS_HYPERV_CPUID is supported since 5.11 and eventually it'll
> make it to all kernels we care about so I'd really like to avoid any
> 'sample' CPUs for the time being. On/off parsing looks like a much
> lesser evil.
When minimum supported by QEMU kernel version gets there, you can remove
scratch CPU in QEMU (if hyperv will remain its sole user).

writing your own property parser like in this series, is possible too
but it adds extra fields to track state and hard to follow logic.
On top it adds a lot of churn by switching hv_ features to dynamic
properties, which is not necessary if scratch CPU approach is used.

Please try reusing scratch CPU approach, see
  kvm_arm_get_host_cpu_features()
for an example. You will very likely end up with simpler series,
compared to reinventing wheel.

in proto would look like:
  * kvm_init:
    hv_passthrough_cached = scratch_cpu->hyperv_features

  * property parsing time:
     x86_hv_passthrough_set()
       cpu->hyperv_features = hv_passthrough_cached
 
    all other features handled by generic property parsing,
    you don't have to do any special handling for them.

  * cpu_relalize()
     hv_expand() to check for dependencies, conflicts
     availability of features.


