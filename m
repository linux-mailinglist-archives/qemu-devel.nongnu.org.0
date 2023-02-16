Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD6B699221
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 11:48:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSbno-0007sj-1G; Thu, 16 Feb 2023 05:47:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pSbnl-0007sI-A3
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 05:47:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pSbnj-0000Wb-68
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 05:47:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676544462;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7PALoh249WFzOor0TX/skYB7G9Qpthgp8yOGUEY7gtY=;
 b=TxvLxRObqN6HQrQgYiTvT8PI+RJmge0/A7tm4QVzKq0LQdhrlFrHXOrsa7aF5hLXdtMYrd
 /swO7e8qad3otGIGwQQ7gjAvrSHGfRztkuCLWudrwSQt09waclgta380febr6lmqcRsqff
 K54TTNv1oPlWxe6ZnxXKe2/68fTjUGs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-253-TsJ7ph3JOwyz_3QsgELqpw-1; Thu, 16 Feb 2023 05:47:38 -0500
X-MC-Unique: TsJ7ph3JOwyz_3QsgELqpw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6CAB5811E6E;
 Thu, 16 Feb 2023 10:47:38 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.164])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D1104010E82;
 Thu, 16 Feb 2023 10:47:36 +0000 (UTC)
Date: Thu, 16 Feb 2023 10:47:34 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Dorinda Bassey <dbassey@redhat.com>, qemu-devel@nongnu.org,
 kraxel@redhat.com, armbru@redhat.com, qemu_oss@crudebyte.com,
 pbonzini@redhat.com, wtaymans@redhat.com
Subject: Re: [PATCH] audio/pwaudio.c: Add Pipewire audio backend for QEMU
Message-ID: <Y+4JxmtoaVMAsBBc@redhat.com>
References: <20230215085102.415053-1-dbassey@redhat.com>
 <Y+zBUaNdzqawzHPs@redhat.com>
 <f65e71ca-e4b8-dcca-5753-c2b225f57775@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f65e71ca-e4b8-dcca-5753-c2b225f57775@msgid.tls.msk.ru>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

On Thu, Feb 16, 2023 at 01:33:47PM +0300, Michael Tokarev wrote:
> 15.02.2023 14:26, Daniel P. Berrangé пишет:
> ..
> > > -       choices: ['alsa', 'coreaudio', 'default', 'dsound', 'jack', 'oss', 'pa', 'sdl', 'sndio'],
> > > +       choices: ['alsa', 'coreaudio', 'default', 'dsound', 'jack', 'oss', 'pa', 'pw', 'sdl', 'sndio'],
> > 
> > I appreciate you probably just followed the example of pulseaudio, abbreviated
> > to 'pa', but I'm not a fan of the existing usage there. So lets be more verbose
> > and say 'pipewire' so users are clear on what this is.
> 
> I'd vote for "pw" here, it is a quite well-known acronym. It is not because "pa"
> is used in qemu, it is because "pa" and now "pw" is used everywhere in context
> of linux sound.

I don't see 'pw' as well known. The package is 'pipewire', the
processes are 'pipewire', the config files are 'pipewire'. The
'pw' abbreviation is too short to be meaningful unless you are
already familiar with pipewire.

> But if there's no need to type it manually every time, it can
> be "pipewire" too.

"pipewire" is not exactly a long word to begin with, and saving
a couple of letters to abbreviate it isn't going to make a
difference in the context of QEMU's command line.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


