Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 754103619C4
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 08:18:33 +0200 (CEST)
Received: from localhost ([::1]:57136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXHoG-0000s8-AD
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 02:18:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lXHnV-0000Sf-Nw
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 02:17:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lXHnT-00060k-Ai
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 02:17:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618553862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aIU6IRF7dc55C4FpPq4nFM3OLkVSNaHTi/HPHsw0uGY=;
 b=WlbVCSfbZcGTNg4iNjvY+QwnenRjdJf0xaqEwsMHKp450yGsZZllRE6pU4HrMchk3ECRGs
 Bkw0aqcg92BAdXreR+1U0o6UVe1t9TMLNO/mr7A8G4S9JVquJJ8BqysG4kr+bp0GA4g2SI
 c2DRukLyChLLwS2JkLb9m45bGE3RlZQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-4hdW2TsLN-aHuXhsOdrMxA-1; Fri, 16 Apr 2021 02:17:37 -0400
X-MC-Unique: 4hdW2TsLN-aHuXhsOdrMxA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9266E192299B;
 Fri, 16 Apr 2021 06:17:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 161575D9C0;
 Fri, 16 Apr 2021 06:17:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8E9F1113525D; Fri, 16 Apr 2021 08:17:30 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 4/8] qapi/error: Change assertion
References: <20210330171844.1197918-1-jsnow@redhat.com>
 <20210330171844.1197918-5-jsnow@redhat.com>
 <e760661b-0c3f-bb9b-0b4d-6c5ff77cfd70@redhat.com>
 <87blagghg5.fsf@dusky.pond.sub.org>
 <7436de5c-afda-160a-068d-18bed05a6a68@redhat.com>
Date: Fri, 16 Apr 2021 08:17:30 +0200
In-Reply-To: <7436de5c-afda-160a-068d-18bed05a6a68@redhat.com> (John Snow's
 message of "Thu, 15 Apr 2021 11:44:24 -0400")
Message-ID: <87eefarbwl.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On 4/15/21 3:00 AM, Markus Armbruster wrote:
>> John Snow <jsnow@redhat.com> writes:
>> 
>>> On 3/30/21 1:18 PM, John Snow wrote:
>>>
>>> Realizing now that this commit topic is wrong :)
>>>
>>> A prior version modified the assertion, I decided it was less churn to
>>> simply add one.
>>>
>>> I think ideally we'd have no assertions here and we'd rely on the type
>>> hints, but I don't think I can prove that this is safe until after part
>>> 6, so I did this for now instead.
>>>
>>>> Eventually, we'll be able to prove that 'info.line' must be an int and
>>>> is never None at static analysis time, and this assert can go
>>>> away. Until then, it's a type error to assume that self.info is not
>>>> None.
>>>>
>>>> Signed-off-by: John Snow <jsnow@redhat.com>
>>>> ---
>>>>    scripts/qapi/error.py | 1 +
>>>>    1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/scripts/qapi/error.py b/scripts/qapi/error.py
>>>> index d179a3bd0c..d0bc7af6e7 100644
>>>> --- a/scripts/qapi/error.py
>>>> +++ b/scripts/qapi/error.py
>>>> @@ -25,6 +25,7 @@ def __init__(self, info, msg, col=None):
>>>>            self.col = col
>>>>           def __str__(self):
>>>> +        assert self.info is not None
>>>>            loc = str(self.info)
>>>>            if self.col is not None:
>>>>                assert self.info.line is not None
>>>>
>> Please show us the revised commit message.  I'm asking because the
>> patch's purpose isn't quite clear to me.  Peeking ahead at PATCH 7, I
>> see that info becomes Optional[QAPISourceInfo].  This means something
>> passes None for info (else you wouldn't make it optional).  None info
>> Works (in the sense of "doesn't crash") as long as col is also None.
>> After the patch, it doesn't.  I'm not saying that's bad, only that I
>> don't quite understand what you're trying to accomplish here.
>> 
>
> Sure.
>
> If you recall, I tried to enforce that QAPISourceInfo was *never* None
> by creating a special value for QSI that represented "No Source
> Info". Ultimately, that idea didn't go through and we solidified that
> the 'info' parameter that gets passed around can sometimes be None.
>
> Hence, this property is Optional[QAPISourceInfo].
>
> Since I know you wanted to crash messily in the case that we allowed a
> None-info to leak into a context like this, I added the new assertion
> to make sure this remains the case.
>
> (since str(None) evaluates to "None", it seemed like there was already
> the implicit assumption that info would never be None. Plus, if 'col'
> is set, mypy notices that we are performing an unsafe check on 
> self.info.line, which had to be remedied.)
>
> Later in the series, after schema.py is typed, it may be possible to
> remove these assertions as we may be able to rely on the strict typing 
> to prove that this situation can never occur. However, since schema.py
> is not yet typed, we can't yet.
>
>
>
> Alright. So given that, I think what you'd like to see for a commit
> message is:
>
> qapi/error: assert QAPISourceInfo is not None
>
> We implicitly assume that self.info will never be None, as the error
> reporting function will not produce meaningful output in this case,
> and will crash if self.col was set. Assert that self.info is not None
> in order to formalize this assumption.
>
> We can not yet change the type of the initializer to prove that this
> is provably true at static analysis time until the rest of this
> library is fully typed.

Let's insert another paragraph to make the intent even clearer, and
adjust the remainder for it:

  qapi/error: assert QAPISourceInfo is not None

  Built-in stuff is not parsed from a source file, and therefore have no
  QAPISourceInfo.  If such None info was used for reporting an error,
  built-in stuff would be broken.  Programming error.  Instead of
  reporting a confusing error with bogus source location then, we better
  crash.

  We currently crash only if self.col was set.  Assert that self.info is
  not None in order to crash reliably.

  We can not yet change the type of the initializer to prove this cannot
  happen at static analysis time before the remainder of the code is
  fully typed.

Note I also replaced "this library" because I'm not sure what it means.

What do you think?


