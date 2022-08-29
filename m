Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B54CE5A49E6
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Aug 2022 13:30:48 +0200 (CEST)
Received: from localhost ([::1]:43620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oScyd-0002Zq-DM
	for lists+qemu-devel@lfdr.de; Mon, 29 Aug 2022 07:30:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oScvG-0007Og-Ii
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 07:27:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58205)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oScvB-0001zp-Ga
 for qemu-devel@nongnu.org; Mon, 29 Aug 2022 07:27:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661772431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LaYuqq0h7t+Ys+wm/xIN/bAPuVmvzmYiU3j4JQcT8Oo=;
 b=OADUzqeLekr0Lv34282h2klKl8gIbCVZMcYnTunHgwFH9gC5kWu67s3gEcOnTuTNrm08n6
 M7nbXHwzsrdFZAHjV9Smw1vxLA2IF7d6tLxxU9gJxpNnxspwr0rRfW/CMi3CElrNtThbaJ
 c6uogWoOdGdOKm/85jghX7XV1FIWNxA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-fCdiMPfrMTidvJsot-RVNw-1; Mon, 29 Aug 2022 07:27:10 -0400
X-MC-Unique: fCdiMPfrMTidvJsot-RVNw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A8888037AC
 for <qemu-devel@nongnu.org>; Mon, 29 Aug 2022 11:27:10 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C8D22166B29;
 Mon, 29 Aug 2022 11:27:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D998D21E6900; Mon, 29 Aug 2022 13:27:06 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Victor Toso <victortoso@redhat.com>
Cc: Andrea Bolognani <abologna@redhat.com>,  qemu-devel@nongnu.org,  Eric
 Blake <eblake@redhat.com>,  Markus Armbruster <armbru@redhat.com>,  John
 Snow <jsnow@redhat.com>,  Daniel P . =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>
Subject: Re: [RFC PATCH v2 2/8] qapi: golang: Generate qapi's alternate
 types in Go
References: <20220617121932.249381-1-victortoso@redhat.com>
 <20220617121932.249381-3-victortoso@redhat.com>
 <CABJz62NXnKFm=n=7eXmb==zSUe0VCy_0jbcFoNc8SwrQ2YKjvg@mail.gmail.com>
 <20220817140419.vpxjay4ouaz2gsam@tapioca>
 <CABJz62PZvdem1C-m-ODVMLrFaN6kqqJm0qyvbLxqeRPXL5jDaA@mail.gmail.com>
 <20220822065956.nmamhjgowbda6dha@tapioca>
Date: Mon, 29 Aug 2022 13:27:06 +0200
In-Reply-To: <20220822065956.nmamhjgowbda6dha@tapioca> (Victor Toso's message
 of "Mon, 22 Aug 2022 08:59:56 +0200")
Message-ID: <87zgfnp9x1.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Victor Toso <victortoso@redhat.com> writes:

