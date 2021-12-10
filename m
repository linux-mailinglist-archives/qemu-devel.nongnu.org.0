Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8FB470411
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 16:42:10 +0100 (CET)
Received: from localhost ([::1]:55086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvi2D-0004pU-PD
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 10:42:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mvi0R-0002Za-0e
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 10:40:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mvi0O-0002R9-Tc
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 10:40:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639150815;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=6TxdopvYwYexByZ5EFI8yh/7ovwgJ99/sjqHYoMnoRU=;
 b=DsfMsGKPm35XXfMmyMIr2kq1DD1j17sH3It4zpAIG62fWQT6HeHbMZWgpD5Quz/hlHdO1U
 LZVUsqI75AHeMxKKOzitzpByMLicRyCP3aaLzdoQxHpm57lv4Ux0WTZyO2fsJmypvS+YsH
 It9nTkvpgMZSo1pauM/2jFHmLWunvhU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-301-8oWtlFqqNkeroFGjOaBM6A-1; Fri, 10 Dec 2021 10:40:08 -0500
X-MC-Unique: 8oWtlFqqNkeroFGjOaBM6A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18041100CE92;
 Fri, 10 Dec 2021 15:40:01 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.153])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DD996E5DD;
 Fri, 10 Dec 2021 15:39:59 +0000 (UTC)
Date: Fri, 10 Dec 2021 15:39:56 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: Redesign of QEMU startup & initial configuration
Message-ID: <YbN0zLsDVr3B/s3+@redhat.com>
References: <87lf13cx3x.fsf@dusky.pond.sub.org> <YbJU5vVdesoGuug9@redhat.com>
 <fb7e946e-6881-0ea3-d824-99693f938165@redhat.com>
 <87czm47a77.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87czm47a77.fsf@dusky.pond.sub.org>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
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
 Mark Burton <mark.burton@greensocs.com>, qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 10, 2021 at 04:26:20PM +0100, Markus Armbruster wrote:
> 
> The existing binary provides bad CLI and limited QMP.
> 
> Going from limited to good QMP involves reworking the startup code.  I
> believe that's easier in a new binary.
> 
> Going from bad CLI to good CLI involves incompatible change.
> Impractical as long as the CLI is a stable interface.  I believe the
> sane way out is a new binary.
> 
> However, I can't see why we'd want to put a good CLI in the old binary
> then.  We could just as well put it in the new binary, or in a wrapper
> program around the new binary.

Having good CLI in a completely new binary is likely to be easier
for users to understand too. The typical pitfall with our existing
binaries is that they provide 4 ways to do the same thing, from
the different points in QEMU's life. This constantly trips up
unsuspecting users and also makes our docs task way more complicated
to think about.

If we're going to have a good CLI, it would ideally only have
one way to do each given task.

No matter what we do we're fighting against a mass of docs
all over the internet talking about 15 years of old QEMU
syntax. If we do a good CLI in a newly named binary, at
least when reading docs, it'll be pretty clear whether
it is talking about the old QEMU or new QEMU binaries,
reducing liklihood of mixing things up.



Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


