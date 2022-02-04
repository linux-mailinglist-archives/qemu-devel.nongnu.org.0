Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F044A950C
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 09:23:48 +0100 (CET)
Received: from localhost ([::1]:50854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFtsg-0003te-TK
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 03:23:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nFswr-0004ZA-1m
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 02:24:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nFswn-0002gi-KQ
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 02:23:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643959434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mIIa3VDEQZEtU1gUTjnCX5R2CuCwSS2gSK44x4mrHKg=;
 b=hb4eweTNR6v1+XsT4+S6BvsApd6X7G8Xp3J6IDjaIkxRRKpPuzcyftyjDBpU2wDdMt6bmv
 v25rRgcRAaGQKOFtEFy1TN4u23lZDDYDboQbxJvoxfZ2kPerr5qsiq9is77ZstCQKrO7sU
 2WXh5kC37qjjN1oMCMkIhAVb25ZoDKU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-367-8EX7j5CkMrmPovv3QcUlAQ-1; Fri, 04 Feb 2022 02:23:53 -0500
X-MC-Unique: 8EX7j5CkMrmPovv3QcUlAQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 393A54686D
 for <qemu-devel@nongnu.org>; Fri,  4 Feb 2022 07:23:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-3.ams2.redhat.com [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E836660C2D;
 Fri,  4 Feb 2022 07:23:26 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3AF0621E6A28; Fri,  4 Feb 2022 08:23:25 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: Notes on Generating Python signatures for QMP RPCs
References: <CAFn=p-aminDYVjPgnR+4x9U3L=Loi55vsHbPq+EOK4AUE_fLeg@mail.gmail.com>
 <Yfuw1gGPPf8IPzLB@redhat.com>
 <CAFn=p-Yq_-MDW3kWXW+D9NNHXtunYREEMxjW5mfVtM48Hcj0AA@mail.gmail.com>
Date: Fri, 04 Feb 2022 08:23:25 +0100
In-Reply-To: <CAFn=p-Yq_-MDW3kWXW+D9NNHXtunYREEMxjW5mfVtM48Hcj0AA@mail.gmail.com>
 (John Snow's message of "Thu, 3 Feb 2022 17:52:10 -0500")
Message-ID: <874k5fccya.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
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
Cc: qemu-devel <qemu-devel@nongnu.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Victor Toso de Carvalho <victortoso@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On Thu, Feb 3, 2022 at 5:40 AM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
>>
>> On Wed, Jan 26, 2022 at 01:58:19PM -0500, John Snow wrote:

[...]

>> I think it is not unreasonable to expose the struct names
>> on introspection though, and just accept that it ties our
>> hands a little more to avoid renaming structs. I don't
>> think we rename frequently enough that this matters.
>
> I feel like I don't have a real stake in this issue yet. Maybe we can
> discuss bolstering the introspection data if we decide that we really,
> really would like the ability to generate bindings dynamically on the
> client side. I'm not sure *I* even want that enough to really push for
> this change yet. (Again, I think I need to come forward with something
> more concrete than an experiment before I dive too deeply into this
> issue. I'll get back to you.)
>
> I wouldn't mind hearing from Markus on what he believes the value of
> anonymizing the types names is. My current understanding is: "The type
> names aren't necessary to speak QMP, so they aren't necessary to
> reveal. We operate on a need-to-know basis, and nobody has needed to
> know."
>
> (The most tangible story I can think of is that we don't want clients
> to do things like assume they can index the introspection data in a
> hashmap and rely on looking up specific type names.)

QMP's compatibility promise (which predates schema introspection)
applies to commands and events.

When I designed schema introspection, I didn't want to grow the existing
compatibility promise, because that would restrict what we can do in the
schema.  Instead, I opted to limit the new compatibility promise for
introspection.  Section "Client JSON Protocol introspection" in
docs/devel/qapi-code-gen.rst has a paragraph on it.

Since telling users what not to do has a somewhat disappointing success
rate, I additionally looked for easy ways to make things not to be done
impractical.  I found "hide the type names".  Tiny bonus: saves a bit of
bandwidth, which probably doesn't matter beyond pleasing me.

Deterring users from bad practice was arguably more important when
schema introspection was new, and good practice wasn't established.

commit 1a9a507b2e3e90aa719c96b4c092e7fad7215f21 (tag: pull-qapi-2015-09-21)
Author: Markus Armbruster <armbru@redhat.com>
Date:   Wed Sep 16 13:06:29 2015 +0200

    qapi-introspect: Hide type names
   =20
    To eliminate the temptation for clients to look up types by name
    (which are not ABI), replace all type names by meaningless strings.
   =20
    Reduces output of query-schema by 13 out of 85KiB.
   =20
    As a debugging aid, provide option -u to suppress the hiding.
   =20
    Signed-off-by: Markus Armbruster <armbru@redhat.com>
    Reviewed-by: Eric Blake <eblake@redhat.com>
    Message-Id: <1442401589-24189-27-git-send-email-armbru@redhat.com>

>> A "NORETURN" flag sounds like a reasonable idea.
>
> Markus has gently pointed out that we do have this information in the
> schema, but it isn't revealed over introspection data *and* we do not
> have introspection for QGA anyway.
>
> We /could/ remove success-response and add a 'NORETURN' feature flag,
> modifying the generator to use that flag (instead of
> success-response), and then we'd get away with not having to modify
> the introspection schema. But we'd still have to add introspection in
> general to QGA, which rather sounds like where the bulk of the work is
> anyway.

If we had feature flags from the start, we might not have added other
flags to the syntax, such as @gen, @success-response, @boxed.

Feature flags are exposed in introspection, the others aren't.  That
dictates which kind to use when adding a flag.

Flags that aren't exposed in introspection can only be used by the
generator itself (d'oh).

A few special feature flags are also used by the generator.  Currently
'deprecated' and 'unstable'.

>>
>> Regards,
>> Daniel
>
> Thanks! I've got a lot to think about.

I might have pile on some more, forgive me ;)


