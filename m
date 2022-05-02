Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2352D516B35
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 09:24:55 +0200 (CEST)
Received: from localhost ([::1]:43620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlQQP-0005hV-LX
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 03:24:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nlQNL-0003hX-Jz
 for qemu-devel@nongnu.org; Mon, 02 May 2022 03:21:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nlQNJ-0004D3-UF
 for qemu-devel@nongnu.org; Mon, 02 May 2022 03:21:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651476100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N9SkTfexpVxFtlhh9Ab5P9Ak6dRNHHaHWUeAHaCf/B8=;
 b=OZjnyj5ZnClwCTOA2osS7bjPhzgSB4Gp3oizducr3b/e+zAkw0LMGP7d0RePxsIHb7pqZo
 3odS01aefyOaOiQX9pPRaBtmIj10a5TOOu+eMI+xpuCOTkm3Rsfmi3nqdn6J5Q8Bif3I2+
 PbNWXxAwLfTah5J3ipyRaUMwe8AizHc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-220-HnYBO7KXOKCgnsDNDuiMPA-1; Mon, 02 May 2022 03:21:37 -0400
X-MC-Unique: HnYBO7KXOKCgnsDNDuiMPA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B6B028070AA
 for <qemu-devel@nongnu.org>; Mon,  2 May 2022 07:21:37 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 541F014C29F3;
 Mon,  2 May 2022 07:21:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 26CDB21E68BC; Mon,  2 May 2022 09:21:36 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Andrea Bolognani <abologna@redhat.com>
Subject: Re: [RFC PATCH v1 0/8] qapi: add generator for Golang interface
References: <20220401224104.145961-1-victortoso@redhat.com>
 <CABJz62PBHFqUyBNtwd_K6pra9_zOz9Ps56JOsNZL8XHf2u35Uw@mail.gmail.com>
 <87a6c52u68.fsf@pond.sub.org>
 <CABJz62NaEgEzEkvdYbNZ5qfkx_gAYfnxt_YbQhGyD08gRH6EYg@mail.gmail.com>
Date: Mon, 02 May 2022 09:21:36 +0200
In-Reply-To: <CABJz62NaEgEzEkvdYbNZ5qfkx_gAYfnxt_YbQhGyD08gRH6EYg@mail.gmail.com>
 (Andrea Bolognani's message of "Fri, 29 Apr 2022 06:15:43 -0700")
Message-ID: <87v8uos8lb.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 Victor Toso <victortoso@redhat.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Andrea Bolognani <abologna@redhat.com> writes:

> On Thu, Apr 28, 2022 at 03:50:55PM +0200, Markus Armbruster wrote:
>> Andrea Bolognani <abologna@redhat.com> writes:
>> > One concern that I have is about naming struct members: things like
>> > SpiceInfo.MouseMode and most others are translated from the QAPI
>> > schema exactly the way you'd expect them, but for example
>> > ChardevCommon.Logappend doesn't look quite right.
>>
>> It doesn't look quite right in the QAPI schema, either: @logappend.  If
>> it was @log-append, as it should, then it would get translated to
>> LogAppend, I guess.
>>
>> Fixing up style isn't a code generator's job.
>
> I agree that the generator shouldn't take too many liberties when
> translating names, and specifically should never attempt to figure
> out that @logappend should have been @log-append instead.
>
> What I was thinking of was more along the lines of, can we change the
> schema so that the proper name is available to the generator without
> breaking the wire protocol? Maybe something like
>
>   ##
>   # ChardevCommon:
>   #
>   # @logappend (rename @log-append): ...
>   ##
>
> That way the generator would have access to both information, and
> would thus be able to generate
>
>   type ChardevCommon struct {
>     LogAppend *bool `json:"logappend,omitempty"`
>   }
>
> The wire protocol would still retain the unappealing name, but at
> least client libraries could hide the uglyness from users.

At the price of mild inconsistency between the library interface and
QMP.

We could clean up QMP if we care, keeping around the old names for
compatibility.  See also Kevin's work on QAPI aliases.  Which is much
more ambitious, though.

>> > Same for the various
>> > structs or members that have unexpectedly-capitalized "Tls" or "Vnc"
>> > in them.
>>
>> Examples?
>
> A perfect one is TlsCredsProperties, whose endpoint member is of type
> QCryptoTLSCredsEndpoint.
>
> On the VNC front, we have SetPasswordOptionsVnc but also
> DisplayReloadOptionsVNC.
>
> There's plenty more, but this should be illustrative enough already.
> Capitalization of these acronyms is inconsistent across the schema,

Common issue with camel-cased compounds containing acronyms, because
either way is ugly.

> with one of the two forms disagreeing with Go naming expectations.

Pardon my ignorance: What are Go's expectations?

> In this case we might be able to just change the schema without
> introducing backwards compatibility issues, though? Type names are
> not actually transmitted on the wire IIUC.

Correct!

>> > but maybe
>> > there's room for adding this kind of information in the form of
>> > additional annotations or something like that?
>>
>> We did for enumeration types: 'prefix' overrides the TYPE_NAME prefix.
>> I fear this was a mistake.
>
> This might be an oversimplification, but I think we might be able to
> solve all of these issues with a single annotation in the form
>
>   namespace:word-MLA-other-words
>
> So for example QCryptoTLSCredsEndpoint would be annotated with
>
>   q:crypto-TLS-creds-endpoint
>
> and each generator would have enough information to produce
> identifiers that fit into the corresponding language, such as
>
>   qcrypto_tls_creds_endpoint
>   CryptoTlsCredsEndpoint
>
> or whatever else.
>
> Of course such annotations would only be necessary to deal with
> identifiers that are not already following the expected naming
> conventions and when MLAs are involved.

Pardon my ignorance some more: what are MLAs?


