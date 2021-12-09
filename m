Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D038546F4EC
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 21:29:29 +0100 (CET)
Received: from localhost ([::1]:59040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvQ2i-00059o-EM
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 15:29:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mvQ1e-0004Sr-56
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 15:28:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mvQ1b-0005iF-Ey
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 15:28:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639081698;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A5PiyoFm3Pe2YsGUClI92aeTooKbhnpiAtwFQfnHpwo=;
 b=it4SY8PvCYECGay21fZLLR3/w1JJ22j+rGaAVJn0YDoXtqBuBtlhcLsIYoLNg1Qug07bYJ
 4ajFyeyfy56CzzGBo8BwtTpClUQTUCEipoL+tfuGNHMaZkY9YFJEhfXJIJTcN86athwj8a
 E2CsQcZdSx6pCs4Jlzr9TLcqij6NKwE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-464-0WagGa9jP6WZaHxm6HJKXw-1; Thu, 09 Dec 2021 15:28:09 -0500
X-MC-Unique: 0WagGa9jP6WZaHxm6HJKXw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36CC710144E2;
 Thu,  9 Dec 2021 20:28:08 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 29EA05E24E;
 Thu,  9 Dec 2021 20:28:05 +0000 (UTC)
Date: Thu, 9 Dec 2021 20:28:03 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Mark Burton <mark.burton@greensocs.com>
Subject: Re: Redesign of QEMU startup & initial configuration
Message-ID: <YbJm0+gK/iLsaBsb@redhat.com>
References: <87lf13cx3x.fsf@dusky.pond.sub.org> <YbJU5vVdesoGuug9@redhat.com>
 <CE6F7A66-A5B9-45CA-9E9D-C8AFFB2976D5@greensocs.com>
MIME-Version: 1.0
In-Reply-To: <CE6F7A66-A5B9-45CA-9E9D-C8AFFB2976D5@greensocs.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
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
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.618,
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

On Thu, Dec 09, 2021 at 09:01:24PM +0100, Mark Burton wrote:
> I’ll take the liberty to cut one part (I agree with much of what you say elsewhere)
> 
> > On 9 Dec 2021, at 20:11, Daniel P. Berrangé <berrange@redhat.com> wrote:
> > 
> > As illustrated earlier, I'd really like us to consider being a bit
> > more adventurous on the CLI side. I'm convinced that a CLI for
> > directly configurable hardware is doomed to be horrible no matter
> > what, if you try to directly expose all QAPI configuration
> > flexibilty. Whether key/value, JSON, whatever, it will become
> > unmanagable on the CLI because VM hardware config is inherantly
> > complicated.
> > 
> 
> I absolutely agree, but reach a slightly different conclusion
> 
> > Thus my though that config files or QMP should be the only two
> > places where the full power of QAPI config is exposed. Use CLI
> > as just a way to interact with config files in a simple way
> > with templates.
> 
> I would countenance that we choose only one place to ‘support’ an interface. Either “Yet Another Hardware Configuration Language” or QAPI. Rather than re-inventing that wheel I would simply suggest that we leave that to the relevant ‘user’ community (libvirt, whatever), who have specific requirements and/or existing solutions. Leaving QEMU itself to focus on improving QAPI (and migrating the CLI). 

Yes, indeed, the logical extension of my idea is that the 'simple'
CLI + templating thing doesn't atually have to be in the main QEMU
binary at all. We could in fact ship a bare '/usr/bin/qemu' which
does the config file templating and spawns whatever full QEMU
binary (/usr/bin/qemu-system-blah) does the real VM.  The key is
just that we have something simple for users, who don't want a
full mgmt layer and like the historical QEMU simple configs.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


