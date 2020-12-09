Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C792D4C3F
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 21:55:53 +0100 (CET)
Received: from localhost ([::1]:44026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn6V6-0003tG-Cz
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 15:55:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kn6TV-0003Gy-Af
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 15:54:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kn6TT-00044p-Sa
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 15:54:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607547251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PFSVsnIwhoaZUZkC48sLGxLmJxwAj3aCUeATQewBCR4=;
 b=LCpH1zKrjx79c1ZshZOgFa0BDBG/S/RKJJFAnYVJMxTXjo14fJ8Wn1mkXJkN3w9zYBDTEM
 FLh+XoftI9SeTgUPJuBqBhASBkcKHf1/kLTdtCiG6bWfNsUA9EqjBVaVSwX7g5+oYHdbnV
 FhrZJi18jYo28S8+izkkVSvgtvetRHc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-wlC-KE9iMyWZomuTQD2uww-1; Wed, 09 Dec 2020 15:54:07 -0500
X-MC-Unique: wlC-KE9iMyWZomuTQD2uww-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C737801ADB;
 Wed,  9 Dec 2020 20:54:06 +0000 (UTC)
Received: from localhost (ovpn-120-147.rdu2.redhat.com [10.10.120.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 884BA6064B;
 Wed,  9 Dec 2020 20:54:05 +0000 (UTC)
Date: Wed, 9 Dec 2020 15:54:04 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 1/6] spapr: Add an "spapr" property to sPAPR CPU core
Message-ID: <20201209205404.GY1289986@habkost.net>
References: <20201209170052.1431440-1-groug@kaod.org>
 <20201209170052.1431440-2-groug@kaod.org>
 <de3d6170-3e28-ce78-41a3-59eca3cb6b67@redhat.com>
 <20201209184225.1b544523@bahia.lan>
 <d0f7cde7-c550-4a6c-8730-c3422002516c@redhat.com>
 <b8474a48-5dcd-343e-ef29-531c628b2ff2@redhat.com>
 <20201209182617.GV1289986@habkost.net>
 <20201209212436.2f7a1b6f@bahia.lan>
MIME-Version: 1.0
In-Reply-To: <20201209212436.2f7a1b6f@bahia.lan>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 09, 2020 at 09:24:36PM +0100, Greg Kurz wrote:
> On Wed, 9 Dec 2020 13:26:17 -0500
> Eduardo Habkost <ehabkost@redhat.com> wrote:
> 
> > On Wed, Dec 09, 2020 at 07:11:40PM +0100, Philippe Mathieu-Daudé wrote:
> > [...]
> > > >>>> @@ -200,7 +199,7 @@ static void spapr_cpu_core_reset(DeviceState *dev)
> > > >>>>      int i;
> > > >>>>  
> > > >>>>      for (i = 0; i < cc->nr_threads; i++) {
> > > >>>> -        spapr_reset_vcpu(sc->threads[i]);
> > > >>>> +        spapr_reset_vcpu(sc->threads[i], sc->spapr);
> > > >>>
> > > >>> Why reset() needs access to the machine state, don't
> > > >>> you have it in realize()?
> > > >>>
> > > >>
> > > >> This is for the vCPU threads of the sPAPR CPU core. They don't have the
> > > >> link to the machine state.
> > > > 
> > > > They are created by spapr_create_vcpu() + spapr_realize_vcpu() in
> > > > spapr_cpu_core_realize(), which has sc->spapr set... Am I missing
> > > > something?
> > > 
> > > Anyhow, from a QOM design point of view, resetfn() is not the correct
> > > place to set a property IMHO, so Cc'ing Eduardo.
> > 
> > This patch is not setting the property on resetfn(), it is
> > setting it on CPU core pre_plug().
> > 
> > This is more complex than simply using qdev_get_machine() and I
> > don't see why it would be better, but I don't think it's wrong.
> > 
> 
> The reference to the machine state is basically needed to
> setup/reset/teardown interrupt presenters in the IRQ chip
> backend. It is a bit unfortunate to express this dependency
> at realize(), reset() and unrealize(). Maybe having an
> "irq_chip" property linked to the IRQ chip backend would
> make more sense ?
> 

Considering that the spapr_irq_*() functions get a
SpaprMachineState argument and deal with two interrupt
controllers, maybe you won't be able to save what you need in a
single irq_chip field?

I don't have a strong opinion here.  It feels weird to me to save
a reference to the global machine object that is always
available, but I don't think that's a problem if you believe the
resulting code looks better.

-- 
Eduardo


