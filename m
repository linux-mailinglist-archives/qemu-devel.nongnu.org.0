Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFA9662BF2
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 18:00:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEvUP-0004mx-Le; Mon, 09 Jan 2023 11:59:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pEvUN-0004mZ-L9
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 11:59:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pEvUL-0006Jg-JY
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 11:59:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673283548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uxWJtwDf98FHh+dJ9IP8U9INPYTZ5AU0UFy/uiVH1m4=;
 b=bQKmo3P77pwlWpmuzgwbqC9+Z3fIeqqifhoVk+8RWu/ryhewtwZ/nmaH565lq5m6OS70UW
 U403GrP0HsJzE1569a62e+1XvVSO3JpN/XIAM4fpN2qNP50EK6LZ1Mf0JbYRqqRVWkqqJE
 90kMW4V7YZJgaUtNjYK2bD1t3aT58tU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-27-JOTHj4PyP0OFOoAA0ZvdNA-1; Mon, 09 Jan 2023 11:59:06 -0500
X-MC-Unique: JOTHj4PyP0OFOoAA0ZvdNA-1
Received: by mail-wr1-f71.google.com with SMTP id
 q3-20020adfab03000000b002b32e25058dso1432467wrc.5
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 08:59:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uxWJtwDf98FHh+dJ9IP8U9INPYTZ5AU0UFy/uiVH1m4=;
 b=RjuDVnwM1CaVLD6EWOK1Y1ApRa2ow7c4cI3KKUxZlidDsfRcni2wwXGljW1A8hOMdp
 aHPeVGivVPW7NF33ic+/nK5Wz+559shF8pqYBWfs/q5m6uZiQwXlGa7AFn8HC1m2K0ri
 6JHOgwyLWw2WQLLiHpErxr2zuU8rx6D13anbw5L9xo/77swAWKnueQH5cz6+qe7fj/GG
 RyqeBAWdgowowGhLorn6pThOCEw2FTTt8KeR0czoOtg+SUozNMnqOn8/wKaTOs0eLZ+7
 v29a+VRrSyoFjqf6FqCWeTSzilz1NjEy0qIwDUaJiJUvirH1AyTe9S+3i7wrAgY7N2mP
 JeiQ==
X-Gm-Message-State: AFqh2kpSDZw9kdlL9BUHEwv7AJGWDrCsj+Dx9Kttz+5VxMiA0E05um5f
 T/JcrR9bDORfTB8dK5w1XwJXiqFIXvrtY0y7axqMs9CA6tOosNmy6NK2goj9nJGdrcaWJ+VLWqQ
 tenP3Htf9i+w+x4I=
X-Received: by 2002:a5d:6844:0:b0:2a2:5a2:cc10 with SMTP id
 o4-20020a5d6844000000b002a205a2cc10mr14007667wrw.36.1673283545603; 
 Mon, 09 Jan 2023 08:59:05 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsW9mgMzOZuPGgOFy3l3dIop5IgvpVZD7fj7GizFR9LnD9bGr/vpQWzEXhnlXREoXUe4t8Wjw==
X-Received: by 2002:a5d:6844:0:b0:2a2:5a2:cc10 with SMTP id
 o4-20020a5d6844000000b002a205a2cc10mr14007650wrw.36.1673283545319; 
 Mon, 09 Jan 2023 08:59:05 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 o14-20020a5d58ce000000b002879c013b8asm9008949wrf.42.2023.01.09.08.59.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 08:59:04 -0800 (PST)
Date: Mon, 9 Jan 2023 16:59:02 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Stefan Berger <stefanb@linux.ibm.com>, jejb@linux.ibm.com,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 2/2] tpm: add backend for mssim
Message-ID: <Y7xH1i0Uvbo0FUwG@work-vm>
References: <10fbda0f-7c8a-3819-fb22-34a9249ac138@linux.ibm.com>
 <b5d26ab0e54c15c408e9bae136bce969283ed5bd.camel@linux.ibm.com>
 <9fac7d95-d891-413f-93f1-18324c7943ea@linux.ibm.com>
 <a8863d1905aa427543facb68d8892af369262f19.camel@linux.ibm.com>
 <29e99f54-d5e8-b18d-08a6-d24435032272@linux.ibm.com>
 <Y5xH/0bbgFzi+G//@redhat.com>
 <a990f3c8-cca9-86ff-6995-6e49ba90f839@linux.ibm.com>
 <Y5xqgK8UXe28VZQ2@redhat.com>
 <cb752b76-a8d1-b3e0-b9ae-94e136eed7d6@linux.ibm.com>
 <Y5yAz0qzaIW4HwFi@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y5yAz0qzaIW4HwFi@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

