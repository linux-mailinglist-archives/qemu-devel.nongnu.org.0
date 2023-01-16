Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F8466B990
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 09:59:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHLKT-0008JR-GV; Mon, 16 Jan 2023 03:58:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pHLKR-0008JG-9L
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 03:58:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pHLKP-00080m-Py
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 03:58:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673859532;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YeD/Hr1Vybu23piKpZ0atu994CJ7rr+FnaElH4OwUlQ=;
 b=DD6XAk2P3nmCTT60fvZPwynlvRM1mBfRdqr9JrdMYMTDU5/A0DQEthU8byzPk00hlS3X/p
 /2w+UH+RC/rK2+tm39eoL4+QfSFWIkBK256o+3LFKIfmDLMMuO0t8GSXPNmj1FUPin/erB
 OmDKxjDMbwRLz3VcIqpNj1aFZnxpC38=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-439-gTexn_TUOU6xLDUK2N7veQ-1; Mon, 16 Jan 2023 03:58:49 -0500
X-MC-Unique: gTexn_TUOU6xLDUK2N7veQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8635C1871D9F;
 Mon, 16 Jan 2023 08:58:48 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 46B0740C2064;
 Mon, 16 Jan 2023 08:58:47 +0000 (UTC)
Date: Mon, 16 Jan 2023 08:58:45 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Volker =?utf-8?Q?R=C3=BCmelin?= <vr_qemu@t-online.de>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 07/11] audio/audio_template: use g_malloc0() to replace
 audio_calloc()
Message-ID: <Y8URq6bKB5tlDsHR@redhat.com>
References: <3b1404eb-a7c5-f64c-3e47-1397c54c45bb@t-online.de>
 <20221218171539.11193-7-vr_qemu@t-online.de>
 <9b60cdc7-3bd3-6651-2e7e-29673731aabd@linaro.org>
 <e4276dbf-ba7c-0ee4-88f8-4b0cffee46f7@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e4276dbf-ba7c-0ee4-88f8-4b0cffee46f7@t-online.de>
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

On Sun, Dec 18, 2022 at 06:39:00PM +0100, Volker Rümelin wrote:
> Am 18.12.22 um 18:26 schrieb Philippe Mathieu-Daudé:
> > On 18/12/22 18:15, Volker Rümelin wrote:
> > > Use g_malloc0() as a direct replacement for audio_calloc().
> > > 
> > > Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
> > > ---
> > >   audio/audio_template.h | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/audio/audio_template.h b/audio/audio_template.h
> > > index d343a1dcb3..5f51ef26b2 100644
> > > --- a/audio/audio_template.h
> > > +++ b/audio/audio_template.h
> > > @@ -273,7 +273,7 @@ static HW *glue(audio_pcm_hw_add_new_,
> > > TYPE)(AudioState *s,
> > >           return NULL;
> > >       }
> > >   -    hw = audio_calloc(__func__, 1, glue(drv->voice_size_, TYPE));
> > > +    hw = g_malloc0(glue(drv->voice_size_, TYPE));
> > >       if (!hw) {
> > 
> > g_malloc0() can't fail. Either you want g_try_malloc0() or
> > remove the error path.
> > 
> 
> g_malloc0() returns NULL if drv->voice_size_(out|in) is 0. I think the code
> is correct.

IMHO relying on that is rather misleading to people reviewing the code
though. As seen by Philippe's reply, people generally don't expect that
g_malloc0 can return NULL, and it is not at all obvious that we are
intentionally expecting 0 to be passed as a size.

Please make this explicit by removing and if (!hw) check after
g_malloc, and adding a check before g_malloc

   if (audio_bug(__func__, glue(drv->voice_size_, TYPE) == 0)) {
       dolog (...)


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


