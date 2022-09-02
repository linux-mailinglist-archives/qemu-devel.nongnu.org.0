Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3185AA764
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 07:52:03 +0200 (CEST)
Received: from localhost ([::1]:49420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTzaz-0004Mt-Iy
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 01:52:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oTzVh-0002qh-0i
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 01:46:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oTzVd-0008WM-QF
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 01:46:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662097588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GQbMdAbOznDhp2gIQyfE7g2JC22UM3Kzh0GxmYb4Rns=;
 b=L0rILEUIL62SR2ye7ws4Q5EXzDcIo4B8IvdlfjBVQcpSp147FYe0uuv818Ml14hmEycmE5
 U7JoCeEcTeQDYrAEhRYmAy8Jir+6QsS+lU2TMInC/Cgpg7G3/Rn9RFaShEVRtBNPHazokA
 lYIrGtDPi6G96HDLcVvgoguDtbINsgM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-192-2SehxyqGP7KfVok80GGkqw-1; Fri, 02 Sep 2022 01:46:24 -0400
X-MC-Unique: 2SehxyqGP7KfVok80GGkqw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 60BB61C04B63;
 Fri,  2 Sep 2022 05:46:23 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EA2DD2166B2B;
 Fri,  2 Sep 2022 05:46:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 97D1F18003AB; Fri,  2 Sep 2022 07:46:21 +0200 (CEST)
Date: Fri, 2 Sep 2022 07:46:21 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Eric Blake <eblake@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, erdemaktas@google.com,
 kvm@vger.kernel.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v1 15/40] i386/tdx: Add property sept-ve-disable for
 tdx-guest object
Message-ID: <20220902054621.yyffxn2vnm74r2b3@sirius.home.kraxel.org>
References: <20220802074750.2581308-1-xiaoyao.li@intel.com>
 <20220802074750.2581308-16-xiaoyao.li@intel.com>
 <20220825113636.qlqmflxcxemh2lmf@sirius.home.kraxel.org>
 <389a2212-56b8-938b-22e5-24ae2bc73235@intel.com>
 <20220826055711.vbw2oovti2qevzzx@sirius.home.kraxel.org>
 <a700a0c6-7f25-dc45-4c49-f61709808f29@intel.com>
 <YxFv6RglTOY3Pevj@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YxFv6RglTOY3Pevj@google.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 02, 2022 at 02:52:25AM +0000, Sean Christopherson wrote:
> On Fri, Sep 02, 2022, Xiaoyao Li wrote:
> > On 8/26/2022 1:57 PM, Gerd Hoffmann wrote:
> > >    Hi,
> > > > For TD guest kernel, it has its own reason to turn SEPT_VE on or off. E.g.,
> > > > linux TD guest requires SEPT_VE to be disabled to avoid #VE on syscall gap
> > > > [1].
> > > 
> > > Why is that a problem for a TD guest kernel?  Installing exception
> > > handlers is done quite early in the boot process, certainly before any
> > > userspace code runs.  So I think we should never see a syscall without
> > > a #VE handler being installed.  /me is confused.
> > > 
> > > Or do you want tell me linux has no #VE handler?
> > 
> > The problem is not "no #VE handler" and Linux does have #VE handler. The
> > problem is Linux doesn't want any (or certain) exception occurrence in
> > syscall gap, it's not specific to #VE. Frankly, I don't understand the
> > reason clearly, it's something related to IST used in x86 Linux kernel.
> 
> The SYSCALL gap issue is that because SYSCALL doesn't load RSP, the first instruction
> at the SYSCALL entry point runs with a userspaced-controlled RSP.  With TDX, a
> malicious hypervisor can induce a #VE on the SYSCALL page and thus get the kernel
> to run the #VE handler with a userspace stack.
> 
> The "fix" is to use an IST for #VE so that a kernel-controlled RSP is loaded on #VE,
> but ISTs are terrible because they don't play nice with re-entrancy (among other
> reasons).  The RSP used for IST-based handlers is hardcoded, and so if a #VE
> handler triggers another #VE at any point before IRET, the second #VE will clobber
> the stack and hose the kernel.
> v
> It's possible to workaround this, e.g. change the IST entry at the very beginning
> of the handler, but it's a maintenance burden.  Since the only reason to use an IST
> is to guard against a malicious hypervisor, Linux decided it would be just as easy
> and more beneficial to avoid unexpected #VEs due to unaccepted private pages entirely.

Hmm, ok, but shouldn't the SEPT_VE bit *really* controlled by the guest then?

Having a hypervisor-controlled config bit to protect against a malicious
hypervisor looks pointless to me ...

take care,
  Gerd


