Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F41560A9D2
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 15:25:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omxNB-0000gZ-Hn; Mon, 24 Oct 2022 09:20:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1omxN8-0000g9-GJ
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:20:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1omxN6-0002kc-QY
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:20:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666617603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XX+MIR5+8nNkVUQs66dI+U+xICeMXMxJ07jUd/RrZ0I=;
 b=CAZ6TZaLfzcjjHT+YP309nHRjjn/6eBGhCattxI9GaQRoqDhQwtL3wA8gZP402la3BlmuU
 A0dFDyKnDrpo3Tu1b2CL6/n/eJ9gdnoicYf/7xMJ80g2j0MsAlxrvDpDlFldz/p6BVwlUg
 lUQoO8mXPihN002pp8fksT8+5juZtrY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-209-eyqPb36pMjShfJyisD34Tw-1; Mon, 24 Oct 2022 09:19:59 -0400
X-MC-Unique: eyqPb36pMjShfJyisD34Tw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0B74785A59D;
 Mon, 24 Oct 2022 13:19:59 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D8F340C2064;
 Mon, 24 Oct 2022 13:19:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id F192821E6936; Mon, 24 Oct 2022 15:19:55 +0200 (CEST)
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
Date: Mon, 24 Oct 2022 15:19:55 +0200
In-Reply-To: <CAFEAcA-TT_zRZQ076k6thP2ANk07EqMg8u7MP_6j24u2CCiEGA@mail.gmail.com>
 (Peter Maydell's message of "Mon, 24 Oct 2022 13:39:49 +0100")
Message-ID: <8735bd8ikk.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

> On Mon, 24 Oct 2022 at 13:28, Markus Armbruster <armbru@redhat.com> wrote:
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>> > Markus: if we add a new value to the ShutdownCause enumeration,
>> > how annoying is it if we decide we don't want it later? I guess
>> > we can just leave it in the enum unused... (In this case we're
>> > using it for purely internal purposes and it won't ever actually
>> > wind up in any QMP events.)
>>
>> Deleting enumeration values is a compatibility issue only if the value
>> is usable in QMP input.
>>
>> "Purely internal" means it cannot occur in QMP output, and any attempt
>> to use it in input fails.  Aside: feels a bit fragile.
>
> In this case there are as far as I can see no QMP input commands
> which use the enum at all -- it's only used in events, which are
> always output, I think.

They are.

Ascertaining "not used in QMP input" is pretty easy, and "not used in
CLI" isn't hard.  My point is that uses could creep in later.  This is
what makes "purely internal" fragile.


