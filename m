Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E3F2DC6E7
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 20:12:52 +0100 (CET)
Received: from localhost ([::1]:42110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpcEF-0006cA-SL
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 14:12:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpcAp-0004e9-4P
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 14:09:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kpcAm-0007TG-J7
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 14:09:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608145754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bhEBZlRw59W8l/2UaDT9jATc2BhEuCBDSfED564kMpE=;
 b=eKChpgBMC9SANHRzV3sBF10iTmNoDDhlgJMRCpY17+3FHe/u4FY73LgoOIfJo7Y1Akf6we
 GunudaY/asRWk/P1SanexNhI9REJPUHYT+jNcO+tZ0r1PsF+uFTraZAVXnuRnIpwzlrnSY
 QoL1j7lXHW4z8jEAhNOwYivVgPSURNA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-UX3PjRPAPta9R3hyr1el5Q-1; Wed, 16 Dec 2020 14:09:11 -0500
X-MC-Unique: UX3PjRPAPta9R3hyr1el5Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 915AF1005504
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 19:09:10 +0000 (UTC)
Received: from localhost (ovpn-115-226.rdu2.redhat.com [10.10.115.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2636E10013C0;
 Wed, 16 Dec 2020 19:09:09 +0000 (UTC)
Date: Wed, 16 Dec 2020 14:09:08 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH 0/5] i386: simplify Hyper-V enlightenments enablement
Message-ID: <20201216190908.GG3140057@habkost.net>
References: <20201119103221.1665171-1-vkuznets@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201119103221.1665171-1-vkuznets@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 19, 2020 at 11:32:16AM +0100, Vitaly Kuznetsov wrote:
> This series is a part of the previously sent "[PATCH RFC v3 00/23] i386:
> KVM: expand Hyper-V features early":
> https://lists.gnu.org/archive/html/qemu-devel/2020-10/msg02443.html
> 
> We're not ready to merge the full patch set yet because the required
> KVM capability is only queued for 5.11. We can, however, extract the
> part providing 'hyperv=on' option to x86 machine types which is valuable
> on its own. Picking up four other patches from the original RFC to
> minimize the code churn in future (x86_cpu_realizefn()).
> 
> Changes since RFCv3:
> - Rename 'hyperv_features' to 'default_hyperv_features' in X86MachineClass
>   [Eduardo]
> - Move x86_cpu_hyperv_realize() invocation after x86_cpu_expand_features()/
>   x86_cpu_filter_features() as we need to reference cpu_has_vmx().
> 
> Vitaly Kuznetsov (5):
>   i386: move hyperv_vendor_id initialization to x86_cpu_realizefn()
>   i386: move hyperv_interface_id initialization to x86_cpu_realizefn()
>   i386: move hyperv_version_id initialization to x86_cpu_realizefn()
>   i386: move hyperv_limits initialization to x86_cpu_realizefn()
>   i386: provide simple 'hyperv=on' option to x86 machine types

Queued, thanks!

-- 
Eduardo


