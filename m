Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 386AE5BFDB2
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 14:20:15 +0200 (CEST)
Received: from localhost ([::1]:58188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oayhw-0000dP-Uf
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 08:20:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oayX2-0006Rr-3l
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 08:08:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oayX0-0005xK-1s
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 08:08:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663762123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sDy0YxPMhvxBN4wY4w+hV/XUl67veYb+TQcUCzdCpHE=;
 b=DxEPt+8fnalLxLX1dyK7vdoxEcYbOHcr3Xv79w8X9J2hTL64q6StHB9x9WXh8kCq6/Y9XY
 KorDczuLK5s4BuvfuDaVQ/CA62SO3PKk0pXUlL8szs3R+QvLbPf4GKu6K+gqOp5pOmg1g6
 neis9DVh6WAH37pbm177ICni4nW9Rkw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-9SDV5UYRPmyTFPpuWsjurA-1; Wed, 21 Sep 2022 08:08:40 -0400
X-MC-Unique: 9SDV5UYRPmyTFPpuWsjurA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 56BDD1C1B106;
 Wed, 21 Sep 2022 12:08:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 003F140C2064;
 Wed, 21 Sep 2022 12:08:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B61D921E6900; Wed, 21 Sep 2022 14:08:38 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: Claudio Fontana <cfontana@suse.de>,  Richard Henderson
 <richard.henderson@linaro.org>,  Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org,  dinechin@redhat.com,  Gerd Hoffmann
 <kraxel@redhat.com>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,
 Daniel P . =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v3 2/3] module: add Error arguments to module_load_one
 and module_load_qom_one
References: <20220908145308.30282-1-cfontana@suse.de>
 <20220908145308.30282-3-cfontana@suse.de>
 <062faaa8-064c-f68a-e316-aaacb80efa5a@linaro.org>
 <3c6cb3ee-2470-654f-c2c4-3449861f9781@suse.de>
 <8682ad9f-aea8-0419-5ff6-c14493e4e980@suse.de>
 <YynvR49aIK2AzbJ3@redhat.com> <87r105gwtl.fsf@pond.sub.org>
 <Yyr47JwudwU7JYQq@redhat.com>
Date: Wed, 21 Sep 2022 14:08:38 +0200
In-Reply-To: <Yyr47JwudwU7JYQq@redhat.com> (Kevin Wolf's message of "Wed, 21
 Sep 2022 13:43:40 +0200")
Message-ID: <874jx1dj5l.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

Kevin Wolf <kwolf@redhat.com> writes:

> Am 21.09.2022 um 06:45 hat Markus Armbruster geschrieben:
>> Kevin Wolf <kwolf@redhat.com> writes:
>> 
>> > Am 08.09.2022 um 19:36 hat Claudio Fontana geschrieben:
>> >> On 9/8/22 19:10, Claudio Fontana wrote:
>> >> > On 9/8/22 18:03, Richard Henderson wrote:
>> >> >> On 9/8/22 15:53, Claudio Fontana wrote:
>> >> >>> @@ -446,8 +447,13 @@ static int dmg_open(BlockDriverState *bs, QDict *options, int flags,
>> >> >>>           return -EINVAL;
>> >> >>>       }
>> >> >>>   
>> >> >>> -    block_module_load_one("dmg-bz2");
>> >> >>> -    block_module_load_one("dmg-lzfse");
>> >> >>> +    if (!block_module_load_one("dmg-bz2", &local_err) && local_err) {
>> >> >>> +        error_report_err(local_err);
>> >> >>> +    }
>> >> >>> +    local_err = NULL;
>> >> >>> +    if (!block_module_load_one("dmg-lzfse", &local_err) && local_err) {
>> >> >>> +        error_report_err(local_err);
>> >> >>> +    }
>> >> >>>   
>> >> >>>       s->n_chunks = 0;
>> >> >>>       s->offsets = s->lengths = s->sectors = s->sectorcounts = NULL;
>> >> >>
>> >> >> I wonder if these shouldn't fail hard if the modules don't exist?
>> >> >> Or at least pass back the error.
>> >> >>
>> >> >> Kevin?
>> >> 
>> >> is "dmg-bz" _required_ for dmg open to work? I suspect if the dmg
>> >> image is not compressed, "dmg" can function even if the extra dmg-bz
>> >> module is not loaded right?
>> >
>> > Indeed. The code seems to consider that the modules may not be present.
>> > The behaviour in these cases is questionable (it seems to silently leave
>> > the buffers as they are and return success), but the modules are clearly
>> > optional.
>> >
>> >> I'd suspect we should then do:
>> >> 
>> >> if (!block_module_load_one("dmg-bz2", &local_err)) {
>> >>   if (local_err) {
>> >>      error_report_err(local_err);
>> >>      return -EINVAL;
>> >>   }
>> >>   warn_report("dmg-bz2 is not present, dmg will skip bz2-compressed chunks */
>> >> }
>> >> 
>> >> and same for dmg-lzfse...?
>> >
>> > Actually, I think during initialisation, we should just pass NULL as
>> > errp and ignore any errors.
>> >
>> > When a request would access a block that can't be uncompressed because
>> > of the missing module, that's where we can have a warn_report_once() and
>> > arguably should fail the I/O request.
>> 
>> Seems like asking for data corruption.  To avoid it, the complete stack
>> needs to handle I/O errors correctly.
>
> If you have any component that doesn't handle I/O errors correctly, keep
> it far away from your data because it _will_ cause corruption eventually.
> The earlier it fails, the better for you.

True for immortals.  Since we're not, it actually depends on
probabilities.

> I don't think we should put great effort into making fundamentally
> broken software a little bit less broken in the corner case that you're
> least likely to hit.

Fair point.

>> Can we detect presence of compressed blocks on open?
>
> We seem to read in the full metadata of the image in dmg_open(). So I
> think it would be possible to detect it there.
>
> dmg_read_mish_block() is what fills in s->types. However, it never fills
> in types that it doesn't know (and it pretends it doesn't know the types
> of compressed blocks whose module is not loaded). So instead of checking
> it in dmg_open() after dmg_read_mish_block() has completed, you would
> have to catch the situation already in dmg_read_mish_block() while
> parsing the image file, which should be entirely doable if you want.

In most cases, "open fails because some blocks are known to be
unreadable" is much better UX than "everything goes swimmingly until you
try to read one of the known-unreadable blocks".

Even when your software manages not to eat your data, surprise bad
blocks are still likely to result in a bad day.

> This is a change in dmg's behaviour, though, which is not the goal of
> the proposed patch. So if we want to do that, it should be a separate
> patch.

Makes sense.


