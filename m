Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4982177DE
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jul 2020 21:24:38 +0200 (CEST)
Received: from localhost ([::1]:39348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jstCo-0004Fd-2Q
	for lists+qemu-devel@lfdr.de; Tue, 07 Jul 2020 15:24:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jstBt-0003l4-Nd
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 15:23:41 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:38642
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jstBq-0004ei-Ub
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 15:23:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594149817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rUyOPqyaIg5rv6ViJqfTxZAUcD12/62GQEiCY8mDaH0=;
 b=TBJ+wZDWYpNLQyX37mt+6obgb3kQM4yLP6V8CMpBo0ANRcTvLb0pwoJfyAdhcFKYhK4ihA
 qzUgf7lFkNvEKrNI63Q7b1AAlwQFUCMmYCZQJIlLfqGICEquMlIK0i4lKuDlKBVprBOFuO
 OSE89Co6htN92wuQmkfWyou00jaXL1s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-56_g5daMMtyu982OijP2OA-1; Tue, 07 Jul 2020 15:23:36 -0400
X-MC-Unique: 56_g5daMMtyu982OijP2OA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BDF2F107ACCD;
 Tue,  7 Jul 2020 19:23:34 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 85D22100164C;
 Tue,  7 Jul 2020 19:23:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 109E41132FD2; Tue,  7 Jul 2020 21:23:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH v4 03/45] error: Document Error API usage rules
References: <20200707160613.848843-1-armbru@redhat.com>
 <20200707160613.848843-4-armbru@redhat.com>
 <a2fdc2c4-62af-ff06-26d3-e9d6c5a449e2@redhat.com>
Date: Tue, 07 Jul 2020 21:23:32 +0200
In-Reply-To: <a2fdc2c4-62af-ff06-26d3-e9d6c5a449e2@redhat.com> (Eric Blake's
 message of "Tue, 7 Jul 2020 13:46:28 -0500")
Message-ID: <87y2nv6sej.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 06:04:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, vsementsov@virtuozzo.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org, groug@kaod.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eric Blake <eblake@redhat.com> writes:

> On 7/7/20 11:05 AM, Markus Armbruster wrote:
>> This merely codifies existing practice, with one exception: the rule
>> advising against returning void, where existing practice is mixed.
>>
>> When the Error API was created, we adopted the (unwritten) rule to
>> return void when the function returns no useful value on success,
>> unlike GError, which recommends to return true on success and false on
>> error then.
>>
>
>> Make the rule advising against returning void official by putting it
>> in writing.  This will hopefully reduce confusion.
>>
>> Update the examples accordingly.
>>
>> The remainder of this series will update a substantial amount of code
>> to honor the rule.
>>
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> Reviewed-by: Eric Blake <eblake@redhat.com>
>> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> Reviewed-by: Greg Kurz <groug@kaod.org>
>> ---
>
>> @@ -95,14 +122,12 @@
>>    * Create a new error and pass it to the caller:
>>    *     error_setg(errp, "situation normal, all fouled up");
>>    *
>> - * Call a function and receive an error from it:
>> - *     Error *err = NULL;
>> - *     foo(arg, &err);
>> - *     if (err) {
>> + * Call a function, receive an error from it, and pass it to caller
>
> maybe s/to caller/to the caller/

Yes.

>> + * when the function returns a value that indicates failure, say false:
>> + *     if (!foo(arg, errp)) {
>>    *         handle the error...
>>    *     }
>> - *
>> - * Receive an error and pass it on to the caller:
>> + * when it doesn't, say a void function:
>
> Hmm. It looks like you have a single sentence "Call a function... when
> the function returns", but this line now makes it obvious that you
> have a single prefix: "Call a function, ...and pass it to the caller:"
> with two choices "when the function returns" and "when it doesn't".
> I'm not sure if there is a nicer way to typeset it, adding yet another
> ":" at the end of the line looks odd.  The idea behind the text is
> fine, I'm just trying to paint the bikeshed to see if there is a
> better presentation.
>
>>    *     Error *err = NULL;
>>    *     foo(arg, &err);
>>    *     if (err) {
>> @@ -120,6 +145,19 @@
>>    *     foo(arg, errp);
>>    * for readability.
>>    *
>> + * Receive an error, and handle it locally
>> + * when the function returns a value that indicates failure, say false:
>> + *     Error *err = NULL;
>> + *     if (!foo(arg, &err)) {
>> + *         handle the error...
>> + *     }
>> + * when it doesn't, say a void function:
>
> It helps that you have repeated the same pattern as above.  But that
> means if you change the layout, both groupings should have the same
> layout.  Maybe:
>
> Intro for a task:
> - when the function returns...
> - when it doesn't
>
> Also, are there functions that have a return type other than void, but
> where the return value is not an indication of error?  If there are,

Yes, there are such functions.

> then the "say a void function" clause makes sense (but we should
> probably recommend against such functions); if there are not, then
> "say a void function" reads awkwardly.  Maybe:
>
> - when it does not, because it is a void function:

What about

  - when it does not, say because it is a void function:

>> + *     Error *err = NULL;
>> + *     foo(arg, &err);
>> + *     if (err) {
>> + *         handle the error...
>> + *     }
>> + *
>>    * Receive and accumulate multiple errors (first one wins):
>>    *     Error *err = NULL, *local_err = NULL;
>>    *     foo(arg, &err);
>>

Thanks!


