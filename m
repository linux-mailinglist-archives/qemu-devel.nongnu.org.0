Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5358B587993
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 11:06:15 +0200 (CEST)
Received: from localhost ([::1]:36428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oInqw-0000aj-Cb
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 05:06:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oImj9-00089L-Fp
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 03:54:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oImj4-0002yZ-UL
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 03:54:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659426841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MeAzO04Dnb3uGm8MF7nssk8EwLyhJiD1FLqytUUqB2E=;
 b=dbuaLseoIafDGW9ETDEiAg4tOzrg0oY/BtLRBCIRL+AQtZmh7ijvm/h/bhfqyiNYnNZvap
 AKGvZaUld02zfv7HgdDdDcCfEplrJ3wmCVqUBbJ2kRaNxtMIx2bR0CReC41RC20cPNnlHd
 CDJVrdKkbLmF1Jx1spBmLzC+r4/w0SU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-508-_OlRWJwXP8SRgz2xPDiwJQ-1; Tue, 02 Aug 2022 03:54:00 -0400
X-MC-Unique: _OlRWJwXP8SRgz2xPDiwJQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E991329AB3E4;
 Tue,  2 Aug 2022 07:53:59 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D4AFE403D0D0;
 Tue,  2 Aug 2022 07:53:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9FB3021E6930; Tue,  2 Aug 2022 09:53:57 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Het Gala <het.gala@nutanix.com>
Cc: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org,
 quintela@redhat.com,  dgilbert@redhat.com,  pbonzini@redhat.com,
 eblake@redhat.com,  prerna.saxena@nutanix.com,  Manish Mishra
 <manish.mishra@nutanix.com>
Subject: Re: [PATCH v2 2/7] multifd: modifying 'migrate' qmp command to add
 multifd socket on particular src and dest pair
References: <20220721195620.123837-1-het.gala@nutanix.com>
 <20220721195620.123837-3-het.gala@nutanix.com>
 <Yt/MZiK3OuvQMRfF@redhat.com>
 <fb5528cf-ccf1-2c21-6899-cb503950d432@nutanix.com>
Date: Tue, 02 Aug 2022 09:53:57 +0200
In-Reply-To: <fb5528cf-ccf1-2c21-6899-cb503950d432@nutanix.com> (Het Gala's
 message of "Thu, 28 Jul 2022 20:32:39 +0530")
Message-ID: <87sfmf84iy.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

Het Gala <het.gala@nutanix.com> writes:

> On 26/07/22 4:43 pm, Daniel P. Berrang=C3=A9 wrote:
>> On Thu, Jul 21, 2022 at 07:56:15PM +0000, Het Gala wrote:
>>> i) Modified the format of the qemu monitor command : 'migrate' by addin=
g a list,
>>>     each element in the list consisting of multifd connection parameter=
s: source
>>>     uri, destination uri and of the number of multifd channels between =
each pair.
>>>
>>> ii) Information of all multifd connection parameters' list and length o=
f the
>>>      list is stored in 'OutgoingMigrateParams' struct.
>>>
>>> Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
>>> Signed-off-by: Het Gala <het.gala@nutanix.com>
>>> ---
>>>   migration/migration.c | 52 +++++++++++++++++++++++++++++--------
>>>   migration/socket.c    | 60 ++++++++++++++++++++++++++++++++++++++++---
>>>   migration/socket.h    | 19 +++++++++++++-
>>>   monitor/hmp-cmds.c    |  1 +
>>>   qapi/migration.json   | 47 +++++++++++++++++++++++++++++----
>>>   5 files changed, 160 insertions(+), 19 deletions(-)
>>>
>>> diff --git a/qapi/migration.json b/qapi/migration.json
>>> index 81185d4311..456247af8f 100644
>>> --- a/qapi/migration.json
>>> +++ b/qapi/migration.json
>>> @@ -1449,12 +1449,37 @@
>>>   ##
>>>   { 'command': 'migrate-continue', 'data': {'state': 'MigrationStatus'}=
 }
>>>   +##
>>> +# @MigrateUriParameter:
>>> +#
>>> +# Information regarding which source interface is connected to which
>>> +# destination interface and number of multifd channels over each inter=
face.
>>> +#
>>> +# @source-uri: uri of the source VM. Default port number is 0.
>>> +#
>>> +# @destination-uri: uri of the destination VM
>>> +#
>>> +# @multifd-channels: number of parallel multifd channels used to migra=
te data
>>> +#                    for specific source-uri and destination-uri. Defa=
ult value
>>> +#                    in this case is 2 (Since 7.1)
>>> +#
>>> +##
>>> +{ 'struct' : 'MigrateUriParameter',
>>> +  'data' : { 'source-uri' : 'str',
>>> +             'destination-uri' : 'str',
>>> +             '*multifd-channels' : 'uint8'} }
>>> +
>>>   ##
>>>   # @migrate:
>>>   #
>>>   # Migrates the current running guest to another Virtual Machine.
>>>   #
>>>   # @uri: the Uniform Resource Identifier of the destination VM
>>> +#       for migration thread
>>> +#
>>> +# @multi-fd-uri-list: list of pair of source and destination VM Uniform
>>> +#                     Resource Identifiers with number of multifd-chan=
nels
>>> +#                     for each pair
>>>   #
>>>   # @blk: do block migration (full disk copy)
>>>   #
>>> @@ -1474,20 +1499,32 @@
>>>   # 1. The 'query-migrate' command should be used to check migration's =
progress
>>>   #    and final result (this information is provided by the 'status' m=
ember)
>>>   #
>>> -# 2. All boolean arguments default to false
>>> +# 2. The uri argument should have the Uniform Resource Identifier of d=
efault
>>> +#    destination VM. This connection will be bound to default network
>>>   #
>>> -# 3. The user Monitor's "detach" argument is invalid in QMP and should=
 not
