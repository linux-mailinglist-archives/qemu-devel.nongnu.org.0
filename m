Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 844B8292494
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Oct 2020 11:27:04 +0200 (CEST)
Received: from localhost ([::1]:48098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kURRX-0004at-KK
	for lists+qemu-devel@lfdr.de; Mon, 19 Oct 2020 05:27:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kURQ9-000483-EO
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 05:25:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kURQ7-0008BC-HX
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 05:25:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603099534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S8Vq1Ap8SBigkU/8LGMXA2a9BrKy83dFwogd18gdHco=;
 b=P1kZuBUCKaOiontJW+7h1OxrewZC4wRBQj+j3iKJtHYH36kP0FG8TtdCpwvavMYIhErWHD
 SaanwWP/L0ziKfVZpgY68V2sjx5f9WGnABv77tybBSnRYZFXiP6l8qDj+SyPcgqsD68l3t
 DS3YmM75hc69wfaOjcaO1L5cqp6b1uM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-2BZvLv5HObiGgA1Gim2UDA-1; Mon, 19 Oct 2020 05:25:32 -0400
X-MC-Unique: 2BZvLv5HObiGgA1Gim2UDA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F888800462;
 Mon, 19 Oct 2020 09:25:30 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.193.206])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F4C86EF46;
 Mon, 19 Oct 2020 09:25:28 +0000 (UTC)
Date: Mon, 19 Oct 2020 11:25:25 +0200
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: Kernel patch cases qemu live migration failed.
Message-ID: <20201019092525.ekvgbcwwtm63pueu@kamzik.brq.redhat.com>
References: <20201015040639.70C6D414009F@webmail.sinamail.sina.com.cn>
 <7fecfc67da4caab1d677a8b4cd5386b3@kernel.org>
 <20201015133505.ubxvbrt6xyvl4362@kamzik.brq.redhat.com>
 <16400df4bdf79b8b22e824eb1a20e2b4@kernel.org>
 <20201015144104.ytwzpxjlsgyun3ob@kamzik.brq.redhat.com>
 <CAFEAcA-LBmbjp-Teb35f=O-1QtMLd8bAuq5XaCz9URdQZ1jxow@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-LBmbjp-Teb35f=O-1QtMLd8bAuq5XaCz9URdQZ1jxow@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 01:44:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Marc Zyngier <maz@kernel.org>, xu910121@sina.com,
 qemu-devel <qemu-devel@nongnu.org>, kvmarm <kvmarm@lists.cs.columbia.edu>,
 "Dave.Martin" <dave.martin@arm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 15, 2020 at 03:57:02PM +0100, Peter Maydell wrote:
> On Thu, 15 Oct 2020 at 15:41, Andrew Jones <drjones@redhat.com> wrote:
> > The reporter states neither the source nor destination hardware supports
> > SVE. My guess is that what's happening is the reserved ID register
> > ID_UNALLOCATED(4,4) was showing up in the KVM_GET_REG_LIST count on
> > the old kernel, but the new kernel filters it out. Maybe it is a
> > bug to filter it out of the count, as it's a reserved ID register and
> > I suppose the other reserved ID registers are still showing up?
> 
> Yeah, RES0 ID registers should show up in the list, because otherwise
> userspace has to annoyingly special case them when the architecture
> eventually defines behaviour for them.
> 
> Dave's comment in the kernel commit message
> # ID_AA64ZFR0_EL1 is RO-RAZ for MRS/MSR when SVE is disabled for the
> # guest, but for compatibility with non-SVE aware KVM implementations
> # the register should not be enumerated at all for KVM_GET_REG_LIST
> # in this case.
> seems wrong to me -- for compatibility the register should remain
> present and behave as RAZ/WI if SVE is disabled in the guest,
> the same way it was before the kernel/KVM knew about SVE at all.

Yup, I agree with you and I'll try writing a patch for this.

Thanks,
drew


