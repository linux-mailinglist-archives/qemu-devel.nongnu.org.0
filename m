Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 249CF60B47F
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 19:47:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on1R8-0006GI-Gx; Mon, 24 Oct 2022 13:40:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1on1Qn-0006AE-9T
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 13:40:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1on1Ql-0006Xu-4R
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 13:40:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666633205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X3UdK8MXvAT2wzNJYnRPAZyLYbs2zBySMA1YTDc8X74=;
 b=b+5lRRcDC5yzupt/skf37aBUjWOlFLWWE12nH0eJ2/S+JiHsKy1XmLxIjE3F+tTEhadelo
 62A8Dis5UMDwHfQ05mbKbEh2Jv0zSqO05huHt+/sutzCf88sTuab/wPfFVbdKwhHjbedpK
 +9J/uRbQp9mz/qfb1zuHyo4iwhxtSxM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-376-DqycNrktNoi8oZk5_m9pEg-1; Mon, 24 Oct 2022 13:39:59 -0400
X-MC-Unique: DqycNrktNoi8oZk5_m9pEg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB5E41019C89;
 Mon, 24 Oct 2022 17:39:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 917412166B2A;
 Mon, 24 Oct 2022 17:39:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8CE5421E6936; Mon, 24 Oct 2022 19:39:51 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,  pbonzini@redhat.com,
 qemu-devel@nongnu.org,  richard.henderson@linaro.org
Subject: Re: [PATCH v3 1/8] reset: allow registering handlers that aren't
 called by snapshot loading
References: <20221014021653.1461512-1-Jason@zx2c4.com>
 <20221014021653.1461512-2-Jason@zx2c4.com>
 <CAFEAcA8jra50q_DvNTGG8Wi+eF+PEKPHnfLNBhUjG9muqiPe0A@mail.gmail.com>
 <87sfjdqubj.fsf@pond.sub.org>
 <CAFEAcA-TT_zRZQ076k6thP2ANk07EqMg8u7MP_6j24u2CCiEGA@mail.gmail.com>
 <8735bd8ikk.fsf@pond.sub.org>
 <CAFEAcA-xbu_nPFSg8K04nXgHGk3xm0HNRwGeGFgPNmoP3Ay_Fw@mail.gmail.com>
Date: Mon, 24 Oct 2022 19:39:51 +0200
In-Reply-To: <CAFEAcA-xbu_nPFSg8K04nXgHGk3xm0HNRwGeGFgPNmoP3Ay_Fw@mail.gmail.com>
 (Peter Maydell's message of "Mon, 24 Oct 2022 15:27:15 +0100")
Message-ID: <871qqx6ryw.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.503,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 24 Oct 2022 at 14:20, Markus Armbruster <armbru@redhat.com> wrote:
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>> > On Mon, 24 Oct 2022 at 13:28, Markus Armbruster <armbru@redhat.com> wrote:
>> >>
>> >> Peter Maydell <peter.maydell@linaro.org> writes:
>> >> > Markus: if we add a new value to the ShutdownCause enumeration,
>> >> > how annoying is it if we decide we don't want it later? I guess
>> >> > we can just leave it in the enum unused... (In this case we're
>> >> > using it for purely internal purposes and it won't ever actually
>> >> > wind up in any QMP events.)
>> >>
>> >> Deleting enumeration values is a compatibility issue only if the value
>> >> is usable in QMP input.
>> >>
>> >> "Purely internal" means it cannot occur in QMP output, and any attempt
>> >> to use it in input fails.  Aside: feels a bit fragile.
>> >
>> > In this case there are as far as I can see no QMP input commands
>> > which use the enum at all -- it's only used in events, which are
>> > always output, I think.
>>
>> They are.
>>
>> Ascertaining "not used in QMP input" is pretty easy, and "not used in
>> CLI" isn't hard.  My point is that uses could creep in later.  This is
>> what makes "purely internal" fragile.
>
> True. But otoh if there's a meaningful use of the enum constant in
> input in future we'll want to keep it around anyway.
>
> I guess what I'm asking is: do you specifically want this patch
> done some other way, or to require that "mark some values as
> internal-only" feature in the QAPI generator, or are you OK with
> it as-is?  QMP/QAPI is your area, so your call...

QAPI was designed to specify QMP.  We pretty soon discovered that QAPI
types can be useful elsewhere, and added some to the schema without
marking them.  Introspection doesn't show these.  Generated
documentation does.  Known shortcoming of the doc generator.

This case differs in that we're adding an internal-only member to a type
that is used by QMP.  Both introspection and documentation will show it.

Interface introspection and (especially!) documentation showing stuff
that doesn't exist in the interface is certainly less than ideal.
However, I don't want to hold this patch hostage to getting QAPI
shortcomings addressed.

Instead, I want QMP documentation to make clear that this value cannot
actually occur.

Fair?


