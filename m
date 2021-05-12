Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C1F37D0DA
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 19:46:38 +0200 (CEST)
Received: from localhost ([::1]:40460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgswP-00062N-2V
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 13:46:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lgstG-0002UO-RW
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:43:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lgstE-0006Uc-Sf
 for qemu-devel@nongnu.org; Wed, 12 May 2021 13:43:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620841399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=csfrSCELiZUqBpHjqTKq/VtrGM8/X5OwiXEjcLW4UhM=;
 b=UXFyV6wdHvadw0SeJZJnRP1s+1FROG6536rcS9JilLJRzN5MgIyn5egoVdzrisBcZlCJs/
 SFLHxk/pUNcz7pKFIxzzVdH1XO8XpgEhKf0PwAiAuYmzzs7ygdpdB3Oc0V5AmSK9yVIyfF
 fAUZTPJ3Pzh/kYvp9yFvuKIDTclLfiY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-2WVN3Hj_MPq6xeVhTKCd1w-1; Wed, 12 May 2021 13:43:14 -0400
X-MC-Unique: 2WVN3Hj_MPq6xeVhTKCd1w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5EA9101371C;
 Wed, 12 May 2021 17:43:12 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B53A25C232;
 Wed, 12 May 2021 17:43:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3E4DF113865F; Wed, 12 May 2021 19:43:07 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH v3 0/9] qapi: untie 'if' conditions from C preprocessor
References: <20210429134032.1125111-1-marcandre.lureau@redhat.com>
 <YJq2SXW1kSyDZ7WX@stefanha-x1.localdomain>
 <CAJ+F1CJ4FNGJj7pVP90njGeyB0REoeBOf=29_6u-QCmJM+LSzA@mail.gmail.com>
Date: Wed, 12 May 2021 19:43:07 +0200
In-Reply-To: <CAJ+F1CJ4FNGJj7pVP90njGeyB0REoeBOf=29_6u-QCmJM+LSzA@mail.gmail.com>
 (=?utf-8?Q?=22Marc-Andr=C3=A9?= Lureau"'s message of "Wed, 12 May 2021
 16:39:48 +0400")
Message-ID: <87im3ndf10.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>, jsnow@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> writes:

> Hi Markus
>
> On Tue, May 11, 2021 at 8:53 PM Stefan Hajnoczi <stefanha@gmail.com> wrot=
e:
>
>> On Thu, Apr 29, 2021 at 05:40:23PM +0400, marcandre.lureau@redhat.com
>> wrote:
>> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> >
>> > Hi,
>> >
>> > This series makes the 'if' conditions less liberal, by formalizing a
>> simple
>> > expression tree based on bare boolean logic of configure option
>> identifiers.
>> >
>> > (this allows to express conditions in Rust in my QAPI-Rust PoC series)
>> >
>> > This is based on John Snow QAPI pt4:
>> > https://patchew.org/QEMU/20210421192233.3542904-1-jsnow@redhat.com/
>> >
>> > Based-on: <20210421192233.3542904-2-jsnow@redhat.com>
>> >
>>
>
> The patch series applies cleanly on top of master now. I checked no
> regression between each commit, including python style checks.

Appears to conflict with John's "[PATCH v2 00/21] qapi: static typing
conversion, pt5a".  I didn't examine the conflicts.

Since I reviewed John's v1 recently, and git-range-diff to v2 looks
fairly innocent at a glance, I'd prefer not to rock that boat.  Let's
discuss what to do as soon as I reviewed John's v2.

> If you are overloaded, can I make a pull request for it?

Not yet, please.


