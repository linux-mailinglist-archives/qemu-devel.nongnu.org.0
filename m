Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD42C5E7D7B
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 16:45:04 +0200 (CEST)
Received: from localhost ([::1]:45472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1objvL-0001Au-IF
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 10:45:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1objt5-0007T7-HW
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 10:42:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1objt2-000602-9F
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 10:42:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663944157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l6IzyFOPWEUAUjMaLkRG1UAKF7k/lXD3/ilykb31EmM=;
 b=XKXIB1XK8qOFGOXKMHbJ+5n1ooX1vxPTpagkBqGJ5BcB5HuyfazKFtd9Pydz+0g+SFlnTq
 MpbMkqH9j1inC1I5d8xOgSnqeeckcTYR1HknqxOgP3JZMAE56DEqw/hXJyNZegJRCOYbZ1
 t82KP9xvqg7UT2yJLJ/Ndm+96OtWhq0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-368-fOdViLs9PQ6nhQgHvcr0zA-1; Fri, 23 Sep 2022 10:42:36 -0400
X-MC-Unique: fOdViLs9PQ6nhQgHvcr0zA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C2BE4185A794;
 Fri, 23 Sep 2022 14:42:35 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F355AC15BA4;
 Fri, 23 Sep 2022 14:42:33 +0000 (UTC)
Date: Fri, 23 Sep 2022 16:42:32 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 dinechin@redhat.com, Gerd Hoffmann <kraxel@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v3 2/3] module: add Error arguments to module_load_one
 and module_load_qom_one
Message-ID: <Yy3F2JkSeB30jqfh@redhat.com>
References: <20220908145308.30282-1-cfontana@suse.de>
 <20220908145308.30282-3-cfontana@suse.de>
 <062faaa8-064c-f68a-e316-aaacb80efa5a@linaro.org>
 <3c6cb3ee-2470-654f-c2c4-3449861f9781@suse.de>
 <8682ad9f-aea8-0419-5ff6-c14493e4e980@suse.de>
 <YynvR49aIK2AzbJ3@redhat.com>
 <eda3f2ce-a828-8c84-60bd-684844eb25b6@suse.de>
 <Yyr72+YyYrhG2zTo@redhat.com>
 <b37405a8-2315-5390-1ae6-5f1cd7ef0001@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b37405a8-2315-5390-1ae6-5f1cd7ef0001@suse.de>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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