>>> +# 3. All boolean arguments default to false
>>> +#
>>> +# 4. The user Monitor's "detach" argument is invalid in QMP and should=
 not
>>>   #    be used
>>>   #
>>>   # Example:
>>>   #
>>> -# -> { "execute": "migrate", "arguments": { "uri": "tcp:0:4446" } }
>>> +# -> { "execute": "migrate",
>>> +#      "arguments": {
>>> +#          "uri": "tcp:0:4446",
>>> +#          "multi-fd-uri-list": [ { "source-uri": "tcp::6900",
>>> +#                                   "destination-uri": "tcp:0:4480",
>>> +#                                   "multifd-channels": 4},
>>> +#                                 { "source-uri": "tcp:10.0.0.0: ",
>>> +#                                   "destination-uri": "tcp:11.0.0.0:7=
789",
>>> +#                                   "multifd-channels": 5} ] } }
>>>   # <- { "return": {} }
>>>   #
>>>   ##
>>>   { 'command': 'migrate',
>>> -  'data': {'uri': 'str', '*blk': 'bool', '*inc': 'bool',
>>> -           '*detach': 'bool', '*resume': 'bool' } }
>>> +  'data': {'uri': 'str', '*multi-fd-uri-list': ['MigrateUriParameter'],
>>> +           '*blk': 'bool', '*inc': 'bool', '*detach': 'bool',
>>> +           '*resume': 'bool' } }
>>
>> Considering the existing migrate API from a QAPI design POV, I
>> think there are several significant flaws with it
>>
>> The use of URIs is the big red flag. It is basically a data encoding
>> scheme within a data encoding scheme.  QEMU code should be able to
>> directly work with the results from QAPI, without having todo a
>> second level of parsing.

Concur.

>> URIs made sense in the context of HMP or the QemuOpts CLI, but do not
>> make sense in QMP. We made a mistake in this respect when we first
>> introduced QMP and implemented 'migrate'.
>>
>> If we going to extend the migrate API I think we should stop using URIs
>> for the new fields, and instead define a QAPI discriminated union for
>> the different data transport backends we offer.
>>
>>       { 'enum': 'MigrateTransport',
>>         'data': ['socket', 'exec'] }
>>
>>       { 'union': 'MigrateAddress',
>>         'base': { 'transport': 'MigrateTransport'},
>>         'discriminator': 'transport',
>>         'data': {
>>             'socket': 'SocketAddress',
>> 	   'exec': ['str'],
>>         }
>>
>> NB, 'socket' should be able to cover all of  'tcp', 'unix', 'vsock'
>> and 'fd' already. I'm fuzzy on best way to represent RDMA.
>>
>>
>> IIUC, the desire of migration maintainers is that we can ultimately
>> have multifd as the preferred, or even only, mechanism. Aside from
>> the main outbound migration control channel, and the multifd
>> data channels, IIUC we have a potential desire to have more channels
>> for post-copy async requests.
>>
>> This all suggests to me a more general representation along the
>> lines of:
>>
>>    { 'enum': 'MigrateChannelType',
>>      'data': ['control', 'data', 'async'] }
>>
>>    { 'struct': 'MigrateChannel',
>>      'data': {
>>         'type': 'MigrateChannelType',
>>         'src-addr': 'MigrateAddress',
>>         'dst-addr': 'MigrateAddress',
>>         'count': 'int',
>>      } }
>>
>>    { 'comand': 'migrate',
>>      'data': {
>>        '*uri': 'str'
>>        '*channels': ['MigrateChannel']
>>      }
>>    }
>>
>> With 'uri' and 'channels' being mutually exclusive here.
>>
>> This whole scheme brings in redundancy wrt to the 'migrate-set-parameter=
s'
>> API wrt multifd - essentally the same data is now being set in two
>> different places. IMHO, we should declare the 'multifd' capability
>> and the 'multifd-chanels' parameter deprecated, since the information
>> they provide is totally redundant, if you're giving an explicit list
>> of channels to 'migrate'.
>
> Hi Daniel. Initially while brainstorming this idea for the first time, we=
 also came up with the same thought of depricating the migrate=20
> API. But how will we achieve this now and how is it going to work. Is it =
like we will be making migate V2 APIs initially, integrate it and then=20
> depricate the old one? would be happy to get some pointers from your end.

Migration maintainers, please advise.


