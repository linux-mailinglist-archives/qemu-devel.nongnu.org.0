Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9203B4BDB2C
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 18:19:19 +0100 (CET)
Received: from localhost ([::1]:34898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMCLG-0006nB-MB
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 12:19:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nMCEE-0006na-A0
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 12:12:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nMCEB-0005sc-8e
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 12:12:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645463518;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g2u6Nu409F7BI8Ku0Zuy8MMzt9jezwQbDYr3o3eMl88=;
 b=aj5sy8RjqyEkaFZDDMk+AIHnGfcfZTYmCDhb+jeu+XgHX7d4exM/qtRvSA+WxDzWZUWtdX
 2UuhJsQJ+iS3v0uNufp5OIT7FunbJS7FIvIbPWUM1JlQR2Pom9ikah79znM7Or3iHRHDFq
 oJxdPnUO65PjBYb+HAPc+q46aXGOEs8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-53-Vln3IfJDNYuW1BuvbeOAwA-1; Mon, 21 Feb 2022 12:11:54 -0500
X-MC-Unique: Vln3IfJDNYuW1BuvbeOAwA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D6C418460E7;
 Mon, 21 Feb 2022 17:11:53 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.93])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C13A838F5;
 Mon, 21 Feb 2022 17:11:51 +0000 (UTC)
Date: Mon, 21 Feb 2022 17:11:48 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH 08/11] mos6522: add "info via" HMP command for debugging
Message-ID: <YhPH1BYRetB0Ks9C@redhat.com>
References: <20220127205405.23499-1-mark.cave-ayland@ilande.co.uk>
 <20220127205405.23499-9-mark.cave-ayland@ilande.co.uk>
 <YgJWPzFczlDBJV/I@redhat.com>
 <77884339-2f51-1ad0-7461-abd79bb36ef1@ilande.co.uk>
 <YgJmz6neLsF2n2u3@redhat.com>
 <f2114228-2243-2b4f-1869-a50d78a5a8d7@ilande.co.uk>
 <YgJrx2ygQmiF4TYx@redhat.com>
 <21104b5a-c895-337c-619d-e880836d5895@ilande.co.uk>
MIME-Version: 1.0
In-Reply-To: <21104b5a-c895-337c-619d-e880836d5895@ilande.co.uk>
User-Agent: Mutt/2.1.5 (2021-12-30)
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Cc: laurent@vivier.eu, "Dr. David Alan Gilbert \(git\)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Feb 20, 2022 at 05:18:33PM +0000, Mark Cave-Ayland wrote:
> On 08/02/2022 13:10, Daniel P. Berrangé wrote:
> 
> > On Tue, Feb 08, 2022 at 01:06:59PM +0000, Mark Cave-Ayland wrote:
> > > On 08/02/2022 12:49, Daniel P. Berrangé wrote:
> > > 
> > > > > I was under the impression that monitor_register_hmp_info_hrt() does all the
> > > > > magic here i.e. it declares the underlying QMP command with an x- prefix and
> > > > > effectively encapsulates the text field in a way that says "this is an
> > > > > unreliable text opaque for humans"?
> > > > 
> > > > The monitor_register_hmp_info_hrt only does the HMP glue side, and
> > > > that's only needed if you must dynamically register the HMP command.
> > > > For statically registered commands set '.cmd_info_hrt' directly in
> > > > the hml-commands-info.hx for the HMP side.
> > > > 
> > > > > If a qapi/ schema is needed could you explain what it should look like for
> > > > > this example and where it should go? Looking at the existing .json files I
> > > > > can't immediately see one which is the right place for this to live.
> > > > 
> > > > Take a look in qapi/machine.json for anyof the 'x-query-XXXX' commands
> > > > there. The QAPI bit is fairly simple.
> > > > 
> > > > if you want to see an illustration of what's different from a previous
> > > > pure HMP impl, look at:
> > > > 
> > > >     commit dd98234c059e6bdb05a52998270df6d3d990332e
> > > >     Author: Daniel P. Berrangé <berrange@redhat.com>
> > > >     Date:   Wed Sep 8 10:35:43 2021 +0100
> > > > 
> > > >       qapi: introduce x-query-roms QMP command
> > > 
> > > I see, thanks for the reference. So qapi/machine.json would be the right
> > > place to declare the QMP part even for a specific device?
> > > 
> > > Even this approach still wouldn't work in its current form though, since as
> > > mentioned in my previous email it seems that only the target CONFIG_*
> > > defines and not the device CONFIG_* defines are present when processing
> > > hmp-commands-info.hx.
> > 
> > Yeah, that's where the pain comes in.  While QAPI schema can be made
> > conditional on a few CONFIG_* parameters - basically those derived
> > from global configure time options, it is impossible for this to be
> > with with target specific options like the device CONFIG_* defines.
> > 
> > This is why I suggested in my othuer reply that it would need to be
> > done with a generic 'info dev-debug' / 'x-query-dev-debug' command
> > that can be registered unconditionally, and then individual devices
> > plug into it.
> 
> After some more experiments this afternoon I still seem to be falling
> through the gaps on this one. This is based upon my understanding that all
> new HMP commands should use a QMP HumanReadableText implementation and the
> new command should be restricted according to target.
> 
> Currently I am working with this change to hmp-commands-info.hx and
> qapi/misc-target.json:

[snip]
 
> i.e. qmp_marshal_output_HumanReadableText() isn't protected by the #if
> TARGET guards and since HumanReadableText is only used by the new
> qmp_x_query_via() functionality then the compiler complains and aborts the
> compilation.
> 
> Possibly this is an error in the QAPI generator for types hidden behind
> commands using "if"? Otherwise I'm not sure what is the best way to proceed,
> so I'd be grateful for some further pointers.

Yes, this is pretty much what I expect and exactly what I hit with
other target specific commands.

That's why I suggested something like a general 'x-device-debug' command
that is NOT conditionalized in QAPI, against which dev impls can register
a callback to provide detailed reporting, instead of a device type specific
command.



Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


