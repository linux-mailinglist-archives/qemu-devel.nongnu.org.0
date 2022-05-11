Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A658E523546
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 16:20:53 +0200 (CEST)
Received: from localhost ([::1]:60486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nonCu-0008Nj-Pc
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 10:20:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nonAs-0006Kl-Ri
 for qemu-devel@nongnu.org; Wed, 11 May 2022 10:18:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nonAp-00050D-2L
 for qemu-devel@nongnu.org; Wed, 11 May 2022 10:18:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652278666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P8IPi1uRvhY3b5dy+95tzIDk6ctK1VLXgqC0jhvWQSg=;
 b=Hqh9OW0SzcHHdlui4OsX+79zMXE4elVJz8u14gJMQE3wKoYbwHtBesTc0OtHGePvJkv+fd
 mRbP27k1J8rHlxEqaKlPLp9quIfNYtIz5DqoK2SI+7W5bq3WYmCGuaaBhk+CIdUYsjfVKa
 Z6xuJ04W+wvhcatnueP/ZA0USzfBgug=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-604-kq8OHdVCNzObzeEVTf5x8Q-1; Wed, 11 May 2022 10:17:44 -0400
X-MC-Unique: kq8OHdVCNzObzeEVTf5x8Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 80C9B3810D22
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 14:17:44 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 347BB7AEB;
 Wed, 11 May 2022 14:17:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 27F6921E6882; Wed, 11 May 2022 16:17:43 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: Victor Toso <victortoso@redhat.com>,  John Snow <jsnow@redhat.com>,
 Eric Blake <eblake@redhat.com>,  qemu-devel@nongnu.org,  =?utf-8?Q?Marc-?=
 =?utf-8?Q?Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [RFC PATCH v1 0/8] qapi: add generator for Golang interface
References: <20220401224104.145961-1-victortoso@redhat.com>
 <87bkwonlkb.fsf@pond.sub.org> <Ynon8Y8uwfL1bDyN@redhat.com>
 <87lev9mw7j.fsf@pond.sub.org> <YnpbuzKo681VwDkn@redhat.com>
 <YnpfuYvBu56CCi7b@redhat.com>
Date: Wed, 11 May 2022 16:17:43 +0200
In-Reply-To: <YnpfuYvBu56CCi7b@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Tue, 10 May 2022 13:51:05 +0100")
Message-ID: <87pmkkdugo.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Tue, May 10, 2022 at 01:34:03PM +0100, Daniel P. Berrang=C3=A9 wrote:
>> On Tue, May 10, 2022 at 02:02:56PM +0200, Markus Armbruster wrote:
>> > > For a minimum viable use case, this doesn't feel all that difficult,=
 as
>> > > conceptually instead of deleting the field from QAPI, we just need to
>> > > annotate it to say when it was deleted from the QEMU side.  The QAPI
>> > > generator for internal QEMU usage, can omit any fields annotated as
>> > > deleted in QAPI schema. The QAPI generator for external app usage,
>> > > can (optionally) be told to include deleted fields ranging back to
>> > > a given version number. So apps can chooses what degree of compat
>> > > they wish to retain.
>> >=20
>> > Consider this evolution of command block_resize
>>=20
>> To help us understand, I'll illustrate some possible interfaces
>> in both Go and Python, since that covers dynamic and static
>> languages
>>=20
>> > * Initially, it has a mandatory argument @device[*].
>>=20
>> Python definition:
>>=20
>>    def block_resize(device, size)
>>=20
>> Caller:
>>=20
>>   block_resize('dev0', 1*GiB)
>>=20
>>=20
>> Golang definition
>>=20
>>    type BlockResizeCommand struct {
>>        Device string
>>        Size int
>>    }
>>=20
>> Caller
>>=20
>>    cmd :=3D &BlockResizeCommand{
>>        Device: "dev0",
>>        Size: 1 * GiB,
>>    }
>>=20
>> > * An alternative way to specify the command's object emerges: new
>> >   argument @node-name.  Both old @device and new @node-name become
>> >   optional, and exactly one of them must be specified.  This is commit
>> >   3b1dbd11a6 "qmp: Allow block_resize to manipulate bs graph nodes."
>>=20
>> Python definition. Tricky, as non-optional params must be before
>> optional params, but size is naturally the last arg. One option
>> is to pointlessly mark 'size' as optional
>>=20
>>    def block_resize(device=3DNone, node_name=3DNone, size=3DNone)
>>=20
>> Caller
>>=20
>>     block_resize(device=3D"dev0", size=3D1*GiB)
>>     block_resize(node_name=3D"devnode0", size=3D1*GiB)
>>=20
>>=20
>> In golang definition
>>=20
>>    type BlockResizeArguments struct {
>>        Device string
>>        NodeName string
>>        Size int
>>    }
>>=20
>> Caller choice of
>>=20
>>    cmd :=3D &BlockResizeCommand{
>>        Device: "dev0",
>>        Size: 1 * GiB,
>>    }
>>=20
>>    cmd :=3D &BlockResizeCommand{
>>        NodeName: "devnode0",
>>        Size: 1 * GiB,
>>    }
>>=20
>>=20
>> Neither case can easily prevent passing Device and NodeName
>> at same time.
>>=20
>> > * At some future date, the old way gets deprecated: argument @device
>> >   acquires feature @deprecated.
>>=20
>> Ok, no change needed to the APIs in either case. Possibly have
>> code emit a warning if a deprecated field is set.
>>=20
>> > * Still later, the old way gets removed: @device is deleted, and
>> >   @node-name becomes mandatory.
>>=20
>> Again no change needed to APIs, but QEMU will throw back an
>> error if the wrong one is used.=20
>>=20
>> > What is the proper version-spanning interface?
>> >=20
>> > I figure it's both arguments optional, must specify the right one for
>> > the version of QEMU actually in use.  This spans versions, but it fails
>> > to abstract from them.
>>=20
>> Yep, I think that's inevitable in this scenario. THe plus side
>> is that apps that want to span versions can do so. The downside
>> is that apps that don't want smarts to span version, may loose
>> compile time warnings about use of the now deleted field.
>
> Having said that, a different way to approach the problem is to expose
> the versioning directly in the generated code.
>
> Consider a QAPI with versioning info about the fields
>
>   { 'command': 'block_resize',
>     'since': '5.0.0',
>     'data': { 'device': ['type': 'str', 'until': '5.2.0' ],
>               '*device': ['type': 'str', 'since': '5.2.0', 'until': '7.0.=
0' ],
>               '*node-name': ['type': 'str', 'since': '5.2.0', 'until: '7.=
0.0' ],
>               'node-name': ['type': 'str', 'since': '7.0.0' ],
>               'size': 'int' } }
>
> Meaning
>
>   * Introduced in 5.0.0, with 'device' mandatory
>   * In 5.2.0, 'device' becomes optional, with optional 'node-name' as alt=
ernative
>   * In 7.0.0, 'device' is deleted, and 'node-name' becomes mandatory
>
> Now consider the Go structs
>
> In 5.0.0 we can generate:
>
>    type BlockResizeArguments struct {
>        V500 *BlockResizeArguments500
>    }
>
>    type BlockResizeArgumentsV1 struct {
>         Device string
>         Size int
>     }
>
> app can use
>
>     dev :=3D "dev0"
>     cmd :=3D BlockResizeArguments{
>        V500: &BlockResizeArguments500{
>           Device: dev,
> 	  Size: 1 * GiB
>        }
>     }
>
>
> In 5.2.0 we can now generate
>
>    type BlockResizeArguments struct {
>        V500 *BlockResizeArgumentsV500
>        V520 *BlockResizeArgumentsV520
>    }
>
>    type BlockResizeArgumentsV500 struct {
>         Device string
>         Size int
>     }
>
>    type BlockResizeArgumentsV520 struct {
>         Device *string
> 	NodeName *string
>         Size int
>     }
>
>
> App can use the same as before, or switch to one of
>
>     dev :=3D "dev0"
>     cmd :=3D BlockResizeArguments{
>        V520: &BlockResizeArguments520{
>           Device: &dev,
> 	  Size: 1 * GiB
>        }
>     }
>
> or
>
>     node :=3D "nodedev0"
>     cmd :=3D BlockResizeArguments{
>        V520: &BlockResizeArguments520{
>           NodeName: &node,
> 	  Size: 1 * GiB
>        }
>     }
>
>
>
> In 7.0.0 we can now generate
>
>
>    type BlockResizeArguments struct {
>        V500 *BlockResizeArgumentsV500
>        V520 *BlockResizeArgumentsV520
>        V700 *BlockResizeArgumentsV700
>    }
>
>    type BlockResizeArgumentsV500 struct {
>         Device string
>         Size int
>    }
>
>    type BlockResizeArgumentsV520 struct {
>         Device *string
> 	NodeName *string
>         Size int
>    }
>
>    type BlockResizeArgumentsV700 struct {
> 	NodeName string
>         Size int
>    }
>
>
>
> App can use the same as before, or switch to
>
>     node :=3D "nodedev0"
>     cmd :=3D BlockResizeArguments{
>        V700: &BlockResizeArguments700{
>           NodeName: node,
> 	  Size: 1 * GiB
>        }
>     }
>
>
> This kind of per-command/type versioning is not uncommon when defining API
> protocols/interfaces.

1. At every release, put a copy of the QAPI schema in the freezer.

2. For every copy, generate Go types with a suitable name suffix.
   Collect all the name stems.

3. For each name stem, define a Go struct that contains all the suffixed
   Go types with that stem.

Look Ma, no cluttering the QAPI schema with a full history!  Also no
complicating the schema language to provide the means for that.