* Daniel P. Berrangé (berrange@redhat.com) wrote:
> On Fri, Dec 16, 2022 at 08:32:44AM -0500, Stefan Berger wrote:
> > 
> > 
> > On 12/16/22 07:54, Daniel P. Berrangé wrote:
> > > On Fri, Dec 16, 2022 at 07:28:59AM -0500, Stefan Berger wrote:
> > > > 
> > > > 
> > > > On 12/16/22 05:27, Daniel P. Berrangé wrote:
> > > > > On Thu, Dec 15, 2022 at 03:53:43PM -0500, Stefan Berger wrote:
> > > > > > 
> > > > > > 
> > > > > > On 12/15/22 15:30, James Bottomley wrote:
> > > > > > > On Thu, 2022-12-15 at 15:22 -0500, Stefan Berger wrote:
> > > > > > > > On 12/15/22 15:07, James Bottomley wrote:
> > > > > > > [...]
> > > > > > > > > don't really have much interest in the migration use case, but I
> > > > > > > > > knew it should work like the passthrough case, so that's what I
> > > > > > > > > tested.
> > > > > > > > 
> > > > > > > > I think your device needs to block migrations since it doesn't handle
> > > > > > > > all migration scenarios correctly.
> > > > > > > 
> > > > > > > Passthrough doesn't block migrations either, presumably because it can
> > > > > > > also be made to work if you know what you're doing.  I might not be
> > > > > > 
> > > > > > Don't compare it to passthrough, compare it to swtpm. It should
> > > > > > have at least the same features as swtpm or be better, otherwise
> > > > > > I don't see why we need to have the backend device in the upstream
> > > > > > repo.
> > > > > 
> > > > > James has explained multiple times that mssim is a beneficial
> > > > > thing to support, given that it is the reference implementation
> > > > > of TPM2. Requiring the same or greater features than swtpm is
> > > > > an unreasonable thing to demand.
> > > > 
> > > > Nevertheless it needs documentation and has to handle migration
> > > > scenarios either via a blocker or it has to handle them all
> > > > correctly. Since it's supposed to be a TPM running remote you
> > > > had asked for TLS support iirc.
> > > 
> > > If the mssim implmentation doesn't provide TLS itself, then I don't
> > > consider that a blocker on the QEMU side, merely a nice-to-have.
> > > 
> > > With swtpm the control channel is being used to load and store state
> > > during the migration dance. This makes the use of an external process
> > > largely transparent to the user, since QEMU handles all the state
> > > save/load as part of its migration data stream.
> > > 
> > > With mssim there is state save/load co-ordination with QEMU. Instead
> > > whomever/whatever is managing the mssim instance, is responsible for
> > > ensuring it is running with the correct state at the time QEMU does
> > > a vmstate load. If doing a live migration this co-ordination is trivial
> > > if you just use the same mssim instance for both src/dst to connect to.
> > > 
> > > If doing save/store to disk, the user needs to be able to save the mssim
> > > state and load it again later. If doing snapshots and reverting to old
> > 
> > There is no way for storing and loading the *volatile state* of the
> > mssim device.
> > 
> > > snapshots, then again whomever manages mssim needs to be keeping saved
> > > TPM state corresponding to each QEMU snapshot saved, and picking the
> > > right one when restoring to old snapshots.
> > 
> > This doesn't work.
> > Either way, if it's possible it can be documented and shown how this works.
> > 
> > > 
> > > QEMU exposes enough functionality to enable a mgmt app / admin us> achieve all of this.
> > 
> > How do you store the volatile state of this device, like the current
> > state of the PCRs, loaded sessions etc? It doesn't support this.
> > 
> > > 
> > > This is not as seemlessly integrated with swtpm is, but it is still
> > > technically posssible todo the right thing with migration from QEMU's
> > > POV. Whether or not the app/person managing mssim instance actually
> > > does the right thing in practice is not a concern of QEMU. I don't
> > > see a need for a migration blocker here.
> > 
> > I do see it because the *volatile state* cannot be extracted from
> > this device. The state of the PCRs is going to be lost.
> 
> All the objections you're raising are related to the current
> specifics of the implementation of the mssim remote server.
> While valid, this is of no concern to QEMU when deciding whether
> to require a migration blocker on the client side. This is 3rd
> party remote service that should be considered a black box from
> QEMU's POV. It is possible to write a remote server that supports
> the mssim network protocol, and has the ability to serialize
> its state. Whether such an impl exists today or not is separate.

We would normally want an example of a working implementation though
wouldn't we?

So I think it's fair to at least want some documentation; if it can be
documented and works, fine; if it doesn't work, then it needs a blocker.

Dave

> With regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


