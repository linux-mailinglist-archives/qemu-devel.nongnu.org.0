Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A2068F3B0
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 17:46:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPnYo-0005ra-Bn; Wed, 08 Feb 2023 11:44:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pPnYj-0005qf-FF
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 11:44:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pPnYh-0003TL-72
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 11:44:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675874674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0rmsnJ6Cv02BpjE01MwjySTDNFjye2sW0o2Jl7BdvIY=;
 b=IQmohM8ef1qbtFbSYH3fkKaPJkiYZuAtoE0wJ4L/TRezYYZWCSjOXgVx1PQRqgqWbnVWce
 R7AuQm0EwwnVZnxmg3KVt5PN8nsaca8DIBO+DnWhZw7Hr5T7f8NK1x2WG2Au+oMjGHr8m+
 hj/N28yPWE+gOEeaNjGNmy4J5S0T13A=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-670--FlfCukgMzyxc3k7CgDXOg-1; Wed, 08 Feb 2023 11:44:30 -0500
X-MC-Unique: -FlfCukgMzyxc3k7CgDXOg-1
Received: by mail-qt1-f199.google.com with SMTP id
 z12-20020ac8710c000000b003b829a0eda2so11114569qto.21
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 08:44:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0rmsnJ6Cv02BpjE01MwjySTDNFjye2sW0o2Jl7BdvIY=;
 b=TZOJJUGH/d57WTZUp2NrnKc7fKKm6px0KqlXgSct6JLAJhMR+/ZuC+Ox/PB5Xgi6DU
 qC7TcCM3e+OgZRXesExH/Ann+Qm/qanG5kBgkrDgG0/aosnTVXxf2cuczh70AaATReNC
 +GSEy4FSBxHfNq+bCkqUSYu8et6MDno+9K5dnx41kcUy57oZroj9z2JKbPXE5cswz2Ee
 VzJBD0wL2JcyKAbBp4XJuaRZbjic8kWD+LySvlPRePVqaFMxsDJ4FtctDfEIppiZluKW
 lRMWFuomJI0I2v/z9Gvvr3akgNi/tTEZgoewT/3S0ypWmf7rq4Nxid5up9s5VeRcRiaT
 fEFw==
X-Gm-Message-State: AO0yUKXCySmFL91XUdrNHva3BYHoVRTF6B7TuWDDodxV1BD2SH6+LuhD
 OhiCdnP3NcwdyBiX8Pd5IC1micxyHgrQG8sc2Lo4gEXaLn1n0THC9oRtfZiOzrq9MqflQp37HSh
 NHXX1TL075OrSMl4=
X-Received: by 2002:ac8:59c3:0:b0:3b6:3af6:f2e1 with SMTP id
 f3-20020ac859c3000000b003b63af6f2e1mr9802535qtf.59.1675874670140; 
 Wed, 08 Feb 2023 08:44:30 -0800 (PST)
X-Google-Smtp-Source: AK7set8J24QGzxkoEFKCeG8uzagx3jw+HVsDxx1DNi5ZcMzIa9Y1Vq9PAoyt0QSiWbELabY73Sxnuw==
X-Received: by 2002:ac8:59c3:0:b0:3b6:3af6:f2e1 with SMTP id
 f3-20020ac859c3000000b003b63af6f2e1mr9802489qtf.59.1675874669844; 
 Wed, 08 Feb 2023 08:44:29 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 p1-20020ac84081000000b003a530a32f67sm11683938qtl.65.2023.02.08.08.44.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 08:44:29 -0800 (PST)
Message-ID: <fcb9bda8-6d95-6109-ae5b-beeb9aa63af2@redhat.com>
Date: Wed, 8 Feb 2023 17:44:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v9 07/14] vfio/migration: Block multiple devices migration
Content-Language: en-US
To: Avihai Horon <avihaih@nvidia.com>,
 Alex Williamson <alex.williamson@redhat.com>
Cc: qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 John Snow <jsnow@redhat.com>, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
References: <20230206123137.31149-1-avihaih@nvidia.com>
 <20230206123137.31149-8-avihaih@nvidia.com>
 <20230207153454.4e1a0c51.alex.williamson@redhat.com>
 <238b17d1-17a3-e5d1-2973-4bda83928d6e@nvidia.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <238b17d1-17a3-e5d1-2973-4bda83928d6e@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.146, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 2/8/23 14:08, Avihai Horon wrote:
