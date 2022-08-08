Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 584F458CA7B
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 16:25:44 +0200 (CEST)
Received: from localhost ([::1]:35326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL3hP-0007b9-3K
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 10:25:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oL3eR-00044g-Go
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 10:22:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oL3eN-0008A4-6t
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 10:22:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659968551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fZo28opGxb5vYhCc74zWP2dnbuVSozmh2j1xAnhvAb4=;
 b=BayFCfongoZ1gMGq0oUPI4yofwhEkTsIc4ToUA0+hHuxjbeSVlM0CcVH0Hlbq5pSJgySae
 YiLDRsdeRCDbXIpJjZLk+k2s+okmj3biruFrGk5BkhcE9bMmfZ4iwTe3p7nziDFSDi8gpl
 i9v0HjfoYw1+es4MjNFAaPBnv71Jnn4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-659-ZbYl1FH1NVqp6KmYUwvxvA-1; Mon, 08 Aug 2022 10:22:27 -0400
X-MC-Unique: ZbYl1FH1NVqp6KmYUwvxvA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E56C818A64F7;
 Mon,  8 Aug 2022 14:22:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AD606945D2;
 Mon,  8 Aug 2022 14:22:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9AFC221E6930; Mon,  8 Aug 2022 16:22:24 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: qemu-devel@nongnu.org,  Nikita Ivanov <nivanov@cloudlinux.com>,  Peter
 Maydell <peter.maydell@linaro.org>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  Greg Kurz <groug@kaod.org>,  Jason Wang
 <jasowang@redhat.com>,  Michael Roth <michael.roth@amd.com>,  Konstantin
 Kostiuk <kkostiuk@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] error handling: Use TFR() macro where applicable
References: <CAAJ4Ao9crXap1OYiutSgG5caZHzVkM=WvQYpVD2XN1M8JsD3cQ@mail.gmail.com>
 <877d3jupln.fsf@pond.sub.org> <3206015.kY3CcG7ZbH@silver>
 <7218690.D19hzYb2mh@silver>
Date: Mon, 08 Aug 2022 16:22:24 +0200
In-Reply-To: <7218690.D19hzYb2mh@silver> (Christian Schoenebeck's message of
 "Mon, 08 Aug 2022 15:11:35 +0200")
Message-ID: <87mtcen7bz.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Christian Schoenebeck <qemu_oss@crudebyte.com> writes:

> On Montag, 8. August 2022 14:52:28 CEST Christian Schoenebeck wrote:
>> On Montag, 8. August 2022 10:05:56 CEST Markus Armbruster wrote:
>> > Nikita Ivanov <nivanov@cloudlinux.com> writes:
>> > > Summing up the discussion above, I suggest the following patch for TFR()
>> > > macro refactoring. (The patch is sequential to the first one I
>> > > introduced
>> > > in the start of the discussion).
>> > > 
>> > >>From 6318bee052900aa93bba6620b53c7cb2290e5001 Mon Sep 17 00:00:00 2001
>> > >>
>> > > From: Nikita Ivanov <nivanov@cloudlinux.com>
>> > > Date: Mon, 8 Aug 2022 09:30:34 +0300
>> > > Subject: [PATCH] Refactoring: rename TFR() to TEMP_FAILURE_RETRY()
>> > > 
>> > > glibc's unistd.h header provides the same macro with the
>> > > subtle difference in type casting. Adjust macro name to the
>> > > common standard and define conditionally.
>> > > 
>> > > Signed-off-by: Nikita Ivanov <nivanov@cloudlinux.com>

[...]

>> > > diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
>> > > index b1c161c035..55f2927d8b 100644
>> > > --- a/include/qemu/osdep.h
>> > > +++ b/include/qemu/osdep.h
>> > > @@ -242,8 +242,10 @@ void QEMU_ERROR("code path is reachable")
>> > > 
>> > >  #if !defined(ESHUTDOWN)
>> > >  #define ESHUTDOWN 4099
>> > >  #endif
>> > > 
>> > > -
>> > > -#define TFR(expr) do { if ((expr) != -1) break; } while (errno ==
>> > > EINTR)
>> > > +#if !defined(TEMP_FAILURE_RETRY)
>> > > +#define TEMP_FAILURE_RETRY(expr) \
>> > > +    do { if ((expr) != -1) break; } while (errno == EINTR)

To avoid / reduce confusion: this macro expands into a statement, and ...

>> > > +#endif
>> > 
>> > GLibc's version is
>> > 
>> >    # define TEMP_FAILURE_RETRY(expression) \
>> >      (__extension__							      \
>> >        ({ long int __result;						      \
>> >           do __result = (long int) (expression);				      \
>> >           while (__result == -1L && errno == EINTR);			      \
>> >           __result; }))

... this one expands into an expression.  It uses GCC's "a compound
statement enclosed in parentheses may appear as an expression" extension.

>> > 
>> > The difference isn't just "type casting", it's also statement
>> > vs. expression.
>> > 
>> > Is it a good idea to have the macro expand into a statement on some
>> > hosts, and into an expression on others?  Sure, CI should catch any uses
>> > as expression, but delaying compile errors to CI wastes developer time.
>> 
>> For consistency and simplicity, I would define exactly one version (no
>> ifdefs) of the macro with a different macro name than glibc's
>> TEMP_FAILURE_RETRY(), and use that QEMU specific macro name in QEMU code
>> everywhere.

TFR()?  Can't resist closing the circle...

>> As for statement vs. expression: The only advantage of the statement version
>> is if you'd need __result as an rvalue, which is not needed ATM, right? So
>> I would go for the expression version (with cast) for now.

The expression-like macro is nicer where the return value matters.
Example (stolen from "The GNU C Library Reference Manual"):

    nbytes = TEMP_FAILURE_RETRY (write (desc, buffer, count));

With the statement-like macro, you have to write

    TEMP_FAILURE_RETRY (nbytes = write (desc, buffer, count));

>> The glibc history does not reveal why they chose the statement version.

The expression version, actually.

>> Best regards,
>> Christian Schoenebeck
>
> Sorry: s/rvalue/lvalue/ i.e. if you need the memory address of result or if 
> you need to take the result value of the last iteration in 'expression' into 
> account.


