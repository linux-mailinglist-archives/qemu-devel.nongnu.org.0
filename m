Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FA4298994
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 10:42:29 +0100 (CET)
Received: from localhost ([::1]:59900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kWz1I-00042z-5s
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 05:42:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kWyzG-0002bb-KL
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 05:40:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kWyzD-00054s-Ih
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 05:40:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603705216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oLmsJ99OS0U995klmvtVy0dW5YqlaC5YIIAYkHyV9pA=;
 b=Tfa4I9mkf4hzfDOz7p1wPm0ejdPmSK/X8a4660uvO/iRU0MyJOWhNQEXv46tbFHFz2mYH/
 PJTw5Fu8vATyny1+d38ms//n9R7e+UYM6gLIFDImj8RQmpT3RM+NnV44xfScLZV3aR/vy1
 q7DVb3xWOQKXZMw8KE2+ncml2D1OLvE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-EOTBlP2NNRKZ_HjKtXWNYA-1; Mon, 26 Oct 2020 05:40:14 -0400
X-MC-Unique: EOTBlP2NNRKZ_HjKtXWNYA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 072501009E30;
 Mon, 26 Oct 2020 09:40:13 +0000 (UTC)
Received: from work-vm (ovpn-112-208.ams2.redhat.com [10.36.112.208])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F3FAD1043270;
 Mon, 26 Oct 2020 09:40:07 +0000 (UTC)
Date: Mon, 26 Oct 2020 09:40:05 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH] ACPI: Avoid infinite recursion when dump-vmstate
Message-ID: <20201026094005.GC3277@work-vm>
References: <20201019093156.2993284-1-liangpeng10@huawei.com>
 <20201023180933.2fe23875@redhat.com>
 <20201023185441.GP3038@work-vm>
 <20201023212346.79e54986@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201023212346.79e54986@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/25 21:03:19
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Peng Liang <liangpeng10@huawei.com>, mst@redhat.com, qemu-devel@nongnu.org,
 xiexiangyou@huawei.com, zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Igor Mammedov (imammedo@redhat.com) wrote:
> On Fri, 23 Oct 2020 19:54:41 +0100
> "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> 
> > * Igor Mammedov (imammedo@redhat.com) wrote:
> > > On Mon, 19 Oct 2020 17:31:56 +0800
> > > Peng Liang <liangpeng10@huawei.com> wrote:
> > >   
> > > > There is a field with vmstate_ghes_state as vmsd in vmstate_ghes_state,
> > > > which will lead to infinite recursion in dump_vmstate_vmsd.
> > > > 
> > > > Fixes: a08a64627b ("ACPI: Record the Generic Error Status Block address")
> > > > Reported-by: Euler Robot <euler.robot@huawei.com>
> > > > Signed-off-by: Peng Liang <liangpeng10@huawei.com>
> > > > ---
> > > >  hw/acpi/generic_event_device.c | 3 +--
> > > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > > > 
> > > > diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> > > > index 6df400e1ee16..4b6867300a55 100644
> > > > --- a/hw/acpi/generic_event_device.c
> > > > +++ b/hw/acpi/generic_event_device.c
> > > > @@ -334,8 +334,7 @@ static const VMStateDescription vmstate_ghes_state = {
> > > >      .minimum_version_id = 1,
> > > >      .needed = ghes_needed,
> > > >      .fields      = (VMStateField[]) {
> > > > -        VMSTATE_STRUCT(ghes_state, AcpiGedState, 1,
> > > > -                       vmstate_ghes_state, AcpiGhesState),
> > > > +        VMSTATE_UINT64(ghes_state.ghes_addr_le, AcpiGedState),  
> > > 
> > > not sure its' ok handle it this way,
> > > 
> > > see how it is done with another structure:
> > > 
> > > static const VMStateDescription vmstate_ged_state = {                            
> > >     .name = "acpi-ged-state",                                                    
> > >     .version_id = 1,                                                             
> > >     .minimum_version_id = 1,                                                     
> > >     .fields      = (VMStateField[]) {                                            
> > >         VMSTATE_UINT32(sel, GEDState),                                           
> > >         VMSTATE_END_OF_LIST()                                                    
> > >     }                                                                            
> > > }; 
> > > 
> > > ...
> > > 
> > > VMSTATE_STRUCT(ged_state, AcpiGedState, 1, vmstate_ged_state, GEDState),
> > > 
> > > i.e. it looks like we are missing structure definition for AcpiGhesState
> > > 
> > > CCing David,
> > >  to help with migration magic in case I'm wrong or missed something  
> > 
> > Yeh that's confusing :-)
> > 
> > Given a:
> > 
> >   VMSTATE_STRUCT(a, B, 1, vmstate_c, C)
> > 
> > We're saying there's a field 'a' in type B, and field 'a'
> > should be of type C and be serialised using vmstate_c.
> > 
> > That also means that in any vmstate_c, we're expecting it
> > to be passed a type C generally.
> > 
> > Having said that; you don't need a struct - you can get away
> > with that VMSTATE_UINT64, there's two problems:
> > 
> >   a) That assumes that your ghes always stays that simple.
> >   b) If you wanted to store a Ghes from a number of different
> > parent structures then you're stuck because your vmstate_ghes_state
> > is bound to being a strict field of AcpiGedState.
> > 
> > So yes, it's neatest to do it using a VMSD for AcpiGhesState
> > 
> > And congratulations on finding a loop; I don't think we've ever had one
> > before :-)
> 
> can we make compilation fail in case VMSTATE_STRUCT is used but
> is not actually provided like it was in this case?

There's some type checking by the vmstate_offset_value macro; which I
think would have verified that the 'ghes_state' field in AcpiGedState
really is of type AcpiGhesState; but what we don't have is a type
associated with a given VMStateDescription to know what type of state
it's supposed to be called on.

Dave

> > 
> > Dave
> > 
> > > >          VMSTATE_END_OF_LIST()
> > > >      }
> > > >  };  
> > >   
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


