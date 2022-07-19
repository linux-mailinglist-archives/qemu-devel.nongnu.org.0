Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3CA5793E7
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 09:13:17 +0200 (CEST)
Received: from localhost ([::1]:43664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDhPw-0001Ma-Hp
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 03:13:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oDhJP-0005lV-2R
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 03:06:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oDhJL-0003JB-Ul
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 03:06:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658214387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1mYfbaVzrEr12/ogKnUkbYWq/SE57sHnl4vCy5oHmx4=;
 b=MiYo2D/fSOUasIQ3RlWezYSEsqe8pRhpXWV9f3CpkKIFxn6GHb6N8TVFfERFKGEX92nAB0
 ziTKelF5BjtIDcuYNwkq5atqyGLXzk+9QnRJ0rn/C1XG8MpFdHqx/OFW//HmqkAnbUdH2h
 KgG8bJUWQqtPyfzYBg8l/ldCMXZhObc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-283-DjDCR2fVMLqqsrEsU6MAFQ-1; Tue, 19 Jul 2022 03:06:24 -0400
X-MC-Unique: DjDCR2fVMLqqsrEsU6MAFQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A0A361C0690E;
 Tue, 19 Jul 2022 07:06:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 59F972026D64;
 Tue, 19 Jul 2022 07:06:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3207621E690D; Tue, 19 Jul 2022 09:06:22 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Het Gala <het.gala@nutanix.com>
Cc: qemu-devel@nongnu.org,  quintela@redhat.com,  dgilbert@redhat.com,
 pbonzini@redhat.com,  berrange@redhat.com,  eblake@redhat.com,  Manish
 Mishra <manish.mishra@nutanix.com>
Subject: Re: [PATCH 1/4] Modifying =?utf-8?B?4oCYbWlncmF0ZeKAmQ==?= qmp
 command to add multi-FD
 socket on particular source and destination pair
References: <20220609073305.142515-1-het.gala@nutanix.com>
 <20220609073305.142515-2-het.gala@nutanix.com>
 <87h73ees2r.fsf@pond.sub.org>
 <06e02954-f94d-0508-90f1-a8610e1a09cf@nutanix.com>
 <877d4a7ang.fsf@pond.sub.org>
 <c3792d65-b24c-be02-f988-fa1c0e27d490@nutanix.com>
Date: Tue, 19 Jul 2022 09:06:22 +0200
In-Reply-To: <c3792d65-b24c-be02-f988-fa1c0e27d490@nutanix.com> (Het Gala's
 message of "Mon, 18 Jul 2022 20:47:53 +0530")
Message-ID: <8735ex1t01.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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

Het Gala <het.gala@nutanix.com> writes:

> On 18/07/22 8:03 pm, Markus Armbruster wrote:
>> Het Gala <het.gala@nutanix.com> writes:
>>
>>> On 18/07/22 2:05 pm, Markus Armbruster wrote:
>>>> Het Gala <het.gala@nutanix.com> writes:
>>>>
>>>>> i) Modified the format of the qemu monitor command : 'migrate' by add=
ing a list,
>>>>>      each element in the list consists of multi-FD connection paramet=
ers: source
>>>>>      and destination uris and of the number of multi-fd channels betw=
een each pair.
>>>>>
>>>>> ii) Information of all multi-FD connection parameters=E2=80=99 list, =
length of the list
>>>>>       and total number of multi-fd channels for all the connections t=
ogether is
>>>>>       stored in =E2=80=98OutgoingArgs=E2=80=99 struct.
>>>>>
>>>>> Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
>>>>> Signed-off-by: Het Gala <het.gala@nutanix.com>
>>>>> ---

[...]

