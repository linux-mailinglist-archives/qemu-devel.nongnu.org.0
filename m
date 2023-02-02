Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 670A9687296
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 01:55:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNNsU-0006hF-0k; Wed, 01 Feb 2023 19:55:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pNNsN-0006gs-3E
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 19:54:56 -0500
Received: from forwardcorp1c.mail.yandex.net
 ([2a02:6b8:c03:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonkuchin@yandex-team.ru>)
 id 1pNNsJ-0000f2-Iw
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 19:54:54 -0500
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 5B4935FA96;
 Thu,  2 Feb 2023 03:54:43 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b522::1:31] (unknown
 [2a02:6b8:b081:b522::1:31])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 fsKGaB0QieA1-Kacg3BKy; Thu, 02 Feb 2023 03:54:42 +0300
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1675299282; bh=JSRjSAQ9/SC/ivUMyOiWTjPKbzfY+vtqfyre/y+STRA=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=y6CImjmsc/Oy4XEIFqH2+5EjwTOEw/oWKK790XQCOdtbbXa63yztfYUdpnTFk0/uO
 7nYeew5eT6RBfVNAq/T21pPLoTzxlgRHJwbc28ErjHOr8zTvyLivVBUuTYSP2BrztE
 Zhng8keT8ZXDzsntSf3MZ+pB7U6AAomhRh1t7pwA=
Authentication-Results: iva4-f06c35e68a0a.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <ed9832ec-eaf0-68a4-b7c1-9f1691ab149e@yandex-team.ru>
Date: Thu, 2 Feb 2023 02:54:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] vhost-user-fs: add capability to allow migration
Content-Language: en-US, ru-RU
To: quintela@redhat.com
Cc: Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel@nongnu.org,
 virtio-fs@redhat.com, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 yc-core@yandex-team.ru, "Michael S. Tsirkin" <mst@redhat.com>
References: <20230115170903.3416105-1-antonkuchin@yandex-team.ru>
 <CAJSP0QVKUKgkBMw1PiN8-L8Ykhq=gfvNTTs4sf1tuzoqHu+GXw@mail.gmail.com>
 <0d57cc40-693b-b36c-a135-fdac60dd00ec@yandex-team.ru>
 <CAJSP0QUXB0kgsCSsmi8dpnJFYho2cR_2Liep=pGmp6WzDZ_7pw@mail.gmail.com>
 <d6bf0b9a-a167-817d-2c17-c2e472961155@yandex-team.ru>
 <CAJSP0QXXe6KgLN2PJvi-5GqcELhUKJPB2pUARL2ktO9TQYAq=g@mail.gmail.com>
 <2fb6efb4-9155-99ad-3acd-c274783436ed@yandex-team.ru>
 <87h6w5ea1m.fsf@secure.mitica>
From: Anton Kuchin <antonkuchin@yandex-team.ru>
In-Reply-To: <87h6w5ea1m.fsf@secure.mitica>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:c03:500:1:45:d181:df01;
 envelope-from=antonkuchin@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 01/02/2023 16:26, Juan Quintela wrote:
> Anton Kuchin <antonkuchin@yandex-team.ru> wrote:
>> On 19/01/2023 18:02, Stefan Hajnoczi wrote:
>>> On Thu, 19 Jan 2023 at 10:29, Anton Kuchin <antonkuchin@yandex-team.ru> wrote:
>>>> On 19/01/2023 16:30, Stefan Hajnoczi wrote:
>>>>> On Thu, 19 Jan 2023 at 07:43, Anton Kuchin <antonkuchin@yandex-team.ru> wrote:
>>>>>> On 18/01/2023 17:52, Stefan Hajnoczi wrote:
>>>>>>> On Sun, 15 Jan 2023 at 12:21, Anton Kuchin <antonkuchin@yandex-team.ru> wrote:
> Hi
>
> Sorry to come so late into the discussion.

You are just in time, I'm working on v2 of this patch right now :-)

