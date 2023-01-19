Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A55866738FB
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 13:52:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIUOU-00064J-Uj; Thu, 19 Jan 2023 07:51:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pIUOS-00062w-9m
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 07:51:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pIUOQ-0001kK-4F
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 07:51:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674132704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MPgL1kvgFMqgCCLmSBxdzpQgvUsZs/qHnWsZr59vXA8=;
 b=V5E8HoKLDU6vFLYhmnv5RpVd97oucNM9r85dQFWi3M9PnW01ltFXKHo7j1z5jE3UgyBqwE
 KMVAOsgjj+MivLOFM4EyitE/eqsWPLZHD6mJrVCZvLX9pi96goACmTj+HjCI8yTphurDvX
 anjQNB1sKDiSlCAEAKvVWImTjtyBB9g=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-425-Mnz2aQqZO_eUsl6ppsERAQ-1; Thu, 19 Jan 2023 07:51:43 -0500
X-MC-Unique: Mnz2aQqZO_eUsl6ppsERAQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 q22-20020adfb196000000b002bbe8a76d8dso334712wra.4
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 04:51:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MPgL1kvgFMqgCCLmSBxdzpQgvUsZs/qHnWsZr59vXA8=;
 b=OyBnr+u++1Q4ljz2kru5Fe+cd4Ro4CxnLBtlOK1+fr+Y5wC1cqccZkCXeEcbiRO1Ag
 DNjaWGmiy89+vC8pzcCP4vRwcI5gAo0yUVUHgi7SDeyJw2uWaRhd4gOXzgHbeHkOX6JG
 APRjWjQM5iGDXUJ1UQw8pi1UuXfwGV/ugxULDV77B6RTLWZZy8eX7hiPFtAEzBVmxati
 HOnwDTCcVzP089ItQNl0fZ4rEBuMQhRhy2kyv8c6nNF7YJiyBVieI2iJyItm/zxtVy0g
 U2Lu6xTDuOk7YLKm4U5bgXTm1p0TAPKGqLQhs/WEwPFGWkOAvlqo24NVje9W2QjA8YIg
 Bk/g==
X-Gm-Message-State: AFqh2koAmFYqVAnziydLFwEYjPWEX93sYHH1jmP0xhp94eH4d7JrGIXS
 OfSvozMg3ZHKSE7My0T69rQ6pJWDwbwv77Wec3P3kvJLPmw06QISykBZnXF4gbGNiRnEBpgCpeJ
 RAgtxkeHKr2bN2Lo=
X-Received: by 2002:a05:6000:98f:b0:2be:296:3b5 with SMTP id
 by15-20020a056000098f00b002be029603b5mr10274533wrb.17.1674132702243; 
 Thu, 19 Jan 2023 04:51:42 -0800 (PST)
X-Google-Smtp-Source: AMrXdXul9EsCbJk8usJzM58/hKkMzbXT0vF+Uoa7uHH3Y7f13Fhf26rGCPHyAO9KSKfJC6LqV0BNYQ==
X-Received: by 2002:a05:6000:98f:b0:2be:296:3b5 with SMTP id
 by15-20020a056000098f00b002be029603b5mr10274513wrb.17.1674132701967; 
 Thu, 19 Jan 2023 04:51:41 -0800 (PST)
Received: from redhat.com ([2.52.28.74]) by smtp.gmail.com with ESMTPSA id
 g2-20020a5d4882000000b00286ad197346sm33564032wrq.70.2023.01.19.04.51.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 04:51:41 -0800 (PST)
