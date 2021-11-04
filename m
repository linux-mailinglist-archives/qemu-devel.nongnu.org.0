Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B13614459AE
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 19:24:55 +0100 (CET)
Received: from localhost ([::1]:33268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mihPy-0007ZJ-Sf
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 14:24:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mihNx-0006hB-NT
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 14:22:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mihNt-00005Z-Al
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 14:22:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636050161;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t6yKkvNHhzIqS2xNPDmEQ99vXtTDaj8sPRBplTl5p4E=;
 b=YFjH4MbUWB0yDedWLKKGMe48r2uBiSVUozTsZN1pFk0lH4YW2Y+QjjLZtQ59/sPWHJTa2Y
 ryLdp4zMNOFLn+sIrfpwmHATEIbWxIfAzg2HhOHsp8cyiXnf11qt0vhyWTrb/+pp2vLY3+
 Iz4bHRJ4BLMhypt6ClaJXay/A0xx7iM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-c55LYKpxMLW3633_TS-qFQ-1; Thu, 04 Nov 2021 14:22:37 -0400
X-MC-Unique: c55LYKpxMLW3633_TS-qFQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8BF8C1922023;
 Thu,  4 Nov 2021 18:22:35 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C3D7B1803D;
 Thu,  4 Nov 2021 18:22:28 +0000 (UTC)
Date: Thu, 4 Nov 2021 18:22:26 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 1/3] sev/i386: Allow launching with -kernel if no OVMF
 hashes table found
Message-ID: <YYQk4rI0sKpxCu78@redhat.com>
References: <20211101102136.1706421-1-dovmurik@linux.ibm.com>
 <20211101102136.1706421-2-dovmurik@linux.ibm.com>
 <YYKynfyEpwn3PRHW@redhat.com> <YYQj4hIiYckbRrZ/@work-vm>
MIME-Version: 1.0
In-Reply-To: <YYQj4hIiYckbRrZ/@work-vm>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Dov Murik <dovmurik@linux.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 04, 2021 at 06:18:10PM +0000, Dr. David Alan Gilbert wrote:
> * Daniel P. Berrangé (berrange@redhat.com) wrote:
> > On Mon, Nov 01, 2021 at 10:21:34AM +0000, Dov Murik wrote:
> > > Commit cff03145ed3c ("sev/i386: Introduce sev_add_kernel_loader_hashes
> > > for measured linux boot", 2021-09-30) introduced measured direct boot
> > > with -kernel, using an OVMF-designated hashes table which QEMU fills.
> > > 
> > > However, if OVMF doesn't designate such an area, QEMU would completely
> > > abort the VM launch.  This breaks launching with -kernel using older
> > > OVMF images which don't publish the SEV_HASH_TABLE_RV_GUID.
> > > 
> > > Instead, just warn the user that -kernel was supplied by OVMF doesn't
> > > specify the GUID for the hashes table.  The following warning will be
> > > displayed during VM launch:
> > > 
> > >     qemu-system-x86_64: warning: SEV: kernel specified but OVMF has no hash table guid
> > > 
> > > Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
> > > Reported-by: Tom Lendacky <thomas.lendacky@amd.com>
> > > ---
> > >  target/i386/sev.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/target/i386/sev.c b/target/i386/sev.c
> > > index eede07f11d..682b8ccf6c 100644
> > > --- a/target/i386/sev.c
> > > +++ b/target/i386/sev.c
> > > @@ -1204,7 +1204,7 @@ bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error **errp)
> > >      int aligned_len;
> > >  
> > >      if (!pc_system_ovmf_table_find(SEV_HASH_TABLE_RV_GUID, &data, NULL)) {
> > > -        error_setg(errp, "SEV: kernel specified but OVMF has no hash table guid");
> > > +        warn_report("SEV: kernel specified but OVMF has no hash table guid");
> > >          return false;
> > 
> > I'm pretty wary of doing this kind of thing.
> > 
> > If someone is using QEMU and they required to have the hashes populated
> > for their use case, they now don't get a fatal error if something goes
> > wrong with the process. This is bad as it hides a serious mistake.
> > 
> > If someone is using QEMU and they don't require to have the hashes
> > populated and they knowingly use a firmware that doesn't support
> > this, they'll now get a irrelevant warning every time they boot
> > QEMU. This is bad because IME users will file bugs complaining
> > about this bogus warning.
> > 
> > 
> > If we genuinely need to support both uses cases, then we should have
> > an explicit command line flag to request the desired behaviour.
> > 
> > This could be a -machine option to indicate that the hashes must
> > be populated.
> > 
> >  - unset: try to populate hashes, *silently* ignore missing table
> >           in ovmf
> >  - set == on: try to populate hashes, report error on missing
> >              table in ovmf
> >   -set == off: never try to populate hashes, nor look for the
> >                table in ovmf
> 
> Or as a property on the sev-guest object.

Yep, I thought of that too, and I'm pretty undecided which is "best".

-machine makes sense as 'kernel' and 'initrd' are properties of
the '-machine' and we're doing stuff related to the.

-object sev-guest makes sense as this is behaviour that's (currently)
specific to SEV.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