> 
> On 08/02/2023 0:34, Alex Williamson wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> On Mon, 6 Feb 2023 14:31:30 +0200
>> Avihai Horon <avihaih@nvidia.com> wrote:
>>
>>> Currently VFIO migration doesn't implement some kind of intermediate
>>> quiescent state in which P2P DMAs are quiesced before stopping or
>>> running the device. This can cause problems in multi-device migration
>>> where the devices are doing P2P DMAs, since the devices are not stopped
>>> together at the same time.
>>>
>>> Until such support is added, block migration of multiple devices.
>>>
>>> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
>>> ---
>>>   include/hw/vfio/vfio-common.h |  2 ++
>>>   hw/vfio/common.c              | 51 +++++++++++++++++++++++++++++++++++
>>>   hw/vfio/migration.c           |  6 +++++
>>>   3 files changed, 59 insertions(+)
>>>
>>> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
>>> index e573f5a9f1..56b1683824 100644
>>> --- a/include/hw/vfio/vfio-common.h
>>> +++ b/include/hw/vfio/vfio-common.h
>>> @@ -218,6 +218,8 @@ typedef QLIST_HEAD(VFIOGroupList, VFIOGroup) VFIOGroupList;
>>>   extern VFIOGroupList vfio_group_list;
>>>
>>>   bool vfio_mig_active(void);
>>> +int vfio_block_multiple_devices_migration(Error **errp);
>>> +void vfio_unblock_multiple_devices_migration(void);
>>>   int64_t vfio_mig_bytes_transferred(void);
>>>
>>>   #ifdef CONFIG_LINUX
>>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>>> index 3a35f4afad..01db41b735 100644
>>> --- a/hw/vfio/common.c
>>> +++ b/hw/vfio/common.c
>>> @@ -41,6 +41,7 @@
>>>   #include "qapi/error.h"
>>>   #include "migration/migration.h"
>>>   #include "migration/misc.h"
>>> +#include "migration/blocker.h"
>>>   #include "sysemu/tpm.h"
>>>
>>>   VFIOGroupList vfio_group_list =
>>> @@ -337,6 +338,56 @@ bool vfio_mig_active(void)
>>>       return true;
>>>   }
>>>
>>> +Error *multiple_devices_migration_blocker;

static ?

So we have two migration blockers, one per device and one global. I guess
it is easier that way than trying to update the per device Error*.

C.


