Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 026752D25BD
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 09:22:31 +0100 (CET)
Received: from localhost ([::1]:40756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmYGS-0006LT-V7
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 03:22:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1kmYE7-0005PT-2Z
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 03:20:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1kmYE3-0002kQ-JQ
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 03:20:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607415597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Gdr/p0ARaLnBGXFbgpHS/zgPQ800EfpHeH298wzNMS8=;
 b=e0ahWAKCpeDSuXOsptYWW4iAtxGWYcgnT0Ugk5FoZp0jYp2aT1filbCqQbDMzfs32zOASv
 O3SLKEpnyFybGu+LNfzwIZLDOIfURAzKjH9sltPWsHT/MG6hnbBAEdJysGpKNkQfmnaMZH
 t8R2acHyfbPD30KMnSW8GHcaj44LpHA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-ivXFV40JPACM7tNSIIcK7w-1; Tue, 08 Dec 2020 03:19:55 -0500
X-MC-Unique: ivXFV40JPACM7tNSIIcK7w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03468C299;
 Tue,  8 Dec 2020 08:19:54 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 435565D9E4;
 Tue,  8 Dec 2020 08:19:45 +0000 (UTC)
Date: Tue, 8 Dec 2020 09:19:42 +0100
From: Peter Krempa <pkrempa@redhat.com>
To: Roman Bolshakov <r.bolshakov@yadro.com>
Subject: Re: [PATCH for-6.0] accel: Wire accel to /machine
Message-ID: <20201208081942.GP105758@angien.pipo.sk>
References: <20201207084621.23876-1-r.bolshakov@yadro.com>
 <20201207173849.GC1289986@habkost.net>
 <20201207175007.GO105758@angien.pipo.sk>
 <X881k+IdAzs5O1yQ@SPB-NB-133.local>
MIME-Version: 1.0
In-Reply-To: <X881k+IdAzs5O1yQ@SPB-NB-133.local>
X-PGP-Key-ID: 0xD018682B
X-PGP-Key-Fingerprint: D294 FF38 A6A2 BF40 6C75  5DEF 36EC 16AC D018 682B
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pkrempa@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 libvir-list@redhat.com,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 08, 2020 at 11:13:07 +0300, Roman Bolshakov wrote:
> On Mon, Dec 07, 2020 at 06:50:07PM +0100, Peter Krempa wrote:
> > On Mon, Dec 07, 2020 at 12:38:49 -0500, Eduardo Habkost wrote:
> > > On Mon, Dec 07, 2020 at 11:46:22AM +0300, Roman Bolshakov wrote:
> > > > There's no generic way to query current accel and its properties via QOM
> > > > because there's no link between an accel and current machine.
> > > > 
> > > > The change adds the link, i.e. if HVF is enabled the following will be
> > > > available in QOM:
> > > > 
> > > >   (qemu) qom-get /machine/accel type
> > > >   "hvf-accel"
> > > > 
> > > > Suggested-by: Markus Armbruster <armbru@redhat.com>
> > > > Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> > > > Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
> > > > ---
> > > > 
> > > > Hi,
> > > > 
> > > > this is a follow up patch that deprecates earlier series [1].
> > > > 
> > > 
> > > Is there a reference to the reasoning for dropping the earlier
> > > approach?  Your previous approach seems preferable.
> > 
> > The gist of the discussion before was that deprecating old commands in
> > the same release cycle as introducing the replacement might be
> > problematic if libvirt wants to adapt ASAP and that the new command
> > should be elevated to a intermediate tier of stability, where ACK from
> > libvirt is needed to change it during the same release cycle
> > incompatibly.
> > 
> > That was meant generally for any command, and was started because we had
> > a similar issue recently.
> > 
> > My intention definitely was not to change the patch itself, but more a
> > process change so that we can keep cooperating on new stuff rapidly, but
> > without actually breaking what we do.
> > 
> 
> Thanks Peter,
> 
> I'll drop deprecation patch in v2 of query-accel QMP command.

Actually In the discussion my stance is that you can deprecate the
old command itself, but starting from that point any semantic changes to
query-accel must be consulted with libvirt as if query-accel was already
released.

We do want to develop the use of the new command as soon as possible,
because that's beneficial to both sides and can actually show a design
problem in the replacement command, so having us replace it before qemu
releases it is good.

On the other hand once libvirt takes the replacement, we must be
involved in any changes to the command due to de-synced release
shchedules so that there isn't a libvirt which e.g. didnt work.

I specifically don't want to derail any of this collaboration, I just
want to enhance it by all parties knowingly agreeing to the "gentleman's
agreement" since complicating the process would actually be detremental.

The thing is that the command may be changed if we know about it and
e.g. didn't yet commit the replacement. We just need to communicate.


