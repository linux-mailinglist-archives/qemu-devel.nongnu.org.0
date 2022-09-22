Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CCB5E67A9
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 17:54:49 +0200 (CEST)
Received: from localhost ([::1]:35834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obOXJ-0000ZN-0A
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 11:54:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1obNJQ-0004BG-Da
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 10:36:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1obNJO-0000gt-Dp
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 10:36:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663857381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q0h9RW7Amo2/J36yKyimmaCd/i4ochaJJwlP5NSF/nY=;
 b=FPP6DCTWsh+7nRDmy3Yjx7EjWOUEgLZZW+yptL03ItMP6fToAmDD5iku729rn3HnuD7Nrs
 eXlV4LgkTI+I+/bVdNzLUJBVuGHmG3h92h5J+mGhSk/EwauG/+wxz+J06jANrCmP4NubKk
 PMySOFe16rJQMdBQdOf0/orgvsIaTl4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-278-JHbUvUbYPYmPhKpxGOccZg-1; Thu, 22 Sep 2022 10:36:19 -0400
X-MC-Unique: JHbUvUbYPYmPhKpxGOccZg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8844E3C0D86F;
 Thu, 22 Sep 2022 14:36:18 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2024640C2066;
 Thu, 22 Sep 2022 14:36:18 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7DFBD21E6900; Thu, 22 Sep 2022 16:36:15 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Cc: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>,  Paolo Bonzini <pbonzini@redhat.com>,  Richard
 Henderson <richard.henderson@linaro.org>,  Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org,  dinechin@redhat.com,  Gerd Hoffmann
 <kraxel@redhat.com>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>
Subject: Re: [PATCH v4 2/3] module: add Error arguments to module_load_one
 and module_load_qom_one
References: <20220908183012.17667-1-cfontana@suse.de>
 <20220908183012.17667-3-cfontana@suse.de>
 <877d23ekj0.fsf@pond.sub.org>
 <76775f64-e49a-1c3c-0d73-10d93eff34e4@amsat.org>
 <87y1ucdirx.fsf@pond.sub.org>
 <cc2c5e14-f0a0-4415-9fe1-d7811ee27850@suse.de>
 <878rmc54cw.fsf@pond.sub.org> <Yywcs7CpKDxahOSM@redhat.com>
 <87leqb4ul9.fsf@pond.sub.org>
 <5f5921fe-6d4f-490b-4328-702a45973bbc@suse.de>
 <87bkr7mvgr.fsf@pond.sub.org>
 <4a656f0f-1497-5569-e562-f537b115daf3@suse.de>
 <87r103lf4y.fsf@pond.sub.org>
 <f7650e0c-1e18-31ac-4ed5-49777a69ba64@suse.de>
Date: Thu, 22 Sep 2022 16:36:15 +0200
In-Reply-To: <f7650e0c-1e18-31ac-4ed5-49777a69ba64@suse.de> (Claudio Fontana's
 message of "Thu, 22 Sep 2022 15:33:41 +0200")
Message-ID: <87leqbjx28.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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

Claudio Fontana <cfontana@suse.de> writes:

> On 9/22/22 15:20, Markus Armbruster wrote:
>> Claudio Fontana <cfontana@suse.de> writes:
>> 
>> [...]
>> 
>>> I think it would be better to completely make the return value separate from the Error,
>>> and really treat Error as an exception and not mix it up with the regular execution,
>>>
>>> but if it is the general consensus that I am the only one seeing this conflation problem we can model it this way too.
>> 
>> It's a matter of language pragmatics.  In Java, you throw an exception
>> on error.  In C, you return an error value.
>> 
>> Trying to emulate exceptions in C might be even more unadvisable than
>> trying to avoid them in Java.  Best to work with the language, not
>> against it.
>> 
>> Trouble is the error values we can conveniently return in C can't convey
>> enough information.  So we use Error for that.  Just like GLib uses
>
> Right, we use Error for that and that's fine, but we should use it _only Error_ for that.
>
> Ie map the Exceptions directly to Error.
>
> So:
>
> try {
>
>   rv = function_call(...);
>
>   use_return_value(rv);
>
> } catch (Exception e) {
>
>   /* handle exceptional case */
>
> }
>
> becomes
>
> rv = function_call(..., Error **errp);
>
> if (errp) {
>   /* handle exceptional case */
> }
>
> use_return_value(rv);

This is simply not the intended use of Error.

Also, "trying to emulate exceptions in C might be even more unadvisable
than trying to avoid them in Java."

> Instead we mix up the Exception code path and the regular code path, by having rv carry a mix of the Exception and regular return value,
> and this creates problems and confusion.

"In C, you return an error value."

> If we put a hard line between the two, I think more clarity emerges.

Maybe, but consistency matters.  Clarity doesn't emerge in isolation.  
Deviating from prevailing usage tends to confuse.

>> GError.
>> 
>> More modern languages do "return error value" much better than C can.  C
>> is what it is.
>> 
>> We could certainly argue how to do better than we do now in QEMU's C
>> code.  However, the Error API is used all over the place, which makes
>> changing it expensive.  "Rethinking the whole Error API" (your words)
>> would have to generate benefits worth this expense.  Which seems
>> unlikely.
>> 
>> [...]
>> 
>
> This is all fine, the problem is how we remodel this in C.
>
> This is how I see the next steps to clarify my position:
>
> short term:
>
> - keep the existing API with the existing assumptions, use a separate argument to carry the pointer to the actual return value (where the function return value as provided by the language is used to return if an exception was generated or not, as we assume today).

We don't actually need separate values for "actual return value" and
"success vs. failure" here.  We can easily encode them in a single
return value.  This is *common* in C, for better or worse.

For instance, read() returns -1 on error, 0 on EOF (which is not an
error), and a positive value on actual read.  On error, @errno is set,
which is a bit awkward (we wouldn't design that way today, I hope).

The interface I proposed is similar: return -1 on error, 0 on not found
(which is not an error), and 1 on successful load.  On error, an Error
is set via @errp.  With a name that makes it obvious that "not found" is
not an error, there's nothing that should surprise someone
passingly familiar with QEMU code.

> - long term (maybe): fix the existing API by detaching completely the return value from the exception.

As I wrote, this seems unlikely to be worth its considerable expense.

> Wdyt?
>
> C


