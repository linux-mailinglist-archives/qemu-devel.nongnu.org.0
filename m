Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 762353887F2
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 09:03:43 +0200 (CEST)
Received: from localhost ([::1]:55546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljGF4-0006nK-AI
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 03:03:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ljGDY-00066G-5G
 for qemu-devel@nongnu.org; Wed, 19 May 2021 03:02:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ljGDR-0003kk-9w
 for qemu-devel@nongnu.org; Wed, 19 May 2021 03:02:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621407719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IOOP7/ycjx5ziH1TvLYVAx0QgcJi714xeLXO4jaU9m4=;
 b=IdD68z7gfSqt/vE6qSwGRAQImD4MRqxgNtbCRkL5ikP3lr7XZWCa5YU6jdsM0rZjNsEqcv
 +GfWCozxS/60f6jbDXAUA8PF6Cjb96898KzSavcp7Lul3SRSp77Pie/L3w1WwA8DKbnuGn
 aWHDNWihszSHZspxt40bDeXoNH2r8WM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-tiYYwlPtMpqOVJkVVvU8ug-1; Wed, 19 May 2021 03:01:55 -0400
X-MC-Unique: tiYYwlPtMpqOVJkVVvU8ug-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D258802B78;
 Wed, 19 May 2021 07:01:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2EE7118B5E;
 Wed, 19 May 2021 07:01:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AEF75113861E; Wed, 19 May 2021 09:01:52 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 01/21] qapi/parser: Don't try to handle file errors
References: <20210511220601.2110055-1-jsnow@redhat.com>
 <20210511220601.2110055-2-jsnow@redhat.com>
 <87wnrw5r2q.fsf@dusky.pond.sub.org>
 <55aacc2d-75c7-c925-4b65-a1e3f0046d3b@redhat.com>
Date: Wed, 19 May 2021 09:01:52 +0200
In-Reply-To: <55aacc2d-75c7-c925-4b65-a1e3f0046d3b@redhat.com> (John Snow's
 message of "Tue, 18 May 2021 09:14:00 -0400")
Message-ID: <87zgwryzof.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On 5/18/21 5:28 AM, Markus Armbruster wrote:
>> John Snow <jsnow@redhat.com> writes:
>> 
>>> Remove the try/except block that handles file-opening errors in
>>> QAPISchemaParser.__init__() and add one each to
>>> QAPISchemaParser._include() and QAPISchema.__init__() respectively.
>>>
>>>
>>> The short-ish version of what motivates this patch is:
>>>
>>> - It's hard to write a good error message in the init method,
>>>    because we need to determine the context of our caller to do so.
>>>    It's easier to just let the caller write the message.
>> 
>> I kind of disagree, but that's okay; it's your commit message :)
>> 
>
> I can nix the paragraph if you want, the primary purpose was to explain 
> to you what I was thinking anyway, and you already know ;)

Nah, keep it.

>>> - We don't want to allow QAPISourceInfo(None, None, None) to exist.
>>> - Errors made using such an object are currently incorrect.
>>> - It's not technically a semantic error if we cannot open the schema
>>> - There are various typing constraints that make mixing these two cases
>>>    undesirable for a single special case.
>>>
>>> Other considerations:
>>>
>>> - open() is moved to a 'with' block to ensure file pointers are
>>>    cleaned up deterministically.
>> 
>> Improvement over v1's leak claim.  Sold!
>> 
>>> - Python 3.3 deprecated IOError and made it a synonym for OSError.
>>>    Avoid the misleading perception these exception handlers are
>>>    narrower than they really are.
>>> - Not all QAPIError objects have an 'info' field, so remove that stanza
>>>    from test-qapi. Don't bother to replace the early exit on purpose
>>>    so that we can test its output in the next commit.
>> 
>> To which hunk exactly does the last item refer?
>> 
>
> Sigh, "Early return", not *exit* -- and I'm referring to the test-qapi hunk.
>
>> My best guess is the last one.  Its rationale is actually "drop code
>> handling the variant of QAPISourceInfo being removed in this patch".
>> 
>
> That too ... I just meant to say "It doesn't need to be replaced"