Am 23.09.2022 um 16:10 hat Claudio Fontana geschrieben:
> On 9/21/22 13:56, Kevin Wolf wrote:
> > Am 21.09.2022 um 09:50 hat Claudio Fontana geschrieben:
> >> On 9/20/22 18:50, Kevin Wolf wrote:
> >>> Am 08.09.2022 um 19:36 hat Claudio Fontana geschrieben:
> >>>> On 9/8/22 19:10, Claudio Fontana wrote:
> >>>>> On 9/8/22 18:03, Richard Henderson wrote:
> >>>>>> On 9/8/22 15:53, Claudio Fontana wrote:
> >>>>>>> @@ -446,8 +447,13 @@ static int dmg_open(BlockDriverState *bs, QDict *options, int flags,
> >>>>>>>           return -EINVAL;
> >>>>>>>       }
> >>>>>>>   
> >>>>>>> -    block_module_load_one("dmg-bz2");
> >>>>>>> -    block_module_load_one("dmg-lzfse");
> >>>>>>> +    if (!block_module_load_one("dmg-bz2", &local_err) && local_err) {
> >>>>>>> +        error_report_err(local_err);
> >>>>>>> +    }
> >>>>>>> +    local_err = NULL;
> >>>>>>> +    if (!block_module_load_one("dmg-lzfse", &local_err) && local_err) {
> >>>>>>> +        error_report_err(local_err);
> >>>>>>> +    }
> >>>>>>>   
> >>>>>>>       s->n_chunks = 0;
> >>>>>>>       s->offsets = s->lengths = s->sectors = s->sectorcounts = NULL;
> >>>>>>
> >>>>>> I wonder if these shouldn't fail hard if the modules don't exist?
> >>>>>> Or at least pass back the error.
> >>>>>>
> >>>>>> Kevin?
> >>>>
> >>>> is "dmg-bz" _required_ for dmg open to work? I suspect if the dmg
> >>>> image is not compressed, "dmg" can function even if the extra dmg-bz
> >>>> module is not loaded right?
> >>>
> >>> Indeed. The code seems to consider that the modules may not be present.
> >>> The behaviour in these cases is questionable (it seems to silently leave
> >>> the buffers as they are and return success)
> > 
> > I think I misunderstood the code here actually. dmg_read_mish_block()
> > skips chunks of unknown type, so later trying to find them fails and
> > dmg_co_preadv() returns -EIO. Which is a reasonable return value for
> > this.
> > 
> >>> , but the modules are clearly
> >>> optional.
> >>>
> >>>> I'd suspect we should then do:
> >>>>
> >>>> if (!block_module_load_one("dmg-bz2", &local_err)) {
> >>>>   if (local_err) {
> >>>>      error_report_err(local_err);
> >>>>      return -EINVAL;
> >>>>   }
> >>>>   warn_report("dmg-bz2 is not present, dmg will skip bz2-compressed chunks */
> >>>> }
> >>>>
> >>>> and same for dmg-lzfse...?
> >>>
> >>> Actually, I think during initialisation, we should just pass NULL as
> >>> errp and ignore any errors.
> >>
> >> Hmm really? I'd think that if there is an actual error loading the
> >> module (module is installed, but the loading itself fails due to
> >> broken module, wrong permissions, I/O errors etc) we would want to
> >> report that fact as it happens?
> > 
> > Can we distinguish the two error cases?
> > 
> > Oooh... Reading the code again carefully, are you returning false
> > without setting errp if the module just couldn't be found? This is a
> > surprising interface.
> > 
> > Yes, I guess then your proposed code is fine (modulo moving
> > warn_report() somewhere else so that it doesn't complain when the image
> > doesn't even contain compressed chunks).
> > 
> >>> When a request would access a block that can't be uncompressed because
> >>> of the missing module, that's where we can have a warn_report_once() and
> >>> arguably should fail the I/O request.
> >>>
> >>> Kevin
> >>>
> >>
> >> That would mean, moving the
> >>
> >> warn_report("dmg-bz2 is not present, dmg will skip bz2-compressed chunks")
> >>
> >> to the uncompression code and change it to a warn_report_once() right?
> > 
> > Yeah, though I think this doesn't actually work because we never even
> > stored the metadata for chunks of unknown type (see above), so we never
> > reach the uncompression code.
> > 
> > What misled me initially is this code in dmg_read_chunk():
> > 
> >         case UDBZ: /* bzip2 compressed */
> >             if (!dmg_uncompress_bz2) {
> >                 break;
> >             }
> > 
> > I believe this is dead code, it could actually be an assertion. So
> > if I'm not missing anything, adding the warning there would be useless.
> > 
> > The other option is moving it into dmg_is_known_block_type() or its
> > caller dmg_read_mish_block(), then we would detect it during open, which
> > is probably nicer anyway.
> > 
> > Kevin
> > 
> > 
> 
> Hi Kevin, I got a bit lost on whether we have some agreement on where
> if anywhere to move the check/warning about missing decompression
> submodules.
> 
> If that's ok I'd post a V5, and we can rediscuss from the new starting
> point?

Sure, feel free, though I don't think the code will otherwise change for
dmg, so we could as well continue here.

My conclusion was that only dmg_read_mish_block() or something called by
it can know whether compressed blocks exist in the image when the
modules aren't present. So if we want to make the warning conditional on
that (and my understanding is correct), this is where a
warn_report_once() would have to live.

Kevin


