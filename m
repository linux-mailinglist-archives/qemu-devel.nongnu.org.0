Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E34F69F472
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 13:22:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUo7I-0007wg-IM; Wed, 22 Feb 2023 07:21:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pUo7F-0007wF-Sx
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 07:20:57 -0500
Received: from forwardcorp1a.mail.yandex.net
 ([2a02:6b8:c0e:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pUo7C-0005wh-Q6
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 07:20:57 -0500
Received: from mail-nwsmtp-smtp-corp-main-62.vla.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-62.vla.yp-c.yandex.net
 [IPv6:2a02:6b8:c0d:3786:0:640:7c97:0])
 by forwardcorp1a.mail.yandex.net (Yandex) with ESMTP id 31A905FE85;
 Wed, 22 Feb 2023 15:20:47 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:a532::1:1e] (unknown
 [2a02:6b8:b081:a532::1:1e])
 by mail-nwsmtp-smtp-corp-main-62.vla.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id 6KNFp80KbiE0-bN6wvhfm; Wed, 22 Feb 2023 15:20:43 +0300
Precedence: bulk
X-Yandex-Fwd: 1
Authentication-Results: mail-nwsmtp-smtp-corp-main-62.vla.yp-c.yandex.net;
 dkim=pass
Message-ID: <59165bde-bfd4-a073-c618-205be3951e4a@yandex-team.ru>
Date: Wed, 22 Feb 2023 15:20:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 1/1] vhost-user-fs: add migration type property
Content-Language: en-US
To: Anton Kuchin <antonkuchin@yandex-team.ru>, qemu-devel@nongnu.org
Cc: yc-core@yandex-team.ru, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, virtio-fs@redhat.com,
 Eric Blake <eblake@redhat.com>
References: <20230217170038.1273710-1-antonkuchin@yandex-team.ru>
 <20230217170038.1273710-2-antonkuchin@yandex-team.ru>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20230217170038.1273710-2-antonkuchin@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:c0e:500:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1a.mail.yandex.net
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.102,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

On 17.02.23 20:00, Anton Kuchin wrote:
> Migration of vhost-user-fs device requires transfer of FUSE internal state
> from backend. There is no standard way to do it now so by default migration
> must be blocked. But if this state can be externally transferred by
> orchestrator give it an option to explicitly allow migration.
> 
> Signed-off-by: Anton Kuchin <antonkuchin@yandex-team.ru>
> ---
>   hw/core/qdev-properties-system.c    | 10 +++++++++
>   hw/virtio/vhost-user-fs.c           | 32 ++++++++++++++++++++++++++++-
>   include/hw/qdev-properties-system.h |  1 +
>   include/hw/virtio/vhost-user-fs.h   |  2 ++
>   qapi/migration.json                 | 16 +++++++++++++++
>   5 files changed, 60 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
> index d42493f630..d9b1aa2a5d 100644
> --- a/hw/core/qdev-properties-system.c
> +++ b/hw/core/qdev-properties-system.c
> @@ -1143,3 +1143,13 @@ const PropertyInfo qdev_prop_uuid = {
>       .set   = set_uuid,
>       .set_default_value = set_default_uuid_auto,
>   };
> +
> +const PropertyInfo qdev_prop_vhost_user_migration_type = {
> +    .name = "VhostUserMigrationType",
> +    .description = "none/external",
> +    .enum_table = &VhostUserMigrationType_lookup,
> +    .get = qdev_propinfo_get_enum,
> +    .set = qdev_propinfo_set_enum,
> +    .set_default_value = qdev_propinfo_set_default_value_enum,
> +    .realized_set_allowed = true,
> +};
> diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> index 83fc20e49e..7deb9df5ec 100644
> --- a/hw/virtio/vhost-user-fs.c
> +++ b/hw/virtio/vhost-user-fs.c
> @@ -298,9 +298,35 @@ static struct vhost_dev *vuf_get_vhost(VirtIODevice *vdev)
>       return &fs->vhost_dev;
>   }
>   
> +static int vhost_user_fs_pre_save(void *opaque)
> +{
> +    VHostUserFS *fs = opaque;
> +    g_autofree char *path = object_get_canonical_path(OBJECT(fs));
> +
> +    switch (fs->migration_type) {
> +    case VHOST_USER_MIGRATION_TYPE_NONE:
> +        error_report("Migration is blocked by device %s", path);
> +        break;
> +    case VHOST_USER_MIGRATION_TYPE_EXTERNAL:
> +        return 0;
> +    default:
> +        error_report("Migration type '%s' is not supported by device %s",
> +                     VhostUserMigrationType_str(fs->migration_type), path);
> +        break;
> +    }
> +
> +    return -1;
> +}

Should we also add this as .pre_load, to force user select correct migration_type on target too?

> +
>   static const VMStateDescription vuf_vmstate = {
>       .name = "vhost-user-fs",
> -    .unmigratable = 1,
> +    .minimum_version_id = 0,
> +    .version_id = 0,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_VIRTIO_DEVICE,
> +        VMSTATE_END_OF_LIST()
> +    },
> +   .pre_save = vhost_user_fs_pre_save,
>   };
>   
>   static Property vuf_properties[] = {
> @@ -309,6 +335,10 @@ static Property vuf_properties[] = {
>       DEFINE_PROP_UINT16("num-request-queues", VHostUserFS,
>                          conf.num_request_queues, 1),
>       DEFINE_PROP_UINT16("queue-size", VHostUserFS, conf.queue_size, 128),
> +    DEFINE_PROP_UNSIGNED("migration", VHostUserFS, migration_type,
> +                         VHOST_USER_MIGRATION_TYPE_NONE,
> +                         qdev_prop_vhost_user_migration_type,
> +                         VhostUserMigrationType),

1. I see, other similar qdev_prop_* use DEFINE_PROP_SIGNED
2. All of them except only qdev_prop_fdc_drive_type, define also a convenient macro in include/hw/qdev-properties-system.h

should we follow these patterns?


-- 
Best regards,
Vladimir


