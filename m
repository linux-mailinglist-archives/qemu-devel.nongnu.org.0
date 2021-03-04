Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FAC32D219
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 12:58:27 +0100 (CET)
Received: from localhost ([::1]:48894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHmcc-0008KW-Dr
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 06:58:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lHmb0-0007hD-Ex
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 06:56:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lHmat-0005a2-4Z
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 06:56:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614858996;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G2LCPAnfiGD5mDu/l0Bnm1ZFW219WaFgWDU4p03qmNs=;
 b=Zs6ddF1+g+pAqICdC9FrMrsPseM56Te9G/M0OCy993U2o7esgcONsTkP5UXAuKqnqCPQpn
 Wv3w2wpVEQR/v0/xI4ohRDQleM63Z48TrfooMAfwWseqtlm6pjptvFINv5mCKPNcFA4Ryf
 0t63REkjaCSNb3tDFr3fdGd0KCTL3Ic=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-7LGnR57gM4er0EBIfV4-DQ-1; Thu, 04 Mar 2021 06:56:32 -0500
X-MC-Unique: 7LGnR57gM4er0EBIfV4-DQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E94D58143F1;
 Thu,  4 Mar 2021 11:56:30 +0000 (UTC)
Received: from redhat.com (ovpn-115-33.ams2.redhat.com [10.36.115.33])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A0F86060F;
 Thu,  4 Mar 2021 11:56:26 +0000 (UTC)
Date: Thu, 4 Mar 2021 11:56:23 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v2] Autoconnect jack ports by default
Message-ID: <YEDK58TwwX+nnZm3@redhat.com>
References: <20210224191927.19271-1-koalinux@gmail.com>
 <5436901.4e4U2xeZI5@silver>
 <20210303071306.h6nmeoau447w4j4b@sirius.home.kraxel.org>
 <1992957.OTMv4WkKIP@silver>
MIME-Version: 1.0
In-Reply-To: <1992957.OTMv4WkKIP@silver>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Geoffrey McRae <geoff@hostfission.com>, qemu-devel@nongnu.org,
 =?utf-8?B?Sm9zw6k=?= Pekkarinen <koalinux@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 04, 2021 at 12:24:44PM +0100, Christian Schoenebeck wrote:
> On Mittwoch, 3. März 2021 08:13:06 CET Gerd Hoffmann wrote:
> >   Hi,
> > 
> > > JACK clients with consumer purpose often auto connect to system ports by
> > > default because their users mostly use JACK just as a consumer desktop
> > > sound server. And I assume this applies to José as well.
> > 
> > Hmm, ok.  I'd suggest to simply change the default for connect-ports
> > then, that'll allow the user to easily change the behavior by setting
> > connect-ports to something else (including the empty string to disable
> > autoconnect).
> > 
> > take care,
> >   Gerd
> 
> Geoffrey, any chance to make you happy as well? E.g. either reserving "none" 
> as special value for "connect-ports" or an additional CL argument
> "no-connect-ports" to make it appear less hackish?

Adding special semantics for existing options generally ends up being
a bad idea in retrospect.

Inverse boolean options are also not very desirable.

I'd suggest a "auto-connect-ports" boolean option, which defaults to
enabled.


 - auto-connect-ports == true,  connect-ports= <unset>

    => use the proposed default regex for connect ports

 - auto-connect-ports == true, connect-ports = regex

    => use the connect-ports regex

 - auto-connect-ports == false, connect-ports= <unset>

   => don't auto connect at all

 - auto-connect-ports == false, connect-ports=regex

   => logically inconsistent config, report an error

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


