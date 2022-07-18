Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A88A5578595
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 16:36:43 +0200 (CEST)
Received: from localhost ([::1]:36896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDRrW-0007B3-OG
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 10:36:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oDRp2-0001Uw-GQ
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 10:34:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oDRoy-00005Z-HN
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 10:34:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658154843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ha/BMsc7EVnxjyCSEZhtkPhwN+ppLtxxzu5qQ7Q3UUY=;
 b=FP46d9/GF5Oq+gHxxWmuoMTVJYeR5j6FiNikkWDnuKBa9KJYKMdKJznTfsQa+qzamQFh/7
 EZfeCWr77tXctNyPRl6GQt9N2WwgznAkQOrz8q1AmnKh8SH/Q7MAlgiau1mD0VQYpQ7eyM
 KBKGGE1rRB/kQLbMwyp4LreJSR6IiGs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-207-ccKKv3vZP9mfpdSngRsVVA-1; Mon, 18 Jul 2022 10:33:57 -0400
X-MC-Unique: ccKKv3vZP9mfpdSngRsVVA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 06EFE85A588;
 Mon, 18 Jul 2022 14:33:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.194.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9464240C1288;
 Mon, 18 Jul 2022 14:33:56 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 353A921E690D; Mon, 18 Jul 2022 16:33:55 +0200 (CEST)
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
Date: Mon, 18 Jul 2022 16:33:55 +0200
In-Reply-To: <06e02954-f94d-0508-90f1-a8610e1a09cf@nutanix.com> (Het Gala's
 message of "Mon, 18 Jul 2022 19:03:34 +0530")
Message-ID: <877d4a7ang.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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

> On 18/07/22 2:05 pm, Markus Armbruster wrote:
>> Het Gala <het.gala@nutanix.com> writes:
>>
>>> i) Modified the format of the qemu monitor command : 'migrate' by addin=
g a list,
>>>     each element in the list consists of multi-FD connection parameters=
: source
>>>     and destination uris and of the number of multi-fd channels between=
 each pair.
>>>
>>> ii) Information of all multi-FD connection parameters=E2=80=99 list, le=
ngth of the list
>>>      and total number of multi-fd channels for all the connections toge=
ther is
>>>      stored in =E2=80=98OutgoingArgs=E2=80=99 struct.
>>>
>>> Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
>>> Signed-off-by: Het Gala <het.gala@nutanix.com>
>>> ---
>>>   include/qapi/util.h   |  9 ++++++++
>>>   migration/migration.c | 47 ++++++++++++++++++++++++++++++--------
>>>   migration/socket.c    | 53 ++++++++++++++++++++++++++++++++++++++++---
>>>   migration/socket.h    | 17 +++++++++++++-
>>>   monitor/hmp-cmds.c    | 22 ++++++++++++++++--
>>>   qapi/migration.json   | 43 +++++++++++++++++++++++++++++++----
>>>   6 files changed, 170 insertions(+), 21 deletions(-)
>>>
>>> diff --git a/include/qapi/util.h b/include/qapi/util.h
>>> index 81a2b13a33..3041feb3d9 100644
>>> --- a/include/qapi/util.h
>>> +++ b/include/qapi/util.h
>>> @@ -56,4 +56,13 @@ int parse_qapi_name(const char *name, bool complete);
>>>       (tail) =3D &(*(tail))->next; \
>>>   } while (0)
>>>=20
>>> +#define QAPI_LIST_LENGTH(list) ({ \
>>> +    int _len =3D 0; \
>>> +    typeof(list) _elem; \
>>> +    for (_elem =3D list; _elem !=3D NULL; _elem =3D _elem->next) { \
>>> +        _len++; \
>>> +    } \
>>> +    _len; \
>>> +})
>>> +
>>
>> Unless there is a compelling reason for open-coding this, make it a
>> (non-inline) function.
>>
> if kept as a function, the datatype of list is different every time
> in the qemu code, and that led to multiple copies of this function. So
> we decided, it would be best to keep it as a macro defined function. We
> would be happy to hear any suggstions to solve this problem while the
> function non-inline.

Point taken.

You could make it a function taking a GenericList *, but then you'd have
to cast actual list pointers to GenericList, which isn't nice.

