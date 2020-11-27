Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA99C2C6809
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 15:41:39 +0100 (CET)
Received: from localhost ([::1]:35796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiewK-0007zJ-Cy
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 09:41:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kieul-0007SN-6n
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 09:39:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kieuf-0000nF-Lb
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 09:39:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606487992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZqN73s8sp12tYhz+Njj+lQEMiyl1UzXQjK0jblelODw=;
 b=Br/jJnt+7yiM0i+wyRqF1+X6I0ljuhpJVIldDnAPTk1kzjNML7xwlalK0c1oV2Y/R1KRaR
 XxiR34h0m8K0gFL8yAToi61RYjX/NZIj50a/zlTRHoeRutGf2dFmDNGoTTUE5jh9Xb8eLy
 jokRuOUAkr2LB2D1/0hUJ1MBLT6ht/8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-Rq2-SHsTNFKAbXOQSCsOPA-1; Fri, 27 Nov 2020 09:39:45 -0500
X-MC-Unique: Rq2-SHsTNFKAbXOQSCsOPA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08681107ACF7
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 14:39:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A888C5D6D1;
 Fri, 27 Nov 2020 14:39:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3EDED113864E; Fri, 27 Nov 2020 15:39:43 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 1/2] keyval: accept escaped commas in implied option
References: <20201111104521.1179396-1-pbonzini@redhat.com>
 <20201111104521.1179396-2-pbonzini@redhat.com>
 <87h7pburdf.fsf@dusky.pond.sub.org>
 <0a15b86b-9ab8-d378-7578-a8304b32870a@redhat.com>
Date: Fri, 27 Nov 2020 15:39:43 +0100
In-Reply-To: <0a15b86b-9ab8-d378-7578-a8304b32870a@redhat.com> (Paolo
 Bonzini's message of "Fri, 27 Nov 2020 10:15:57 +0100")
Message-ID: <87360urhhs.fsf@dusky.pond.sub.org>
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
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

> [huge snip]
>
> On 27/11/20 09:38, Markus Armbruster wrote:
>> The suboptimal error message is due to the way I coded the parser, not
>> due to the grammar.
>
> Small digression: a different grammar influences how the parser is 
> written.  You coded the parser like this because you thought of implied 
> options as "key without ="; instead I thought of them as "value not 
> preceded by key=".

Which requires relaxing the key syntax, as you did.  Without that, we'd
need unbounded lookahead to decide how to reduce a comma.

>> 
>>   --nbd key=val,=,fob=
>> 
>>     master:       Invalid parameter ''
>>     your patch:   Expected parameter before '='
>> 
>>     Improvement, but which '='?  Possibly better:
>> 
>>                   Expected parameter before '=,fob='
>
> Yup, easy.
>
>>    --nbd .key=
>> 
>>      master:       Invalid parameter '..key'
>>      your patch:   same
>> 
>>      Better, I think:
>> 
>>                    Name expected before '..key'
>> 
>>    Odd: if I omit the '=', your patch's message often changes to
>> 
>>                    Expected '=' after parameter ...
>> 
>>    This means the parser reports a non-first syntax error.  Parsing
>>    smell, I'm afraid :)
>
> Nah, just lazy cut-and-paste of the existing error message.  I should 
> rename that error to something "No implicit parameter name for '.key'" 
> (again, different grammar -> different parser -> different error).  That 
> error message actually makes sense: "--object .key" would create an 
> object of type ".key" both without or with these changes.

However, --object a=b,.key would not, because the sugar is available
for the leftmost value only.

"No implicit parameter name" assumes the user intended .key as a value,
and forgot to write the key.  We could instead assume the user intended
.key as key, and messed it up (forgot a fragment, fat-fingered '.',
whatever).  The absence of '=' makes the value assumption more
plausible, but that's already lookahead.

Error messages based on guesses what the user has in mind can be quite
confusing when we guess wrong.  A strictly factual syntax error style
like "I expected FOO instead of BAR here" may not be great, but has a
relatively low risk of being confusing.

>> * Invalid key fragment
>> 
>>    --nbd key.1a.b=
>> 
>>      master:       Invalid parameter 'key.1a.b'
>>      your patch:   same
>> 
>>      Slightly better, I think:
>> 
>>                    'key.1a' is not a valid parameter name
>
> Or just "Invalid parameter '1a'".  I'm not going to do that in v2 
> though, since parameter parsing is not being

Sentence not being finished?

>> I believe there are two, maybe three reasons for this series:
>> 
>> 1. Support ',' in values with an implicit keys.
>> 
>> 2. Improve error reporting.
>> 
>> 3. Maybe nicer code.
>> 
>> 1. is a feature without a known use.
>
> Breaking news: there is actually a use.  I should have pointed out in 
> the commit message, but I didn't realize at the time, that this patch 
> fixes device-introspect-test once device_add is switched to keyval-based 
> parsing.  And why is that?  Because even though SUNW,fdtwo is not 
> user-creatable, you can still do "device_add SUNW,,fdtwo,help".  It even 
> works from the command line:
>
> $ qemu-system-sparc -device SUNW,,fdtwo,help
> SUNW,fdtwo options:
>    drive=<str>            - Node name or ID of a block device to use as 
> a backend
>    fallback=<FdcDriveType> - FDC drive type, 144/288/120/none/auto 
> (default: "144")
>    ...

Right.  I actually had that knowledge filed in my brain, but it failed
to bubble up.

It fixes device-introspect-test only because you also fixed the test to
escape comma (commit e27bd498769, in rc1).  Quoting myself: "Parameter
values with comma need special treatment before and after the patch."

> This invocation is useful (for some value of useful) to see which 
> properties you can pass with -global.  So there *is* a valid (for some 
> value of valid) use of escaped commas in implied options.  It can be 
> fixed with deprecation etc. but that would be a more complicated 
> endeavor than just adjusting keyval.

The question becomes whether CLI help syntax is subject to the
compatibility promise.

It's certainly not something we'd want programs to use.  We provide QMP
commands for the purpose.

For human users, the usability goodness of keeping

    -device SUNW,,fdtwo,help

working would in my opinion be dwarved several times over by renaming
the the offenders so that you don't need arcane knowledge "double the
comma" just to get help.  We should do that regardless of this patch.

>> 2. can be had with much less churn
>> (I'm ready to back that up with a patch).  Since I haven't looked at
>> PATCH 2, I'm reserving judgement on 3.
>
> FWIW I think this patch is already an improvement in code niceness, 
> though I accept that it's in the eye of the beholder.
>
> Paolo


