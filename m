Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE30692FE4
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Feb 2023 11:07:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQmm7-0003JZ-Qx; Sat, 11 Feb 2023 05:06:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pQmm5-0003Fe-0g
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 05:06:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pQmm2-0008GZ-H5
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 05:06:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676109985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ylbCv6HUkisP01xe7akPPHagbWAjiqZq6mYxMiRImk0=;
 b=N0D0fNWSUO6kvSpdySqj19IKg5JmG4t7PlTPRakGjXNiodtaCKxycMfib9fzK00SRJwGFP
 Kbpb+qCUzclEePQNmTvXk4Gl+c61Eni2pRg8+OAjcjFFiEgOATlMRIZoPOX/+ajuO1EpXL
 7X6+SorRsoEiLUqkaZHSnm9FCbFEzBo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-91-aSsgAwPxPk2T8em5t29PoQ-1; Sat, 11 Feb 2023 05:06:23 -0500
X-MC-Unique: aSsgAwPxPk2T8em5t29PoQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E3CD61C05145;
 Sat, 11 Feb 2023 10:06:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F9CC51FF;
 Sat, 11 Feb 2023 10:06:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A5F5721E6A1F; Sat, 11 Feb 2023 11:06:21 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,  Michael Roth <michael.roth@amd.com>
Subject: Re: [PATCH v3 3/7] qapi/expr: Split check_expr out from check_exprs
References: <20230209184758.1017863-1-jsnow@redhat.com>
 <20230209184758.1017863-4-jsnow@redhat.com>
 <87pmahr983.fsf@pond.sub.org>
 <CAFn=p-bSS_0A2cpWce01Oy7c4gGtDYzMYjSpc4azniYPcPN7CQ@mail.gmail.com>
Date: Sat, 11 Feb 2023 11:06:21 +0100
In-Reply-To: <CAFn=p-bSS_0A2cpWce01Oy7c4gGtDYzMYjSpc4azniYPcPN7CQ@mail.gmail.com>
 (John Snow's message of "Fri, 10 Feb 2023 10:20:11 -0500")
Message-ID: <874jrs349u.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

John Snow <jsnow@redhat.com> writes:

> --0000000000003b01fe05f45a096a
> Content-Type: text/plain; charset="UTF-8"
>
> On Fri, Feb 10, 2023, 7:33 AM Markus Armbruster <armbru@redhat.com> wrote:
>
>> Another observation...
>>
>> John Snow <jsnow@redhat.com> writes:
>>
>> > Primarily, this reduces a nesting level of a particularly long
>> > block. It's mostly code movement, but a new docstring is created.
>> >
>> > It also has the effect of creating a fairly convenient "catch point" in
>> > check_exprs for exception handling without making the nesting level even
>> > worse.
>>
>
> What I mean is: If you want to handle exceptions without this patch, a
> try/catch will add another nesting level to this hundred line function.
>
> By splitting it, you can use the outer looping function as a choke point to
> write the handler.
>
> I had a branch once where I use this fact to stop routing "info" into 99%
> of expr.py. I did this to use an off the shelf JSON validator while
> preserving your custom source info error reporting that identifies the
> precise location of the error.

When you have to reindent anyway, the drawback "makes git-blame less
useful" evaporates.  When the reindent is due to another level of
nesting, the benefit "reduces nesting" becomes more valuable.

> I took that out for now, in the interest of staying focused on the minimum
> viable to achieve strict typing, but found this change to be helpful anyway.
>
> Admit that it does muddy the waters with git blame, but... my calculus on
> that might just be different from yours.
>
> (To me, git blame is almost always something I have to trace back through
> several refactors anyway, so I see the battle as lost before I started.)
>
> I can omit this patch for now if you'd like, it isn't crucial. I just think
> I'd still "kinda like to have it". I'll leave it up to you.

I'd prefer to shelve it for now.  Bring it back when we have to reindent
anyway.

>> > Signed-off-by: John Snow <jsnow@redhat.com>
>> >
>> > ---
>> >
>> > This patch was originally written as part of my effort to factor out
>> > QAPISourceInfo from this file by having expr.py raise a simple
>> > exception, then catch and wrap it at the higher level.
>> >
>> > This series doesn't do that anymore, but reducing the nesting level
>> > still seemed subjectively nice. It's not crucial.
>> >
>> > Signed-off-by: John Snow <jsnow@redhat.com>
>>
>
> Whoops, script doesn't understand when I add notes.
>
>> ---
>> >  scripts/qapi/expr.py | 179 +++++++++++++++++++++++--------------------
>> >  1 file changed, 95 insertions(+), 84 deletions(-)
>> >
>> > diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
>> > index 5a1782b57ea..b56353bdf84 100644
>> > --- a/scripts/qapi/expr.py
>> > +++ b/scripts/qapi/expr.py
>> > @@ -595,6 +595,99 @@ def check_event(expr: _JSONObject, info:
>> QAPISourceInfo) -> None:
>> >      check_type(args, info, "'data'", allow_dict=not boxed)
>> >
>> >
>> > +def check_expr(expr_elem: _JSONObject) -> None:
>>
>> [...]
>>
>> >  def check_exprs(exprs: List[_JSONObject]) -> List[_JSONObject]:
>> >      """
>> >      Validate and normalize a list of parsed QAPI schema expressions.
>>
>> The typing is kind of wrong.
>>
>> The list is the value of QAPISchemaParser.exprs, which is (losely) typed
>> as List[Dict[str, object]].  It is actually a dict mapping
>>
>>    'expr' -> _ExprValue
>>    'info' -> QAPISourceInfo
>>    'doc'  -> Optional[QAPIDoc]
>>
>> Thet's not what _JSONObject is!  Its doc string describes it as
>> "Deserialized JSON objects as returned by the parser", i.e. the same as
>> _ExprValue.
>>
>> Works only because _JSONObject is a dict mapping arbitrary keys to
>> _JSONObject, str or bool.
>>
>> This patch spreads the flawed typing to the new function.
>>
>> Gets healed later in the series.
>>
>
> Oops...!
>
> Symptom of patch reordering that happened some time ago, I think. Mea
> culpa. Will fix.
>
> (Possibly with some ugly intermediate type that goes away by end of series.)

Only if it's dead easy.

Simply have the commit message point out there's problem being fixed?

>> [...]


