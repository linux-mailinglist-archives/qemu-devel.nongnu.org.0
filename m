Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91794338804
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 09:55:37 +0100 (CET)
Received: from localhost ([::1]:57176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKda4-0006GR-MT
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 03:55:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1lKdXZ-0004lF-En
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 03:53:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1lKdXX-0003ZD-U1
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 03:53:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615539177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0Jtf4aeY7AiMil3kzn0AAPvxSjwzZLEZz/8c48+osFo=;
 b=RR34MYPSckzuUk0LTzQ0sTx5vJPoMln/EAOP7t6xhc4qcQx1MNQgpfEa5FcBXHKR2js3qO
 LbaX/tNfopsXODy+SsD1DyxmOxUPN6jaRt6cIo7Yh6q4T//oUtaUp7wfMaJxCityYzAznT
 45Z6ET5L4A9DrPUsdA0RPDgy6KM5NJ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-axdfmyeYNMGZRV-ETYV98g-1; Fri, 12 Mar 2021 03:52:55 -0500
X-MC-Unique: axdfmyeYNMGZRV-ETYV98g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6098A8189C6;
 Fri, 12 Mar 2021 08:52:54 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DF145C255;
 Fri, 12 Mar 2021 08:52:44 +0000 (UTC)
Date: Fri, 12 Mar 2021 09:52:42 +0100
From: Peter Krempa <pkrempa@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 00/30] qapi/qom: QAPIfy --object and object-add
Message-ID: <YEsr2gv8zaayOE/n@angien.pipo.sk>
References: <20210308165440.386489-1-kwolf@redhat.com>
 <YEjWQnWKbr5teciB@angien.pipo.sk>
 <90130a0c-7f96-f344-b185-b790c5d6b78a@redhat.com>
 <20210310173044.GF6076@merkur.fritz.box>
 <87ft12q8kf.fsf@dusky.pond.sub.org>
 <e98a5eb7-4716-a0f4-0ad2-adaa4cd9cefa@redhat.com>
 <87h7lhbx6b.fsf@dusky.pond.sub.org>
 <10fd7cbf-9ee5-3869-22fd-352e42a980ba@redhat.com>
 <871rck7pqw.fsf@dusky.pond.sub.org>
 <82b6906c-956e-89a2-e76f-7ad6695009b0@redhat.com>
MIME-Version: 1.0
In-Reply-To: <82b6906c-956e-89a2-e76f-7ad6695009b0@redhat.com>
X-PGP-Key-ID: 0xD018682B
X-PGP-Key-Fingerprint: D294 FF38 A6A2 BF40 6C75  5DEF 36EC 16AC D018 682B
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Kevin Wolf <kwolf@redhat.com>, lvivier@redhat.com, thuth@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, libvir-list@redhat.com,
 jasowang@redhat.com, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, kraxel@redhat.com, mreitz@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 12, 2021 at 09:46:54 +0100, Paolo Bonzini wrote:
> On 12/03/21 09:14, Markus Armbruster wrote:
> > Paolo Bonzini <pbonzini@redhat.com> writes:
> > 
> > > On 11/03/21 15:08, Markus Armbruster wrote:
> > > > > I would rather keep the OptsVisitor here.  Do the same check for JSON
> > > > > syntax that you have in qobject_input_visitor_new_str, and whenever
> > > > > you need to walk all -object arguments, use something like this:
> > > > > 
> > > > >       typedef struct ObjectArgument {
> > > > >           const char *id;
> > > > >           QDict *json;    /* or NULL for QemuOpts */
> > > > >           QSIMPLEQ_ENTRY(ObjectArgument) next;
> > > > >       }
> > > > > 
> > > > > I already had patches in my queue to store -object in a GSList of
> > > > > dictionaries, changing it to use the above is easy enough.
> > > > 
> > > > I think I'd prefer following -display's precedence.  See my reply to
> > > > Kevin for details.
> > > 
> > > Yeah, I got independently to the same conclusion and posted patches
> > > for that.  I was scared that visit_type_ObjectOptions was too much for
> > > OptsVisitor but it seems to work...
> > 
> > We have reason to be scared.  I'll try to cover this in my review.
> 
> Yes, it's a good reason to possibly even delay those 3 patches to 6.1.

Is there a chance we could get the json syntax for -object for now? I
think it would simplify libvirt's code a bit and sidestep the issue of
converting the already existing parameters from JSON form we have into
the commandline form.


