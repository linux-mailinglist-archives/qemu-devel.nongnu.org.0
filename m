Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEEE64C7F6
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 12:29:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Pw5-0001FH-6T; Wed, 14 Dec 2022 06:28:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p5Pw2-0001El-HU
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 06:28:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p5Pw0-00043N-Me
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 06:28:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671017303;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dts/Q99oaATtmofFqXuoqoz5WiUS6Sorl0Osx0VHQNk=;
 b=Ke+W1QyN7GrYeWYdPz2XPjnRwAJVmH6NLpxaWrx6KTIs6SUSivcL3mMIF/xoByxobGPOgp
 iULC6v8jukE/6lWygOtjOvupiLeK45Gcj2AXsL8BOi3BV/D2PxE/OOwF2tbig6wlpmVvOt
 jKcCpGafBMu+oWezbhMVuADhcip7eqQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-132-i3pe2NaRMv6bEfH5f1sYvA-1; Wed, 14 Dec 2022 06:28:20 -0500
X-MC-Unique: i3pe2NaRMv6bEfH5f1sYvA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F1EA885A588;
 Wed, 14 Dec 2022 11:28:19 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 66665492C14;
 Wed, 14 Dec 2022 11:28:18 +0000 (UTC)
Date: Wed, 14 Dec 2022 11:28:10 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 2/3] qapi, audio: respect build time conditions in audio
 schema
Message-ID: <Y5mzSuv15FBpan0B@redhat.com>
References: <20210302175524.1290840-1-berrange@redhat.com>
 <20210302175524.1290840-3-berrange@redhat.com>
 <62940e7f-60dc-86d7-6007-da0e89dfc6ff@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <62940e7f-60dc-86d7-6007-da0e89dfc6ff@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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

On Mon, Dec 12, 2022 at 05:53:21PM +0100, Thomas Huth wrote:
> On 02/03/2021 18.55, Daniel P. Berrangé wrote:
> > Currently the -audiodev accepts any audiodev type regardless of what is
> > built in to QEMU. An error only occurs later at runtime when a sound
> > device tries to use the audio backend.
> > 
> > With this change QEMU will immediately reject -audiodev args that are
> > not compiled into the binary. The QMP schema will also be introspectable
> > to identify what is compiled in.
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >   audio/audio.c          | 16 +++++++++++++++
> >   audio/audio_legacy.c   | 41 ++++++++++++++++++++++++++++++++++++++-
> >   audio/audio_template.h | 16 +++++++++++++++
> >   qapi/audio.json        | 44 ++++++++++++++++++++++++++++++++----------
> >   4 files changed, 106 insertions(+), 11 deletions(-)
> 
>  Hi Daniel!
> 
> Would you have time to respin this patch for QEMU 8.0 ?

Realistically I'm not going to get it soon. If you want to take over
feel free.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


