Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 672B2408EDB
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 15:39:14 +0200 (CEST)
Received: from localhost ([::1]:34350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPmAz-0004Ix-H0
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 09:39:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mPlhr-0001QL-Vk
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 09:09:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mPlhl-0003tP-Us
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 09:09:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631538540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PS44Q7wT58G1pMP54VjTFPTld/50aCiP1biwF91+/hI=;
 b=UDhJd0DyDCzboEEiF18XWGp+twu8DObeuy3tpykZVJxPyCaTwsM59x8XNxbmhykwh279Eb
 tGy2RX8oLFJRM1mzjv0r9tVfm9oDM/yq/qrpg/NFzerDaSGN4ykuOnVMivPcLq1983uATB
 i3VayMJ0dHsa21+wCERBSq7cNLSYleg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-wEK-xcVeMySosYnCn3jDUg-1; Mon, 13 Sep 2021 09:08:59 -0400
X-MC-Unique: wEK-xcVeMySosYnCn3jDUg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24E2F802934
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 13:08:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EBAC65F707;
 Mon, 13 Sep 2021 13:08:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 811C8113865F; Mon, 13 Sep 2021 15:08:56 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] qapi: define cleanup function for g_autoptr(Error)
References: <20210912124834.503032-1-pbonzini@redhat.com>
 <87fsu959rr.fsf@dusky.pond.sub.org>
 <7337ee08-cc7d-4ef1-dcc4-3b0facc8b7b1@redhat.com>
 <87tuio3jq8.fsf@dusky.pond.sub.org>
Date: Mon, 13 Sep 2021 15:08:56 +0200
In-Reply-To: <87tuio3jq8.fsf@dusky.pond.sub.org> (Markus Armbruster's message
 of "Mon, 13 Sep 2021 11:31:11 +0200")
Message-ID: <87tuiomxlj.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: berrange@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster <armbru@redhat.com> writes:

> Paolo Bonzini <pbonzini@redhat.com> writes:
>
>> On 13/09/21 07:23, Markus Armbruster wrote:
>>> Paolo Bonzini <pbonzini@redhat.com> writes:
>>> 
>>>> Allow replacing calls to error_free() with g_autoptr(Error)
>>>> declarations.
>>>>
>>>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>>>> ---
>>>>   include/qapi/error.h | 2 ++
>>>>   1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/include/qapi/error.h b/include/qapi/error.h
>>>> index 4a9260b0cc..8564657baf 100644
>>>> --- a/include/qapi/error.h
>>>> +++ b/include/qapi/error.h
>>>> @@ -437,6 +437,8 @@ Error *error_copy(const Error *err);
>>>>    */
>>>>   void error_free(Error *err);
>>>>   +G_DEFINE_AUTOPTR_CLEANUP_FUNC(Error, error_free);
>>>> +
>>>>   /*
>>>>    * Convenience function to assert that *@errp is set, then silently free it.
>>>>    */
>>> I'd like to see at least one actual use.
>>
>> I'll have one soon, I'll Cc you on that one.  (I wrote this because
>> Dan suggested using g_autoptr(Error) in a review, but it doesn't work
>> yet).
>
> I recommend to squash this patch into its first user, or maybe put it
> right before it.

I went for a walk, and now I have more substantial comments.

I'm not sure g_autoptr() is a good match for the Error interface in its
current shape.  Let me explain.

Use of error_free() is relatively rare: a bit over 200 calls outside
tests/, compared to more than 4000 error_setg*().  This is because the
most common ways to clean up are propagation and reporting, not
error_free().

As is, reporting errors doesn't play well with g_autoptr().  Example:

    Error *err = NULL;

    ... code that may set @err ...

    if (error is serious) {
        error_report_err(err);
    } else {
        error_free(err);
    }

Tempting, but wrong:

    g_autoptr(Error) err = NULL;

    ... code that may set @err ...

    if (error is serious) {
        error_report_err(err);
    }

Double-free, since error_report_err() frees its argument.  Correct:

    g_autoptr(Error) err = NULL;

    ... code that may set @err ...

    if (error is serious) {
        error_report_err(err);
        err = NULL;
    }

Hardly an improvement.

Same for propagation: replace error_report_err(err) by
error_propagate(errp, err).

If we decide we want g_autoptr(Error) anyway, then error.h's big comment
needs an update.