>>>>> diff --git a/migration/socket.c b/migration/socket.c
>>>>> index 4fd5e85f50..7ca6af8cca 100644
>>>>> --- a/migration/socket.c
>>>>> +++ b/migration/socket.c
>>>>> @@ -32,6 +32,17 @@ struct SocketOutgoingArgs {
>>>>>        SocketAddress *saddr;
>>>>>    } outgoing_args;
>>>>>
>>>>> +struct SocketArgs {
>>>>> +    struct SrcDestAddr data;
>>>>> +    uint8_t multifd_channels;
>>>>> +};
>>>>> +
>>>>> +struct OutgoingMigrateParams {
>>>>> +    struct SocketArgs *socket_args;
>>>>> +    size_t length;
>>>> Length of what?
>>> length of the socket_args[] array. Thanks for pointing it out. I will
>>> be more specific for this variable in the v2 patchset series.
>>>
>>>>> +    uint64_t total_multifd_channel;
>>>> @total_multifd_channels appears to be the sum of the
>>>> socket_args[*].multifd_channels.  Correct?
>>> Yes Markus, you are correct.
>> Sure you need to keep the sum separately?
>
> So earlier, the idea behind this was that, we had this intention to depre=
ciate the migrate_multifd_channels() API from the live migration=20
> process. We made total_multifd_channels() function, where it used to calc=
ulate total number of multifd channels every time, for whichever=20
> function called was computation internsive so we replaced it by returning=
 sum of socket_args[*].multifd_channels i.e.=20
> total_multifd_channel in the later patches.
>
> =C2=A0But now in the v2 patchset onwards, Thanks to inputs from Dr. David=
 and Daniel, we are not depricating migrate_multifd_channels() API but=20
> the value from the API will be cross-referenced with sum of socket_args[*=
].multifd_channels i.e. total_multifd_channel, and error if=20
> they are not equal.

I'm afraid I don't understand.  I'm not sure I have to.  Let me loop
back to my question.

If @total_multifd_channel is always the sum of the
socket_args[*].multifd_channels, then you can always compute it on the
fly.

I.e. you can replace @total_multifd_channel by a function that returns
the sum.

Precomputing it instead is more complex, because then you need to
document that the two are the same.  Also, bug oppertunity: letting them
deviate somehow.  I figure that's worthwhile only if computing on the
fly is too expensive.

>>>>> +} outgoing_migrate_params;
>>>>> +
>>>>>    void socket_send_channel_create(QIOTaskFunc f, void *data)
>>>>>    {
>>>>>        QIOChannelSocket *sioc =3D qio_channel_socket_new();
>>>>> @@ -47,6 +58,14 @@ int socket_send_channel_destroy(QIOChannel *send)
>>>>>            qapi_free_SocketAddress(outgoing_args.saddr);
>>>>>            outgoing_args.saddr =3D NULL;
>>>>>        }
>>>>> +
>>>>> +    if (outgoing_migrate_params.socket_args !=3D NULL) {
>>>>> +        g_free(outgoing_migrate_params.socket_args);
>>>>> +        outgoing_migrate_params.socket_args =3D NULL;
>>>>> +    }
>>>>> +    if (outgoing_migrate_params.length) {
>>>>> +        outgoing_migrate_params.length =3D 0;
>>>>> +    }
>>>>>        return 0;
>>>>>    }
>>>>>
>>>>> @@ -117,13 +136,41 @@ socket_start_outgoing_migration_internal(Migrat=
ionState *s,
>>>>>    }
>>>>>
>>>>>    void socket_start_outgoing_migration(MigrationState *s,
>>>>> -                                     const char *str,
>>>>> +                                     const char *dst_str,
>>>>>                                         Error **errp)
>>>>>    {
>>>>>        Error *err =3D NULL;
>>>>> -    SocketAddress *saddr =3D socket_parse(str, &err);
>>>>> +    SocketAddress *dst_saddr =3D socket_parse(dst_str, &err);
>>>>> +    if (!err) {
>>>>> +        socket_start_outgoing_migration_internal(s, dst_saddr, &err);
>>>>> +    }
>>>>> +    error_propagate(errp, err);
>>>>> +}
>>>>> +
>>>>> +void init_multifd_array(int length)
>>>>> +{
>>>>> +    outgoing_migrate_params.socket_args =3D g_new0(struct SocketArgs=
, length);
>>>>> +    outgoing_migrate_params.length =3D length;
>>>>> +    outgoing_migrate_params.total_multifd_channel =3D 0;
>>>>> +}
>>>>> +
>>>>> +void store_multifd_migration_params(const char *dst_uri,
>>>>> +                                    const char *src_uri,
>>>>> +                                    uint8_t multifd_channels,
>>>>> +                                    int idx, Error **errp)
>>>>> +{
>>>>> +    Error *err =3D NULL;
>>>>> +    SocketAddress *src_addr =3D NULL;
>>>>> +    SocketAddress *dst_addr =3D socket_parse(dst_uri, &err);
>>>>> +    if (src_uri) {
>>>>> +        src_addr =3D socket_parse(src_uri, &err);
>>>>> +    }
>>>> Incorrect use of &err.  error.h's big comment:
>>>>
>>>>    * Receive and accumulate multiple errors (first one wins):
>>>>    *     Error *err =3D NULL, *local_err =3D NULL;
>>>>    *     foo(arg, &err);
>>>>    *     bar(arg, &local_err);
>>>>    *     error_propagate(&err, local_err);
>>>>    *     if (err) {
>>>>    *         handle the error...
>>>>    *     }
>>>>    *
>>>>    * Do *not* "optimize" this to
>>>>    *     Error *err =3D NULL;
>>>>    *     foo(arg, &err);
>>>>    *     bar(arg, &err); // WRONG!
>>>>    *     if (err) {
>>>>    *         handle the error...
>>>>    *     }
>>>>    * because this may pass a non-null err to bar().
>>>>
>>> Thankyou Markus for sharing this knowledge. I was unaware of the
>>> dont's with &err.
>> The big comment should help you along.  If it doesn't, just ask.
>> I read the comment, and it is pretty well explained out there.
>>
>>>>>        if (!err) {
>>>>> -        socket_start_outgoing_migration_internal(s, saddr, &err);
>>>>> +        outgoing_migrate_params.socket_args[idx].data.dst_addr =3D d=
st_addr;
>>>>> +        outgoing_migrate_params.socket_args[idx].data.src_addr =3D s=
rc_addr;
>>>>> +        outgoing_migrate_params.socket_args[idx].multifd_channels
>>>>> +                                                         =3D multifd=
_channels;
>>>>> +        outgoing_migrate_params.total_multifd_channel +=3D multifd_c=
hannels;
>>>>>        }
>>>>>        error_propagate(errp, err);
>>>> Consider
>>>>
>>>>          struct SocketArgs *sa =3D &outgoing_migrate_params.socket_arg=
s[idx];
>>>>          SocketAddress *src_addr, *dst_addr;
>>>>
>>>>          src_addr =3D socketaddress(src_uri, errp);
>>>>          if (!src_addr) {
>>>>              return;
>>>>          }
>>>>
>>>>          dst_addr =3D socketaddress(dst_uri, errp);
>>>>          if (!dst_addr) {
>>>>              return;
>>>>          }
>>>>
>>>>          sa->data.dst_addr =3D dst_addr;
>>>>          sa->data.src_addr =3D src_addr;
>>>>          sa->multifd_channels =3D multifd_channels;
>>>>          outgoing_migrate_params.total_multifd_channel +=3D multifd_ch=
annels;
>>> Thanks Markus for this amazing suggestion. Your approach looks
>>> simpler to understand and also resolves the error it had with &err. I
>>> will surely implement this in the upcoming v2 patchset.
>> You're welcome :)
>
> I just wanted to have a double check on the solution you gave above Marku=
s. The suggestion you have given there has been deliberately=20
> written in that way right, because
>
> src_addr =3D socketaddress(src_uri, errp);
> dst_addr =3D socketaddress(dst_uri, errp);
> if (!src_addr) {
>     return;
> }
> if (!dst_addr) {
>     return;
> }
>
> would still be an error right according to the &err guidelines from error=
.h file.

Correct.

>>>>>    }