Date: Thu, 19 Jan 2023 07:51:37 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Anton Kuchin <antonkuchin@yandex-team.ru>
Cc: qemu-devel@nongnu.org, virtio-fs@redhat.com,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Juan Quintela <quintela@redhat.com>, yc-core@yandex-team.ru
Subject: Re: [PATCH] vhost-user-fs: add capability to allow migration
Message-ID: <20230119074602-mutt-send-email-mst@kernel.org>
References: <20230115170903.3416105-1-antonkuchin@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230115170903.3416105-1-antonkuchin@yandex-team.ru>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sun, Jan 15, 2023 at 07:09:03PM +0200, Anton Kuchin wrote:
> Now any vhost-user-fs device makes VM unmigratable, that also prevents
> qemu update without stopping the VM. In most cases that makes sense
> because qemu has no way to transfer FUSE session state.
> 
> But we can give an option to orchestrator to override this if it can
> guarantee that state will be preserved (e.g. it uses migration to
> update qemu and dst will run on the same host as src and use the same
> socket endpoints).
> 
> This patch keeps default behavior that prevents migration with such devices
> but adds migration capability 'vhost-user-fs' to explicitly allow migration.
> 
> Signed-off-by: Anton Kuchin <antonkuchin@yandex-team.ru>
> ---
>  hw/virtio/vhost-user-fs.c | 25 ++++++++++++++++++++++++-
>  qapi/migration.json       |  7 ++++++-
>  2 files changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> index f5049735ac..13d920423e 100644
> --- a/hw/virtio/vhost-user-fs.c
> +++ b/hw/virtio/vhost-user-fs.c
> @@ -24,6 +24,7 @@
>  #include "hw/virtio/vhost-user-fs.h"
>  #include "monitor/monitor.h"
>  #include "sysemu/sysemu.h"
> +#include "migration/migration.h"
>  
>  static const int user_feature_bits[] = {
>      VIRTIO_F_VERSION_1,
> @@ -298,9 +299,31 @@ static struct vhost_dev *vuf_get_vhost(VirtIODevice *vdev)
>      return &fs->vhost_dev;
>  }
>  
> +static int vhost_user_fs_pre_save(void *opaque)
> +{
> +    MigrationState *s = migrate_get_current();
> +
> +    if (!s->enabled_capabilities[MIGRATION_CAPABILITY_VHOST_USER_FS]) {
> +        error_report("Migration of vhost-user-fs devices requires internal FUSE "
> +                     "state of backend to be preserved. If orchestrator can "
> +                     "guarantee this (e.g. dst connects to the same backend "
> +                     "instance or backend state is migrated) set 'vhost-user-fs' "
> +                     "migration capability to true to enable migration.");

Isn't it possible that some backends are same and some are not?
Shouldn't this be a device property then?



> +        return -1;
> +    }
> +
> +    return 0;
> +}
> +
>  static const VMStateDescription vuf_vmstate = {
>      .name = "vhost-user-fs",
> -    .unmigratable = 1,
> +    .minimum_version_id = 0,
> +    .version_id = 0,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_VIRTIO_DEVICE,
> +        VMSTATE_END_OF_LIST()
> +    },
> +   .pre_save = vhost_user_fs_pre_save,
>  };
>  
>  static Property vuf_properties[] = {
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 88ecf86ac8..9a229ea884 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -477,6 +477,11 @@
>  #                    will be handled faster.  This is a performance feature and
>  #                    should not affect the correctness of postcopy migration.
>  #                    (since 7.1)
> +# @vhost-user-fs: If enabled, the migration process will allow migration of
> +#                 vhost-user-fs devices, this should be enabled only when
> +#                 backend can preserve local FUSE state e.g. for qemu update
> +#                 when dst reconects to the same endpoints after migration.
> +#                 (since 8.0)
>  #
>  # Features:
>  # @unstable: Members @x-colo and @x-ignore-shared are experimental.
> @@ -492,7 +497,7 @@
>             'dirty-bitmaps', 'postcopy-blocktime', 'late-block-activate',
>             { 'name': 'x-ignore-shared', 'features': [ 'unstable' ] },
>             'validate-uuid', 'background-snapshot',
> -           'zero-copy-send', 'postcopy-preempt'] }
> +           'zero-copy-send', 'postcopy-preempt', 'vhost-user-fs'] }

I kind of dislike that it's such a specific flag. Is only vhost-user-fs
ever going to be affected? Any way to put it in a way that is more generic?


>  ##
>  # @MigrationCapabilityStatus:
> -- 
> 2.34.1


