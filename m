Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A0564C873
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 12:53:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5QJN-0001Mt-Fp; Wed, 14 Dec 2022 06:52:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p5QJK-0001Kw-CL
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 06:52:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p5QJI-0001cY-2j
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 06:52:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671018746;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d5L213/xwIH4/vhQyx+32vhPI2FtRiwYSwlXetdvQg8=;
 b=geGODUz0A7i/s5KouYhVAzXf+rgiB6kn77t5H91K5UsnRDsY2KpY5qMjfiFOhFj2XfDv/+
 R7Sbi9ij92bk1jU1wm7R3/wSbuO4eLQixExJ7M/FUJFdJZ6nY69mmuBGqtaQ1FKeHyDIuH
 AMngl9OwdpsHv9+vV4xcXZIn2YdQ5fM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-494-1cvi2HuDMkOQjVkd2jXfKg-1; Wed, 14 Dec 2022 06:52:23 -0500
X-MC-Unique: 1cvi2HuDMkOQjVkd2jXfKg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 419CB85C069;
 Wed, 14 Dec 2022 11:52:23 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 191B014171C0;
 Wed, 14 Dec 2022 11:52:21 +0000 (UTC)
Date: Wed, 14 Dec 2022 11:52:17 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: jejb@linux.ibm.com, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH] tpm: add backend for mssim
Message-ID: <Y5m48UP/E/RuvBHM@redhat.com>
References: <4780481659602f92fffacac66e7dca41ad2787c4.camel@linux.ibm.com>
 <Y5dNC77CubqrfXku@redhat.com>
 <b06d31496117c8dd8b8fe60c4bebd96377ca3ff1.camel@linux.ibm.com>
 <f76810cb-3658-84b0-e4b4-a684dff99f38@linux.ibm.com>
 <8066be497c4c81827b24a672a550a805e06eec68.camel@linux.ibm.com>
 <c3fa7405-7d4c-a686-d4c3-a3ff74864467@linux.ibm.com>
 <92daee895872aab2047c3768a9c67b1839406568.camel@linux.ibm.com>
 <dc520ab2-04db-b8cb-15fd-871bb1da0d1b@linux.ibm.com>
 <d2262d8bd5a1d53cb1d4c32e0424dc8727372265.camel@linux.ibm.com>
 <f7119c81-e571-382b-84c6-628747cd9e0b@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f7119c81-e571-382b-84c6-628747cd9e0b@linux.ibm.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Dec 12, 2022 at 05:02:43PM -0500, Stefan Berger wrote:
> 
> 
> On 12/12/22 16:36, James Bottomley wrote:
> > On Mon, 2022-12-12 at 14:32 -0500, Stefan Berger wrote:
> > > 
> > > 
> > > On 12/12/22 14:12, James Bottomley wrote:
> > > > On Mon, 2022-12-12 at 13:58 -0500, Stefan Berger wrote:
> > > > > On 12/12/22 13:48, James Bottomley wrote:
> > > > > > On Mon, 2022-12-12 at 11:59 -0500, Stefan Berger wrote:
> > > > > > > On 12/12/22 11:38, James Bottomley wrote:
> > > > [...]
> > > > > > > > the kernel use of the TPM, but I'm trying to fix that.  The
> > > > > > > > standard mssim server is too simplistic to do transport
> > > > > > > > layer
> > > > > > > > security, but like everything that does this (or rather
> > > > > > > > doesn't
> > > > > > > > do this), you can front it with stunnel4.
> > > > > > > 
> > > > > > > And who or what is going to set this up?
> > > > > > 
> > > > > > I'm not sure I understand the question.  Stunnel4 is mostly
> > > > > > used to
> > > > > > convert unencrypted proxies like imap on 143 or smtp on 25 to
> > > > > > the
> > > > > > secure version.  Most people who run servers are fairly
> > > > > > familiar
> > > > > > with using it.  It's what IBM used for encrypted migration
> > > > > > initially.  You can run stunnel on both ends, or the qemu side
> > > > > > could be built in using the qemu tls-creds way of doing things
> > > > > > but
> > > > > > anything running the standard MS server would have to front it
> > > > > > with
> > > > > > stunnel still.
> > > > > 
> > > > > So it's up to libvirt to setup stunnel to support a completely
> > > > > different setup than what it has for swtpm already?
> > > > 
> > > > I don't think so, no.  Libvirt doesn't usually help with server
> > > > setup (witness the complexity of setting up a server side vtpm
> > > > proxy) so in the case tls-creds were built in, it would just work
> > > > if the object is
> > > 
> > > I see, so you are extending the TPM emulator with TLS on the client
> > > side so you don't need another tool to setup a TLS connection from
> > > the QEMU/client side.
> > 
> > I didn't say I would do this, just that it's an easy possibility with
> > the current qemu framework.  I actually need to fiddle with the TPM
> > externally to do some of my testing (like platform reset injection) so
> > I won't use TLS anyway.
> > 
> > > Is the server side across the network or on the same host?
> > 
> > It can be either.
> 
> For the remote TPM you'll need some sort of management stack (who
> is building this?) that does the port assignments (allocations and
> freeing, starting of TPM instances etc) for the possibly many TPMs
> you would run on a remote machine and then create the libvirt XML
> or QEMU command line with the port assignments. I am not sure I
> see the advantage of this versus what we have at the moment with a
> single management stack . Also, if you did this you'd have a single
> point of failure for many VMs whose TPM is presumably running on
> some dedicated machine(s).

IMHO this is largely tangential. Remote access is technically possible,
but local access is likely the common case. It isn't neccessary to
solve the full remote mgmt solution as a pre-condition for this
proposed patch.

All that matters is whether it is valuable to have the mssim backend
in QEMU. I think the benefit is weak when considering a full virt
mgmt stack like OpenStack/KubeVirt, as swtpm basically solves
everything people need to commonly do AFAICT.

None the less, I can understand why it is desirable to have the option
be able to run against the TPM reference implementation, for the sake
of testing behavioural compliance.

It is a shame there isn't a standardized protocol for software TPM
communication, as that'd avoid the need for multiple backends.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


