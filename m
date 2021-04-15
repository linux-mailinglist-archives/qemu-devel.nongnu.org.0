Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FCA360A41
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 15:12:37 +0200 (CEST)
Received: from localhost ([::1]:53956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX1nQ-0006Fw-3h
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 09:12:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lX1lP-00051n-In
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 09:10:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lX1lJ-0005YW-D4
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 09:10:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618492224;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xdnxvJeTvmTI93qf6LXA1rTwvbfDgu74hg2PcT7SRqs=;
 b=Q7HkX1k/9YqGZKeSAROcZmlQKabFp+hXh44QnrUkUPxAaVikPlMy/pkv2IicidADrFtTx1
 HvAxlFgcDuDil/Cf1IDKz94ZZC1Bg6w2l4t/iHvM/HY7/rWHFblvdCxqpCW2jag82k/3DB
 DMGk2CNAqibpddoOdHDumplVvNL3bwA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-vPLUIfV-O_mhsw2Vc67VQw-1; Thu, 15 Apr 2021 09:10:19 -0400
X-MC-Unique: vPLUIfV-O_mhsw2Vc67VQw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 553D58030B5
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 13:10:18 +0000 (UTC)
Received: from redhat.com (ovpn-115-159.ams2.redhat.com [10.36.115.159])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E066F5D9C0;
 Thu, 15 Apr 2021 13:10:09 +0000 (UTC)
Date: Thu, 15 Apr 2021 14:10:06 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 0/8] [RfC] fix tracing for modules
Message-ID: <YHg7LnMeJehqf3sO@redhat.com>
References: <20210121125028.3247190-1-kraxel@redhat.com>
 <20210203163202.GF241524@stefanha-x1.localdomain>
 <20210222151332.vea6cszd4pwtkeno@sirius.home.kraxel.org>
 <YFiHnr/uguP8/Vtz@redhat.com>
 <20210409131245.oqeu4ooueazqfcir@sirius.home.kraxel.org>
 <YHBT2ZLdIesZOR4Q@redhat.com>
 <20210412130759.txvduaibh3yjaig5@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20210412130759.txvduaibh3yjaig5@sirius.home.kraxel.org>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 12, 2021 at 03:07:59PM +0200, Gerd Hoffmann wrote:
> On Fri, Apr 09, 2021 at 02:17:13PM +0100, Daniel P. Berrangé wrote:
> > On Fri, Apr 09, 2021 at 03:12:45PM +0200, Gerd Hoffmann wrote:
> > >   Hi,
> > > 
> > > > eg a trace point "dma_map_wait" gets mapped to probes in many
> > > > .stp files, once per target, because we need to match based on
> > > > the executable path:
> > > > 
> > > >   probe qemu.system.x86_64.dma_map_wait = process("/usr/libexec/qemu-system-x86_64").mark("dma_map_wait")
> > > 
> > > So, that changes with modules, we need the module name now, i.e.
> > > 
> > >     probe qemu.system.x86_64.qxl_soft_reset = \
> > > 	process("/home/kraxel/qemu-install/lib/qemu/hw-display-qxl.so").mark("qxl_soft_reset")
> > > 
> > > We could repeat that in every qemu-system-$arch.stp file.
> > 
> > This would have the surprise the 'qemu.system.x86_64.qxl_soft_reset'
> > probes will fire even for qemu-system-ppc64 / qemu-system-xxxxx etc
> > because we've not restricted the scope as the original probe did.
> 
> Oh, right.
> 
> > If we can't fix that, then we must use the second option to avoid
> > the surprise IMHO
> 
> Yep.  Got that working.  Only problem is qemu-trace-stap is broken now
> and it seems there is no easy way out.  Right now qemu-trace-stap can
> simply work with a constant prefix, with that change the prefix can be
> either qemu.system.$arch or qemu.system.modules and I suspect there is
> no way around listing tracepoints to figure the correct name ...

Maybe just don't change the probe names, and declare that people have
to tell stap to filter by pid if you want exact matches

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


