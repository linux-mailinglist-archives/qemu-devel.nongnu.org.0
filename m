Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C55F954E89E
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 19:28:59 +0200 (CEST)
Received: from localhost ([::1]:52626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1tIg-0006YS-E4
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 13:28:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o1tGq-0004x1-Ki
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 13:27:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o1tGm-0000tc-Dw
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 13:27:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655400417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qu5dlq5ZM+xHUgdsOJXpYtxfMpJLvCDGHKpj0lPTj6c=;
 b=JbE9Ry70VpbN2kSFlYbRDFHYA4BtLK88/HY1RNsHHXJOpXzEWUAnYidZ4Qvuo7sL05REfJ
 asAcW1DJIokptuFzYKSoDEcJo0p81MmSWbfZ2fBpyewFNQEsIdeNm5iBWY6B6gMlYljBgT
 x3LKwsolJpAgUYIGtN+qwL2OACZvcmo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-577-Ck993GNZNuOkkOoSRbGAPA-1; Thu, 16 Jun 2022 13:26:50 -0400
X-MC-Unique: Ck993GNZNuOkkOoSRbGAPA-1
Received: by mail-wm1-f72.google.com with SMTP id
 c187-20020a1c35c4000000b003970013833aso893578wma.1
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 10:26:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=qu5dlq5ZM+xHUgdsOJXpYtxfMpJLvCDGHKpj0lPTj6c=;
 b=phQoM2Q0va6k4c5WGctt6dmIvpcWUHDHcAkyC3/pP//u8PDy8bYFIrF4b+pkriJ3ST
 ULdWVscA1bjSPO6Ib0iGFvNlvnpr/lbPX0my5fNPVzEYwvBWZwvlAEFzfJUahoEMfpO6
 FWd9B5JZKVx3IAFE2DRjTdRjBziLrYkmXaVgjDHqmVuOdvLy7g4ZA6opZapOXV/Nu3Ei
 JPeYaRTg2L1r1KxjVwf32iqb0vRLmRuyTRtAvJ6XkeR6zNP+6Janl0qLbWd+eoFsSb4e
 BmB/roRUDG5FkzKhDSUZSSF5i4/A8H2TDMoyn2u40ZL4R8Dg+igXeZCe83DG7VaOdQFg
 oMTQ==
X-Gm-Message-State: AOAM530EPVfRsE+ZCQoIirPS57r7Lgtpoy4z52ELw1yYShorCejMl0wT
 TjMDPeNkhDrU+L4kdv1HK0wAKEDAXxGgouMgp0lHzjXa94Z6yYXaUj6r0VvnvKSs4LzKEgTYakg
 Sr9HL4i0+vdNtyNQ=
X-Received: by 2002:a05:600c:4e54:b0:39c:6e5e:c667 with SMTP id
 e20-20020a05600c4e5400b0039c6e5ec667mr16383757wmq.151.1655400409324; 
 Thu, 16 Jun 2022 10:26:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypyfG983hZO7R6KG7DPxFo/axTFjauifPvkad0lILzZZvuqin0XeMqQyE5tf4e1GNgunnTYw==
X-Received: by 2002:a05:600c:4e54:b0:39c:6e5e:c667 with SMTP id
 e20-20020a05600c4e5400b0039c6e5ec667mr16383717wmq.151.1655400408945; 
 Thu, 16 Jun 2022 10:26:48 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 e4-20020a5d5004000000b0020fdc90aeabsm2398219wrt.82.2022.06.16.10.26.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 10:26:48 -0700 (PDT)
Date: Thu, 16 Jun 2022 18:26:45 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Het Gala <het.gala@nutanix.com>, cfontana@suse.de
Cc: qemu-devel@nongnu.org, quintela@redhat.com, pbonzini@redhat.com,
 berrange@redhat.com, armbru@redhat.com, eblake@redhat.com,
 Manish Mishra <manish.mishra@nutanix.com>
Subject: Re: [PATCH 1/4] Modifying =?utf-8?B?4oCY?=
 =?utf-8?Q?migrate=E2=80=99_qmp_command_t?= =?utf-8?Q?o?= add multi-FD socket
 on particular source and destination pair
Message-ID: <Yqtn1Q5Dkd2fe0G2@work-vm>
References: <20220609073305.142515-1-het.gala@nutanix.com>
 <20220609073305.142515-2-het.gala@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220609073305.142515-2-het.gala@nutanix.com>
User-Agent: Mutt/2.2.5 (2022-05-16)
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
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

* Het Gala (het.gala@nutanix.com) wrote:
> i) Modified the format of the qemu monitor command : 'migrate' by adding a list,
>    each element in the list consists of multi-FD connection parameters: source
>    and destination uris and of the number of multi-fd channels between each pair.
> 
> ii) Information of all multi-FD connection parameters’ list, length of the list
>     and total number of multi-fd channels for all the connections together is
>     stored in ‘OutgoingArgs’ struct.
> 
> Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
> Signed-off-by: Het Gala <het.gala@nutanix.com>
> ---
>  include/qapi/util.h   |  9 ++++++++
>  migration/migration.c | 47 ++++++++++++++++++++++++++++++--------
>  migration/socket.c    | 53 ++++++++++++++++++++++++++++++++++++++++---
>  migration/socket.h    | 17 +++++++++++++-
>  monitor/hmp-cmds.c    | 22 ++++++++++++++++--
>  qapi/migration.json   | 43 +++++++++++++++++++++++++++++++----
>  6 files changed, 170 insertions(+), 21 deletions(-)
> 
> diff --git a/include/qapi/util.h b/include/qapi/util.h
> index 81a2b13a33..3041feb3d9 100644
> --- a/include/qapi/util.h
> +++ b/include/qapi/util.h
> @@ -56,4 +56,13 @@ int parse_qapi_name(const char *name, bool complete);
>      (tail) = &(*(tail))->next; \
>  } while (0)
>  
> +#define QAPI_LIST_LENGTH(list) ({ \
> +    int _len = 0; \
> +    typeof(list) _elem; \
> +    for (_elem = list; _elem != NULL; _elem = _elem->next) { \
> +        _len++; \
> +    } \
> +    _len; \
> +})
> +
>  #endif

