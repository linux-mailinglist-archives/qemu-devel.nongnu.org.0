Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3362AF548
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 16:43:53 +0100 (CET)
Received: from localhost ([::1]:42514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcsHo-0008PW-LG
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 10:43:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kcsGR-0007TU-3I
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 10:42:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kcsGO-0003d6-Tj
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 10:42:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605109344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i+G8L1/Eialvw0lW/R6YSYbADwdkDSxG/tQCXaNTs9o=;
 b=OKpnjhEqpOi59zvP+Y7JsaFC7Y22Pnq1QcBJ99emQby218+CTP+irFqfOKrIl6cmEA+dgm
 eQ+Q82oeBBrCuSYOLKXRaI8r+8boaNCXyxtsIqArJXyOD7N0AgsRgR/mMW8Od/r+hFpcNC
 7xMwmt5qp+7ryoTAAvMWRULgJgxMVns=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-1du4iv4jMiW-bzTjs_ZUuw-1; Wed, 11 Nov 2020 10:42:20 -0500
X-MC-Unique: 1du4iv4jMiW-bzTjs_ZUuw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5B2F57083;
 Wed, 11 Nov 2020 15:42:18 +0000 (UTC)
Received: from work-vm (ovpn-113-88.ams2.redhat.com [10.36.113.88])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6684219C71;
 Wed, 11 Nov 2020 15:42:02 +0000 (UTC)
Date: Wed, 11 Nov 2020 15:41:59 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC v3] VFIO Migration
Message-ID: <20201111154159.GG3232@work-vm>
References: <20201110095349.GA1082456@stefanha-x1.localdomain>
 <20201111125626.GC3232@work-vm>
 <20201111153438.GD1421166@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <20201111153438.GD1421166@stefanha-x1.localdomain>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: John G Johnson <john.g.johnson@oracle.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, mtsirkin@redhat.com,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 quintela@redhat.com, Jason Wang <jasowang@redhat.com>, "Zeng,
 Xin" <xin.zeng@intel.com>, qemu-devel@nongnu.org,
 Yan Zhao <yan.y.zhao@intel.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Felipe Franciosi <felipe@nutanix.com>,
 Christophe de Dinechin <dinechin@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Stefan Hajnoczi (stefanha@redhat.com) wrote:
> On Wed, Nov 11, 2020 at 12:56:26PM +0000, Dr. David Alan Gilbert wrote:
> > * Stefan Hajnoczi (stefanha@redhat.com) wrote:
> > > Orchestrating Migrations
> > > ------------------------
> > > In order to migrate a device a *migration parameter list* must first be built
> > > on the source. Each migration parameter is added to the list if it is in
> > > effect. For example, the migration parameter list for a device with
> > > new-feature=off,num-queues=4 would be num-queues=4 if the new-feature migration
> > > parameter was introduced with the off value disabling its effect.
> > 
> > What component builds that list (i.e. what component needs to know the
> > history that new-feature=off was the default - ah I think you answer
> > that below).
> 
> Yep. Thanks for noting this. I'll need to reorder things so it is clear.
> 
> > > The following conditions must be met to establish migration compatibility:
> > > 
> > > 1. The source and destination device model strings match.
> > > 
> > > 2. Each migration parameter name from the migration parameter list is supported
> > >    by the destination. For example, the destination supports the num-queues
> > >    migration parameter.
> > > 
> > > 3. Each migration parameter value from the migration parameter list is
> > >    supported by the destination. For example, the destination supports
> > >    num-queues=4.
> > 
> > Hmm, are combinations of parameter checks needed - i.e. is it possible
> > that a destination supports    num-queues=4 and  new-feature=on/off -
> > but only supports new-feature=on when num-queues>2 ?
> 
> Yes, it's possible but cannot be expressed in the migration info JSON.
> 
> We need to choose a level of expressiveness that will be useful enough
> without being complex. In the extreme the migration info would contain
> Turing complete validation expressions (e.g. JavaScript) so that any
> relationship can be expressed, but I doubt that complexity is needed.
> The other extreme is just booleans and (opaque) strings for maximum
> simplicity.
> 
> If the syntax is not expressive enough then it's impossible to check
> migration compatibility without actually creating a new device instance
> on the destination. Daniel Berrange raised the requirement of checking
> migration compatibility without creating the device since this helps
> with selecting a migration destination.

Right, but my worry isn't the JSON description, it's the set of 3
conditions above; they need to state that only some combinations need to
be valid.