[...]

>>>>> diff --git a/qapi/migration.json b/qapi/migration.json
>>>>> index 6130cd9fae..fb259d626b 100644
>>>>> --- a/qapi/migration.json
>>>>> +++ b/qapi/migration.json
>>>>> @@ -1454,12 +1454,38 @@
>>>>>    ##
>>>>>    { 'command': 'migrate-continue', 'data': {'state': 'MigrationStatu=
s'} }
>>>>>
>>>>> +##
>>>>> +# @MigrateUriParameter:
>>>>> +#
>>>>> +# Information regarding which source interface is connected to which
>>>>> +# destination interface and number of multifd channels over each int=
erface.
>>>>> +#
>>>>> +# @source-uri: the Uniform Resource Identifier of the source VM.
>>>>> +#              Default port number is 0.
>>>>> +#
>>>>> +# @destination-uri: the Uniform Resource Identifier of the destinati=
on VM
>>>>> +#
>>>>> +# @multifd-channels: number of parallel multifd channels used to mig=
rate data
>>>>> +#                    for specific source-uri and destination-uri. De=
fault value
>>>>> +#                    in this case is 2 (Since 4.0)
>>>> You mean "(Since 7.1)", I guess.
>>> Yes yes. Also David pointed this thing out. I will update the version
>>> in the v2 patchset.
>>>
>>>>> +#
>>>>> +##
>>>>> +{ 'struct' : 'MigrateUriParameter',
>>>>> +  'data' : { 'source-uri' : 'str',
>>>>> +             'destination-uri' : 'str',
>>>>> +             '*multifd-channels' : 'uint8'} }
>>>>> +
>>>>>    ##
>>>>>    # @migrate:
>>>>>    #
>>>>>    # Migrates the current running guest to another Virtual Machine.
>>>>>    #
>>>>>    # @uri: the Uniform Resource Identifier of the destination VM
>>>>> +#       for migration thread
>>>>> +#
>>>>> +# @multi-fd-uri-list: list of pair of source and destination VM Unif=
orm
>>>>> +#                     Resource Identifiers with number of multifd-ch=
annels
>>>>> +#                     for each pair
>>>>>    #
>>>>>    # @blk: do block migration (full disk copy)
>>>>>    #
>>>>> @@ -1479,20 +1505,27 @@
>>>>>    # 1. The 'query-migrate' command should be used to check migration=
's progress
>>>>>    #    and final result (this information is provided by the 'status=
' member)
>>>>>    #
>>>>> -# 2. All boolean arguments default to false
>>>>> +# 2. The uri argument should have the Uniform Resource Identifier of=
 default
>>>>> +#    destination VM. This connection will be bound to default network
>>>>> +#
>>>>> +# 3. All boolean arguments default to false
>>>>>    #
>>>>> -# 3. The user Monitor's "detach" argument is invalid in QMP and shou=
ld not
>>>>> +# 4. The user Monitor's "detach" argument is invalid in QMP and shou=
ld not
>>>>>    #    be used
>>>>>    #
>>>>>    # Example:
>>>>>    #
>>>>> -# -> { "execute": "migrate", "arguments": { "uri": "tcp:0:4446" } }
>>>>> +# -> { "execute": "migrate",
>>>>> +#                 "arguments": { "uri": "tcp:0:4446", "multi-fd-uri-=
list": [ {
>>>>> +#                                "source-uri": "tcp::6900", "destina=
tion-uri": "tcp:0:4480",
>>>>> +#                                "multifd-channels": 4}, { "source-u=
ri": "tcp:10.0.0.0: ",
>>>>> +#                                "destination-uri": "tcp:11.0.0.0:77=
89", "multifd-channels": 5} ] } }
>>>>>    # <- { "return": {} }
>>>>>    #
>>>>>    ##
>>>>>    { 'command': 'migrate',
>>>>> -  'data': {'uri': 'str', '*blk': 'bool', '*inc': 'bool',
>>>>> -           '*detach': 'bool', '*resume': 'bool' } }
>>>>> +  'data': {'uri': 'str', '*multi-fd-uri-list': ['MigrateUriParameter=
'], '*blk': 'bool',
> ??
>
> Sorry Markus, I think the statement I wrote did not make sense, I apologi=
se for that. I meant to say example in the sense:
>
>   # Example:
>   #
> # -> { "execute": "migrate", "arguments": { "uri": "tcp:0:4446" } }
> # -> { "execute": "migrate",
> #                 "arguments": { "uri": "tcp:0:4446", "multi-fd-uri-list"=
: [ {
> #                                "source-uri": "tcp::6900", "destination-=
uri": "tcp:0:4480",
> #                                "multifd-channels": 4}, { "source-uri": =
"tcp:10.0.0.0: ",
> #                                "destination-uri": "tcp:11.0.0.0:7789", =
"multifd-channels": 5} ] } }
>
> even this we should try to wrap within 80 character column right? or is t=
hat okay to go beyond 80.

I'd format it like

  # -> { "execute": "migrate",
  #      "arguments": {
  #          "uri": "tcp:0:4446",
  #          "multi-fd-uri-list": [
  #              { "source-uri": "tcp::6900",
  #                "destination-uri": "tcp:0:4480",
  #                "multifd-channels": 4 },
  #              { "source-uri": "tcp:10.0.0.0: ",
  #                "destination-uri": "tcp:11.0.0.0:7789",
  #                 "multifd-channels": 5} ] } }

>>>> Long line.
>>> Okay, acknowledged. Even for example, should it be under 80
>>> characters per line, or that is fine?
>> docs/devel/style.rst:
>>
>>      Line width
>>      =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
>>      Lines should be 80 characters; try not to make them longer.
>>
>>      Sometimes it is hard to do, especially when dealing with QEMU subsy=
stems
>>      that use long function or symbol names. If wrapping the line at 80 =
columns
>>      is obviously less readable and more awkward, prefer not to wrap it;=
 better
>>      to have an 85 character line than one which is awkwardly wrapped.
>>
>>      Even in that case, try not to make lines much longer than 80 charac=
ters.
>>      (The checkpatch script will warn at 100 characters, but this is int=
ended
>>      as a guard against obviously-overlength lines, not a target.)
>>
>> Personally, I very much prefer to wrap between 70 and 75 except where it
>> impairs legibility.
> Okay thanks again Markus for your valuable suggestion. I will try to wrap=
 within 75 in almost all the cases.
>>>>> +           '*inc': 'bool', '*detach': 'bool', '*resume': 'bool' } }
>>>>>      ##
>>>>>    # @migrate-incoming:
>>> Regards,
>>>
>>> Het Gala
>
> Regards,
>
> Het Gala


