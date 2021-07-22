Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C64693D26C9
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 17:36:04 +0200 (CEST)
Received: from localhost ([::1]:46748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6ajz-0008Dz-91
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 11:36:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m6aj2-0007Su-Bz
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 11:35:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m6aiy-0001kk-Ue
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 11:35:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626968099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dqPTUyyW1XXlHVIwJWhDNBlvHZ2Av3YjYn+lPXEK7VI=;
 b=DlCj9pkGSIrcU3x21p0UL4+sSMhp6U8XFXmwQ4m0+B3MaNEWZxI0e6xowGzsqxFv1kwnvH
 CN6StlU9CVEAXr4qqzCpmNqU/z4FShzr0epqwGZbuUTk9MbyiNmUQJFpM2E7/9Y4lu4duW
 L+SB0YveOS/J846NKRLdQR+4VsTvwrw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-3jKcWtogNEaBOGbJUIONSw-1; Thu, 22 Jul 2021 11:34:58 -0400
X-MC-Unique: 3jKcWtogNEaBOGbJUIONSw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8BEC71966322
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 15:34:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-187.ams2.redhat.com
 [10.36.114.187])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AE18760C9B;
 Thu, 22 Jul 2021 15:34:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1E04C11326B9; Thu, 22 Jul 2021 17:34:51 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 1/2] qapi: introduce forwarding visitor
References: <20210719104033.185109-1-pbonzini@redhat.com>
 <20210719104033.185109-2-pbonzini@redhat.com>
 <87v952fnut.fsf@dusky.pond.sub.org>
 <3426ca4c-fc26-1730-76f8-c46bc7fddca3@redhat.com>
Date: Thu, 22 Jul 2021 17:34:51 +0200
In-Reply-To: <3426ca4c-fc26-1730-76f8-c46bc7fddca3@redhat.com> (Paolo
 Bonzini's message of "Thu, 22 Jul 2021 17:08:19 +0200")
Message-ID: <87zguee50k.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: imammedo@redhat.com, alex.williamson@redhat.com, eblake@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 22/07/21 16:02, Markus Armbruster wrote:
>> Double-checking: the other fields are not accessible via this visitor.
>> Correct?
>
> Correct.
>
>>>
>>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>>> ---
>>>   include/qapi/forward-visitor.h    |  27 +++
>>>   qapi/meson.build                  |   1 +
>>>   qapi/qapi-forward-visitor.c       | 307 ++++++++++++++++++++++++++++++
>>>   tests/unit/meson.build            |   1 +
>>>   tests/unit/test-forward-visitor.c | 165 ++++++++++++++++
>>>   5 files changed, 501 insertions(+)
>>>   create mode 100644 include/qapi/forward-visitor.h
>>>   create mode 100644 qapi/qapi-forward-visitor.c
>>>   create mode 100644 tests/unit/test-forward-visitor.c
>> 
>> Missing: update of the big comment in include/qapi/visitor.h.  Can be
>> done on top.
>
> Also because I'm not sure what to add. :)
>
> This is not a fifth type of visitor, it's a wrapper for the existing
> types (two of them, input and output; the other two don't break
> horribly but make no sense either).

Unlike the other visitors, this one isn't of a fixed type.  I think
mentioning this would be nice.  Perhaps add to the paragraph

 * There are four kinds of visitors: input visitors (QObject, string,
 * and QemuOpts) parse an external representation and build the
 * corresponding QAPI object, output visitors (QObject and string)
 * take a QAPI object and generate an external representation, the
 * dealloc visitor takes a QAPI object (possibly partially
 * constructed) and recursively frees it, and the clone visitor
 * performs a deep clone of a QAPI object.

a sentence along the lines of "The forwarding visitor is special: it
wraps another visitor, and shares its type."

>>> +static bool forward_field_translate_name(ForwardFieldVisitor *v, const char **name,
>>> +                                         Error **errp)
>>> +{
>>> +    if (v->depth) {
>>> +        return true;
>>> +    }
>> 
>> Succeed when we're in a sub-struct.
>> 
>>> +    if (g_str_equal(*name, v->from)) {
>>> +        *name = v->to;
>>> +        return true;
>>> +    }
>> 
>> Succeed when we're in the root struct and @name is the alias name.
>> Replace the alias name by the real one.
>> 
>>> +    error_setg(errp, QERR_MISSING_PARAMETER, *name);
>>> +    return false;
>> 
>> Fail when we're in the root struct and @name is not the alias name.
>> 
>>> +}
>> 
>> Can you explain why you treat names in sub-structs differently than
>> names other than the alias name in the root struct?
>
> Taking the example of QOM alias properties, if the QOM property you're
> aliasing is a struct, its field names are irrelevant.  The caller may
> not even know what they are, as they are not part of the namespace (e.g.
> the toplevel QDict returned by keyval_parse) that is being modified.
>
> There are no aliased compound QOM properties that I can make a proper
> example with, unfortunately.

Since the intent is to forward *only* the alias, I wonder why we forward
*everything* when v->depth > 0.

Oh.  Is it because to get to v->depth > 0, we must have entered the
alias, so whatever we forward there must be members of the alias?

>>> +    /*
>>> +     * The name of alternates is reused when accessing the content,
>>> +     * so do not increase depth here.
>>> +     */
>> 
>> I understand why you don't increase @depth here (same reason
>> qobject-input-visitor.c doesn't qobject_input_push() here).  I don't
>> understand the comment :)
>
> See above: the alternate is not a struct; the names that are passed
> between start_alternate and end_alternate are within the same namespace
> as the toplevel field.

Yes.

> As to the comment, the idea is: if those calls used e.g. name == NULL,
> the depth would need to be increased, but the name will be the same one
> that was received by start_alternate.  Change to "The name passed to
> start_alternate is also used when accessing the content"?

Better.

>>> +Visitor *visitor_forward_field(Visitor *target, const char *from, const char *to)
>>> +{
>>> +    ForwardFieldVisitor *v = g_new0(ForwardFieldVisitor, 1);
>>> +
>>> +    v->visitor.type = target->type;
>> 
>> Do arbitrary types work?  Or is this limited to input and output
>> visitors?
>
> They don't crash, but they don't make sense because 1) they should not
> live outside qapi_clone and visit_free_* 2) they use NULL for the
> outermost name.

I'd prefer to restrict the forwarding visitor to the cases that make
sense and have test coverage.

>> Not forwarded: method .type_size().  Impact: visit_type_size() will call
>> the wrapped visitor's .type_uint64() instead of its .type_size().  The
>> two differ for the opts visitor, the keyval input visitor, the string
>> input visitor, and the string output visitor.
>
> Fixed, of course.  Incremental diff after my sig.

Looks good to me apart from rather long lines in block comments.
Best to wrap these around column 70, unless the wrapping obviously
reduces legibility.


