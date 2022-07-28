Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C7A584254
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 16:54:23 +0200 (CEST)
Received: from localhost ([::1]:45808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH4u5-00025v-W2
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 10:54:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oH4q9-0006MU-6e
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 10:50:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oH4q5-0005Ll-Gw
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 10:50:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659019812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h1THK366nG+yLMgHoIdTGT8kQ1oG9u1RyeAzzR/3KV8=;
 b=JnaGl0W77Xfn0LP5VK6E2yd87V0IetMsLwLDajjLYEkzFjzod0vchWfiowKJ2pL/67mAJr
 wcADW9w+uJTr24+Zekb5GVS/yJaLuRAVZuy2+EdWmYuv1JDjqxNQC+yqxCf9rxtKOW34hx
 2T43Bzwy0j4s5k7aVaj01rvTZorNTFg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-185-Gy4yZ42fOnivYoaQEuBBTw-1; Thu, 28 Jul 2022 10:50:08 -0400
X-MC-Unique: Gy4yZ42fOnivYoaQEuBBTw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DA92218A6506;
 Thu, 28 Jul 2022 14:50:07 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 592B72166B26;
 Thu, 28 Jul 2022 14:50:07 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EE2D421E6930; Thu, 28 Jul 2022 16:50:05 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,  Hao Wu <wuhaotsh@google.com>,
 richard.henderson@linaro.org,  qemu-arm@nongnu.org,
 qemu-devel@nongnu.org,  venture@google.com,  Avi.Fishman@nuvoton.com,
 kfting@nuvoton.com,  hskinnemoen@google.com,  f4bug@amsat.org,
 bin.meng@windriver.com,  qemu-block@nongnu.org,  thuth@redhat.com,  Hanna
 Reitz <hreitz@redhat.com>
Subject: Re: [PATCH v5 5/8] blockdev: Add a new IF type IF_OTHER
References: <20220714182836.89602-1-wuhaotsh@google.com>
 <20220714182836.89602-6-wuhaotsh@google.com>
 <87ilnuda33.fsf@pond.sub.org> <YuGMFRDj3tLOIJK7@redhat.com>
 <CAFEAcA-_TkDW4tPxvmwEt-Rr6VAr_7aWNX2++CE+1G5cBPtiBg@mail.gmail.com>
 <YuKPVi9UjmZVqw5a@redhat.com>
Date: Thu, 28 Jul 2022 16:50:05 +0200
In-Reply-To: <YuKPVi9UjmZVqw5a@redhat.com> (Kevin Wolf's message of "Thu, 28
 Jul 2022 15:29:58 +0200")
Message-ID: <878rodxpeq.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

> Am 28.07.2022 um 11:46 hat Peter Maydell geschrieben:
>> On Wed, 27 Jul 2022 at 20:03, Kevin Wolf <kwolf@redhat.com> wrote:
>> >
>> > Am 18.07.2022 um 11:49 hat Markus Armbruster geschrieben:
>> > > An OTP device isn't really a parallel flash, and neither are eFuses.
>> > > More fast-and-lose use of IF_PFLASH may exist in the tree, and maybe of
>> > > other interface types, too.
>> > >
>> > > This patch introduces IF_OTHER.  The patch after next uses it for an
>> > > EEPROM device.
>> > >
>> > > Do we want IF_OTHER?
>> >
>> > What would the semantics even be? Any block device that doesn't pick up
>> > a different category may pick up IF_OTHER backends?
>> >
>> > It certainly feels like a strange interface to ask for "other" disk and
>> > then getting as surprise what this other thing might be. It's
>> > essentially the same as having an explicit '-device other', and I
>> > suppose most people would find that strange.
>> >
>> > > If no, I guess we get to abuse IF_PFLASH some more.
>> > >
>> > > If yes, I guess we should use IF_PFLASH only for actual parallel flash
>> > > memory going forward.  Cleaning up existing abuse of IF_PFLASH may not
>> > > be worth the trouble, though.
>> > >
>> > > Thoughts?
>> >
>> > If the existing types aren't good enough (I don't have an opinion on
>> > whether IF_PFLASH is a good match), let's add a new one. But a specific
>> > new one, not just "other".
>> 
>> I think the common thread is "this isn't what anybody actually thinks
>> of as being a 'disk', but we would like to back it with a block device
>> anyway". That can cover a fair range of possibilities...
>
> How confident are we that no board will ever have two devices of this
> kind?
>
> As long as every board has at most one, if=other is a bad user interface
> in terms of descriptiveness, but still more or less workable as long as
> you know what it means for the specific board you use.
>
> But if you have more than one device, it becomes hard to predict which
> device gets which backend - it depends on the initialisation order in
> the code then,

Really?  Board code should use IF_OTHER devices just like it uses the
other interface types, namely connecting each frontend device to a
backend device with a well-known and fixed interface type and index (or
bus and unit instead, where appropriate).

>                and I'm pretty sure that this isn't something that should
> have significance in external interfaces and therefore become a stable
> API.

I agree that "implied by execution order" is a bad idea: commit
95fd260f0a "blockdev: Drop unused drive_get_next()".