> 
> > > The migration compatibility check can be performed without initiating a
> > > migration. Therefore, this process can be used to select the migration
> > > destination.
> > > 
> > > The following steps perform the migration:
> > > 
> > > 1. Configure the destination so it is prepared to load the device state,
> > >    including applying the migration parameter list. This may involve
> > >    instantiating a new device instance or resetting an existing device instance
> > >    to a configuration that is compatible with the source.
> > > 
> > >    The details of how to do this for VFIO/mdev drivers and vfio-user device
> > >    backend programs is described below.
> > > 
> > > 2. Save the device state on the source and load it on the destination.
> > 
> > Which is true for almost everything, unles sit turned out to have
> > significant amounts of RAM on board;  do we have a way to deal with that
> > for vfio/vhost-user - where it needs to be iterative? (Lets just ignore
> > this for now)
> 
> Step 2 includes iterative migration. I should have mentioned that in the
> document.

OK.

> > > "allowed_values"
> > >   The list all values that the device implementation accepts for this migration
> > >   parameter. Integer ranges can be described using "<min>-<max>" strings.
> > > 
> > >   Examples: ['a', 'b', 'c'], [1, 5, 7], ['0-255', 512, '1024-2048'], [true]
> > > 
> > >   This member is optional. When absent, any value suitable for the type may be
> > >   given but the device implementation may refuse certain values.
> > 
> > JSON isn't a great choice for specifying ranges of integers
> 
> Agreed :)
> 
> > > The device is instantiated by launching the destination process with the
> > > migration parameter list from the source:
> > > 
> > > .. code:: bash
> > > 
> > >   $ my-device --m-<param1>=<value1> --m-<param2> <value2> [...]
> > > 
> > > This example shows how to instantiate the device with migration parameters
> > > ``param1`` and ``param2``. Both ``--m-<param>=<value>`` and ``--m-<param>
> > > <value>`` option formats are accepted.
> > > 
> > > The ``--m-`` prefix is used to allow the device emulation program to implement
> > > device implementation-specific command-line options without conflicting with
> > > the migration parameter namespace.
> > 
> > That feels like an odd syntax to me.
> 
> Unfortunately we cannot use --<param>. I also considered using a JSON
> input file but that makes it harder to invoke the device emulation
> program manually for testing/development. I bet I'd have to look up the
> JSON syntax every time whereas it's easy to remember how to format a
> command-line parameter.
> 
> The other one I considered was using '--' or another marker to separate
> device implementation-specific command-line arguments from migration
> parameters. However, doing so places requirements on the device
> emulation program's command-line parsing library and I think people will
> be unhappy if their favorite Go, Rust, Python, etc library cannot handle
> the command-line options due to our weird syntax.
> 
> Any ideas for a better syntax?

I'd be happy with a --param name=value   repeatedly, but also know that
some option parsers don't like that.

> > > When preparing for migration on the source, each migration parameter from the
> > > migration info JSON is added to the migration parameter list if its value
> > > differs from "off_value". If a migration parameter in the list is not available
> > > on the destination, then migration is not possible. If a migration parameter
> > > value is not in the destination "allowed_values" migration_info.json then
> > > migration is not possible.
> > > 
> > > On the destination, a command-line is generated from the migration parameter
> > > list. For each destination migration parameter missing from the migration
> > > parameter list a command-line option is added with the destination "off_value".
> > > The device emulation program prints an error message to standard error and
> > > terminates with exit status 1 if the device could not be instantiated.
> > 
> > I still don't think this revision answers the question of how a VM
> > management program picks a sane set of parameter values for a new VM
> > it's creating, especially if it wants it to be migratable.  That's
> > something your version stuff in V1 seemed nice for.
> 
> Good point. If we're creating a VM and expect to migrate between two
> device implementations, how do we choose the migration parameters?
> 
> I can see a solution for that: grab the set of "init_values" from both
> device implementations and use the one that both accept. This is O(N^2)
> so it's not great when there are many device implementations involved.
> It's O(N) with version numbers because you can keep an intersection set
> of supported version numbers.

Which is actually more complex if there's only some combinations that
work.

> This point definitely needs to be included in the document. Is my answer
> acceptable or do you think versions are really needed?
> 
> It's also hard to answer "which of these two migration parameter lists
> is better/more modern?" without versions when non-bool migration
> parameters are involved.

Dave

> Stefan


-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


