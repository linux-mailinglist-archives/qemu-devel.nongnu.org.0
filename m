Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 064A92AF763
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 18:29:07 +0100 (CET)
Received: from localhost ([::1]:42610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kctvd-0000mu-ER
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 12:29:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kctu1-0008Lk-2m
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 12:27:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kctty-0007WC-33
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 12:27:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605115640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4c686tYS5tIDmTji6kLtJVbgyprpdFEU8e4Ynsxlt1I=;
 b=DTEwOmXmwu1a94ax2+dIfPNRiiu+dhUWFRROBUASM41SL4RsUrWAQNYeFAFL826HJED+Og
 Xn6w21fdG8Ybdr5sWChlymYoddlLRq+NniJs0vsIrD0KgkOXb89BFzFvDqQRwQPvQsK5H9
 RgC4FXGiMWrbMJWFpTfaXIQYB6Yq17I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-M_9evMp3MVisq8CfYSkxNg-1; Wed, 11 Nov 2020 12:27:17 -0500
X-MC-Unique: M_9evMp3MVisq8CfYSkxNg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 107771028D4C;
 Wed, 11 Nov 2020 17:27:15 +0000 (UTC)
Received: from work-vm (ovpn-113-88.ams2.redhat.com [10.36.113.88])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CF867664C;
 Wed, 11 Nov 2020 17:26:37 +0000 (UTC)
Date: Wed, 11 Nov 2020 17:26:35 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH] ACPI: Avoid infinite recursion when dump-vmstate
Message-ID: <20201111172635.GJ3232@work-vm>
References: <20201019093156.2993284-1-liangpeng10@huawei.com>
 <20201023180933.2fe23875@redhat.com>
 <20201023185441.GP3038@work-vm>
 <be52cdde-33de-d519-6509-5f0900ce4c36@huawei.com>
 <20201111140112.GE3232@work-vm>
 <20201111181306.20ebdd77@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201111181306.20ebdd77@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:49:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
> On Wed, 11 Nov 2020 14:01:12 +0000
> "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> 
> > Is someone taking a fix for this in 5.2 - it's breaking vmstate
> > comparison.
> can you merge it via migration tree?

I could; Peng: Could you give a sign-off for this version ?

Dave

> [...]
> 
> for fixed up version below
> Acked-by: Igor Mammedov <imammedo@redhat.com>
> 
> > > 
> > > Do you mean that we need another VMStateDescription to describe
> > > AcpiGhesState instead of using VMSTATE_UINT64 directly?  Maybe like this:
> > > 
> > > diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> > > index 6df400e1ee16..5454be67d5f0 100644
> > > --- a/hw/acpi/generic_event_device.c
> > > +++ b/hw/acpi/generic_event_device.c
> > > @@ -322,6 +322,16 @@ static const VMStateDescription vmstate_ged_state = {
> > >      }
> > >  };
> > > 
> > > +static const VMStateDescription vmstate_ghes = {
> > > +    .name = "acpi-ghes",
> > > +    .version_id = 1,
> > > +    .minimum_version_id = 1,
> > > +    .fields     = (VMStateField[]) {
> > > +        VMSTATE_UINT64(ghes_addr_le, AcpiGhesState),
> > > +        VMSTATE_END_OF_LIST()
> > > +    },
> > > +};
> > > +
> > >  static bool ghes_needed(void *opaque)
> > >  {
> > >      AcpiGedState *s = opaque;
> > > @@ -335,7 +345,7 @@ static const VMStateDescription vmstate_ghes_state = {
> > >      .needed = ghes_needed,
> > >      .fields      = (VMStateField[]) {
> > >          VMSTATE_STRUCT(ghes_state, AcpiGedState, 1,
> > > -                       vmstate_ghes_state, AcpiGhesState),
> > > +                       vmstate_ghes, AcpiGhesState),
> > >          VMSTATE_END_OF_LIST()
> > >      }
> > >  };
> > > 
> > > -- 
> > > Thanks,
> > > Peng
> > >   
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