Can we the commit message clearer here?  Maybe:

    - test-qapi's code handling None fname is now dead.  Drop it.

Or just drop the item entirely.

>> QAPIError not having .info don't actually exist before this patch.
>> 
>> I'm afraid I don't get the second sentence.
>>  >>
>>>
>>> The long version:
>>>
>>> The error message string here is incorrect (since 52a474180a):
>> 
>> I think this reads slightly better:
>> 
>>    The error message here is incorrect (since commit 52a474180a):
>
> OK (If I need to respin I'll change it?)

Or I change it in my tree if we decide we don't need a full respin.

>>>> python3 qapi-gen.py 'fake.json'
>>> qapi-gen.py: qapi-gen.py: can't read schema file 'fake.json': No such file or directory
>>>
>>> In pursuing it, we find that QAPISourceInfo has a special accommodation
>>> for when there's no filename. Meanwhile, the intended typing of
>>> QAPISourceInfo was (non-optional) 'str'.
>> 
>> Not sure about "intended".  When I wrote the code, I intended ".fname is
>> str means it's a position that file; None means it's not in a file".  I
>> didn't intend typing, because typing wasn't a concern back then.
>> 
>> Do you mean something like "we'd prefer to type .fname as (non-optional)
>> str"?
>> 
>
> Really, I meant *I* intended that typing. I just have a habit of using 
> "we" for F/OSS commit messages.
>
> What I am really saying: When I typed this field, I didn't realize it 
> could be None actually -- I see this as a way to fix the "intended 
> typing" that I established however many commits ago.

In commit f5d4361cda "qapi/source.py: add type hint annotations", I
believe.

Hmm, this commit actually fixes incorrect typing, doesn't it?

>>>
>>> To remove this, I'd want to avoid having a "fake" QAPISourceInfo
>>> object. We also don't want to explicitly begin accommodating
>>> QAPISourceInfo itself being None, because we actually want to eventually
>>> prove that this can never happen -- We don't want to confuse "The file
>>> isn't open yet" with "This error stems from a definition that wasn't
>>> defined in any file".
>>>
>>> (An earlier series tried to create a dummy info object, but it was tough
>>> to prove in review that it worked correctly without creating new
>>> regressions. This patch avoids that distraction. We would like to first
>>> prove that we never raise QAPISemError for any built-in object before we
>>> add "special" info objects. We aren't ready to do that yet.)
>>>
>>> So, which way out of the labyrinth?
>>>
>>> Here's one way: Don't try to handle errors at a level with "mixed"
>>> semantic contexts; i.e. don't mix inclusion errors (should report a
>>> source line where the include was triggered) and command line errors
>>> (where we specified a file we couldn't read).
>>>
>>> Remove the error handling from the initializer of the parser. Pythonic!
>>> Now it's the caller's job to figure out what to do about it. Handle the
>>> error in QAPISchemaParser._include() instead, where we can write a
>>> targeted error message where we are guaranteed to have an 'info' context
>>> to report with.
>>>
>>> The root level error can similarly move to QAPISchema.__init__(), where
>>> we know we'll never have an info context to report with, so we use a
>>> more abstract error type.
>>>
>>> Now the error looks sensible again:
>>>
>>>> python3 qapi-gen.py 'fake.json'
>>> qapi-gen.py: can't read schema file 'fake.json': No such file or directory
>>>
>>> With these error cases separated, QAPISourceInfo can be solidified as
>>> never having placeholder arguments that violate our desired types. Clean
>>> up test-qapi along similar lines.
>>>
>>> Fixes: 52a474180a
>>>
>>> Signed-off-by: John Snow <jsnow@redhat.com>

[...]

>> Patch looks good to me.
>> 
>
> Well, that's good ;)


