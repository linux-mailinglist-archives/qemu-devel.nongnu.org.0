Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C624A947F
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 08:24:21 +0100 (CET)
Received: from localhost ([::1]:56740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFsxA-0002Mn-38
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 02:24:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nFsTz-0005IZ-V0
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 01:54:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nFsTt-0005X8-1n
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 01:54:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643957644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QAHwYg68pBpXMfBz3eTAztGN6c/5Bl2bMnRLtPuPwfM=;
 b=C8CZln4n63kitG5TQrSBpGcpKaKAtX6oxDnIh48c8t/G/HaWzkciRYJc0TaBhSLj6YBOsz
 4Jd4TTwvpQ03Sk66YiM9k9jlElOtap9L8VGy/4Fe51+y5Obxbnk79JwlP1Ai3OhqULyxZO
 UJHzGYLa6IpolZ57C6wtWDl9eY8a26Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-44-mufn4pd6MiCgzopTqqbp7g-1; Fri, 04 Feb 2022 01:54:02 -0500
X-MC-Unique: mufn4pd6MiCgzopTqqbp7g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAFE783DD20
 for <qemu-devel@nongnu.org>; Fri,  4 Feb 2022 06:54:01 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-3.ams2.redhat.com [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EF87C7A240;
 Fri,  4 Feb 2022 06:53:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 403A921E6A28; Fri,  4 Feb 2022 07:53:46 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: Notes on Generating Python signatures for QMP RPCs
References: <CAFn=p-aminDYVjPgnR+4x9U3L=Loi55vsHbPq+EOK4AUE_fLeg@mail.gmail.com>
 <871r0tp96s.fsf@dusky.pond.sub.org>
 <CAFn=p-YEVpqMFUNt8-svhEMCvu4HEUvO06DUmJn3GZC0pTnf7Q@mail.gmail.com>
 <874k5g4687.fsf@pond.sub.org>
 <CAFn=p-YiXcYkdHwqRCvQDKP3vYwv5u4CFnxMCcBGnzSyNF9zVw@mail.gmail.com>
Date: Fri, 04 Feb 2022 07:53:46 +0100
In-Reply-To: <CAFn=p-YiXcYkdHwqRCvQDKP3vYwv5u4CFnxMCcBGnzSyNF9zVw@mail.gmail.com>
 (John Snow's message of "Thu, 3 Feb 2022 16:14:28 -0500")
Message-ID: <87ee4jcebp.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
 Victor Toso de Carvalho <victortoso@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Andrea Bolognani <abologna@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

John Snow <jsnow@redhat.com> writes:

> On Thu, Feb 3, 2022 at 5:04 AM Markus Armbruster <armbru@redhat.com> wrote:
>> John Snow <jsnow@redhat.com> writes:
>> > On Thu, Jan 27, 2022 at 9:03 AM Markus Armbruster <armbru@redhat.com> wrote:
>> >> John Snow <jsnow@redhat.com> writes:
>
>> >> > (7) I have no idea what to do about functions that "may not return".
>> >> > The QGA stuff in particular, I believe, is prone to some weirdness
>> >> > that violates the core principles of the QMP spec.
>> >>
>> >> Yes.
>> >>
>> >> docs/interop/qmp-spec.txt dictates a command sends either a success or
>> >> an error response.  Makes sense.
>> >>
>> >> QGA has a few commands that shut down the guest.  How could such a
>> >> command send a success response?  If it sends it before it initiates
>> >> shutdown, response transmission races with shutdown.  The easy way out
>> >> is violating qmp-spec.txt.  Thus, 'success-response': false.  Just for
>> >> QGA.
>> >>
>> >
>> > Oh, whoops, I already have the information we need. O:-)
>> > (Assuming that 'success-response' is visible in the introspection data, anyway.
>>
>> qapi/introspect.json:
>>
>>     ##
>>     # @SchemaInfoCommand:
>>     [...]
>>     # TODO: @success-response (currently irrelevant, because it's QGA, not QMP)
>>     #
>>     # Since: 2.5
>>     ##
>>     { 'struct': 'SchemaInfoCommand',
>>       'data': { 'arg-type': 'str', 'ret-type': 'str',
>>                 '*allow-oob': 'bool' } }
>>
>> The TODO neglects to spell out "and QGA doesn't support introspection so
>> far".
>
> Oof, ouch, my bones.
>
> What will it take to add introspection to QGA? (Is this GSoC/Outreachy
> appropriate?)
> (This is not critically important to me, just a backburner thought.)

The QEMU/QGA part should be easy enough: implement and document a
suitable introspection command, by stealing from query-qmp-schema.

The much more interesting part is putting it to actual use.


