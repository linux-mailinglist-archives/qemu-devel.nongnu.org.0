Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C009D5BFD6B
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 13:58:45 +0200 (CEST)
Received: from localhost ([::1]:60992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oayNI-0007oH-1x
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 07:58:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oay8v-0001kJ-P2
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 07:43:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1oay8q-0000us-6C
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 07:43:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663760627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M8texLtq1hBzHUDUbn1p4Gd7zKHsoqvG390lu2DRTuo=;
 b=U83ujrbfBQud2PUoTunfQeZ0fZaxp2BeoZgNmn+bIsIDnu19NeFAzv9PID3ixmNewRyqqo
 PQsCgYaL5XIfPmUDfotqbs1bam4ok00Rril4fM4esibGLaiblzayHgxFZmgHPrUhTOgKQc
 4HNySerKfPkhiRh7HfEieWoLYOlqr04=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-ilaUJKqxMP-uzeDEZfruWg-1; Wed, 21 Sep 2022 07:43:45 -0400
X-MC-Unique: ilaUJKqxMP-uzeDEZfruWg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A4A3862FE1;
 Wed, 21 Sep 2022 11:43:45 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 906F31121314;
 Wed, 21 Sep 2022 11:43:42 +0000 (UTC)
Date: Wed, 21 Sep 2022 13:43:40 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Claudio Fontana <cfontana@suse.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 dinechin@redhat.com, Gerd Hoffmann <kraxel@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v3 2/3] module: add Error arguments to module_load_one
 and module_load_qom_one
Message-ID: <Yyr47JwudwU7JYQq@redhat.com>
References: <20220908145308.30282-1-cfontana@suse.de>
 <20220908145308.30282-3-cfontana@suse.de>
 <062faaa8-064c-f68a-e316-aaacb80efa5a@linaro.org>
 <3c6cb3ee-2470-654f-c2c4-3449861f9781@suse.de>
 <8682ad9f-aea8-0419-5ff6-c14493e4e980@suse.de>
 <YynvR49aIK2AzbJ3@redhat.com> <87r105gwtl.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r105gwtl.fsf@pond.sub.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 21.09.2022 um 06:45 hat Markus Armbruster geschrieben:
> Kevin Wolf <kwolf@redhat.com> writes:
> 
> > Am 08.09.2022 um 19:36 hat Claudio Fontana geschrieben:
> >> On 9/8/22 19:10, Claudio Fontana wrote:
> >> > On 9/8/22 18:03, Richard Henderson wrote:
> >> >> On 9/8/22 15:53, Claudio Fontana wrote:
> >> >>> @@ -446,8 +447,13 @@ static int dmg_open(BlockDriverState *bs, QDict *options, int flags,
> >> >>>           return -EINVAL;
> >> >>>       }
> >> >>>   
> >> >>> -    block_module_load_one("dmg-bz2");
> >> >>> -    block_module_load_one("dmg-lzfse");
> >> >>> +    if (!block_module_load_one("dmg-bz2", &local_err) && local_err) {
> >> >>> +        error_report_err(local_err);
> >> >>> +    }
> >> >>> +    local_err = NULL;
> >> >>> +    if (!block_module_load_one("dmg-lzfse", &local_err) && local_err) {
> >> >>> +        error_report_err(local_err);
> >> >>> +    }
> >> >>>   
> >> >>>       s->n_chunks = 0;
> >> >>>       s->offsets = s->lengths = s->sectors = s->sectorcounts = NULL;
> >> >>
> >> >> I wonder if these shouldn't fail hard if the modules don't exist?
> >> >> Or at least pass back the error.
> >> >>
> >> >> Kevin?
> >> 
> >> is "dmg-bz" _required_ for dmg open to work? I suspect if the dmg
> >> image is not compressed, "dmg" can function even if the extra dmg-bz
> >> module is not loaded right?
> >
> > Indeed. The code seems to consider that the modules may not be present.
> > The behaviour in these cases is questionable (it seems to silently leave
> > the buffers as they are and return success), but the modules are clearly
> > optional.
> >
> >> I'd suspect we should then do:
> >> 
> >> if (!block_module_load_one("dmg-bz2", &local_err)) {
> >>   if (local_err) {
> >>      error_report_err(local_err);
> >>      return -EINVAL;
> >>   }
> >>   warn_report("dmg-bz2 is not present, dmg will skip bz2-compressed chunks */
> >> }
> >> 
> >> and same for dmg-lzfse...?
> >
> > Actually, I think during initialisation, we should just pass NULL as
> > errp and ignore any errors.
> >
> > When a request would access a block that can't be uncompressed because
> > of the missing module, that's where we can have a warn_report_once() and
> > arguably should fail the I/O request.
> 
> Seems like asking for data corruption.  To avoid it, the complete stack
> needs to handle I/O errors correctly.

If you have any component that doesn't handle I/O errors correctly, keep
it far away from your data because it _will_ cause corruption eventually.
The earlier it fails, the better for you.

I don't think we should put great effort into making fundamentally
broken software a little bit less broken in the corner case that you're
least likely to hit.

> Can we detect presence of compressed blocks on open?

We seem to read in the full metadata of the image in dmg_open(). So I
think it would be possible to detect it there.

dmg_read_mish_block() is what fills in s->types. However, it never fills
in types that it doesn't know (and it pretends it doesn't know the types
of compressed blocks whose module is not loaded). So instead of checking
it in dmg_open() after dmg_read_mish_block() has completed, you would
have to catch the situation already in dmg_read_mish_block() while
parsing the image file, which should be entirely doable if you want.

This is a change in dmg's behaviour, though, which is not the goal of
the proposed patch. So if we want to do that, it should be a separate
patch.

Kevin


