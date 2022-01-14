Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC5648E953
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 12:43:14 +0100 (CET)
Received: from localhost ([::1]:35994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8KzB-0004Of-EQ
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 06:43:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n8Kvp-0001ZF-11
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 06:39:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n8Kvm-0000jP-6v
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 06:39:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642160370;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Rk3cMS5M06HvpkEWCOn46ftE6C0vl3UIPWphvupxrV0=;
 b=i4wg301WDogB5hOtzFjH+pwVxECztpWQQfa31efPSk/erLPEV/JZuIB0dT9Awzn0P/IcaE
 b/futdPldbbSMuhS/xoD4h6/07N4iEwCnTrRoUiFwSn+C0+X/4j63FrTUJVRsJHNBAM+Nc
 /xgvSJXuXVvv8C9379HnMgUB8FIppnc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-569-fblWvC4bO7OdsQEy2ORMBQ-1; Fri, 14 Jan 2022 06:39:23 -0500
X-MC-Unique: fblWvC4bO7OdsQEy2ORMBQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A736C6408E;
 Fri, 14 Jan 2022 11:39:21 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.131])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F7F9105B1EF;
 Fri, 14 Jan 2022 11:38:43 +0000 (UTC)
Date: Fri, 14 Jan 2022 11:38:40 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 4/6] migration: Add ram-only capability
Message-ID: <YeFgwNZ497nhNRF7@redhat.com>
References: <20211224111148.345438-1-nikita.lapshin@virtuozzo.com>
 <20211224111148.345438-5-nikita.lapshin@virtuozzo.com>
 <87v8ym36l6.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87v8ym36l6.fsf@dusky.pond.sub.org>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: eduardo@habkost.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@virtuozzo.com, quintela@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, Nikita Lapshin <nikita.lapshin@virtuozzo.com>,
 crosa@redhat.com, hreitz@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 14, 2022 at 12:22:13PM +0100, Markus Armbruster wrote:
> Nikita Lapshin <nikita.lapshin@virtuozzo.com> writes:
> 
> > If this capability is enabled migration stream
> > will have RAM section only.
> >
> > Signed-off-by: Nikita Lapshin <nikita.lapshin@virtuozzo.com>
> 
> [...]
> 
> > diff --git a/qapi/migration.json b/qapi/migration.json
> > index d53956852c..626fc59d14 100644
> > --- a/qapi/migration.json
> > +++ b/qapi/migration.json
> > @@ -454,6 +454,8 @@
> >  #
> >  # @no-ram: If enabled, migration stream won't contain any ram in it. (since 7.0)
> >  #
> > +# @ram-only: If enabled, only RAM sections will be sent. (since 7.0)
> > +#
> 
> What happens when I ask for 'no-ram': true, 'ram-only': true?

So IIUC

  no-ram=false, ram-only=false =>  RAM + vmstate
  no-ram=true, ram-only=false => vmstate
  no-ram=false, ram-only=true =>  RAM
  no-ram=true, ram-only=true => nothing to send ?

I find that the fact that one flag is a negative request and
the other flag is a positive request to be confusing.

If we must have two flags then could we at least use the same
style for both. ie either

  @no-ram
  @no-vmstate

Or

  @ram-only
  @vmstate-only

Since the code enforces these flags are mutually exclusive
though, it might point towards being handled by a enum

  { 'enum': 'MigrationStreamContent',
    'data': ['both', 'ram', 'vmstate'] }

none of these approaches are especially future proof if we ever
need fine grained control over sending a sub-set of the non-RAM
vmstate. Not sure if that matters in the end.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