>>>   #endif
>>> diff --git a/migration/migration.c b/migration/migration.c
>>> index 31739b2af9..c408175aeb 100644
>>> --- a/migration/migration.c
>>> +++ b/migration/migration.c
>>> @@ -2328,13 +2328,14 @@ static bool migrate_prepare(MigrationState *s, =
bool blk, bool blk_inc,
>>>       return true;
>>>   }
>>>=20
>>> -void qmp_migrate(const char *uri, bool has_blk, bool blk,
>>> +void qmp_migrate(const char *uri, bool has_multi_fd_uri_list,
>>> +                 MigrateUriParameterList *cap, bool has_blk, bool blk,
>>>                    bool has_inc, bool inc, bool has_detach, bool detach,
>>>                    bool has_resume, bool resume, Error **errp)
>>>   {
>>>       Error *local_err =3D NULL;
>>>       MigrationState *s =3D migrate_get_current();
>>> -    const char *p =3D NULL;
>>> +    const char *dst_ptr =3D NULL;
>>>=20
>>>       if (!migrate_prepare(s, has_blk && blk, has_inc && inc,
>>>                            has_resume && resume, errp)) {
>>> @@ -2348,20 +2349,46 @@ void qmp_migrate(const char *uri, bool has_blk,=
 bool blk,
>>>           }
>>>       }
>>>=20
>>> +    /*
>>> +     * In case of Multi-FD migration parameters, if uri is provided,
>>> +     * supports only tcp network protocol.
>>> +     */
>>> +    if (has_multi_fd_uri_list) {
>>> +        int length =3D QAPI_LIST_LENGTH(cap);
>>> +        init_multifd_array(length);
>>> +        for (int i =3D 0; i < length; i++) {
>>> +            const char *p1 =3D NULL, *p2 =3D NULL;
>>> +            const char *multifd_dst_uri =3D cap->value->destination_ur=
i;
>>> +            const char *multifd_src_uri =3D cap->value->source_uri;
>>> +            uint8_t multifd_channels =3D cap->value->multifd_channels;
>>> +            if (!strstart(multifd_dst_uri, "tcp:", &p1) ||
>>> +                !strstart(multifd_src_uri, "tcp:", &p2)) {
>>> +                error_setg(errp, "multi-fd destination and multi-fd so=
urce "
>>> +                "uri, both should be present and follows tcp protocol =
only");
>>> +                break;
>>> +            } else {
>>> +                store_multifd_migration_params(p1 ? p1 : multifd_dst_u=
ri,
>>> +                                            p2 ? p2 : multifd_src_uri,
>>> +                                            multifd_channels, i, &loca=
l_err);
>>> +            }
>>> +            cap =3D cap->next;
>>> +        }
>>> +    }
>>> +
>>>       migrate_protocol_allow_multi_channels(false);
>>> -    if (strstart(uri, "tcp:", &p) ||
>>> +    if (strstart(uri, "tcp:", &dst_ptr) ||
>>>           strstart(uri, "unix:", NULL) ||
>>>           strstart(uri, "vsock:", NULL)) {
>>>           migrate_protocol_allow_multi_channels(true);
>>> -        socket_start_outgoing_migration(s, p ? p : uri, &local_err);
>>> +        socket_start_outgoing_migration(s, dst_ptr ? dst_ptr : uri, &l=
ocal_err);
>>>   #ifdef CONFIG_RDMA
>>> -    } else if (strstart(uri, "rdma:", &p)) {
>>> -        rdma_start_outgoing_migration(s, p, &local_err);
>>> +    } else if (strstart(uri, "rdma:", &dst_ptr)) {
>>> +        rdma_start_outgoing_migration(s, dst_ptr, &local_err);
>>>   #endif
>>> -    } else if (strstart(uri, "exec:", &p)) {
>>> -        exec_start_outgoing_migration(s, p, &local_err);
>>> -    } else if (strstart(uri, "fd:", &p)) {
>>> -        fd_start_outgoing_migration(s, p, &local_err);
>>> +    } else if (strstart(uri, "exec:", &dst_ptr)) {
>>> +        exec_start_outgoing_migration(s, dst_ptr, &local_err);
>>> +    } else if (strstart(uri, "fd:", &dst_ptr)) {
>>> +        fd_start_outgoing_migration(s, dst_ptr, &local_err);
>>>       } else {
>>>           if (!(has_resume && resume)) {
>>>               yank_unregister_instance(MIGRATION_YANK_INSTANCE);
>>> diff --git a/migration/socket.c b/migration/socket.c
>>> index 4fd5e85f50..7ca6af8cca 100644
>>> --- a/migration/socket.c
>>> +++ b/migration/socket.c
>>> @@ -32,6 +32,17 @@ struct SocketOutgoingArgs {
>>>       SocketAddress *saddr;
>>>   } outgoing_args;
>>>=20
>>> +struct SocketArgs {
>>> +    struct SrcDestAddr data;
>>> +    uint8_t multifd_channels;
>>> +};
>>> +
>>> +struct OutgoingMigrateParams {
>>> +    struct SocketArgs *socket_args;
>>> +    size_t length;
>>
>> Length of what?
>
> length of the socket_args[] array. Thanks for pointing it out. I will
> be more specific for this variable in the v2 patchset series.
>
>>> +    uint64_t total_multifd_channel;
>>
>> @total_multifd_channels appears to be the sum of the
>> socket_args[*].multifd_channels.  Correct?
>
> Yes Markus, you are correct.

Sure you need to keep the sum separately?

>>> +} outgoing_migrate_params;
>>> +
>>>   void socket_send_channel_create(QIOTaskFunc f, void *data)
>>>   {
>>>       QIOChannelSocket *sioc =3D qio_channel_socket_new();
>>> @@ -47,6 +58,14 @@ int socket_send_channel_destroy(QIOChannel *send)
>>>           qapi_free_SocketAddress(outgoing_args.saddr);
>>>           outgoing_args.saddr =3D NULL;
>>>       }
>>> +
>>> +    if (outgoing_migrate_params.socket_args !=3D NULL) {
>>> +        g_free(outgoing_migrate_params.socket_args);
>>> +        outgoing_migrate_params.socket_args =3D NULL;
>>> +    }
>>> +    if (outgoing_migrate_params.length) {
>>> +        outgoing_migrate_params.length =3D 0;
>>> +    }
>>>       return 0;
>>>   }
>>>=20
>>> @@ -117,13 +136,41 @@ socket_start_outgoing_migration_internal(Migratio=
nState *s,
>>>   }
>>>=20
>>>   void socket_start_outgoing_migration(MigrationState *s,
>>> -                                     const char *str,
>>> +                                     const char *dst_str,
>>>                                        Error **errp)
>>>   {
>>>       Error *err =3D NULL;
>>> -    SocketAddress *saddr =3D socket_parse(str, &err);
>>> +    SocketAddress *dst_saddr =3D socket_parse(dst_str, &err);
>>> +    if (!err) {
>>> +        socket_start_outgoing_migration_internal(s, dst_saddr, &err);
>>> +    }
>>> +    error_propagate(errp, err);
>>> +}
>>> +
>>> +void init_multifd_array(int length)
>>> +{
>>> +    outgoing_migrate_params.socket_args =3D g_new0(struct SocketArgs, =
length);
>>> +    outgoing_migrate_params.length =3D length;
>>> +    outgoing_migrate_params.total_multifd_channel =3D 0;
>>> +}
>>> +
>>> +void store_multifd_migration_params(const char *dst_uri,
>>> +                                    const char *src_uri,
>>> +                                    uint8_t multifd_channels,
>>> +                                    int idx, Error **errp)
>>> +{
>>> +    Error *err =3D NULL;
>>> +    SocketAddress *src_addr =3D NULL;
>>> +    SocketAddress *dst_addr =3D socket_parse(dst_uri, &err);
>>> +    if (src_uri) {
>>> +        src_addr =3D socket_parse(src_uri, &err);
>>> +    }
>>
>> Incorrect use of &err.  error.h's big comment:
>>
>>   * Receive and accumulate multiple errors (first one wins):
>>   *     Error *err =3D NULL, *local_err =3D NULL;
>>   *     foo(arg, &err);
>>   *     bar(arg, &local_err);
>>   *     error_propagate(&err, local_err);
>>   *     if (err) {
>>   *         handle the error...
>>   *     }
>>   *
>>   * Do *not* "optimize" this to
>>   *     Error *err =3D NULL;
>>   *     foo(arg, &err);
>>   *     bar(arg, &err); // WRONG!
>>   *     if (err) {
>>   *         handle the error...
>>   *     }
>>   * because this may pass a non-null err to bar().
>>
> Thankyou Markus for sharing this knowledge. I was unaware of the
> dont's with &err.

The big comment should help you along.  If it doesn't, just ask.

>>>       if (!err) {
>>> -        socket_start_outgoing_migration_internal(s, saddr, &err);
>>> +        outgoing_migrate_params.socket_args[idx].data.dst_addr =3D dst=
_addr;
>>> +        outgoing_migrate_params.socket_args[idx].data.src_addr =3D src=
_addr;
>>> +        outgoing_migrate_params.socket_args[idx].multifd_channels
>>> +                                                         =3D multifd_c=
hannels;
>>> +        outgoing_migrate_params.total_multifd_channel +=3D multifd_cha=
nnels;
>>>       }
>>>       error_propagate(errp, err);
>>
>> Consider
>>
>>         struct SocketArgs *sa =3D &outgoing_migrate_params.socket_args[i=
dx];
>>         SocketAddress *src_addr, *dst_addr;
>>
>>         src_addr =3D socketaddress(src_uri, errp);
>>         if (!src_addr) {
>>             return;
>>         }
>>
>>         dst_addr =3D socketaddress(dst_uri, errp);
>>         if (!dst_addr) {
>>             return;
>>         }
>>
>>         sa->data.dst_addr =3D dst_addr;
>>         sa->data.src_addr =3D src_addr;
>>         sa->multifd_channels =3D multifd_channels;
>>         outgoing_migrate_params.total_multifd_channel +=3D multifd_chann=
els;
>
> Thanks Markus for this amazing suggestion. Your approach looks
> simpler to understand and also resolves the error it had with &err. I
> will surely implement this in the upcoming v2 patchset.

You're welcome :)

>>>   }
>>> diff --git a/migration/socket.h b/migration/socket.h
>>> index 891dbccceb..bba7f177fe 100644
>>> --- a/migration/socket.h
>>> +++ b/migration/socket.h
>>> @@ -19,12 +19,27 @@
>>>=20
>>>   #include "io/channel.h"
>>>   #include "io/task.h"
>>> +#include "migration.h"
>>> +
>>> +/* info regarding destination and source uri */
>>> +struct SrcDestAddr {
>>> +    SocketAddress *dst_addr;
>>> +    SocketAddress *src_addr;
>>> +};
>>
>> QEMU coding style wants a typedef.
>
> Okay, acknowledged.
>
>>>=20
>>>   void socket_send_channel_create(QIOTaskFunc f, void *data);
>>>   int socket_send_channel_destroy(QIOChannel *send);
>>>=20
>>>   void socket_start_incoming_migration(const char *str, Error **errp);
>>>=20
>>> -void socket_start_outgoing_migration(MigrationState *s, const char *st=
r,
>>> +void socket_start_outgoing_migration(MigrationState *s, const char *ds=
t_str,
>>>                                        Error **errp);
>>> +
>>> +int multifd_list_length(MigrateUriParameterList *list);
>>> +
>>> +void init_multifd_array(int length);
>>> +
>>> +void store_multifd_migration_params(const char *dst_uri, const char *s=
rc_uri,
>>> +                                    uint8_t multifd_channels, int idx,
>>> +                                    Error **erp);
>>>   #endif
>>> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
>>> index 622c783c32..2db539016a 100644
>>> --- a/monitor/hmp-cmds.c
>>> +++ b/monitor/hmp-cmds.c
>>> @@ -56,6 +56,9 @@
>>>   #include "migration/snapshot.h"
>>>   #include "migration/misc.h"
>>>=20
>>> +/* Default number of multi-fd channels */
>>> +#define DEFAULT_MIGRATE_MULTIFD_CHANNELS 2
>>> +
>>>   #ifdef CONFIG_SPICE
>>>   #include <spice/enums.h>
>>>   #endif
>>> @@ -1574,10 +1577,25 @@ void hmp_migrate(Monitor *mon, const QDict *qdi=
ct)
>>>       bool inc =3D qdict_get_try_bool(qdict, "inc", false);
>>>       bool resume =3D qdict_get_try_bool(qdict, "resume", false);
>>>       const char *uri =3D qdict_get_str(qdict, "uri");
>>> +
>>> +    const char *src_uri =3D qdict_get_str(qdict, "source-uri");
>>> +    const char *dst_uri =3D qdict_get_str(qdict, "destination-uri");
>>> +    uint8_t multifd_channels =3D qdict_get_try_int(qdict, "multifd-cha=
nnels",
>>> +                                        DEFAULT_MIGRATE_MULTIFD_CHANNE=
LS);
>>>       Error *err =3D NULL;
>>> +    MigrateUriParameterList *caps =3D NULL;
>>> +    MigrateUriParameter *value;
>>> +
>>> +    value =3D g_malloc0(sizeof(*value));
>>> +    value->source_uri =3D (char *)src_uri;
>>> +    value->destination_uri =3D (char *)dst_uri;
>>> +    value->multifd_channels =3D multifd_channels;
>>> +    QAPI_LIST_PREPEND(caps, value);
>>> +
>>> +    qmp_migrate(uri, !!caps, caps, !!blk, blk, !!inc,
>>> +                inc, false, false, true, resume, &err);
>>> +    qapi_free_MigrateUriParameterList(caps);
>>>=20
>>> -    qmp_migrate(uri, !!blk, blk, !!inc, inc,
>>> -                false, false, true, resume, &err);
>>>       if (hmp_handle_error(mon, err)) {
>>>           return;
>>>       }
>>> diff --git a/qapi/migration.json b/qapi/migration.json
>>> index 6130cd9fae..fb259d626b 100644
>>> --- a/qapi/migration.json
>>> +++ b/qapi/migration.json
>>> @@ -1454,12 +1454,38 @@
>>>   ##
>>>   { 'command': 'migrate-continue', 'data': {'state': 'MigrationStatus'}=
 }
>>>=20
>>> +##
>>> +# @MigrateUriParameter:
>>> +#
>>> +# Information regarding which source interface is connected to which
>>> +# destination interface and number of multifd channels over each inter=
face.
>>> +#
>>> +# @source-uri: the Uniform Resource Identifier of the source VM.
>>> +#              Default port number is 0.
>>> +#
>>> +# @destination-uri: the Uniform Resource Identifier of the destination=
 VM
>>> +#
>>> +# @multifd-channels: number of parallel multifd channels used to migra=
te data
>>> +#                    for specific source-uri and destination-uri. Defa=
ult value
>>> +#                    in this case is 2 (Since 4.0)
>>
>> You mean "(Since 7.1)", I guess.
>
> Yes yes. Also David pointed this thing out. I will update the version
> in the v2 patchset.
>
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
>>> @@ -1479,20 +1505,27 @@
>>>   # 1. The 'query-migrate' command should be used to check migration's =
progress
>>>   #    and final result (this information is provided by the 'status' m=
ember)
>>>   #
>>> -# 2. All boolean arguments default to false
>>> +# 2. The uri argument should have the Uniform Resource Identifier of d=
efault
>>> +#    destination VM. This connection will be bound to default network
>>> +#
>>> +# 3. All boolean arguments default to false
>>>   #
>>> -# 3. The user Monitor's "detach" argument is invalid in QMP and should=
 not
>>> +# 4. The user Monitor's "detach" argument is invalid in QMP and should=
 not
>>>   #    be used
>>>   #
>>>   # Example:
>>>   #
>>> -# -> { "execute": "migrate", "arguments": { "uri": "tcp:0:4446" } }
>>> +# -> { "execute": "migrate",
>>> +#                 "arguments": { "uri": "tcp:0:4446", "multi-fd-uri-li=
st": [ {
>>> +#                                "source-uri": "tcp::6900", "destinati=
on-uri": "tcp:0:4480",
>>> +#                                "multifd-channels": 4}, { "source-uri=
": "tcp:10.0.0.0: ",
>>> +#                                "destination-uri": "tcp:11.0.0.0:7789=
", "multifd-channels": 5} ] } }
>>>   # <- { "return": {} }
>>>   #
>>>   ##
>>>   { 'command': 'migrate',
>>> -  'data': {'uri': 'str', '*blk': 'bool', '*inc': 'bool',
>>> -           '*detach': 'bool', '*resume': 'bool' } }
>>> +  'data': {'uri': 'str', '*multi-fd-uri-list': ['MigrateUriParameter']=
, '*blk': 'bool',
??
>> Long line.
>
> Okay, acknowledged. Even for example, should it be under 80
> characters per line, or that is fine?

docs/devel/style.rst:

    Line width
    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

    Lines should be 80 characters; try not to make them longer.

    Sometimes it is hard to do, especially when dealing with QEMU subsystems
    that use long function or symbol names. If wrapping the line at 80 colu=
mns
    is obviously less readable and more awkward, prefer not to wrap it; bet=
ter
    to have an 85 character line than one which is awkwardly wrapped.

    Even in that case, try not to make lines much longer than 80 characters.
    (The checkpatch script will warn at 100 characters, but this is intended
    as a guard against obviously-overlength lines, not a target.)

Personally, I very much prefer to wrap between 70 and 75 except where it
impairs legibility.

>>
>>> +           '*inc': 'bool', '*detach': 'bool', '*resume': 'bool' } }
>>>=20=20
>>>   ##
>>>   # @migrate-incoming:
>
> Regards,
>
> Het Gala