>
>>>>>>>> +static int vhost_user_fs_pre_save(void *opaque)
>>>>>>>> +{
>>>>>>>> +    MigrationState *s = migrate_get_current();
>>>>>>>> +
>>>>>>>> +    if (!s->enabled_capabilities[MIGRATION_CAPABILITY_VHOST_USER_FS]) {
>>>>>>>> +        error_report("Migration of vhost-user-fs devices requires internal FUSE "
>>>>>>>> +                     "state of backend to be preserved. If orchestrator can "
>>>>>>>> +                     "guarantee this (e.g. dst connects to the same backend "
>>>>>>>> +                     "instance or backend state is migrated) set 'vhost-user-fs' "
>>>>>>>> +                     "migration capability to true to enable migration.");
>>>>>>>> +        return -1;
>>>>>>>> +    }
>>>>>>>> +
>>>>>>>> +    return 0;
>>>>>>>> +}
>>>>>>>> +
>>>>>>>>      static const VMStateDescription vuf_vmstate = {
>>>>>>>>          .name = "vhost-user-fs",
>>>>>>>> -    .unmigratable = 1,
>>>>>>>> +    .minimum_version_id = 0,
>>>>>>>> +    .version_id = 0,
>>>>>>>> +    .fields = (VMStateField[]) {
>>>>>>>> +        VMSTATE_VIRTIO_DEVICE,
>>>>>>>> +        VMSTATE_END_OF_LIST()
>>>>>>>> +    },
>>>>>>>> +   .pre_save = vhost_user_fs_pre_save,
>>>>>>>>      };
> I don't object to extend the vmstate this way.
>
> But I object to the migration capability for several reasons:
> - This feature has _nothing_ to do with migration, the problem, what it
>    describes, etc is related to vhost_user_fs.
> - The number of migration capabilities is limited
>    And we add checks to see if they are valid, consistent, etc
>    see qemu/migration/migration.c:migrate_caps_check()
> - As Stefan says, we can have several vhost_user_fs devices, and each
>    one should know if it can migrate or not.
> - We have to options for the orchestator:
>    * it knows that all the vhost_user_fs devices can be migration
>      Then it can add a property to each vhost_user_fs device
>    * it don't know it
>      Then it is a good idea that we are not migrating this VM.
>
>> I think we'd be better without a new marker because migration code
>> has standard generic way of solving such puzzles that I described
>> above. So adding new marker would go against existing practice.
>> But if you could show me where I missed something I'll be grateful
>> and will fix it to avoid potential problems.
>> I'd also be happy to know the opinion of Dr. David Alan Gilbert.
> If everybody agrees that any vhost_user_fs device is going to have a
> virtio device, then I agree with you that the marker is not needed at
> this point.
>
> Once told that, I think that you are making your live harder in the
> future when you add the other migratable devices.
>
> I am assuming here that your "underlying device" is:
>
> enum VhostUserFSType {
>      VHOST_USER_NO_MIGRATABLE = 0,
>      // The one we are doing here
>      VHOST_USER_EXTERNAL_MIGRATABLE,
>      // The one you describe for the future
>      VHOST_USER_INTERNAL_MIGRATABLE,
> };
>
> struct VHostUserFS {
>      /*< private >*/
>      VirtIODevice parent;
>      VHostUserFSConf conf;
>      struct vhost_virtqueue *vhost_vqs;
>      struct vhost_dev vhost_dev;
>      VhostUserState vhost_user;
>      VirtQueue **req_vqs;
>      VirtQueue *hiprio_vq;
>      int32_t bootindex;
>      enum migration_type;
>      /*< public >*/
> };
>
>
> static int vhost_user_fs_pre_save(void *opaque)
> {
>      VHostUserFS *s = opaque;
>
>      if (s->migration_type == VHOST_USER_NO_MIGRATABLE)) {
>          error_report("Migration of vhost-user-fs devices requires internal FUSE "
>                       "state of backend to be preserved. If orchestrator can "
>                       "guarantee this (e.g. dst connects to the same backend "
>                       "instance or backend state is migrated) set 'vhost-user-fs' "
>                       "migration capability to true to enable migration.");
>          return -1;
>      }
>      if (s->migration_type == VHOST_USER_EXTERNAL_MIGRATABLE) {
>          return 0;
>      }
>      if (s->migration_type == VHOST_USER_INTERNAL_MIGRATABLE) {
>          error_report("still not implemented");
>          return -1;
>      }
>      assert("we don't reach here");
> }
>
> Your initial vmstateDescription
>
> static const VMStateDescription vuf_vmstate = {
>      .name = "vhost-user-fs",
>      .unmigratable = 1,
>      .minimum_version_id = 0,
>      .version_id = 0,
>      .fields = (VMStateField[]) {
>          VMSTATE_INT8(migration_type, struct VHostUserFS),
>          VMSTATE_VIRTIO_DEVICE,
>          VMSTATE_END_OF_LIST()
>      },
>      .pre_save = vhost_user_fs_pre_save,
> };
>
> And later you change it to something like:
>
> static bool vhost_fs_user_internal_state_needed(void *opaque)
> {
>      VHostUserFS *s = opaque;
>
>      return s->migration_type == VMOST_USER_INTERNAL_MIGRATABLE;
> }
>
> static const VMStateDescription vmstate_vhost_user_fs_internal_sub = {
>      .name = "vhost-user-fs/internal",
>      .version_id = 1,
>      .minimum_version_id = 1,
>      .needed = &vhost_fs_user_internal_state_needed,
>      .fields = (VMStateField[]) {
>          .... // Whatever
>          VMSTATE_END_OF_LIST()
>      }
> };
>
> static const VMStateDescription vuf_vmstate = {
>      .name = "vhost-user-fs",
>      .minimum_version_id = 0,
>      .version_id = 0,
>      .fields = (VMStateField[]) {
>          VMSTATE_INT8(migration_type, struct VHostUserFS),
>          VMSTATE_VIRTIO_DEVICE,
>          VMSTATE_END_OF_LIST()
>      },
>      .pre_save = vhost_user_fs_pre_save,
>      .subsections = (const VMStateDescription*[]) {
>          &vmstate_vhost_user_fs_internal_sub,
>          NULL
>      }
> };
>
> And you are done.
>
> I will propose to use a property to set migration_type, but I didn't
> want to write the code right now.
>
> I think that this proposal will make Stephan happy, and it is just
> adding and extra uint8_t that is helpul to implement everything.

That is exactly the approach I'm trying to implement it right now. Single
flag can be convenient for orchestrator but makes it too hard to account in
all cases for all devices on qemu side without breaking future 
compatibility.
So I'm rewriting it with properties.

BTW do you think each vhost-user device should have its own enum of 
migration
types or maybe we could make them common for all device types?

>
> Later, Juan.
>
> PD.  One of the few things that Pascal got right and C got completely
>       wrong were pascal variant registers vs C union's.  If you have a
>       union, if should be "required" that there is a field in the
>       enclosing struct that specifies what element of the union we have.
>       This is exactly that case.
>

