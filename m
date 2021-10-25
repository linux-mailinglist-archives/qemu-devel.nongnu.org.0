Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75502439EFD
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 21:09:09 +0200 (CEST)
Received: from localhost ([::1]:54104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf5LI-0000Tv-It
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 15:09:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mf5Hd-00070v-8F
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 15:05:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mf5HX-0000u9-H1
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 15:05:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635188714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=II+91Dt6ux8IaekPnxQAkUuOXnYjnQzDW9deG9MHiHU=;
 b=TcNg4gBCB5Jnx4d1Jv34q9HjPhEcHbw04imde5Rik4KPi4Rl+Ie/3nLLSzOXdQUaGfGff/
 C0fpP29yKILblZsr8sBP/Yl4CdTN2VumslNjSwYlqFxOsWDy0vpwy7EAAxLYugg4Gu2wAx
 5H57TYCdNzXt+IfIL0FUWYHHLS6lbdg=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-uPuye8BhNsa-wSld1ydkCA-1; Mon, 25 Oct 2021 15:05:13 -0400
X-MC-Unique: uPuye8BhNsa-wSld1ydkCA-1
Received: by mail-ua1-f70.google.com with SMTP id
 97-20020ab0026a000000b002cb89a52468so3034343uas.19
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 12:05:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=II+91Dt6ux8IaekPnxQAkUuOXnYjnQzDW9deG9MHiHU=;
 b=mvjauUJ+4kMN08v21VOQaSwit9fFkJpeSabVfb+8DmYK47pEJxfZoAt5kGNB1fE7YC
 d/v6cDPyjFj5ihGahakQSo5cjTsTmCepS+9Xx1fEc7GDMggkeFkoCHh95Bh3cM/C1dY5
 DGr5id2a8qQI6hVEkFVUs4pueWQA5XfNogUkmmweKf32cZFX/e7WgCpOV38r8qUdD2s/
 Of/gaLVuq98hxXJ21jP12398C76PYCvHFKsXia46HuVP/1Ssxe+MMfhH6Y/DDP0Wk/9n
 o6V1brEDNDQBLAWzvy4BRoZgFk9zFq7JUlqPrf4yDg25UyqM1DASs0kqmh9xHfboz023
 e23A==
X-Gm-Message-State: AOAM530hilAEihuzkmfCZZMBxtTTUYonHU2DTlsH/HWXJInJ/Kx7CYfh
 U4oMM5G/NFbuRKsZcCnlxGrzP5syJNdFjMatWABnGX4wkbaJ+TOQtHyTfYMAlwCNLvtm+bLPnwa
 GVJ7+0eS4XBLnrdOh/dEy2x2G1HPih6M=
X-Received: by 2002:ab0:3c54:: with SMTP id u20mr9468860uaw.32.1635188712838; 
 Mon, 25 Oct 2021 12:05:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRS6UE1EH61sJwhwgJFmvz3Yzv4t5dhSvBGi3UEVTK47/pfsk4ObESuodfA2nG0kWIykpnzp1qBsbaq9eR+sI=
X-Received: by 2002:ab0:3c54:: with SMTP id u20mr9468821uaw.32.1635188712593; 
 Mon, 25 Oct 2021 12:05:12 -0700 (PDT)
MIME-Version: 1.0
References: <20211025052532.3859634-1-armbru@redhat.com>
 <20211025052532.3859634-3-armbru@redhat.com>
In-Reply-To: <20211025052532.3859634-3-armbru@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 25 Oct 2021 15:05:01 -0400
Message-ID: <CAFn=p-bkEhAMknmKm_242Yb6RkDyhjuPtWxmQUEfsexgx9PHaw@mail.gmail.com>
Subject: Re: [PATCH 2/9] qapi: Mark unstable QMP parts with feature 'unstable'
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000005aebad05cf320a9d"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, pkrempa@redhat.com,
 Daniel Berrange <berrange@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 libvir-list@redhat.com, qemu-devel <qemu-devel@nongnu.org>,
 mdroth@linux.vnet.ibm.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005aebad05cf320a9d
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 25, 2021 at 1:25 AM Markus Armbruster <armbru@redhat.com> wrote:

> Add special feature 'unstable' everywhere the name starts with 'x-',
> except for InputBarrierProperties member x-origin and
> MemoryBackendProperties member x-use-canonical-path-for-ramblock-id,
> because these two are actually stable.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  qapi/block-core.json | 123 +++++++++++++++++++++++++++++++------------
>  qapi/migration.json  |  35 +++++++++---
>  qapi/misc.json       |   6 ++-
>  qapi/qom.json        |  11 ++--
>  4 files changed, 130 insertions(+), 45 deletions(-)
>
> diff --git a/qapi/block-core.json b/qapi/block-core.json
> index 6d3217abb6..ce2c1352cb 100644
> --- a/qapi/block-core.json
> +++ b/qapi/block-core.json
> @@ -1438,6 +1438,9 @@
>  #
>  # @x-perf: Performance options. (Since 6.0)
>  #
> +# Features:
> +# @unstable: Member @x-perf is experimental.
> +#
>

It'd be a lot cooler if we could annotate the unstable member directly
instead of confusing it with the syntax that might describe the entire
struct/union/command/etc, but ... eh, it's just a doc field, so I'm not
gonna press on this. I don't have the energy to get into a doc formatting
standard discussion right now, so: sure, why not?


>  # Note: @on-source-error and @on-target-error only affect background
>  #       I/O.  If an error occurs during a guest write request, the
> device's
>  #       rerror/werror actions will be used.
> @@ -1452,7 +1455,9 @@
>              '*on-source-error': 'BlockdevOnError',
>              '*on-target-error': 'BlockdevOnError',
>              '*auto-finalize': 'bool', '*auto-dismiss': 'bool',
> -            '*filter-node-name': 'str', '*x-perf': 'BackupPerf'  } }
> +            '*filter-node-name': 'str',
> +            '*x-perf': { 'type': 'BackupPerf',
> +                         'features': [ 'unstable' ] } } }
>
>  ##
>  # @DriveBackup:
> @@ -1916,9 +1921,13 @@
>  #
>  # Get the block graph.
>  #
> +# Features:
> +# @unstable: This command is meant for debugging.
> +#
>  # Since: 4.0
>  ##
> -{ 'command': 'x-debug-query-block-graph', 'returns': 'XDbgBlockGraph' }
> +{ 'command': 'x-debug-query-block-graph', 'returns': 'XDbgBlockGraph',
> +  'features': [ 'unstable' ] }
>
>  ##
>  # @drive-mirror:
> @@ -2257,6 +2266,9 @@
>  #
>  # Get bitmap SHA256.
>  #
> +# Features:
> +# @unstable: This command is meant for debugging.
> +#
>  # Returns: - BlockDirtyBitmapSha256 on success
>  #          - If @node is not a valid block device, DeviceNotFound
>  #          - If @name is not found or if hashing has failed, GenericError
> with an
> @@ -2265,7 +2277,8 @@
>  # Since: 2.10
>  ##
>  { 'command': 'x-debug-block-dirty-bitmap-sha256',
> -  'data': 'BlockDirtyBitmap', 'returns': 'BlockDirtyBitmapSha256' }
> +  'data': 'BlockDirtyBitmap', 'returns': 'BlockDirtyBitmapSha256',
> +  'features': [ 'unstable' ] }
>
>  ##
>  # @blockdev-mirror:
> @@ -2495,27 +2508,57 @@
>  #
>  # Properties for throttle-group objects.
>  #
> -# The options starting with x- are aliases for the same key without x- in
> -# the @limits object. As indicated by the x- prefix, this is not a stable
> -# interface and may be removed or changed incompatibly in the future. Use
> -# @limits for a supported stable interface.
> -#
>  # @limits: limits to apply for this throttle group
>  #
> +# Features:
> +# @unstable: All members starting with x- are aliases for the same key
> +#            without x- in the @limits object.  This is not a stable
> +#            interface and may be removed or changed incompatibly in
> +#            the future.  Use @limits for a supported stable
> +#            interface.
> +#
>  # Since: 2.11
>  ##
>  { 'struct': 'ThrottleGroupProperties',
>    'data': { '*limits': 'ThrottleLimits',
> -            '*x-iops-total' : 'int', '*x-iops-total-max' : 'int',
> -            '*x-iops-total-max-length' : 'int', '*x-iops-read' : 'int',
> -            '*x-iops-read-max' : 'int', '*x-iops-read-max-length' : 'int',
> -            '*x-iops-write' : 'int', '*x-iops-write-max' : 'int',
> -            '*x-iops-write-max-length' : 'int', '*x-bps-total' : 'int',
> -            '*x-bps-total-max' : 'int', '*x-bps-total-max-length' : 'int',
> -            '*x-bps-read' : 'int', '*x-bps-read-max' : 'int',
> -            '*x-bps-read-max-length' : 'int', '*x-bps-write' : 'int',
> -            '*x-bps-write-max' : 'int', '*x-bps-write-max-length' : 'int',
> -            '*x-iops-size' : 'int' } }
> +            '*x-iops-total': { 'type': 'int',
> +                               'features': [ 'unstable' ] },
> +            '*x-iops-total-max': { 'type': 'int',
> +                                   'features': [ 'unstable' ] },
> +            '*x-iops-total-max-length': { 'type': 'int',
> +                                          'features': [ 'unstable' ] },
> +            '*x-iops-read': { 'type': 'int',
> +                              'features': [ 'unstable' ] },
> +            '*x-iops-read-max': { 'type': 'int',
> +                                  'features': [ 'unstable' ] },
> +            '*x-iops-read-max-length': { 'type': 'int',
> +                                         'features': [ 'unstable' ] },
> +            '*x-iops-write': { 'type': 'int',
> +                               'features': [ 'unstable' ] },
> +            '*x-iops-write-max': { 'type': 'int',
> +                                   'features': [ 'unstable' ] },
> +            '*x-iops-write-max-length': { 'type': 'int',
> +                                          'features': [ 'unstable' ] },
> +            '*x-bps-total': { 'type': 'int',
> +                              'features': [ 'unstable' ] },
> +            '*x-bps-total-max': { 'type': 'int',
> +                                  'features': [ 'unstable' ] },
> +            '*x-bps-total-max-length': { 'type': 'int',
> +                                         'features': [ 'unstable' ] },
> +            '*x-bps-read': { 'type': 'int',
> +                             'features': [ 'unstable' ] },
> +            '*x-bps-read-max': { 'type': 'int',
> +                                 'features': [ 'unstable' ] },
> +            '*x-bps-read-max-length': { 'type': 'int',
> +                                        'features': [ 'unstable' ] },
> +            '*x-bps-write': { 'type': 'int',
> +                              'features': [ 'unstable' ] },
> +            '*x-bps-write-max': { 'type': 'int',
> +                                  'features': [ 'unstable' ] },
> +            '*x-bps-write-max-length': { 'type': 'int',
> +                                         'features': [ 'unstable' ] },
> +            '*x-iops-size': { 'type': 'int',
> +                              'features': [ 'unstable' ] } } }
>
>  ##
>  # @block-stream:
> @@ -2916,6 +2959,7 @@
>  #                          read-only when the last writer is detached.
> This
>  #                          allows giving QEMU write permissions only on
> demand
>  #                          when an operation actually needs write access.
> +# @unstable: Member x-check-cache-dropped is meant for debugging.
>  #
>  # Since: 2.9
>  ##
> @@ -2926,7 +2970,8 @@
>              '*aio': 'BlockdevAioOptions',
>              '*drop-cache': {'type': 'bool',
>                              'if': 'CONFIG_LINUX'},
> -            '*x-check-cache-dropped': 'bool' },
> +            '*x-check-cache-dropped': { 'type': 'bool',
> +                                        'features': [ 'unstable' ] } },
>    'features': [ { 'name': 'dynamic-auto-read-only',
>                    'if': 'CONFIG_POSIX' } ] }
>
> @@ -4041,13 +4086,16 @@
>  #                   future requests before a successful reconnect will
>  #                   immediately fail. Default 0 (Since 4.2)
>  #
> +# Features:
> +# @unstable: Member @x-dirty-bitmap is experimental.
> +#
>  # Since: 2.9
>  ##
>  { 'struct': 'BlockdevOptionsNbd',
>    'data': { 'server': 'SocketAddress',
>              '*export': 'str',
>              '*tls-creds': 'str',
> -            '*x-dirty-bitmap': 'str',
> +            '*x-dirty-bitmap': { 'type': 'str', 'features': [ 'unstable'
> ] },
>              '*reconnect-delay': 'uint32' } }
>
>  ##
> @@ -4865,13 +4913,17 @@
>  #                   and replacement of an active keyslot
>  #                   (possible loss of data if IO error happens)
>  #
> +# Features:
> +# @unstable: This command is experimental.
> +#
>  # Since: 5.1
>  ##
>  { 'command': 'x-blockdev-amend',
>    'data': { 'job-id': 'str',
>              'node-name': 'str',
>              'options': 'BlockdevAmendOptions',
> -            '*force': 'bool' } }
> +            '*force': 'bool' },
> +  'features': [ 'unstable' ] }
>
>  ##
>  # @BlockErrorAction:
> @@ -5242,16 +5294,18 @@
>  #
>  # @node: the name of the node that will be added.
>  #
> -# Note: this command is experimental, and its API is not stable. It
> -#       does not support all kinds of operations, all kinds of children,
> nor
> -#       all block drivers.
> +# Features:
> +# @unstable: This command is experimental, and its API is not stable.  It
> +#            does not support all kinds of operations, all kinds of
> +#            children, nor all block drivers.
>  #
> -#       FIXME Removing children from a quorum node means introducing gaps
> in the
> -#       child indices. This cannot be represented in the 'children' list
> of
> -#       BlockdevOptionsQuorum, as returned by .bdrv_refresh_filename().
> +#            FIXME Removing children from a quorum node means introducing
> +#            gaps in the child indices. This cannot be represented in the
> +#            'children' list of BlockdevOptionsQuorum, as returned by
> +#            .bdrv_refresh_filename().
>  #
> -#       Warning: The data in a new quorum child MUST be consistent with
> that of
> -#       the rest of the array.
> +#            Warning: The data in a new quorum child MUST be consistent
> +#            with that of the rest of the array.
>  #
>  # Since: 2.7
>  #
> @@ -5280,7 +5334,8 @@
>  { 'command': 'x-blockdev-change',
>    'data' : { 'parent': 'str',
>               '*child': 'str',
> -             '*node': 'str' } }
> +             '*node': 'str' },
> +  'features': [ 'unstable' ] }
>
>  ##
>  # @x-blockdev-set-iothread:
> @@ -5297,8 +5352,9 @@
>  # @force: true if the node and its children should be moved when a
> BlockBackend
>  #         is already attached
>  #
> -# Note: this command is experimental and intended for test cases that need
> -#       control over IOThreads only.
> +# Features:
> +# @unstable: This command is experimental and intended for test cases that
> +#            need control over IOThreads only.
>  #
>  # Since: 2.12
>  #
> @@ -5320,7 +5376,8 @@
>  { 'command': 'x-blockdev-set-iothread',
>    'data' : { 'node-name': 'str',
>               'iothread': 'StrOrNull',
> -             '*force': 'bool' } }
> +             '*force': 'bool' },
> +  'features': [ 'unstable' ] }
>
>  ##
>  # @QuorumOpType:
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 88f07baedd..9aa8bc5759 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -452,14 +452,20 @@
>  #                       procedure starts. The VM RAM is saved with
> running VM.
>  #                       (since 6.0)
>  #
> +# Features:
> +# @unstable: Members @x-colo and @x-ignore-shared are experimental.
> +#
>  # Since: 1.2
>  ##
>  { 'enum': 'MigrationCapability',
>    'data': ['xbzrle', 'rdma-pin-all', 'auto-converge', 'zero-blocks',
> -           'compress', 'events', 'postcopy-ram', 'x-colo', 'release-ram',
> +           'compress', 'events', 'postcopy-ram',
> +           { 'name': 'x-colo', 'features': [ 'unstable' ] },
> +           'release-ram',
>             'block', 'return-path', 'pause-before-switchover', 'multifd',
>             'dirty-bitmaps', 'postcopy-blocktime', 'late-block-activate',
> -           'x-ignore-shared', 'validate-uuid', 'background-snapshot'] }
> +           { 'name': 'x-ignore-shared', 'features': [ 'unstable' ] },
> +           'validate-uuid', 'background-snapshot'] }
>
>  ##
>  # @MigrationCapabilityStatus:
> @@ -743,6 +749,9 @@
>  #                        block device name if there is one, and to their
> node name
>  #                        otherwise. (Since 5.2)
>  #
> +# Features:
> +# @unstable: Member @x-checkpoint-delay is experimental.
> +#
>  # Since: 2.4
>  ##
>  { 'enum': 'MigrationParameter',
> @@ -753,7 +762,9 @@
>             'cpu-throttle-initial', 'cpu-throttle-increment',
>             'cpu-throttle-tailslow',
>             'tls-creds', 'tls-hostname', 'tls-authz', 'max-bandwidth',
> -           'downtime-limit', 'x-checkpoint-delay', 'block-incremental',
> +           'downtime-limit',
> +           { 'name': 'x-checkpoint-delay', 'features': [ 'unstable' ] },
> +           'block-incremental',
>             'multifd-channels',
>             'xbzrle-cache-size', 'max-postcopy-bandwidth',
>             'max-cpu-throttle', 'multifd-compression',
> @@ -903,6 +914,9 @@
>  #                        block device name if there is one, and to their
> node name
>  #                        otherwise. (Since 5.2)
>  #
> +# Features:
> +# @unstable: Member @x-checkpoint-delay is experimental.
> +#
>  # Since: 2.4
>  ##
>  # TODO either fuse back into MigrationParameters, or make
> @@ -925,7 +939,8 @@
>              '*tls-authz': 'StrOrNull',
>              '*max-bandwidth': 'size',
>              '*downtime-limit': 'uint64',
> -            '*x-checkpoint-delay': 'uint32',
> +            '*x-checkpoint-delay': { 'type': 'uint32',
> +                                     'features': [ 'unstable' ] },
>              '*block-incremental': 'bool',
>              '*multifd-channels': 'uint8',
>              '*xbzrle-cache-size': 'size',
> @@ -1099,6 +1114,9 @@
>  #                        block device name if there is one, and to their
> node name
>  #                        otherwise. (Since 5.2)
>  #
> +# Features:
> +# @unstable: Member @x-checkpoint-delay is experimental.
> +#
>  # Since: 2.4
>  ##
>  { 'struct': 'MigrationParameters',
> @@ -1119,7 +1137,8 @@
>              '*tls-authz': 'str',
>              '*max-bandwidth': 'size',
>              '*downtime-limit': 'uint64',
> -            '*x-checkpoint-delay': 'uint32',
> +            '*x-checkpoint-delay': { 'type': 'uint32',
> +                                     'features': [ 'unstable' ] },
>              '*block-incremental': 'bool',
>              '*multifd-channels': 'uint8',
>              '*xbzrle-cache-size': 'size',
> @@ -1351,6 +1370,9 @@
>  # If sent to the Secondary, the Secondary side will run failover work,
>  # then takes over server operation to become the service VM.
>  #
> +# Features:
> +# @unstable: This command is experimental.
> +#
>  # Since: 2.8
>  #
>  # Example:
> @@ -1359,7 +1381,8 @@
>  # <- { "return": {} }
>  #
>  ##
> -{ 'command': 'x-colo-lost-heartbeat' }
> +{ 'command': 'x-colo-lost-heartbeat',
> +  'features': [ 'unstable' ] }
>
>  ##
>  # @migrate_cancel:
> diff --git a/qapi/misc.json b/qapi/misc.json
> index 5c2ca3b556..358548abe1 100644
> --- a/qapi/misc.json
> +++ b/qapi/misc.json
> @@ -185,6 +185,9 @@
>  # available during the preconfig state (i.e. when the --preconfig command
>  # line option was in use).
>  #
> +# Features:
> +# @unstable: This command is experimental.
> +#
>  # Since 3.0
>  #
>  # Returns: nothing
> @@ -195,7 +198,8 @@
>  # <- { "return": {} }
>  #
>  ##
> -{ 'command': 'x-exit-preconfig', 'allow-preconfig': true }
> +{ 'command': 'x-exit-preconfig', 'allow-preconfig': true,
> +  'features': [ 'unstable' ] }
>
>  ##
>  # @human-monitor-command:
> diff --git a/qapi/qom.json b/qapi/qom.json
> index 7231ac3f34..ccd1167808 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -559,10 +559,8 @@
>  #                                        for ramblock-id. Disable this
> for 4.0
>  #                                        machine types or older to allow
>  #                                        migration with newer QEMU
> versions.
> -#                                        This option is considered stable
> -#                                        despite the x- prefix. (default:
> -#                                        false generally, but true for
> machine
> -#                                        types <= 4.0)
> +#                                        (default: false generally,
> +#                                        but true for machine types <=
> 4.0)
>  #
>  # Note: prealloc=true and reserve=false cannot be set at the same time.
> With
>  #       reserve=true, the behavior depends on the operating system: for
> example,
> @@ -785,6 +783,9 @@
>  ##
>  # @ObjectType:
>  #
> +# Features:
> +# @unstable: Member @x-remote-object is experimental.
> +#
>  # Since: 6.0
>  ##
>  { 'enum': 'ObjectType',
> @@ -836,7 +837,7 @@
>      'tls-creds-psk',
>      'tls-creds-x509',
>      'tls-cipher-suites',
> -    'x-remote-object'
> +    { 'name': 'x-remote-object', 'features': [ 'unstable' ] }
>    ] }
>
>  ##
> --
> 2.31.1
>
>
Seems OK, but I didn't audit for false positives/negatives. Trusting your
judgment here. (It looks like Phil started to audit this in his reply to
your previous commit, so I'll trust that.)

Acked-by: John Snow <jsnow@redhat.com>

--0000000000005aebad05cf320a9d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Oct 25, 2021 at 1:25 AM Marku=
s Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Add =
special feature &#39;unstable&#39; everywhere the name starts with &#39;x-&=
#39;,<br>
except for InputBarrierProperties member x-origin and<br>
MemoryBackendProperties member x-use-canonical-path-for-ramblock-id,<br>
because these two are actually stable.<br>
<br>
Signed-off-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" t=
arget=3D"_blank">armbru@redhat.com</a>&gt;<br>
---<br>
=C2=A0qapi/block-core.json | 123 +++++++++++++++++++++++++++++++-----------=
-<br>
=C2=A0qapi/migration.json=C2=A0 |=C2=A0 35 +++++++++---<br>
=C2=A0qapi/misc.json=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 ++-<br>
=C2=A0qapi/qom.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 11 ++--<br>
=C2=A04 files changed, 130 insertions(+), 45 deletions(-)<br>
<br>
diff --git a/qapi/block-core.json b/qapi/block-core.json<br>
index 6d3217abb6..ce2c1352cb 100644<br>
--- a/qapi/block-core.json<br>
+++ b/qapi/block-core.json<br>
@@ -1438,6 +1438,9 @@<br>
=C2=A0#<br>
=C2=A0# @x-perf: Performance options. (Since 6.0)<br>
=C2=A0#<br>
+# Features:<br>
+# @unstable: Member @x-perf is experimental.<br>
+#<br></blockquote><div><br></div><div>It&#39;d be a lot cooler if we could=
 annotate the unstable member directly instead of confusing it with the syn=
tax that might describe the entire struct/union/command/etc, but ... eh, it=
&#39;s just a doc field, so I&#39;m not gonna press on this. I don&#39;t ha=
ve the energy to get into a doc formatting standard discussion right now, s=
o: sure, why not?<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
=C2=A0# Note: @on-source-error and @on-target-error only affect background<=
br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0I/O.=C2=A0 If an error occurs during a gu=
est write request, the device&#39;s<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0rerror/werror actions will be used.<br>
@@ -1452,7 +1455,9 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*on-source-error&#39;:=
 &#39;BlockdevOnError&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*on-target-error&#39;:=
 &#39;BlockdevOnError&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*auto-finalize&#39;: &=
#39;bool&#39;, &#39;*auto-dismiss&#39;: &#39;bool&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*filter-node-name&#39;: &#3=
9;str&#39;, &#39;*x-perf&#39;: &#39;BackupPerf&#39;=C2=A0 } }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*filter-node-name&#39;: &#3=
9;str&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*x-perf&#39;: { &#39;type&#=
39;: &#39;BackupPerf&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;features&#39;: [ &#39;unstable&#39; ] } } }<br>
<br>
=C2=A0##<br>
=C2=A0# @DriveBackup:<br>
@@ -1916,9 +1921,13 @@<br>
=C2=A0#<br>
=C2=A0# Get the block graph.<br>
=C2=A0#<br>
+# Features:<br>
+# @unstable: This command is meant for debugging.<br>
+#<br>
=C2=A0# Since: 4.0<br>
=C2=A0##<br>
-{ &#39;command&#39;: &#39;x-debug-query-block-graph&#39;, &#39;returns&#39=
;: &#39;XDbgBlockGraph&#39; }<br>
+{ &#39;command&#39;: &#39;x-debug-query-block-graph&#39;, &#39;returns&#39=
;: &#39;XDbgBlockGraph&#39;,<br>
+=C2=A0 &#39;features&#39;: [ &#39;unstable&#39; ] }<br>
<br>
=C2=A0##<br>
=C2=A0# @drive-mirror:<br>
@@ -2257,6 +2266,9 @@<br>
=C2=A0#<br>
=C2=A0# Get bitmap SHA256.<br>
=C2=A0#<br>
+# Features:<br>
+# @unstable: This command is meant for debugging.<br>
+#<br>
=C2=A0# Returns: - BlockDirtyBitmapSha256 on success<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - If @node is not a valid block d=
evice, DeviceNotFound<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - If @name is not found or if has=
hing has failed, GenericError with an<br>
@@ -2265,7 +2277,8 @@<br>
=C2=A0# Since: 2.10<br>
=C2=A0##<br>
=C2=A0{ &#39;command&#39;: &#39;x-debug-block-dirty-bitmap-sha256&#39;,<br>
-=C2=A0 &#39;data&#39;: &#39;BlockDirtyBitmap&#39;, &#39;returns&#39;: &#39=
;BlockDirtyBitmapSha256&#39; }<br>
+=C2=A0 &#39;data&#39;: &#39;BlockDirtyBitmap&#39;, &#39;returns&#39;: &#39=
;BlockDirtyBitmapSha256&#39;,<br>
+=C2=A0 &#39;features&#39;: [ &#39;unstable&#39; ] }<br>
<br>
=C2=A0##<br>
=C2=A0# @blockdev-mirror:<br>
@@ -2495,27 +2508,57 @@<br>
=C2=A0#<br>
=C2=A0# Properties for throttle-group objects.<br>
=C2=A0#<br>
-# The options starting with x- are aliases for the same key without x- in<=
br>
-# the @limits object. As indicated by the x- prefix, this is not a stable<=
br>
-# interface and may be removed or changed incompatibly in the future. Use<=
br>
-# @limits for a supported stable interface.<br>
-#<br>
=C2=A0# @limits: limits to apply for this throttle group<br>
=C2=A0#<br>
+# Features:<br>
+# @unstable: All members starting with x- are aliases for the same key<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 without x- in the @limits objec=
t.=C2=A0 This is not a stable<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 interface and may be removed or=
 changed incompatibly in<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 the future.=C2=A0 Use @limits f=
or a supported stable<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 interface.<br>
+#<br>
=C2=A0# Since: 2.11<br>
=C2=A0##<br>
=C2=A0{ &#39;struct&#39;: &#39;ThrottleGroupProperties&#39;,<br>
=C2=A0 =C2=A0&#39;data&#39;: { &#39;*limits&#39;: &#39;ThrottleLimits&#39;,=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*x-iops-total&#39; : &#39;i=
nt&#39;, &#39;*x-iops-total-max&#39; : &#39;int&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*x-iops-total-max-length&#3=
9; : &#39;int&#39;, &#39;*x-iops-read&#39; : &#39;int&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*x-iops-read-max&#39; : &#3=
9;int&#39;, &#39;*x-iops-read-max-length&#39; : &#39;int&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*x-iops-write&#39; : &#39;i=
nt&#39;, &#39;*x-iops-write-max&#39; : &#39;int&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*x-iops-write-max-length&#3=
9; : &#39;int&#39;, &#39;*x-bps-total&#39; : &#39;int&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*x-bps-total-max&#39; : &#3=
9;int&#39;, &#39;*x-bps-total-max-length&#39; : &#39;int&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*x-bps-read&#39; : &#39;int=
&#39;, &#39;*x-bps-read-max&#39; : &#39;int&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*x-bps-read-max-length&#39;=
 : &#39;int&#39;, &#39;*x-bps-write&#39; : &#39;int&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*x-bps-write-max&#39; : &#3=
9;int&#39;, &#39;*x-bps-write-max-length&#39; : &#39;int&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*x-iops-size&#39; : &#39;in=
t&#39; } }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*x-iops-total&#39;: { &#39;=
type&#39;: &#39;int&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;features&#39;: [ &#39;unstable&#=
39; ] },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*x-iops-total-max&#39;: { &=
#39;type&#39;: &#39;int&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;features&#39;: [ &=
#39;unstable&#39; ] },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*x-iops-total-max-length&#3=
9;: { &#39;type&#39;: &#39;int&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
#39;features&#39;: [ &#39;unstable&#39; ] },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*x-iops-read&#39;: { &#39;t=
ype&#39;: &#39;int&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;features&#39;: [ &#39;unstable&#39; ] =
},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*x-iops-read-max&#39;: { &#=
39;type&#39;: &#39;int&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;features&#39;: [ &#39;un=
stable&#39; ] },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*x-iops-read-max-length&#39=
;: { &#39;type&#39;: &#39;int&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#=
39;features&#39;: [ &#39;unstable&#39; ] },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*x-iops-write&#39;: { &#39;=
type&#39;: &#39;int&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;features&#39;: [ &#39;unstable&#=
39; ] },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*x-iops-write-max&#39;: { &=
#39;type&#39;: &#39;int&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;features&#39;: [ &=
#39;unstable&#39; ] },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*x-iops-write-max-length&#3=
9;: { &#39;type&#39;: &#39;int&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &=
#39;features&#39;: [ &#39;unstable&#39; ] },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*x-bps-total&#39;: { &#39;t=
ype&#39;: &#39;int&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;features&#39;: [ &#39;unstable&#39; ] =
},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*x-bps-total-max&#39;: { &#=
39;type&#39;: &#39;int&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;features&#39;: [ &#39;un=
stable&#39; ] },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*x-bps-total-max-length&#39=
;: { &#39;type&#39;: &#39;int&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#=
39;features&#39;: [ &#39;unstable&#39; ] },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*x-bps-read&#39;: { &#39;ty=
pe&#39;: &#39;int&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;features&#39;: [ &#39;unstable&#39; ] }=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*x-bps-read-max&#39;: { &#3=
9;type&#39;: &#39;int&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;features&#39;: [ &#39;uns=
table&#39; ] },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*x-bps-read-max-length&#39;=
: { &#39;type&#39;: &#39;int&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;fea=
tures&#39;: [ &#39;unstable&#39; ] },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*x-bps-write&#39;: { &#39;t=
ype&#39;: &#39;int&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;features&#39;: [ &#39;unstable&#39; ] =
},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*x-bps-write-max&#39;: { &#=
39;type&#39;: &#39;int&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;features&#39;: [ &#39;un=
stable&#39; ] },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*x-bps-write-max-length&#39=
;: { &#39;type&#39;: &#39;int&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#=
39;features&#39;: [ &#39;unstable&#39; ] },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*x-iops-size&#39;: { &#39;t=
ype&#39;: &#39;int&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;features&#39;: [ &#39;unstable&#39; ] =
} } }<br>
<br>
=C2=A0##<br>
=C2=A0# @block-stream:<br>
@@ -2916,6 +2959,7 @@<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 read-only when the last writer is detached. This<b=
r>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 allows giving QEMU write permissions only on deman=
d<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 when an operation actually needs write access.<br>
+# @unstable: Member x-check-cache-dropped is meant for debugging.<br>
=C2=A0#<br>
=C2=A0# Since: 2.9<br>
=C2=A0##<br>
@@ -2926,7 +2970,8 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*aio&#39;: &#39;Blockd=
evAioOptions&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*drop-cache&#39;: {&#3=
9;type&#39;: &#39;bool&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;if&#39;: &#39;CONFIG_LINUX&#39;},<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*x-check-cache-dropped&#39;=
: &#39;bool&#39; },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*x-check-cache-dropped&#39;=
: { &#39;type&#39;: &#39;bool&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;fea=
tures&#39;: [ &#39;unstable&#39; ] } },<br>
=C2=A0 =C2=A0&#39;features&#39;: [ { &#39;name&#39;: &#39;dynamic-auto-read=
-only&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;i=
f&#39;: &#39;CONFIG_POSIX&#39; } ] }<br>
<br>
@@ -4041,13 +4086,16 @@<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0future requests before a successful reconnect will<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0immediately fail. Default 0 (Since 4.2)<br>
=C2=A0#<br>
+# Features:<br>
+# @unstable: Member @x-dirty-bitmap is experimental.<br>
+#<br>
=C2=A0# Since: 2.9<br>
=C2=A0##<br>
=C2=A0{ &#39;struct&#39;: &#39;BlockdevOptionsNbd&#39;,<br>
=C2=A0 =C2=A0&#39;data&#39;: { &#39;server&#39;: &#39;SocketAddress&#39;,<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*export&#39;: &#39;str=
&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*tls-creds&#39;: &#39;=
str&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*x-dirty-bitmap&#39;: &#39;=
str&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*x-dirty-bitmap&#39;: { &#3=
9;type&#39;: &#39;str&#39;, &#39;features&#39;: [ &#39;unstable&#39; ] },<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*reconnect-delay&#39;:=
 &#39;uint32&#39; } }<br>
<br>
=C2=A0##<br>
@@ -4865,13 +4913,17 @@<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0and replacement of an active keyslot<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(possible loss of data if IO error happens)<br>
=C2=A0#<br>
+# Features:<br>
+# @unstable: This command is experimental.<br>
+#<br>
=C2=A0# Since: 5.1<br>
=C2=A0##<br>
=C2=A0{ &#39;command&#39;: &#39;x-blockdev-amend&#39;,<br>
=C2=A0 =C2=A0&#39;data&#39;: { &#39;job-id&#39;: &#39;str&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;node-name&#39;: &#39;s=
tr&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;options&#39;: &#39;Blo=
ckdevAmendOptions&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*force&#39;: &#39;bool&#39;=
 } }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*force&#39;: &#39;bool&#39;=
 },<br>
+=C2=A0 &#39;features&#39;: [ &#39;unstable&#39; ] }<br>
<br>
=C2=A0##<br>
=C2=A0# @BlockErrorAction:<br>
@@ -5242,16 +5294,18 @@<br>
=C2=A0#<br>
=C2=A0# @node: the name of the node that will be added.<br>
=C2=A0#<br>
-# Note: this command is experimental, and its API is not stable. It<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0does not support all kinds of operations, all =
kinds of children, nor<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0all block drivers.<br>
+# Features:<br>
+# @unstable: This command is experimental, and its API is not stable.=C2=
=A0 It<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 does not support all kinds of o=
perations, all kinds of<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 children, nor all block drivers=
.<br>
=C2=A0#<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0FIXME Removing children from a quorum node mea=
ns introducing gaps in the<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0child indices. This cannot be represented in t=
he &#39;children&#39; list of<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0BlockdevOptionsQuorum, as returned by .bdrv_re=
fresh_filename().<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FIXME Removing children from a =
quorum node means introducing<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gaps in the child indices. This=
 cannot be represented in the<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;children&#39; list of Bloc=
kdevOptionsQuorum, as returned by<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .bdrv_refresh_filename().<br>
=C2=A0#<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0Warning: The data in a new quorum child MUST b=
e consistent with that of<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0the rest of the array.<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Warning: The data in a new quor=
um child MUST be consistent<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with that of the rest of the ar=
ray.<br>
=C2=A0#<br>
=C2=A0# Since: 2.7<br>
=C2=A0#<br>
@@ -5280,7 +5334,8 @@<br>
=C2=A0{ &#39;command&#39;: &#39;x-blockdev-change&#39;,<br>
=C2=A0 =C2=A0&#39;data&#39; : { &#39;parent&#39;: &#39;str&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*child&#39;: &#39;str=
&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*node&#39;: &#39;str&=
#39; } }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*node&#39;: &#39;str&=
#39; },<br>
+=C2=A0 &#39;features&#39;: [ &#39;unstable&#39; ] }<br>
<br>
=C2=A0##<br>
=C2=A0# @x-blockdev-set-iothread:<br>
@@ -5297,8 +5352,9 @@<br>
=C2=A0# @force: true if the node and its children should be moved when a Bl=
ockBackend<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0is already attached<br>
=C2=A0#<br>
-# Note: this command is experimental and intended for test cases that need=
<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0control over IOThreads only.<br>
+# Features:<br>
+# @unstable: This command is experimental and intended for test cases that=
<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 need control over IOThreads onl=
y.<br>
=C2=A0#<br>
=C2=A0# Since: 2.12<br>
=C2=A0#<br>
@@ -5320,7 +5376,8 @@<br>
=C2=A0{ &#39;command&#39;: &#39;x-blockdev-set-iothread&#39;,<br>
=C2=A0 =C2=A0&#39;data&#39; : { &#39;node-name&#39;: &#39;str&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;iothread&#39;: &#39;S=
trOrNull&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*force&#39;: &#39;boo=
l&#39; } }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*force&#39;: &#39;boo=
l&#39; },<br>
+=C2=A0 &#39;features&#39;: [ &#39;unstable&#39; ] }<br>
<br>
=C2=A0##<br>
=C2=A0# @QuorumOpType:<br>
diff --git a/qapi/migration.json b/qapi/migration.json<br>
index 88f07baedd..9aa8bc5759 100644<br>
--- a/qapi/migration.json<br>
+++ b/qapi/migration.json<br>
@@ -452,14 +452,20 @@<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0procedure starts. The VM RAM is saved with running VM.<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0(since 6.0)<br>
=C2=A0#<br>
+# Features:<br>
+# @unstable: Members @x-colo and @x-ignore-shared are experimental.<br>
+#<br>
=C2=A0# Since: 1.2<br>
=C2=A0##<br>
=C2=A0{ &#39;enum&#39;: &#39;MigrationCapability&#39;,<br>
=C2=A0 =C2=A0&#39;data&#39;: [&#39;xbzrle&#39;, &#39;rdma-pin-all&#39;, &#3=
9;auto-converge&#39;, &#39;zero-blocks&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;compress&#39;, &#39;events&#=
39;, &#39;postcopy-ram&#39;, &#39;x-colo&#39;, &#39;release-ram&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;compress&#39;, &#39;events&#=
39;, &#39;postcopy-ram&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ &#39;name&#39;: &#39;x-colo&#39=
;, &#39;features&#39;: [ &#39;unstable&#39; ] },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;release-ram&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;block&#39;, &#39;return-path=
&#39;, &#39;pause-before-switchover&#39;, &#39;multifd&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;dirty-bitmaps&#39;, &#39;pos=
tcopy-blocktime&#39;, &#39;late-block-activate&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;x-ignore-shared&#39;, &#39;v=
alidate-uuid&#39;, &#39;background-snapshot&#39;] }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ &#39;name&#39;: &#39;x-ignore-s=
hared&#39;, &#39;features&#39;: [ &#39;unstable&#39; ] },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;validate-uuid&#39;, &#39;bac=
kground-snapshot&#39;] }<br>
<br>
=C2=A0##<br>
=C2=A0# @MigrationCapabilityStatus:<br>
@@ -743,6 +749,9 @@<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 block device name if there is one, and to their node name=
<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 otherwise. (Since 5.2)<br>
=C2=A0#<br>
+# Features:<br>
+# @unstable: Member @x-checkpoint-delay is experimental.<br>
+#<br>
=C2=A0# Since: 2.4<br>
=C2=A0##<br>
=C2=A0{ &#39;enum&#39;: &#39;MigrationParameter&#39;,<br>
@@ -753,7 +762,9 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;cpu-throttle-initial&#39;, &=
#39;cpu-throttle-increment&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;cpu-throttle-tailslow&#39;,<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;tls-creds&#39;, &#39;tls-hos=
tname&#39;, &#39;tls-authz&#39;, &#39;max-bandwidth&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;downtime-limit&#39;, &#39;x-=
checkpoint-delay&#39;, &#39;block-incremental&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;downtime-limit&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ &#39;name&#39;: &#39;x-checkpoi=
nt-delay&#39;, &#39;features&#39;: [ &#39;unstable&#39; ] },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;block-incremental&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;multifd-channels&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;xbzrle-cache-size&#39;, &#39=
;max-postcopy-bandwidth&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;max-cpu-throttle&#39;, &#39;=
multifd-compression&#39;,<br>
@@ -903,6 +914,9 @@<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 block device name if there is one, and to their node name=
<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 otherwise. (Since 5.2)<br>
=C2=A0#<br>
+# Features:<br>
+# @unstable: Member @x-checkpoint-delay is experimental.<br>
+#<br>
=C2=A0# Since: 2.4<br>
=C2=A0##<br>
=C2=A0# TODO either fuse back into MigrationParameters, or make<br>
@@ -925,7 +939,8 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*tls-authz&#39;: &#39;=
StrOrNull&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*max-bandwidth&#39;: &=
#39;size&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*downtime-limit&#39;: =
&#39;uint64&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*x-checkpoint-delay&#39;: &=
#39;uint32&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*x-checkpoint-delay&#39;: {=
 &#39;type&#39;: &#39;uint32&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;features&#3=
9;: [ &#39;unstable&#39; ] },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*block-incremental&#39=
;: &#39;bool&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*multifd-channels&#39;=
: &#39;uint8&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*xbzrle-cache-size&#39=
;: &#39;size&#39;,<br>
@@ -1099,6 +1114,9 @@<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 block device name if there is one, and to their node name=
<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 otherwise. (Since 5.2)<br>
=C2=A0#<br>
+# Features:<br>
+# @unstable: Member @x-checkpoint-delay is experimental.<br>
+#<br>
=C2=A0# Since: 2.4<br>
=C2=A0##<br>
=C2=A0{ &#39;struct&#39;: &#39;MigrationParameters&#39;,<br>
@@ -1119,7 +1137,8 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*tls-authz&#39;: &#39;=
str&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*max-bandwidth&#39;: &=
#39;size&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*downtime-limit&#39;: =
&#39;uint64&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*x-checkpoint-delay&#39;: &=
#39;uint32&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;*x-checkpoint-delay&#39;: {=
 &#39;type&#39;: &#39;uint32&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;features&#3=
9;: [ &#39;unstable&#39; ] },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*block-incremental&#39=
;: &#39;bool&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*multifd-channels&#39;=
: &#39;uint8&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*xbzrle-cache-size&#39=
;: &#39;size&#39;,<br>
@@ -1351,6 +1370,9 @@<br>
=C2=A0# If sent to the Secondary, the Secondary side will run failover work=
,<br>
=C2=A0# then takes over server operation to become the service VM.<br>
=C2=A0#<br>
+# Features:<br>
+# @unstable: This command is experimental.<br>
+#<br>
=C2=A0# Since: 2.8<br>
=C2=A0#<br>
=C2=A0# Example:<br>
@@ -1359,7 +1381,8 @@<br>
=C2=A0# &lt;- { &quot;return&quot;: {} }<br>
=C2=A0#<br>
=C2=A0##<br>
-{ &#39;command&#39;: &#39;x-colo-lost-heartbeat&#39; }<br>
+{ &#39;command&#39;: &#39;x-colo-lost-heartbeat&#39;,<br>
+=C2=A0 &#39;features&#39;: [ &#39;unstable&#39; ] }<br>
<br>
=C2=A0##<br>
=C2=A0# @migrate_cancel:<br>
diff --git a/qapi/misc.json b/qapi/misc.json<br>
index 5c2ca3b556..358548abe1 100644<br>
--- a/qapi/misc.json<br>
+++ b/qapi/misc.json<br>
@@ -185,6 +185,9 @@<br>
=C2=A0# available during the preconfig state (i.e. when the --preconfig com=
mand<br>
=C2=A0# line option was in use).<br>
=C2=A0#<br>
+# Features:<br>
+# @unstable: This command is experimental.<br>
+#<br>
=C2=A0# Since 3.0<br>
=C2=A0#<br>
=C2=A0# Returns: nothing<br>
@@ -195,7 +198,8 @@<br>
=C2=A0# &lt;- { &quot;return&quot;: {} }<br>
=C2=A0#<br>
=C2=A0##<br>
-{ &#39;command&#39;: &#39;x-exit-preconfig&#39;, &#39;allow-preconfig&#39;=
: true }<br>
+{ &#39;command&#39;: &#39;x-exit-preconfig&#39;, &#39;allow-preconfig&#39;=
: true,<br>
+=C2=A0 &#39;features&#39;: [ &#39;unstable&#39; ] }<br>
<br>
=C2=A0##<br>
=C2=A0# @human-monitor-command:<br>
diff --git a/qapi/qom.json b/qapi/qom.json<br>
index 7231ac3f34..ccd1167808 100644<br>
--- a/qapi/qom.json<br>
+++ b/qapi/qom.json<br>
@@ -559,10 +559,8 @@<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f=
or ramblock-id. Disable this for 4.0<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m=
achine types or older to allow<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m=
igration with newer QEMU versions.<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 This opt=
ion is considered stable<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 despite =
the x- prefix. (default:<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 false ge=
nerally, but true for machine<br>
-#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 types &l=
t;=3D 4.0)<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (default=
: false generally,<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 but true=
 for machine types &lt;=3D 4.0)<br>
=C2=A0#<br>
=C2=A0# Note: prealloc=3Dtrue and reserve=3Dfalse cannot be set at the same=
 time. With<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0reserve=3Dtrue, the behavior depends on t=
he operating system: for example,<br>
@@ -785,6 +783,9 @@<br>
=C2=A0##<br>
=C2=A0# @ObjectType:<br>
=C2=A0#<br>
+# Features:<br>
+# @unstable: Member @x-remote-object is experimental.<br>
+#<br>
=C2=A0# Since: 6.0<br>
=C2=A0##<br>
=C2=A0{ &#39;enum&#39;: &#39;ObjectType&#39;,<br>
@@ -836,7 +837,7 @@<br>
=C2=A0 =C2=A0 =C2=A0&#39;tls-creds-psk&#39;,<br>
=C2=A0 =C2=A0 =C2=A0&#39;tls-creds-x509&#39;,<br>
=C2=A0 =C2=A0 =C2=A0&#39;tls-cipher-suites&#39;,<br>
-=C2=A0 =C2=A0 &#39;x-remote-object&#39;<br>
+=C2=A0 =C2=A0 { &#39;name&#39;: &#39;x-remote-object&#39;, &#39;features&#=
39;: [ &#39;unstable&#39; ] }<br>
=C2=A0 =C2=A0] }<br>
<br>
=C2=A0##<br>
-- <br>
2.31.1<br>
<br></blockquote><div><br></div><div>Seems OK, but I didn&#39;t audit for f=
alse positives/negatives. Trusting your judgment here. (It looks like Phil =
started to audit this in his reply to your previous commit, so I&#39;ll tru=
st that.)</div><div><br></div><div>Acked-by: John Snow &lt;<a href=3D"mailt=
o:jsnow@redhat.com">jsnow@redhat.com</a>&gt;<br></div></div></div>

--0000000000005aebad05cf320a9d--


