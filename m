Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B868630D5DA
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 10:08:20 +0100 (CET)
Received: from localhost ([::1]:42862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7E95-0005EJ-Ro
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 04:08:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7E7l-0004NI-MG
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 04:06:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l7E7i-0004Ur-9v
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 04:06:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612343211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KLkQu906pWMpCh21yRIoHcqL1IxvT9FYy1HoJu7jtC0=;
 b=aoL+oiamoO4INnxFCAipKXCCH0NDiAiio4OC2h/VxckxceambbNQ7TUu/BeNHa4I1zL0T7
 X5q1FMsG3t8XdmZCm008ECX/lR0pzQhL7gPIj8bUiTo0FC6zxEEzLTDkj349HJn4csKaia
 r6uy7Zw+4ZndphHz/JDc4sR7+5yoaYs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-534-sAe2l6wXMVypBthXCsZBhA-1; Wed, 03 Feb 2021 04:06:48 -0500
X-MC-Unique: sAe2l6wXMVypBthXCsZBhA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 52D3E107ACE3;
 Wed,  3 Feb 2021 09:06:46 +0000 (UTC)
Received: from work-vm (ovpn-115-70.ams2.redhat.com [10.36.115.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 89D0E60C6B;
 Wed,  3 Feb 2021 09:06:43 +0000 (UTC)
Date: Wed, 3 Feb 2021 09:06:40 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: James Bottomley <jejb@linux.ibm.com>
Subject: Re: [PATCH v2 2/2] sev: update sev-inject-launch-secret to make gpa
 optional
Message-ID: <20210203090640.GA2950@work-vm>
References: <20201214154429.11023-1-jejb@linux.ibm.com>
 <20201214154429.11023-3-jejb@linux.ibm.com>
 <20210126123201.GB4221@work-vm>
 <16a33e2f34ee370be4bbecad017b5760b7d65e81.camel@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <16a33e2f34ee370be4bbecad017b5760b7d65e81.camel@linux.ibm.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
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
Cc: thomas.lendacky@amd.com, ashish.kalra@amd.com, brijesh.singh@amd.com,
 david.kaplan@amd.com, berrange@redhat.com, jon.grimm@amd.com, tobin@ibm.com,
 qemu-devel@nongnu.org, frankeh@us.ibm.com, Dov.Murik1@il.ibm.com,
 pbonzini@redhat.com, dovmurik@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* James Bottomley (jejb@linux.ibm.com) wrote:
> On Tue, 2021-01-26 at 12:32 +0000, Dr. David Alan Gilbert wrote:
> > * James Bottomley (jejb@linux.ibm.com) wrote:
> > > If the gpa isn't specified, it's value is extracted from the OVMF
> > > properties table located below the reset vector (and if this
> > > doesn't
> > > exist, an error is returned).  OVMF has defined the GUID for the
> > > SEV
> > > secret area as 4c2eb361-7d9b-4cc3-8081-127c90d3d294 and the format
> > > of
> > > the <data> is: <base>|<size> where both are uint32_t.  We extract
> > > <base> and use it as the gpa for the injection.
> > > 
> > > Note: it is expected that the injected secret will also be GUID
> > > described but since qemu can't interpret it, the format is left
> > > undefined here.
> > > 
> > > Signed-off-by: James Bottomley <jejb@linux.ibm.com>
> > > 
> > > ---
> > > 
> > > v2: fix line length warning, add more comments about sev area
> > > ---
> > >  qapi/misc-target.json |  2 +-
> > >  target/i386/monitor.c | 27 ++++++++++++++++++++++++++-
> > >  2 files changed, 27 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/qapi/misc-target.json b/qapi/misc-target.json
> > > index 06ef8757f0..0c7491cd82 100644
> > > --- a/qapi/misc-target.json
> > > +++ b/qapi/misc-target.json
> > > @@ -216,7 +216,7 @@
> > >  #
> > >  ##
> > >  { 'command': 'sev-inject-launch-secret',
> > > -  'data': { 'packet-header': 'str', 'secret': 'str', 'gpa':
> > > 'uint64' },
> > > +  'data': { 'packet-header': 'str', 'secret': 'str', '*gpa':
> > > 'uint64' },
> > >    'if': 'defined(TARGET_I386)' }
> > >  
> > >  ##
> > > diff --git a/target/i386/monitor.c b/target/i386/monitor.c
> > > index 1bc91442b1..11bdb04155 100644
> > > --- a/target/i386/monitor.c
> > > +++ b/target/i386/monitor.c
> > > @@ -34,6 +34,7 @@
> > >  #include "sev_i386.h"
> > >  #include "qapi/qapi-commands-misc-target.h"
> > >  #include "qapi/qapi-commands-misc.h"
> > > +#include "hw/i386/pc.h"
> > >  
> > >  /* Perform linear address sign extension */
> > >  static hwaddr addr_canonical(CPUArchState *env, hwaddr addr)
> > > @@ -730,9 +731,33 @@ SevCapability
> > > *qmp_query_sev_capabilities(Error **errp)
> > >      return sev_get_capabilities(errp);
> > >  }
> > >  
> > > +#define SEV_SECRET_GUID "4c2eb361-7d9b-4cc3-8081-127c90d3d294"
> > > +struct sev_secret_area {
> > > +    uint32_t base;
> > > +    uint32_t size;
> > > +};
> > > +
> > >  void qmp_sev_inject_launch_secret(const char *packet_hdr,
> > > -                                  const char *secret, uint64_t
> > > gpa,
> > > +                                  const char *secret,
> > > +                                  bool has_gpa, uint64_t gpa,
> > >                                    Error **errp)
> > >  {
> > > +    if (!has_gpa) {
> > > +        uint8_t *data;
> > > +        struct sev_secret_area *area;
> > > +
> > > +        /*
> > > +         * not checking length means that this area can't be
> > > versioned
> > > +         * by length and would have to be replaced if updated
> > > +         */
> > 
> > Can you just explain that a bit more?
> 
> It's referring back to the original concept that the reset vector
> length would tell you what version of the thing you were using.  So if
> you were looking for a property at offset 10 and the length came in as
> 8 the version was too early.  If it was 18 you had a later version and
> your property was present.
> 
> The current scheme uses guids which can be versioned by length if you
> think you'll add extra properties to them.  This one I don't think
> would ever get an extra property, so there's no point checking the
> length.  Not checking the length means if I'm wrong and we do need an
> extra property it will have to be attached to a new guid.
> 
> That's a bit confusing to add to the comment ... how about I just leave
> out the comment entirely?

Yes, I don't think it makes much sense unless you knew the history.

Dave

> > > +        if (!pc_system_ovmf_table_find(SEV_SECRET_GUID, &data,
> > > NULL)) {
> > > +            error_setg(errp, "SEV: no secret area found in OVMF,"
> > > +                       " gpa must be specified.");
> > > +            return;
> > > +        }
> > > +        area = (struct sev_secret_area *)data;
> > > +        gpa = area->base;
> > > +    }
> > > +
> > >      sev_inject_launch_secret(packet_hdr, secret, gpa, errp);
> > 
> > Other than me not understanding that comment, I think we're fine:
> 
> Thanks.
> 
> > Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > 
> > >  }
> > > -- 
> > > 2.26.2
> > > 
> > > 
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


