Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8648328185
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 15:57:04 +0100 (CET)
Received: from localhost ([::1]:39614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGjyp-0001tt-Nw
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 09:57:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lGjwk-0000Zn-5v
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 09:54:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lGjwh-0002Cy-Ax
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 09:54:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614610488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UbBpE7mDj1YLfUKpvngOYXNcX+4hxtP8AcruiHdGMDw=;
 b=PaqsuOOtgzF/tv18iAmJYxT7v6UxAWIx6lKBalo3xvdZCzX8O7wPDFlF03qXR2z+RjLWCB
 DJHjGI1NErj67gUgfgJy2AUPZaXI7Z9KinfZHMjrjnBZoS1uJEayvjeyUegVPgHpw9T9qX
 pplrVZfG5Wp3G1BbB7GYr0zRMmaTcKs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-Yt3iQHc4PDOmcwAVttcvAQ-1; Mon, 01 Mar 2021 09:54:44 -0500
X-MC-Unique: Yt3iQHc4PDOmcwAVttcvAQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73D2DC29C
 for <qemu-devel@nongnu.org>; Mon,  1 Mar 2021 14:54:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F4425D760;
 Mon,  1 Mar 2021 14:54:43 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AB4A4113860F; Mon,  1 Mar 2021 15:54:41 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PULL 27/29] vl: deprecate -writeconfig
References: <20210226080526.651705-1-pbonzini@redhat.com>
 <20210226080526.651705-28-pbonzini@redhat.com>
 <87r1kzl2vy.fsf@dusky.pond.sub.org>
 <94db680f-a43f-7f94-a897-5512ceef6b98@redhat.com>
 <878s77hunk.fsf@dusky.pond.sub.org>
 <51d463b8-29ec-b0b9-fece-d8a7594f7dbe@redhat.com>
Date: Mon, 01 Mar 2021 15:54:41 +0100
In-Reply-To: <51d463b8-29ec-b0b9-fece-d8a7594f7dbe@redhat.com> (Paolo
 Bonzini's message of "Mon, 1 Mar 2021 14:45:00 +0100")
Message-ID: <87lfb6gc0e.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 01/03/21 14:26, Markus Armbruster wrote:
>>> Didn't really forget; being pretty sure that there's no usage in the
>>> wild and having good reasons to remove the code, giving a firm removal
>>> date should encourage people to speak up sooner rather than later.
>> Second thoughts after agreeing to change something are okay.  Keeping
>> them for yourself not so much, because it deprives your reviewers of a
>> chance to raise further points.
>
> Sorry about that.
>
>> In this case, the point I didn't make because I wanted to reach
>> agreement on contents before nitpicking form: you're not using
>> warn_report() the way it wants to be used:
>> 
>>      /*
>>       * Print a warning message to current monitor if we have one, else to stderr.
>>       * Format arguments like sprintf(). The resulting message should be a
>> ---> * single phrase, with no newline or trailing punctuation.
>>       * Prepend the current location and append a newline.
>>       */
>>      void warn_report(const char *fmt, ...)
>
> I knew about the rules for no newline or trailing punctuation, but I 
> didn't remember the other.  I can certainly respin, that said:
>
> - the comment should say "sentence", not "phrase".  For example "a 
> single phrase" is a single phrase, while "the resulting message should 
> be a single phrase" is a single sentence.

I avoided "sentence", because good error messages aren't always
grammatically complete sentences.  My use of "phrase" may well be wrong.
I tried!  Patches welcome :)

Dicking around on the web, I just found

    https://www.postgres-xl.org/documentation/error-style-guide.html

Drop the Postgres-specific parts, and what's left is pretty close to my
thoughts on error message style.

> - I'm not sure how to interpret the rule above.  First of all, the 
> sentence mixes part that are mandatory part ("no newline", checked by 
> checkpatch.pl) is mixed with the style guide ("no trailing punctuation" 
> and "a single sentence").  Second, whether a single sentence is better 
> often depends on the case.  For example, comparing these four:
>
> WARNING: -writeconfig foo: -writeconfig is deprecated.  It will go away 
> in QEMU 6.2 with no replacement
>
> WARNING: -writeconfig foo: -writeconfig is deprecated and will go away 
> in QEMU 6.2 with no replacement
>
> WARNING: -writeconfig foo: -writeconfig is deprecated; it will go away 
> in QEMU 6.2 with no replacement
>
> WARNING: -writeconfig foo: -writeconfig is deprecated
> WARNING: -writeconfig foo: it will go away in QEMU 6.2 with no replacement
>
> The first one is what was in this patch.
>
> The second does sound fine to me and it's probably what I'll use in v2, 
> with or without the "in QEMU 6.2" part.  However some could consider it 
> to be worse style due to the longer sentence.
>
> The third one is playing with the rules; a semicolon would be separating 
> two sentences.  However usage of the semicolon is quite common in error 
> messages, so maybe it would be good too?

Semicolons can be okay, as long the resulting message is still short.

Still short:

    warning: -writeconfig foo: -writeconfig is deprecated without replacement

    warning: -writeconfig foo: option is deprecated; there is no replacement

No longer short:

    warning: -writeconfig foo: -writeconfig is deprecated; it will go away in QEMU 6.2 with no replacement

There is no need to squeeze all the information into the "primary" error
message!  That one should state what's wrong *concisely*.  If you feel
you should explain further, or would like to advise on what could be
done to fix the problem, a separate "hint" message often reads better
than overloading the primary message with information.

When reporting to the user, use error_report() / warn_report() for the
"primary", and error_printf() for the "hint".

When setting an Error, use error_setg() for the "primary", and
error_append_hint() for the "hint".  error_report_err() will then use
error_report() and error_printf() correctly.

> The last one also complies, but it is not clear what "it" refers to so 
> it seems to be the worst in this case.  In other cases it's the obvious 
> choice, and we even have an API for it (error_append_hint... however it 
> doesn't play well with error_fatal which I'm otherwise a big fan of). 
> In this case, not so much.

Use of error_append_hint() requires ERRP_GUARD().  Without ERRP_GUARD(),
the hint indeed gets lost when errp == &error_fatal.

Properly guarded, we could have something like

    warning: -writeconfig foo: option -writeconfig is deprecated
    This option will go away with no replacement.

I'm glad you like &error_fatal, too!  I have had to defend it a few
times :)


