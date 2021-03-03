Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F58C32B676
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 11:11:20 +0100 (CET)
Received: from localhost ([::1]:33480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHOTP-0001hX-BH
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 05:11:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lHORT-0000N4-OP
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 05:09:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lHORQ-0007QR-SW
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 05:09:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614766156;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MfWzikx2XsbeaYZG7vhcw4Yv0X5DOWpOW2N2wkNetio=;
 b=K8Esn6Eaoj0wiTBPPGp/1ONHKQ+bHn9HomhkWUl4i7Vy04nBt4RDnL5Dosu2+d5LEIFOSO
 JvAaSCR5dU4zvewG909Ma5z2vy4dkx+pKe52QLTToDZbk9+6qhrUtA/7ZInGLUqlLMJEFM
 3R/8GAHfO6GQyhwjabQslcDLNwkErmQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-9_lHENEpP1G7tkl7YrYX1w-1; Wed, 03 Mar 2021 05:09:14 -0500
X-MC-Unique: 9_lHENEpP1G7tkl7YrYX1w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66955801976;
 Wed,  3 Mar 2021 10:09:13 +0000 (UTC)
Received: from redhat.com (ovpn-115-145.ams2.redhat.com [10.36.115.145])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D80760BFA;
 Wed,  3 Mar 2021 10:09:08 +0000 (UTC)
Date: Wed, 3 Mar 2021 10:09:05 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 2/3] qapi, audio: respect build time conditions in audio
 schema
Message-ID: <YD9gQT2b7f8e8gq8@redhat.com>
References: <20210302175524.1290840-1-berrange@redhat.com>
 <20210302175524.1290840-3-berrange@redhat.com>
 <e3b72b58-8dca-dade-f872-bee8303f075d@redhat.com>
MIME-Version: 1.0
In-Reply-To: <e3b72b58-8dca-dade-f872-bee8303f075d@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: Michael Roth <michael.roth@amd.com>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 02, 2021 at 01:05:45PM -0600, Eric Blake wrote:
> On 3/2/21 11:55 AM, Daniel P. Berrangé wrote:
> > Currently the -audiodev accepts any audiodev type regardless of what is
> > built in to QEMU. An error only occurs later at runtime when a sound
> > device tries to use the audio backend.
> > 
> > With this change QEMU will immediately reject -audiodev args that are
> > not compiled into the binary. The QMP schema will also be introspectable
> > to identify what is compiled in.
> 
> Nice!
> 
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  audio/audio.c          | 16 +++++++++++++++
> >  audio/audio_legacy.c   | 41 ++++++++++++++++++++++++++++++++++++++-
> >  audio/audio_template.h | 16 +++++++++++++++
> >  qapi/audio.json        | 44 ++++++++++++++++++++++++++++++++----------
> >  4 files changed, 106 insertions(+), 11 deletions(-)
> > 
> 
> > +++ b/qapi/audio.json
> > @@ -386,8 +386,24 @@
> >  # Since: 4.0
> >  ##
> >  { 'enum': 'AudiodevDriver',
> > -  'data': [ 'none', 'alsa', 'coreaudio', 'dsound', 'jack', 'oss', 'pa',
> > -            'sdl', 'spice', 'wav' ] }
> > +  'data': [ 'none',
> > +            { 'name': 'alsa',
> > +              'if': 'defined(CONFIG_AUDIO_ALSA)' },
> > +            { 'name': 'coreaudio',
> > +              'if': 'defined(CONFIG_AUDIO_COREAUDIO)' },
> > +            { 'name': 'dsound',
> > +              'if': 'defined(CONFIG_AUDIO_DSOUND)' },
> > +            { 'name': 'jack',
> > +              'if': 'defined(CONFIG_AUDIO_JACK)' },
> > +            { 'name': 'oss',
> > +              'if': 'defined(CONFIG_AUDIO_OSS)' },
> > +            { 'name': 'pa',
> > +              'if': 'defined(CONFIG_AUDIO_PA)' },
> > +            { 'name': 'sdl',
> > +              'if': 'defined(CONFIG_AUDIO_SDL)' },
> > +            { 'name': 'spice',
> > +              'if': 'defined(CONFIG_SPICE)' },
> > +            'wav' ] }
> 
> I'll trust that you compiled multiple times to test the various
> interplays between options.

No, just sent it through gitlab CI which I assumed would cover it

> 
> Reviewed-by: Eric Blake <eblake@redhat.com>

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


