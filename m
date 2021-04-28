Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD73D36D1D0
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 07:49:42 +0200 (CEST)
Received: from localhost ([::1]:53058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbd4v-0001lR-FN
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 01:49:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lbd44-0001M9-Da
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 01:48:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lbd41-0002U5-5L
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 01:48:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619588923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tC3lFuDjl8IK4e9oLSTrftvJMvmO3mJxfRwGwT6l5rk=;
 b=QAfrWvA2PqhfMrpMX6DkozIsn9qVb3ktPfloVsTe1jQVo+sboJaHgNegfLt9WQ2YXI6o2B
 fLOLzTUphrzME0w9gpCEE1pCTIhu0qbXKMT1H9V6tmVG5kBiEPQ43CtcdPFsHSiC2Wgzu2
 SQQAs515M73qJrcHsDVy1cfGHdM1+/U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-yrRow74ZOseAoH0UeDy-Xw-1; Wed, 28 Apr 2021 01:48:41 -0400
X-MC-Unique: yrRow74ZOseAoH0UeDy-Xw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3CD6801B13;
 Wed, 28 Apr 2021 05:48:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BBE885D9F0;
 Wed, 28 Apr 2021 05:48:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4BD4F113525D; Wed, 28 Apr 2021 07:48:37 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 01/22] qapi/parser: Don't try to handle file errors
References: <20210422030720.3685766-1-jsnow@redhat.com>
 <20210422030720.3685766-2-jsnow@redhat.com>
 <87czuldmwb.fsf@dusky.pond.sub.org>
 <4d378146-9623-82e9-3906-53954ebba2f5@redhat.com>
 <87wnsnvnyc.fsf@dusky.pond.sub.org>
 <1df92443-b8e0-a6e4-e0af-fb562a3579f1@redhat.com>
Date: Wed, 28 Apr 2021 07:48:37 +0200
In-Reply-To: <1df92443-b8e0-a6e4-e0af-fb562a3579f1@redhat.com> (John Snow's
 message of "Tue, 27 Apr 2021 13:58:39 -0400")
Message-ID: <87bl9zq7re.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
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

> On 4/27/21 9:47 AM, Markus Armbruster wrote:
>> John Snow <jsnow@redhat.com> writes:
>> 
>>> On 4/23/21 11:46 AM, Markus Armbruster wrote:
>>>> John Snow <jsnow@redhat.com> writes:
>>>>
>>>>> The short-ish version of what motivates this patch is:
>>>>>
>>>>> - The parser initializer does not possess adequate context to write a
>>>>>     good error message -- It tries to determine the caller's semantic
>>>>>     context.
>>>>
>>>> I'm not sure I get what you're trying to say here.
>>>>
>>>
>>> I mean: this __init__ method does not *know* who is calling it or why.
>>> Of course, *we* do, because the code base is finite and nobody else but
>>> us is calling into it.
>>>
>>> I mean to point out that the initializer has to do extra work (Just a
>>> little) to determine what the calling context is and raise an error
>>> accordingly.
>>>
>>> Example: If we have a parent info context, we raise an error in the
>>> context of the caller. If we don't, we have to create a new presumed
>>> context (using the weird None SourceInfo object).
>> 
>> I guess you mean
>> 
>>              raise QAPISemError(incl_info or QAPISourceInfo(None, None, None),
>> 
>> I can't see other instances of messing with context.
>> 
>
> Yes, and the string construction that follows, too. It's all about 
> trying to understand who our caller is and raising an error appropriate 
> for them on their behalf.

I guess you can view it that way.  I never did.  My thinking was

    @fname either comes from a schema file (@incl_info is not None) or
    somewhere else.  If schema file, make the exception's __str__()
    start with "SCHEMA-FILE:LINE: ", because that's how compilers report
    errors in source files.  Else, make it start with just "PROGNAME: ",
    because that's how compilers report errors unrelated to source
    files.

This assumes "incl_info is None implies unrelated to source file".  I
think that's fair.  I don't think it rises to the level of
"understanding who our caller is".

>>> So I just mean to say:
>>>
>>> "Let the caller, who unambiguously always has the exactly correct
>>> context worry about what the error message ought to be."

[...]

>>>> Before the patch, only IOError from open() and .read() get converted to
>>>> QAPISemError, and therefore caught by main().
>>>>
>>>> The patch widen this to anywhere in QAPISchemaParser.__init__().  Hmm.
>>>>
>>>
>>> "Changed in version 3.3: EnvironmentError, IOError, WindowsError,
>>> socket.error, select.error and mmap.error have been merged into OSError,
>>> and the constructor may return a subclass."
>>>
>>>   >>> OSError == IOError
>>> True
>>>
>>> (No, I didn't know this before I wrote it. I just intentionally wanted
>>> to catch everything that open() might return, which I had simply assumed
>>> was not fully captured by IOError. Better to leave it as OSError now to
>>> avoid misleading anyone into thinking it's more narrow than it really is.)
>> 
>> Good to know.
>> 
>> However, I was talking about the code covered by try ... except OSError
>> (or IOError, or whatever).  Before the patch, it's just open() and
>> .read().  Afterwards it's all of .__init__().
>> 
>
> Apologies, I misread.
>
>> Could anything else in .__init__() possibly raise OSError?  Probably
>> not, but it's not trivially obvious.  Which makes me go "hmm."
>> 
>> "Hmm" isn't "no", it's just "hmm".
>> 
>
> Yeah, it is rather broad. That is one of the perils of doing *so much* 
> at init() time, in my opinion.

It's not ideal, but then having to write something like

    parser = QAPISchemaParser(fname).parse()

or

    parser = QAPISchemaParser().parse(fname)

instead of just

    parser = QAPISchemaParser(fname)

would be less than ideal, too.

> We don't make any other syscalls in the parser though, so it should be 
> fine. The docstring patch later documents the errors we expect to see 
> here, so it becomes a visible part of the interface.

[...]


