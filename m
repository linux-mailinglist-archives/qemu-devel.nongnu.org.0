Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6C54ABD1A
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 12:56:43 +0100 (CET)
Received: from localhost ([::1]:56382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH2dO-0004A5-FG
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 06:56:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nH2Vj-0005C8-Gq
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 06:48:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nH2Vg-00040V-6e
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 06:48:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644234523;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5twVBvPXrV/PAxnzkwfJDNh03x4yf4gkgFowFEXJd8g=;
 b=Qv+CcHe76caNk8FmNSQNBO9wCeW/tIz1CGtMewSvAbGfOF4A3Pzj0SvkjzxqpMPwYzwNcR
 0d+k5hPPScyZ4AcpMcQosODaDpMS2ed0+7hhCRUD7IeiE69gHeO2xL7A1O118yY+QpkJqr
 Y7XfAZ1oD/3blXMVpVXGDyXyxTN3ZQU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-348-UgYyGxPROTaE0FH8Vyfkpg-1; Mon, 07 Feb 2022 06:48:36 -0500
X-MC-Unique: UgYyGxPROTaE0FH8Vyfkpg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B92B98143EA;
 Mon,  7 Feb 2022 11:48:35 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B811A2AAA3;
 Mon,  7 Feb 2022 11:48:32 +0000 (UTC)
Date: Mon, 7 Feb 2022 11:48:27 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v4 2/4] hw/i386: Attach CPUs to machine
Message-ID: <YgEHC81neFAk4dHk@redhat.com>
References: <20220205124526.500158-1-f4bug@amsat.org>
 <20220205124526.500158-3-f4bug@amsat.org>
 <20220207091437.52cf36b1@redhat.com>
 <20220207101843.259f517c@redhat.com>
 <YgDoKlkP9Isdjnv8@angien.pipo.sk>
 <20220207122222.58903ec7@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220207122222.58903ec7@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Yang Zhong <yang.zhong@intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Peter Krempa <pkrempa@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 07, 2022 at 12:22:22PM +0100, Igor Mammedov wrote:
> On Mon, 7 Feb 2022 10:36:42 +0100
> Peter Krempa <pkrempa@redhat.com> wrote:
> 
> > On Mon, Feb 07, 2022 at 10:18:43 +0100, Igor Mammedov wrote:
> > > On Mon, 7 Feb 2022 09:14:37 +0100
> > > Igor Mammedov <imammedo@redhat.com> wrote:
> > >   
> > > > On Sat,  5 Feb 2022 13:45:24 +0100
> > > > Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
> > > >   
> > > > > Previously CPUs were exposed in the QOM tree at a path
> > > > > 
> > > > >   /machine/unattached/device[nn]
> > > > > 
> > > > > where the 'nn' of the first CPU is usually zero, but can
> > > > > vary depending on what devices were already created.
> > > > > 
> > > > > With this change the CPUs are now at
> > > > > 
> > > > >   /machine/cpu[nn]
> > > > > 
> > > > > where the 'nn' of the first CPU is always zero.    
> > > > 
> > > > Could you add to commit message the reason behind the change?  
> > > 
> > > regardless, it looks like unwarranted movement to me
> > > prompted by livirt accessing/expecting a QOM patch which is
> > > not stable ABI. I'd rather get it fixed on libvirt side.
> > > 
> > > If libvirt needs for some reason access a CPU instance,
> > > it should use @query-hotpluggable-cpus to get a list of CPUs
> > > (which includes QOM path of already present CPUs) instead of
> > > hard-codding some 'well-known' path as there is no any guarantee 
> > > that it will stay stable whatsoever.  
> > 
> > I don't disagree with you about the use of hardcoded path, but the way
> > of using @query-hotpluggable-cpus is not really aligning well for how
> > it's being used.
> >
> > To shed a bit more light, libvirt uses the following hardcoded path
> > 
> > #define QOM_CPU_PATH  "/machine/unattached/device[0]"
> > 
> > in code which is used to query CPU flags. That code doesn't care at all
> > which cpus are present but wants to get any of them. So yes, calling
> > query-hotpluggable-cpus is possible but a bit pointless.
> 
> Even though query-hotpluggable-cpus is cumbersome
> it still lets you avoid hardcodding QOM path and let you
> get away with keeping "_400 QMP calls" probing while
> something better comes along.
> 
> 
> > In general the code probing cpu flags via qom-get is very cumbersome as
> > it ends up doing ~400 QMP calls at startup of a VM in cases when we deem
> > it necessary to probe the cpu fully.
> > 
> > It would be much better (And would sidestep the issue altoghether) if we
> > had a more sane interface to probe all cpu flags in one go, and ideally
> > the argument specifying the cpu being optional.
> > 
> > Libvirt can do the adjustment, but for now IMO the path to the first cpu
> > (/machine/unattached/device[0]) became de-facto ABI by the virtue that
> > it was used by libvirt and if I remember correctly it was suggested by
> > the folks dealing with the CPU when the code was added originally.
> I would've argued against that back then as well,
> there weren't any guarantee and I wouldn't like precedent of
> QOM abuse becoming de-facto ABI.
> Note: this patch breaks this so called ABI as well and introduces
> yet another harcodded path without any stability guarantee whatsoever.

AFAIK, we've never defined anything about QOM paths wrt ABI one way
or the other ? In the absence of guidelines then it comes down to
what are reasonable expectations of the mgmt app. These expectations
will be influenced by what it is actually possible to acheive given
our API as exposed.

I think it is unreasonable to expect /machine/unattached to be
stable because by its very nature it is just a dumping ground
for anything where the dev hasn't put in any thought to the path
placement.  IOW, it was/is definitely a bad idea for libvirt to
rely on /machine/unattached in any way. That we're liable to be
broken is not nice, but its really our own fault - we should 
have asked for a better solution from day one here.


I think it is somewhat reasonable to expect other QOM paths to
be stable as there's been some degree of thought put into their
placement. If we don't want apps to be considering other
paths to be stable, then we need to explain exactly what they
can and can't rely on, and most importantly actually provide
a way for them to do what they need


For example, libvirt needs a QOM path to query memory balloon
stats. All libvirt knows is that it set 'id=balloon0' when
creating it on the CLI. To find the balloon device in QOM it
then looks for all paths under '/machine/peripheral', and
tries to find one called 'child<$ID>' where $ID is the id=xxx
value from the CLI.

We do the same dance when we need to find out where thue
default VGA device we created lives.

This all feels kinda silly as we're going through a dance to
dynamically find the device, but in practice it is no better
than just hardcoding it.

The problem we face in these examp\les is that as an input we
are giving QMEU a device 'id' but at runtime we're needing to
then use a QOM path instead of the 'id'. So we need a way to
translate an 'id' to a QOM path. What is the right way to do
this in a supported manner without making any assumptions
about QOM paths ?


For the CPUs cases, we don't have any 'id' on the CLI since
CPUs aren't configured that way, so we just hardcoded the
full path. You've pointed out query-hotpluggable-cpus which
is a possible solution.

In another case we're assuming that '/machine' has a property
called 'rtc-time'. IMHO it is reasonable to assume that
'/machine' as a QOM path is stable.

It isn't as simple as just saying "all QOM paths are unstable".

I struggle to come up with a good rule to explain what apps can
/ can't rely on wrt QOM paths, other than stay far away from
anything with '/unattached'.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


