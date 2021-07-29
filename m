Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EE93DA109
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 12:28:15 +0200 (CEST)
Received: from localhost ([::1]:56938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m93Gw-0001lC-9A
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 06:28:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m93FP-0007wP-Nr
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 06:26:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m93FL-0007pJ-NT
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 06:26:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627554393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zmQO6IXkVzRhqlfFYgtWFR+c0rHmhJ5Z0lLDNYS9kqU=;
 b=Pr0dt6RIQL5zsyKNjpzcgQTdEL4uZT8MV3pXrsBiMKx1GdmWp2zfSFUXw6xUoMlDFv1Bla
 +RxbsAjPebEtiLbMuNzvJ5M1Y+M4suX/zkcoOFURc9GIrgpk7p+fGGRI/ZOafvZjQ6wZQp
 bPRj0GBOYckHK2LR/VhC9prHW9r2Kvc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-5agMVuKzNiCT9eSlGFgJiQ-1; Thu, 29 Jul 2021 06:26:30 -0400
X-MC-Unique: 5agMVuKzNiCT9eSlGFgJiQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C72610066E6;
 Thu, 29 Jul 2021 10:26:29 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-106.ams2.redhat.com
 [10.36.114.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B4D4410016F7;
 Thu, 29 Jul 2021 10:26:28 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2437F1800382; Thu, 29 Jul 2021 12:26:27 +0200 (CEST)
Date: Thu, 29 Jul 2021 12:26:27 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: modular tcg
Message-ID: <20210729102627.ovaimyubcfieaika@sirius.home.kraxel.org>
References: <20210722220952.17444-1-jziviani@suse.de>
 <20210722220952.17444-2-jziviani@suse.de>
 <c26fc6f4-341f-c66f-5384-c811e1342891@suse.de>
 <20210723095231.sfbkhdwdg43nedkk@sirius.home.kraxel.org>
 <4b5c010f-1365-e746-c269-9b9e48771f7b@suse.de>
 <6a3940a4-ca70-343b-5724-0f8f59d6fde4@suse.de>
 <20210723124858.rh63jh2esxahib4e@sirius.home.kraxel.org>
 <20210729091407.n7bdlyw5rsievdch@sirius.home.kraxel.org>
 <d04c1456-e2fb-2b0d-e011-bcdafbacc9ba@suse.de>
MIME-Version: 1.0
In-Reply-To: <d04c1456-e2fb-2b0d-e011-bcdafbacc9ba@suse.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.719, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, richard.henderson@linaro.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Jose R. Ziviani" <jziviani@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > It's basically two groups:
> > 
> >  * Arch-specific (functions taking CPUX86State as argument), most of the
> >    unresolved symbols in target/i386/ and i386/ directories go into this
> >    category.
> 
> Yes, and we need to think about all targets, not just i386.

Sure.  I just want go forward in small steps, so my plan is to tackle
them one by one (starting with i386).

> >  * Common (functions taking CPUState as argument).  Everything else.
> > 
> > The common functions could be added TCGCPUOps to allow them being called via
> 
> TCGCCPUOps are target-specific in their implementation, so I guess
> it's the arch specific part that could be TCGCPUOps (maybe, would need
> deep thinking).

Ok, lets make it three groups then.

  (1) generic interface, arch implementation (this is what we have
      TCGCPUOps hooks right now).
  (2) generic interface, generic implementation (functions taking a
      CPUState as argument, simliar to group (1).
  (3) arch-specific interface and implementation (functions taking a
      CPUX86State argument).

We could add group (2) to TCGCPUOps for this ...

> > CPUClass->tcg_ops->$name instead of a direct symbol reference.  Not sure this
> > is a good idea though.  Experimental patch covering tcg_exec_realizefn +
> > tcg_exec_unrealizefn below.

... but as I sayed, not sure this is the best plan.

Adding group (3) to TCGCPUOps is a non-starter IMHO given that the
function prototypes are arch-specific (using CPUX86State) and also
the interfaces actually needed are arch-specific.  something like
x86_register_ferr_irq or cpu_x86_update_dr7 simply doesn't exist on
!x86.  I guess we'll need TCG${arch}Ops for those.

> > No idea yet how to handle arch-specific bits best.  Seems there is no existing
> > infrastructure to untangle target-specific code and tcg, so this probably needs
> > something new.
> 
> We need target-specific modules. They could at the beginning absorb
> also the non-target specific parts in my view.  So you have a big
> tcg-arm module, a tcg-i386 module etc.
> 
> I think I sketched already the idea in the Makefile I shared before?

We have target-specific modules in master branch.
Used for qtest (all archs) and tcg (i386/x86_64 only, accel ops only).

The build system changes to build more tcg bits modular are here:
https://git.kraxel.org/cgit/qemu/log/?h=sirius/modules-tcg-meson
Doesn't build due unresolved symbols, but shows which code
changes/cleanups/reorganizations are needed for (more) modular tcg.

take care,
  Gerd