This looks like it should be a separate patch to me (and perhaps size_t
for len?)

> diff --git a/migration/migration.c b/migration/migration.c
> index 31739b2af9..c408175aeb 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -2328,13 +2328,14 @@ static bool migrate_prepare(MigrationState *s, bool blk, bool blk_inc,
>      return true;
>  }
>  
> -void qmp_migrate(const char *uri, bool has_blk, bool blk,
> +void qmp_migrate(const char *uri, bool has_multi_fd_uri_list,
> +                 MigrateUriParameterList *cap, bool has_blk, bool blk,
>                   bool has_inc, bool inc, bool has_detach, bool detach,
>                   bool has_resume, bool resume, Error **errp)
>  {
>      Error *local_err = NULL;
>      MigrationState *s = migrate_get_current();
> -    const char *p = NULL;
> +    const char *dst_ptr = NULL;
>  
>      if (!migrate_prepare(s, has_blk && blk, has_inc && inc,
>                           has_resume && resume, errp)) {
> @@ -2348,20 +2349,46 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
>          }
>      }
>  
> +    /*
> +     * In case of Multi-FD migration parameters, if uri is provided,

I think you mean 'if uri list is provided'

> +     * supports only tcp network protocol.
> +     */
> +    if (has_multi_fd_uri_list) {
> +        int length = QAPI_LIST_LENGTH(cap);
> +        init_multifd_array(length);
> +        for (int i = 0; i < length; i++) {
> +            const char *p1 = NULL, *p2 = NULL;

Keep these as ps/pd  to make it clear which is source and dest.

> +            const char *multifd_dst_uri = cap->value->destination_uri;
> +            const char *multifd_src_uri = cap->value->source_uri;
> +            uint8_t multifd_channels = cap->value->multifd_channels;
> +            if (!strstart(multifd_dst_uri, "tcp:", &p1) ||
> +                !strstart(multifd_src_uri, "tcp:", &p2)) {

I've copied in Claudio Fontana; Claudio is fighting to make snapshots
faster and has been playing with various multithread schemes for multifd
with files and fd's;  perhaps the syntax you're proposing doesn't need
to be limited to tcp.

> +                error_setg(errp, "multi-fd destination and multi-fd source "
> +                "uri, both should be present and follows tcp protocol only");
> +                break;
> +            } else {
> +                store_multifd_migration_params(p1 ? p1 : multifd_dst_uri,
> +                                            p2 ? p2 : multifd_src_uri,
> +                                            multifd_channels, i, &local_err);
> +            }
> +            cap = cap->next;
> +        }
> +    }
> +
>      migrate_protocol_allow_multi_channels(false);
> -    if (strstart(uri, "tcp:", &p) ||
> +    if (strstart(uri, "tcp:", &dst_ptr) ||
>          strstart(uri, "unix:", NULL) ||
>          strstart(uri, "vsock:", NULL)) {
>          migrate_protocol_allow_multi_channels(true);
> -        socket_start_outgoing_migration(s, p ? p : uri, &local_err);
> +        socket_start_outgoing_migration(s, dst_ptr ? dst_ptr : uri, &local_err);
>  #ifdef CONFIG_RDMA
> -    } else if (strstart(uri, "rdma:", &p)) {
> -        rdma_start_outgoing_migration(s, p, &local_err);
> +    } else if (strstart(uri, "rdma:", &dst_ptr)) {
> +        rdma_start_outgoing_migration(s, dst_ptr, &local_err);
>  #endif
> -    } else if (strstart(uri, "exec:", &p)) {
> -        exec_start_outgoing_migration(s, p, &local_err);
> -    } else if (strstart(uri, "fd:", &p)) {
> -        fd_start_outgoing_migration(s, p, &local_err);
> +    } else if (strstart(uri, "exec:", &dst_ptr)) {
> +        exec_start_outgoing_migration(s, dst_ptr, &local_err);
> +    } else if (strstart(uri, "fd:", &dst_ptr)) {
> +        fd_start_outgoing_migration(s, dst_ptr, &local_err);
>      } else {
>          if (!(has_resume && resume)) {
>              yank_unregister_instance(MIGRATION_YANK_INSTANCE);
> diff --git a/migration/socket.c b/migration/socket.c
> index 4fd5e85f50..7ca6af8cca 100644
> --- a/migration/socket.c
> +++ b/migration/socket.c
> @@ -32,6 +32,17 @@ struct SocketOutgoingArgs {
>      SocketAddress *saddr;
>  } outgoing_args;
>  
> +struct SocketArgs {
> +    struct SrcDestAddr data;

'data' is an odd name; 'addresses' perhaps?

> +    uint8_t multifd_channels;
> +};
> +
> +struct OutgoingMigrateParams {
> +    struct SocketArgs *socket_args;
> +    size_t length;
> +    uint64_t total_multifd_channel;
> +} outgoing_migrate_params;
> +
>  void socket_send_channel_create(QIOTaskFunc f, void *data)
>  {
>      QIOChannelSocket *sioc = qio_channel_socket_new();
> @@ -47,6 +58,14 @@ int socket_send_channel_destroy(QIOChannel *send)
>          qapi_free_SocketAddress(outgoing_args.saddr);
>          outgoing_args.saddr = NULL;
>      }
> +
> +    if (outgoing_migrate_params.socket_args != NULL) {
> +        g_free(outgoing_migrate_params.socket_args);
> +        outgoing_migrate_params.socket_args = NULL;

I think g_free is safe on NULL; so I think you can just do this without
the if.

> +    }
> +    if (outgoing_migrate_params.length) {

Does that ever differ from the != NULL test ?
I think you can always just set this to 0 without the test.

> +        outgoing_migrate_params.length = 0;
> +    }
>      return 0;
>  }
>  
> @@ -117,13 +136,41 @@ socket_start_outgoing_migration_internal(MigrationState *s,
>  }
>  
>  void socket_start_outgoing_migration(MigrationState *s,
> -                                     const char *str,
> +                                     const char *dst_str,
>                                       Error **errp)
>  {
>      Error *err = NULL;
> -    SocketAddress *saddr = socket_parse(str, &err);
> +    SocketAddress *dst_saddr = socket_parse(dst_str, &err);
> +    if (!err) {
> +        socket_start_outgoing_migration_internal(s, dst_saddr, &err);
> +    }
> +    error_propagate(errp, err);
> +}
> +
> +void init_multifd_array(int length)
> +{
> +    outgoing_migrate_params.socket_args = g_new0(struct SocketArgs, length);
> +    outgoing_migrate_params.length = length;
> +    outgoing_migrate_params.total_multifd_channel = 0;
> +}
> +
> +void store_multifd_migration_params(const char *dst_uri,
> +                                    const char *src_uri,
> +                                    uint8_t multifd_channels,
> +                                    int idx, Error **errp)
> +{
> +    Error *err = NULL;
> +    SocketAddress *src_addr = NULL;
> +    SocketAddress *dst_addr = socket_parse(dst_uri, &err);
> +    if (src_uri) {
> +        src_addr = socket_parse(src_uri, &err);
> +    }
>      if (!err) {
> -        socket_start_outgoing_migration_internal(s, saddr, &err);
> +        outgoing_migrate_params.socket_args[idx].data.dst_addr = dst_addr;
> +        outgoing_migrate_params.socket_args[idx].data.src_addr = src_addr;
> +        outgoing_migrate_params.socket_args[idx].multifd_channels
> +                                                         = multifd_channels;
> +        outgoing_migrate_params.total_multifd_channel += multifd_channels;
>      }
>      error_propagate(errp, err);
>  }
> diff --git a/migration/socket.h b/migration/socket.h
> index 891dbccceb..bba7f177fe 100644
> --- a/migration/socket.h
> +++ b/migration/socket.h
> @@ -19,12 +19,27 @@
>  
>  #include "io/channel.h"
>  #include "io/task.h"
> +#include "migration.h"
> +
> +/* info regarding destination and source uri */
> +struct SrcDestAddr {
> +    SocketAddress *dst_addr;
> +    SocketAddress *src_addr;
> +};
>  
>  void socket_send_channel_create(QIOTaskFunc f, void *data);
>  int socket_send_channel_destroy(QIOChannel *send);
>  
>  void socket_start_incoming_migration(const char *str, Error **errp);
>  
> -void socket_start_outgoing_migration(MigrationState *s, const char *str,
> +void socket_start_outgoing_migration(MigrationState *s, const char *dst_str,
>                                       Error **errp);
> +
> +int multifd_list_length(MigrateUriParameterList *list);
> +
> +void init_multifd_array(int length);
> +
> +void store_multifd_migration_params(const char *dst_uri, const char *src_uri,
> +                                    uint8_t multifd_channels, int idx,
> +                                    Error **erp);
>  #endif
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index 622c783c32..2db539016a 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -56,6 +56,9 @@
>  #include "migration/snapshot.h"
>  #include "migration/misc.h"
>  
> +/* Default number of multi-fd channels */
> +#define DEFAULT_MIGRATE_MULTIFD_CHANNELS 2
> +
>  #ifdef CONFIG_SPICE
>  #include <spice/enums.h>
>  #endif
> @@ -1574,10 +1577,25 @@ void hmp_migrate(Monitor *mon, const QDict *qdict)
>      bool inc = qdict_get_try_bool(qdict, "inc", false);
>      bool resume = qdict_get_try_bool(qdict, "resume", false);
>      const char *uri = qdict_get_str(qdict, "uri");
> +
> +    const char *src_uri = qdict_get_str(qdict, "source-uri");
> +    const char *dst_uri = qdict_get_str(qdict, "destination-uri");
> +    uint8_t multifd_channels = qdict_get_try_int(qdict, "multifd-channels",
> +                                        DEFAULT_MIGRATE_MULTIFD_CHANNELS);
>      Error *err = NULL;
> +    MigrateUriParameterList *caps = NULL;
> +    MigrateUriParameter *value;
> +
> +    value = g_malloc0(sizeof(*value));
> +    value->source_uri = (char *)src_uri;
> +    value->destination_uri = (char *)dst_uri;
> +    value->multifd_channels = multifd_channels;
> +    QAPI_LIST_PREPEND(caps, value);
> +
> +    qmp_migrate(uri, !!caps, caps, !!blk, blk, !!inc,
> +                inc, false, false, true, resume, &err);
> +    qapi_free_MigrateUriParameterList(caps);
>  
> -    qmp_migrate(uri, !!blk, blk, !!inc, inc,
> -                false, false, true, resume, &err);
>      if (hmp_handle_error(mon, err)) {
>          return;
>      }

Please split the HMP changes into a separate patch.

> diff --git a/qapi/migration.json b/qapi/migration.json
> index 6130cd9fae..fb259d626b 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -1454,12 +1454,38 @@
>  ##
>  { 'command': 'migrate-continue', 'data': {'state': 'MigrationStatus'} }
>  
> +##
> +# @MigrateUriParameter:
> +#
> +# Information regarding which source interface is connected to which
> +# destination interface and number of multifd channels over each interface.
> +#
> +# @source-uri: the Uniform Resource Identifier of the source VM.
> +#              Default port number is 0.
> +#
> +# @destination-uri: the Uniform Resource Identifier of the destination VM

I would just say 'uri' rather than spelling it out.

> +# @multifd-channels: number of parallel multifd channels used to migrate data
> +#                    for specific source-uri and destination-uri. Default value
> +#                    in this case is 2 (Since 4.0)

7.1 at the moment.

> +#
> +##
> +{ 'struct' : 'MigrateUriParameter',
> +  'data' : { 'source-uri' : 'str',
> +             'destination-uri' : 'str',
> +             '*multifd-channels' : 'uint8'} }

OK, so much higher level question - why do we specify both URIs on
each end?  Is it just the source that is used on the source side to say
which NIC to route down?  On the destination side I guess there's no
need?

Do we have some rule about needing to specify enough channels for all
the multifd channels we specify (i.e. if we specify 4 multifd channels
in the migration parameter do we have to supply 4 channels here?)
What happens with say Peter's preemption channel?

Is there some logical ordering rule; i.e. if we were to start ordering
particular multifd threads, then can we say that we allocate these
channels in the same order as this list?

>  ##
>  # @migrate:
>  #
>  # Migrates the current running guest to another Virtual Machine.
>  #
>  # @uri: the Uniform Resource Identifier of the destination VM
> +#       for migration thread
> +#
> +# @multi-fd-uri-list: list of pair of source and destination VM Uniform
> +#                     Resource Identifiers with number of multifd-channels
> +#                     for each pair
>  #
>  # @blk: do block migration (full disk copy)
>  #
> @@ -1479,20 +1505,27 @@
>  # 1. The 'query-migrate' command should be used to check migration's progress
>  #    and final result (this information is provided by the 'status' member)
>  #
> -# 2. All boolean arguments default to false
> +# 2. The uri argument should have the Uniform Resource Identifier of default
> +#    destination VM. This connection will be bound to default network
> +#
> +# 3. All boolean arguments default to false
>  #
> -# 3. The user Monitor's "detach" argument is invalid in QMP and should not
> +# 4. The user Monitor's "detach" argument is invalid in QMP and should not
>  #    be used
>  #
>  # Example:
>  #
> -# -> { "execute": "migrate", "arguments": { "uri": "tcp:0:4446" } }
> +# -> { "execute": "migrate",
> +#                 "arguments": { "uri": "tcp:0:4446", "multi-fd-uri-list": [ {
> +#                                "source-uri": "tcp::6900", "destination-uri": "tcp:0:4480",
> +#                                "multifd-channels": 4}, { "source-uri": "tcp:10.0.0.0: ",
> +#                                "destination-uri": "tcp:11.0.0.0:7789", "multifd-channels": 5} ] } }
>  # <- { "return": {} }
>  #
>  ##
>  { 'command': 'migrate',
> -  'data': {'uri': 'str', '*blk': 'bool', '*inc': 'bool',
> -           '*detach': 'bool', '*resume': 'bool' } }
> +  'data': {'uri': 'str', '*multi-fd-uri-list': ['MigrateUriParameter'], '*blk': 'bool',
> +           '*inc': 'bool', '*detach': 'bool', '*resume': 'bool' } }
>  
>  ##
>  # @migrate-incoming:
> -- 
> 2.22.3
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


