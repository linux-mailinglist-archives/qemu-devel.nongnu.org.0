Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A1A393661
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 21:36:58 +0200 (CEST)
Received: from localhost ([::1]:40144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmLoP-0001Io-EH
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 15:36:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lmLnH-0008Mh-Ta
 for qemu-devel@nongnu.org; Thu, 27 May 2021 15:35:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lmLnE-0000Gs-4r
 for qemu-devel@nongnu.org; Thu, 27 May 2021 15:35:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622144143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vBBtVvnbweTfRRiikmxbx1VSYBaZxTUZIb7uVYlMbDg=;
 b=a66bU8a9MnJeO+5fopz1esv7rEDTahDIhkNbV8ksH+0zmoZRqh64onBfznpSpFBEc9VQ5A
 VAxxPNhuxihwvAOZvm/PHJJ2UaGod5xQjQdJU8xr5a6tmuSkfFSbeTmhc02pZ4EKB+zlMt
 zIJd77tDcBxMKMQ07x6tatsm36dcrqQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-2sMoYU59Ni2hn3wkNPmTWw-1; Thu, 27 May 2021 15:35:41 -0400
X-MC-Unique: 2sMoYU59Ni2hn3wkNPmTWw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90297101371D
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 19:35:40 +0000 (UTC)
Received: from localhost (ovpn-117-209.rdu2.redhat.com [10.10.117.209])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 574DE5C5B5;
 Thu, 27 May 2021 19:35:40 +0000 (UTC)
Date: Thu, 27 May 2021 15:35:39 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH v6 00/19] i386: KVM: expand Hyper-V features early
Message-ID: <20210527193539.qcncovc25ahhjgyp@habkost.net>
References: <20210422161130.652779-1-vkuznets@redhat.com>
 <20210526202014.tkeim3ofmsknbijy@habkost.net>
 <87fsy87hih.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
In-Reply-To: <87fsy87hih.fsf@vitty.brq.redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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

On Thu, May 27, 2021 at 09:39:02AM +0200, Vitaly Kuznetsov wrote:
> Eduardo Habkost <ehabkost@redhat.com> writes:
> 
> > On Thu, Apr 22, 2021 at 06:11:11PM +0200, Vitaly Kuznetsov wrote:
> >> Vitaly Kuznetsov (19):
> >>   i386: keep hyperv_vendor string up-to-date
> >>   i386: invert hyperv_spinlock_attempts setting logic with
> >>     hv_passthrough
> >>   i386: always fill Hyper-V CPUID feature leaves from X86CPU data
> >>   i386: stop using env->features[] for filling Hyper-V CPUIDs
> >>   i386: introduce hyperv_feature_supported()
> >>   i386: introduce hv_cpuid_get_host()
> >>   i386: drop FEAT_HYPERV feature leaves
> >>   i386: introduce hv_cpuid_cache
> >>   i386: split hyperv_handle_properties() into
> >>     hyperv_expand_features()/hyperv_fill_cpuids()
> >>   i386: move eVMCS enablement to hyperv_init_vcpu()
> >>   i386: switch hyperv_expand_features() to using error_setg()
> >>   i386: adjust the expected KVM_GET_SUPPORTED_HV_CPUID array size
> >>   i386: prefer system KVM_GET_SUPPORTED_HV_CPUID ioctl over vCPU's one
> >>   i386: use global kvm_state in hyperv_enabled() check
> >
> > I'm queueing patches 1-14 (the ones above) on my x86-next branch.
> 
> Thank you! Is it published somewhere so I can base next version[s] on it? 

Yes: http://gitlab.com/ehabkost/qemu x86-next

-- 
Eduardo


