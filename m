Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B80231B95
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jul 2020 10:51:46 +0200 (CEST)
Received: from localhost ([::1]:55934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0hoP-0001Dm-Q9
	for lists+qemu-devel@lfdr.de; Wed, 29 Jul 2020 04:51:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinechin@redhat.com>)
 id 1k0hlR-0006im-QR
 for qemu-devel@nongnu.org; Wed, 29 Jul 2020 04:48:41 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:48348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dinechin@redhat.com>)
 id 1k0hlN-0004ad-Uf
 for qemu-devel@nongnu.org; Wed, 29 Jul 2020 04:48:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596012516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N5JujI55DsHbmtMCcqPwJoGcU8MI0DZ+oEEsuGJhGho=;
 b=ATe7TYZ8ljNfFPFRKgmBk50XXlGTPkhPfMmufY+NGHgTQxyXdCIVsgj8Iw8rjksR2Fxrvq
 biJnp05Bi7JN1v9duh1/Nugfmv8fzHyCprmnsnvv9Te48lKzJiam0JWQbRWEe1f+y+kzdJ
 x7J4gSOcor3qg8pwqMUBumwCuyCbf64=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-i24op6P5NiKh3vTBh9Az-g-1; Wed, 29 Jul 2020 04:48:34 -0400
X-MC-Unique: i24op6P5NiKh3vTBh9Az-g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E36A21DE1
 for <qemu-devel@nongnu.org>; Wed, 29 Jul 2020 08:48:33 +0000 (UTC)
Received: from titinator (ovpn-114-132.ams2.redhat.com [10.36.114.132])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6786610098AB;
 Wed, 29 Jul 2020 08:48:29 +0000 (UTC)
References: <ly4kprhd8e.fsf@redhat.com>
 <fe8f0bd6-ed47-08b8-d7c9-fc40c32b0bb2@redhat.com>
 <87eeouafe0.fsf@dusky.pond.sub.org>
User-agent: mu4e 1.5.2; emacs 26.3
From: Christophe de Dinechin <dinechin@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: Missing qapi_free_Type in error case for qapi generated code?
In-reply-to: <87eeouafe0.fsf@dusky.pond.sub.org>
Date: Wed, 29 Jul 2020 10:48:24 +0200
Message-ID: <lyy2n2g10n.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dinechin@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=63.128.21.74; envelope-from=dinechin@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/29 01:09:48
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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


On 2020-07-29 at 10:34 CEST, Markus Armbruster wrote...
> Eric Blake <eblake@redhat.com> writes:
>
>> On 7/28/20 10:26 AM, Christophe de Dinechin wrote:
>>> The qapi generated code for qmp_marshal_query_spice seems to be missing a
>>> resource deallocation for "retval". For example, for SpiceInfo:
>>>
>>
>>>      retval = qmp_query_spice(&err);
>>>      error_propagate(errp, err);
>>>      if (err) {
>>> /* retval not freed here */
>>
>> Because it should be NULL here.  Returning an error AND an object is
>> frowned on.
>
> It's forbidden, actually.  The QMP handler must either succeed and
> return a value, or fail cleanly.

OK. Then I guess Eric's suggestion to add an assert is the correct
approach, with the caveat you identified.

>
> Since it has to return a value even when it fails, it returns an error
> value then.  "Cleanly" means the error value does not require cleanup.
>
> The generated marshalling function relies on this: it *ignores* the
> error value.
>
>>> /* Missing: qapi_free_SpiceInfo(retval); */
>>>          goto out;
>>>      }
>>>
>>>      qmp_marshal_output_SpiceInfo(retval, ret, errp);
>>
>> And here, retval was non-NULL, but is cleaned as a side-effect of
>> qmp_marshal_output_SpiceInfo.
>>
>>>
>>> out:
>>
>> So no matter how you get to the label, retval is no longer valid
>> memory that can be leaked.
>>
>>>      visit_free(v);
>>>      v = qapi_dealloc_visitor_new();
>>>      visit_start_struct(v, NULL, NULL, 0, NULL);
>>>      visit_end_struct(v, NULL);
>>>      visit_free(v);
>>> }
>>> #endif /* defined(CONFIG_SPICE) */
>>>
>>> Questions:
>>>
>>> - Is the query code supposed to always return NULL in case of error?
>>
>> Yes.  If not, that is a bug in qmp_query_spice.
>
> Correct.
>
>>> In the
>>>    case of hmp_info_spice, there is no check for info==NULL, so on the
>
> I'm blind.  Where?

In hmp_info_spice, there is this code:

    info = qmp_query_spice(NULL);

    if (!info->enabled) {
        monitor_printf(mon, "Server: disabled\n");
        goto out;
    }

I guess this code relies on qmp_query_spice never returning an error.
Why is that a safe assumption?

This came to my attention because I wanted to return an error and a NULL
value for modular spice if the module is not available.

>
>>>    contrary, it seems to indicate that a non-null result is always expected,
>>>    and that function does call qapi_free_SpiceInfo
>>
>> Calling qapi_free_SpiceInfo(NULL) is a safe no-op.  Or if you expect
>> the function to always succeed, you could pass &error_abort as the
>> errp parameter.
>>
>>>
>>> - If not, is there an existing shortcut to generate the correct deallocation
>>>    code for return types that need it? You can't just use
>>>    qapi_free_%(c_type)s because that would generate an extra * character,
>>>    i.e. I get "SpiceInfo *" and not "SpiceInfo".
>>
>> Ah, you're debating about editing scripts/qapi/commands.py.  If
>> anything, an edit to add 'assert(!retval)' if qmp_COMMAND failed might
>> be smarter than trying to add code to free retval.
>
> This is more complicated than it may seem.
>
> The "natural" error value for a pointer-valued function is NULL.  I'm
> confident the handlers use it.  assert(!retval) should work.
>
> For functions returning something else, people may have different ideas
> on what to return on error.  To make assert(!retval) work, they need to
> return something "falsish".  I'm not ready to bet my own money on all of
> them doing that.

That's what I was thinking too. Glad to confirm I was not reading that code
too wrong.

>
> Aside: only functions in pragma returns-whitelist can return
> non-pointer.
>
>>> - If not, is there any good way to know if the type is a pointer type?
>>>    (A quick look in cripts/qapi/types.py does not show anything obvious)
>
> No clean way exists, simply because there has been no need.  So far,
> we've always found a reasonable way to generate code that works whether
> types are pointers in C or not.
>
>> Look at scripts/qapi/schema.py; each QAPI metatype has implementations
>> of .c_name and .c_type that determine how to represent that QAPI
>> object in C.  You probably want c_name instead of c_type when
>> constructing the name of a qapi_free_FOO function, but that goes back
>> to my question of whether such a call is even needed.
>
> Method c_name() returns a string you can interpolate into C identifiers.
>
> Method c_type() returns a string you can use as C type in generated
> code.

That part I understood. I was looking for something like method c_basetype()
or something like that for the non-pointer type of a pointer.

>
> The QAPI scripts could use more comments.

+1.

--
Cheers,
Christophe de Dinechin (IRC c3d)