>>> +
>>> +static unsigned int vfio_migratable_device_num(void)
>>> +{
>>> +    VFIOGroup *group;
>>> +    VFIODevice *vbasedev;
>>> +    unsigned int device_num = 0;
>>> +
>>> +    QLIST_FOREACH(group, &vfio_group_list, next) {
>>> +        QLIST_FOREACH(vbasedev, &group->device_list, next) {
>>> +            if (vbasedev->migration) {
>>> +                device_num++;
>>> +            }
>>> +        }
>>> +    }
>>> +
>>> +    return device_num;
>>> +}
>>> +
>>> +int vfio_block_multiple_devices_migration(Error **errp)
>>> +{
>>> +    int ret;
>>> +
>>> +    if (vfio_migratable_device_num() != 2) {
>>> +        return 0;
>>> +    }
>>> +
>>> +    error_setg(&multiple_devices_migration_blocker,
>>> +               "Migration is currently not supported with multiple "
>>> +               "VFIO devices");
>>> +    ret = migrate_add_blocker(multiple_devices_migration_blocker, errp);
>>> +    if (ret < 0) {
>>> +        error_free(multiple_devices_migration_blocker);
>>> +        multiple_devices_migration_blocker = NULL;
>>> +    }
>>> +
>>> +    return ret;
>>> +}
>>> +
>>> +void vfio_unblock_multiple_devices_migration(void)
>>> +{
>>> +    if (vfio_migratable_device_num() != 2) {
>>> +        return;
>>> +    }
>>> +
>>> +    migrate_del_blocker(multiple_devices_migration_blocker);
>>> +    error_free(multiple_devices_migration_blocker);
>>> +    multiple_devices_migration_blocker = NULL;
>>> +}
>> A couple awkward things here.  First I wish we could do something
>> cleaner or more intuitive than the != 2 test.  I get that we're trying
>> to do this on the addition of the 2nd device supporting migration, or
>> the removal of the next to last device independent of all other devices,
>> but I wonder if it wouldn't be better to remove the multiple-device
>> blocker after migration is torn down for the device so we can test
>> device >1 or ==1 in combination with whether
>> multiple_devices_migration_blocker is NULL.
>>
>> Which comes to the second awkwardness, if we fail to add the blocker we
>> free and clear the blocker, but when we tear down the device due to that
>> failure we'll remove the blocker that doesn't exist, free NULL, and
>> clear it again.  Thanks to the glib slist the migration blocker is
>> using, I think that all works, but I'd rather not be dependent on that
>> implementation to avoid a segfault here.  Incorporating a test of
>> multiple_devices_migration_blocker as above would avoid this too.
> 
> You mean something like this?
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 3a35f4afad..f3e08eff58 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> 
> [...]
> 
> +int vfio_block_multiple_devices_migration(Error **errp)
> +{
> +    int ret;
> +
> +    if (vfio_migratable_device_num() <= 1 ||
> +        multiple_devices_migration_blocker) {
> +        return 0;
> +    }
> +
> +    error_setg(&multiple_devices_migration_blocker,
> +               "Migration is currently not supported with multiple "
> +               "VFIO devices");
> +    ret = migrate_add_blocker(multiple_devices_migration_blocker, errp);
> +    if (ret < 0) {
> +        error_free(multiple_devices_migration_blocker);
> +        multiple_devices_migration_blocker = NULL;
> +    }
> +
> +    return ret;
> +}
> +
> +void vfio_unblock_multiple_devices_migration(void)
> +{
> +    if (vfio_migratable_device_num() > 1 ||
> +        !multiple_devices_migration_blocker) {
> +        return;
> +    }
> +
> +    migrate_del_blocker(multiple_devices_migration_blocker);
> +    error_free(multiple_devices_migration_blocker);
> +    multiple_devices_migration_blocker = NULL;
> +}
> +
>   static bool vfio_devices_all_dirty_tracking(VFIOContainer *container)
>   {
>       VFIOGroup *group;
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index 552c2313b2..15b446c0ec 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -880,6 +880,11 @@ int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
>           goto add_blocker;
>       }
> 
> +    ret = vfio_block_multiple_devices_migration(errp);
> +    if (ret) {
> +        return ret;
> +    }
> +
>       trace_vfio_migration_probe(vbasedev->name, info->index);
>       g_free(info);
>       return 0;
> @@ -906,6 +911,7 @@ void vfio_migration_finalize(VFIODevice *vbasedev)
>           qemu_del_vm_change_state_handler(migration->vm_state);
>           unregister_savevm(VMSTATE_IF(vbasedev->dev), "vfio", vbasedev);
>           vfio_migration_exit(vbasedev);
> +        vfio_unblock_multiple_devices_migration();
>       }
> 
>       if (vbasedev->migration_blocker) {
> 
> 
> Maybe also negate the if conditions and put the add/remove blocker code inside it? Is it more readable this way?
> E.g.:
> 
> +int vfio_block_multiple_devices_migration(Error **errp)
> +{
> +    int ret = 0;
> +
> +    if (vfio_migratable_device_num() > 1 &&
> +        !multiple_devices_migration_blocker) {
> +        error_setg(&multiple_devices_migration_blocker,
> +                   "Migration is currently not supported with multiple "
> +                   "VFIO devices");
> +        ret = migrate_add_blocker(multiple_devices_migration_blocker, errp);
> +        if (ret < 0) {
> +            error_free(multiple_devices_migration_blocker);
> +            multiple_devices_migration_blocker = NULL;
> +        }
> +    }
> +
> +    return ret;
> +}
> +
> +void vfio_unblock_multiple_devices_migration(void)
> +{
> +    if (vfio_migratable_device_num() <= 1 &&
> +        multiple_devices_migration_blocker) {
> +        migrate_del_blocker(multiple_devices_migration_blocker);
> +        error_free(multiple_devices_migration_blocker);
> +        multiple_devices_migration_blocker = NULL;
> +    }
> +}
> 
> Thanks.
> 


