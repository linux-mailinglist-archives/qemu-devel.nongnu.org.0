Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA0547438F
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 14:35:07 +0100 (CET)
Received: from localhost ([::1]:57998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx7xR-0001pO-AO
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 08:35:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mx7kf-0007o7-47
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 08:21:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mx7kb-0002Gt-MY
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 08:21:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639488108;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wpqEenkP9sMFUS7JHtJr8Bdumyu8nMCHfzUaNJVYM8s=;
 b=RE1+cOGMXGN9aVdpayhGQIA+rBwrSJ/aUqV1DvN0RXBu0YBIK+UmjOS/ppUMzpwMkqc6Cn
 XoUMybnFrcQ0BAWKgumIzQjvQ5OKSpdyMz0bDjmUOakV4AJOIZs3EAeXlahodup8MIeypH
 8v/m+BtMdimJ1c8q3TbZd/uWbDOVAy0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-247-WwVZ2WuRPi613aPqWRqV1g-1; Tue, 14 Dec 2021 08:21:43 -0500
X-MC-Unique: WwVZ2WuRPi613aPqWRqV1g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8769A3E745;
 Tue, 14 Dec 2021 13:21:42 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.122])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C3DE75BE02;
 Tue, 14 Dec 2021 13:21:40 +0000 (UTC)
Date: Tue, 14 Dec 2021 13:21:38 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Mark Burton <mark.burton@greensocs.com>
Subject: Re: Redesign of QEMU startup & initial configuration
Message-ID: <YbiaYnPTUZ70hC1j@redhat.com>
References: <YbJU5vVdesoGuug9@redhat.com>
 <fb7e946e-6881-0ea3-d824-99693f938165@redhat.com>
 <87czm47a77.fsf@dusky.pond.sub.org> <YbN0zLsDVr3B/s3+@redhat.com>
 <87ilvszg52.fsf@dusky.pond.sub.org>
 <edbfff5c-65df-980c-acee-05055c254636@redhat.com>
 <YbeJ/zTV/n+l2CmH@redhat.com>
 <9AF99888-A4BF-4459-92C1-71E5B76A2C79@greensocs.com>
 <YbiWh8nQDWpMegER@redhat.com>
 <4AED38B2-E2DD-46F7-93AA-622D5F6BB570@greensocs.com>
MIME-Version: 1.0
In-Reply-To: <4AED38B2-E2DD-46F7-93AA-622D5F6BB570@greensocs.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Dec 14, 2021 at 02:11:11PM +0100, Mark Burton wrote:
> 
> 
> > On 14 Dec 2021, at 14:05, Daniel P. Berrangé <berrange@redhat.com> wrote:
> > 
> > On Mon, Dec 13, 2021 at 09:22:14PM +0100, Mark Burton wrote:
> >> 
> >> 
> >>> On 13 Dec 2021, at 18:59, Daniel P. Berrangé <berrange@redhat.com> wrote:
> >>> 
> >>> …. we no longer have to solve everything
> >>> Ourselves. 
> >> 
> >> I support this sentiment.
> >> 
> >> Lets re-factor the code so people can build what they need using an API.
> >> Actually, ‘QEMU’ only need support the existing CLI, and provide a suitable internal API.
> >> If that API was relatively stable, that would help those (few) who maintain a different startup mechanism (but its only a ’nice to have’). (Making that convenient, as Paolo has show, would also be ’nice to have’).
> > 
> > To be clear I do strongly believe that the QEMU project needs
> > to deliver the higher level simplified interface too. I just
> > want that higher level interface to be flexible enough to
> > let end users expand on what it offers, without having to
> > write C code nor having to switch entirely to the low level
> > interface like we do today.
> > 
> > IOW, QEMU needs to deliver more than just a low level building
> > block API.
> 
> Why?
> Clearly it would be nice if “higher level” interfaceS existed in
> the world. Clearly QEMU could provide one, two, or many. But, why
> do you think QEMU ‘must’ provide them?

To serve our users who are not all wanting to be use a management
layer. They want to be using a simple binary to spin up adhoc
VMs. This is the reason why we've kept most of the short option
CLI args in the existing QEMU binaries, despite having more
comprehensive low level replacement args. 

If we just declare we're not going to provide this simple binary
any more, then we're just casting these users adrift. This in
effect means they'll just carry on existing the historical QEMU
binaries and we'll never be able to eliminate them, so we'll be
maintaining two things forever.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