> Hi,
>
> On Fri, Aug 19, 2022 at 11:27:13AM -0500, Andrea Bolognani wrote:
>> On Wed, Aug 17, 2022 at 04:04:19PM +0200, Victor Toso wrote:
>> > On Tue, Jul 05, 2022 at 08:45:06AM -0700, Andrea Bolognani wrote:
>> > > On Fri, Jun 17, 2022 at 02:19:26PM +0200, Victor Toso wrote:
>> > > > func (s *BlockdevRef) UnmarshalJSON(data []byte) error {
>> > > >     // Check for json-null first
>> > > >     if string(data) == "null" {
>> > > >         return errors.New(`null not supported for BlockdevRef`)
>> > > >     }
>> > > >     // Check for BlockdevOptions
>> > > >     {
>> > > >         s.Definition = new(BlockdevOptions)
>> > > >         if err := StrictDecode(s.Definition, data); err == nil {
>> > > >             return nil
>> > > >         }
>> > >
>> > > The use of StrictDecode() here means that we won't be able to
>> > > parse an alternate produced by a version of QEMU where
>> > > BlockdevOptions has gained additional fields, doesn't it?
>> >
>> > That's correct. This means that with this RFCv2 proposal, qapi-go
>> > based on qemu version 7.1 might not be able to decode a qmp
>> > message from qemu version 7.2 if it has introduced a new field.
>> >
>> > This needs fixing, not sure yet the way to go.
>> >
>> > > Considering that we will happily parse such a BlockdevOptions
>> > > outside of the context of BlockdevRef, I think we should be
>> > > consistent and allow the same to happen here.
>> >
>> > StrictDecode is only used with alternates because, unlike unions,
>> > Alternate types don't have a 'discriminator' field that would
>> > allow us to know what data type to expect.
>> >
>> > With this in mind, theoretically speaking, we could have very
>> > similar struct types as Alternate fields and we have to find on
>> > runtime which type is that underlying byte stream.
>> >
>> > So, to reply to your suggestion, if we allow BlockdevRef without
>> > StrictDecode we might find ourselves in a situation that it
>> > matched a few fields of BlockdevOptions but it the byte stream
>> > was actually another type.
>>
>> IIUC your concern is that the QAPI schema could gain a new
>> type, TotallyNotBlockdevOptions, which looks exactly like
>> BlockdevOptions except for one or more extra fields.
>>
>> If QEMU then produced a JSON like
>>
>>   { "description": { /* a TotallyNotBlockdevOptions here */ } }
>>
>> and we'd try to deserialize it with Go code like
>>
>>   ref := BlockdevRef{}
>>   json.Unmarsal(&ref)
>>
>> we'd end up mistakenly parsing the TotallyNotBlockdevOptions as a
>> valid BlockdevOptions, dropping the extra fields in the process.
>>
>> Does that correctly describe the reason why you feel that the use of
>> StrictDecode is necessary?
>
> Not quite. The problem here is related to the Alternate types of
> the QAPI specification [0], just to name a simple in-use example,
> BlockdevRefOrNul [1].
>
> [0] https://gitlab.com/qemu-project/qemu/-/blob/master/docs/devel/qapi-code-gen.rst?plain=1#L387
> [1] https://gitlab.com/qemu-project/qemu/-/blob/master/qapi/block-core.json#L4349
>
> To exemplify the problem that I try to solve with StrictDecode,
> let's say there is a DeviceRef alternate type that looks like:
>
> { 'alternate': 'DeviceRef',
>   'data': { 'memory': 'BlockdevRefInMemory',
>             'disk': 'BlockdevRefInDisk',
>             'cloud': 'BlockdevRefInCloud' } }
>
> Just a quick recap, at runtime we don't have data's payload name
> (e.g: disk).  We need to check the actual data and try to find
> what is the payload type.
>
> type BlockdevRefInMemory struct {
>     Name  *string
>     Size  uint64
>     Start uint64
>     End   uint64
> }
>
> type BlockdevRefInDisk struct {
>     Name  *string
>     Size  uint64
>     Path  *string
> }
>
> type BlockdevRefInCloud struct {
>     Name  *string
>     Size  uint64
>     Uri   *string
> }
>
> All types have unique fields but they all share some fields too.

Quick intercession (I merely skimmed the review thread; forgive me if
it's not useful or not new):

    An alternate type is like a union type, except there is no
    discriminator on the wire.  Instead, the branch to use is inferred
    from the value.  An alternate can only express a choice between types
    represented differently on the wire.

This is docs/devel/qapi-code-gen.rst.  Implied there: the inference is
based on the JSON type *only*, i.e. no two branches can have the same
JSON type on the wire.  Since all complex types (struct or union) are
JSON object on the wire, at most one alternate branch can be of complex
type.

More sophisticated inference would be possible if we need it.  So far we
haven't.

> Golang, without StrictDecode would happily decode a "disk"
> payload into either "memory" or "cloud" fields, matching only
> what the json provides and ignoring the rest. StrictDecode would
> error if the payload had fields that don't belong to that Type so
> we could try to find a perfect match.
>
> While this should work reliably with current version of QEMU's
> qapi-schema.json, it is not future error proof... It is just a
> bit better than not checking at all.
>
> The overall expectations is that, if the fields have too much in
> common, it is likely they should have been tagged as 'union'
> instead of 'alternate'. Yet, because alternate types have this
> flexibility, we need to be extra careful.
>
> I'm still thinking about this in a way that would not give too
> much hassle when considering a generated code that talks with
> older/newer qemu where some fields might have been added/removed.
>
>> If so, I respectfully disagree :)
>>
>> If the client code is expecting a BlockdevRef as the return
>> value of a command and QEMU is producing something that is
>> *not* a BlockdevRef instead, that's an obvious bug in QEMU. If
>> the client code is expecting a BlockdevRef as the return value
>> of a command that is specified *not* to return a BlockdevRef,
>> that's an obvious bug in the client code.
>>
>> In neither case it should be the responsibility of the SDK to
>> second-guess the declared intent, especially when it's
>> perfectly valid for a type to be extended in a
>> backwards-compatible way by adding fields to it.
>
> Yes, the SDK should consider valid QMP messages. This specific
> case is just a bit more complex qapi type that SDK needs to
> worry.
>
> Thanks for your input!
> Victor


