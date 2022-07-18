Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 574C0578020
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 12:49:03 +0200 (CEST)
Received: from localhost ([::1]:43630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDOJC-0001AP-G0
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 06:49:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oDOG1-0004fv-Se
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 06:45:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oDOFy-0003WF-8O
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 06:45:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658141141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tpeN08+ZXHMpRZQHQOwdKku0bDVAaURwJsFEygNUNUM=;
 b=HNJL3xepD40VCZ8VjDOa2CjUKYIB5bp36q7uxCmdrwA91orEMtvcDhiCB/TWq66P+6kPFV
 mlP1ug/GnInXrcoYytZb2Rod/Dq1HPSqbptVwbPbi1T0tGBkGQ+koPB5WpDQmGhSzUyKfh
 EnHh/Zx/FP73lkVPd7Zfw+E5l+YTD7M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-445-Y2RM9KBeN0yrHxBvbrJL7g-1; Mon, 18 Jul 2022 06:45:37 -0400
X-MC-Unique: Y2RM9KBeN0yrHxBvbrJL7g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8110B101A588;
 Mon, 18 Jul 2022 10:45:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B42C492C3B;
 Mon, 18 Jul 2022 10:45:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 03DEB21E690D; Mon, 18 Jul 2022 12:45:36 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, kwolf@redhat.com,  hreitz@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@gmail.com>
Subject: Re: [RFC PATCH] qobject: Rewrite implementation of QDict for
 in-order traversal
References: <20220705095421.2455041-1-armbru@redhat.com>
 <87wncqmq2t.fsf@pond.sub.org> <YsgOhJLpbyODJCGG@redhat.com>
 <CAFEAcA_pA_K=06chM9xwS8BzK2W6v0g5S5Vr_=YT1A9xqX+tfw@mail.gmail.com>
 <YswEzUyQJtxAlylE@redhat.com>
 <CAFEAcA80xNkyoPV78eJS5wdJ2CEtqkGQZMebuBSBgTJLNwpDGw@mail.gmail.com>
Date: Mon, 18 Jul 2022 12:45:35 +0200
In-Reply-To: <CAFEAcA80xNkyoPV78eJS5wdJ2CEtqkGQZMebuBSBgTJLNwpDGw@mail.gmail.com>
 (Peter Maydell's message of "Mon, 11 Jul 2022 12:15:22 +0100")
Message-ID: <87a696d7hs.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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

Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 11 Jul 2022 at 12:09, Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>>
>> On Mon, Jul 11, 2022 at 11:32:35AM +0100, Peter Maydell wrote:
>> > I'm pretty sure that nothing needs sparse array elements like
>> > that. The major reason for the len-PROP field is an implementation
>> > one: because there is currently no way for a QOM object to
>> > say "call this method if somebody tries to set a non-existent
>> > property", the way array properties work is that the 'set'
>> > method for the len-PROP property is the place where we then
>> > add the PROP[0], PROP[1], ... properties.
>>
>> Ahhh, I see what you mean. I totally missed this subtle detail.
>>
>> IIUC, there's essentially no such thing as array properties
>> in QOM. 'prop[0]', 'prop[1]', 'prop[2]', etc are all simply
>> scalar properties from QOM's, that just happen to follow a
>> common naming scheme, but QOM doesn't care about that.
>
> Yeah. The exception is the bit Markus pointed out where somebody
> has later added special case support for setting "prop[*]" to
> mean "whatever the next index is".
>
>> > If we either had a "call this for any property set/get attempt
>> > where there is no specific method set" or else had array
>> > properties supported by the core QOM code, we could avoid
>> > having to set len-PROP first.
>>
>> Techically arrays are already supported at the core QOM level, because
>> you can use any QAPI type as a property.  The authz/list.c object
>> has a 'rules' property that is an array of QAuthzListRule objects:
>>
>>   { 'struct': 'AuthZListProperties',
>>     'data': { '*policy': 'QAuthZListPolicy',
>>               '*rules': ['QAuthZListRule'] } }
>>
>> At the time I wrote that, we couldn't express it on the CLI though,
>> without using JSON syntax for -object. I don't think we've ever
>> made it possible to use the opts_visitor with non-scalar properties
>> though.

The opts visitor is flat by design.  Avoid it in new code, use
qobject_input_visitor_new_keyval() instead.  Typical use is via a
wrapper such as qobject_input_visitor_new_str().

> Mmm, if we had started the array-property implementation starting
> from a QAPI API (or even with the idea of setting properties from
> command line arguments) and working from there we'd probably have ended
> up with something different. The primary use case though has
> never involved QAPI or the command line, it's just C code for setting
> property values on devices created within QEMU.

Trouble with QOM is that things meant for internal use bleed to the
external interface so easily.  We've been quite cavalier about that.
Should we change our attitude?


