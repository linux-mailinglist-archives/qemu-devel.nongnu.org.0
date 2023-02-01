Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15453686844
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 15:28:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNE4d-0008G0-HZ; Wed, 01 Feb 2023 09:26:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNE4b-0008Fr-6a
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 09:26:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNE4Z-0002KA-9K
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 09:26:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675261610;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=vZHnP1i2YXRWdC/LcYOUNyTc6dy1d5CSRyf4bbgfapY=;
 b=B9J0pwtRGBp+dekF0Rlg74a3XDfDFz4zOag/4xggO6NRRTmz6WymBqzl93MqVcFVGCbrvs
 cdDKKDkAtC6OnT/peD3fcU3TUaZgE5xlKGG7bepF5CaB5ClJ+cT2tGO6nGPdbzdt3Hsllr
 RFobQzMALc7U+9UOsbJogsbTYHlTd/Y=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-458-YMTvliu0P-OpEOjUu9G6gQ-1; Wed, 01 Feb 2023 09:26:48 -0500
X-MC-Unique: YMTvliu0P-OpEOjUu9G6gQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 k9-20020a05600c1c8900b003dc5dec2ac6so1168708wms.4
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 06:26:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vZHnP1i2YXRWdC/LcYOUNyTc6dy1d5CSRyf4bbgfapY=;
 b=waARrvLcJV5l6gFhe7KV/aaoSYSoQLO6SGjCMTIgd5xRSaoPd8G4Tqi9mvx8rYe34B
 Mjz0sRhMkEnXdlEL9v2p6S3WhvA4amvmBcIRDS8NNabIujfmxM38Hm3U2MM4N2F9Y1Ub
 550p4s7oNfel65y+k7R5KvNZ5b2eCmo0//I9fS8pSGsCgmC786GbSJht8HPhxQL1CBpI
 DF+P8xduzV9ISLLVRWErG13mAMLKrsebY6b5TDU22Yg7rj0N8FIubKU92usSUTKQXsz8
 q6AIw5DqTl9KXTJTwUv5to4gJd1RTU/Qu91IdLdUvLcrSovlJfq1Zx06ZoyWb8mYvGzR
 uNZw==
X-Gm-Message-State: AO0yUKWANLqO6TuMm4CPPEu/sTlMLVJXDPbOphBJUSfSML/6vZYE2C8p
 6HZIqqSH5AQegGS7K+f5rMc7V84IA5sgA+wudLl2//CoQuv6ZlUpw2Pdvh7Et1eVwhfhLsiNeOn
 OwVxA+s8avDuTjfY=
X-Received: by 2002:adf:fe07:0:b0:2bf:c4f1:c383 with SMTP id
 n7-20020adffe07000000b002bfc4f1c383mr2334102wrr.6.1675261607649; 
 Wed, 01 Feb 2023 06:26:47 -0800 (PST)
X-Google-Smtp-Source: AK7set+xJavytzK8mCfXRWsxVIaU+UZT/FqFwoEj5wgKd5Nr/1FpBpckerWhevSAo0IR1i03jBv6oA==
X-Received: by 2002:adf:fe07:0:b0:2bf:c4f1:c383 with SMTP id
 n7-20020adffe07000000b002bfc4f1c383mr2334077wrr.6.1675261607251; 
 Wed, 01 Feb 2023 06:26:47 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 m14-20020a5d6a0e000000b002bfd09f2ca6sm15408613wru.3.2023.02.01.06.26.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 06:26:46 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Anton Kuchin <antonkuchin@yandex-team.ru>
Cc: Stefan Hajnoczi <stefanha@gmail.com>,  qemu-devel@nongnu.org,
 virtio-fs@redhat.com,  Markus Armbruster <armbru@redhat.com>,  Eric Blake
 <eblake@redhat.com>,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,  yc-core@yandex-team.ru,  "Michael
 S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] vhost-user-fs: add capability to allow migration
In-Reply-To: <2fb6efb4-9155-99ad-3acd-c274783436ed@yandex-team.ru> (Anton
 Kuchin's message of "Thu, 19 Jan 2023 18:58:12 +0200")
References: <20230115170903.3416105-1-antonkuchin@yandex-team.ru>
 <CAJSP0QVKUKgkBMw1PiN8-L8Ykhq=gfvNTTs4sf1tuzoqHu+GXw@mail.gmail.com>
 <0d57cc40-693b-b36c-a135-fdac60dd00ec@yandex-team.ru>
 <CAJSP0QUXB0kgsCSsmi8dpnJFYho2cR_2Liep=pGmp6WzDZ_7pw@mail.gmail.com>
 <d6bf0b9a-a167-817d-2c17-c2e472961155@yandex-team.ru>
 <CAJSP0QXXe6KgLN2PJvi-5GqcELhUKJPB2pUARL2ktO9TQYAq=g@mail.gmail.com>
 <2fb6efb4-9155-99ad-3acd-c274783436ed@yandex-team.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 01 Feb 2023 15:26:45 +0100
Message-ID: <87h6w5ea1m.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Anton Kuchin <antonkuchin@yandex-team.ru> wrote:
> On 19/01/2023 18:02, Stefan Hajnoczi wrote:
>> On Thu, 19 Jan 2023 at 10:29, Anton Kuchin <antonkuchin@yandex-team.ru> wrote:
>>> On 19/01/2023 16:30, Stefan Hajnoczi wrote:
>>>> On Thu, 19 Jan 2023 at 07:43, Anton Kuchin <antonkuchin@yandex-team.ru> wrote:
>>>>> On 18/01/2023 17:52, Stefan Hajnoczi wrote:
>>>>>> On Sun, 15 Jan 2023 at 12:21, Anton Kuchin <antonkuchin@yandex-team.ru> wrote:

Hi

Sorry to come so late into the discussion.


>>>>>>> +static int vhost_user_fs_pre_save(void *opaque)
>>>>>>> +{
>>>>>>> +    MigrationState *s = migrate_get_current();
>>>>>>> +
>>>>>>> +    if (!s->enabled_capabilities[MIGRATION_CAPABILITY_VHOST_USER_FS]) {
>>>>>>> +        error_report("Migration of vhost-user-fs devices requires internal FUSE "
>>>>>>> +                     "state of backend to be preserved. If orchestrator can "
>>>>>>> +                     "guarantee this (e.g. dst connects to the same backend "
>>>>>>> +                     "instance or backend state is migrated) set 'vhost-user-fs' "
>>>>>>> +                     "migration capability to true to enable migration.");
>>>>>>> +        return -1;
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    return 0;
>>>>>>> +}
>>>>>>> +
>>>>>>>     static const VMStateDescription vuf_vmstate = {
>>>>>>>         .name = "vhost-user-fs",
>>>>>>> -    .unmigratable = 1,
>>>>>>> +    .minimum_version_id = 0,
>>>>>>> +    .version_id = 0,
>>>>>>> +    .fields = (VMStateField[]) {
>>>>>>> +        VMSTATE_VIRTIO_DEVICE,
>>>>>>> +        VMSTATE_END_OF_LIST()
>>>>>>> +    },
>>>>>>> +   .pre_save = vhost_user_fs_pre_save,
>>>>>>>     };

I don't object to extend the vmstate this way.

But I object to the migration capability for several reasons:
- This feature has _nothing_ to do with migration, the problem, what it
  describes, etc is related to vhost_user_fs.
- The number of migration capabilities is limited
  And we add checks to see if they are valid, consistent, etc
  see qemu/migration/migration.c:migrate_caps_check()
- As Stefan says, we can have several vhost_user_fs devices, and each
  one should know if it can migrate or not.
- We have to options for the orchestator:
  * it knows that all the vhost_user_fs devices can be migration
    Then it can add a property to each vhost_user_fs device
  * it don't know it
    Then it is a good idea that we are not migrating this VM.

> I think we'd be better without a new marker because migration code
> has standard generic way of solving such puzzles that I described
> above. So adding new marker would go against existing practice.
> But if you could show me where I missed something I'll be grateful
> and will fix it to avoid potential problems.
> I'd also be happy to know the opinion of Dr. David Alan Gilbert.

If everybody agrees that any vhost_user_fs device is going to have a
virtio device, then I agree with you that the marker is not needed at
this point.

Once told that, I think that you are making your live harder in the
future when you add the other migratable devices.

I am assuming here that your "underlying device" is:

enum VhostUserFSType {
    VHOST_USER_NO_MIGRATABLE = 0,
    // The one we are doing here
    VHOST_USER_EXTERNAL_MIGRATABLE,
    // The one you describe for the future
    VHOST_USER_INTERNAL_MIGRATABLE,
};

struct VHostUserFS {
    /*< private >*/
    VirtIODevice parent;
    VHostUserFSConf conf;
    struct vhost_virtqueue *vhost_vqs;
    struct vhost_dev vhost_dev;
    VhostUserState vhost_user;
    VirtQueue **req_vqs;
    VirtQueue *hiprio_vq;
    int32_t bootindex;
    enum migration_type;
    /*< public >*/
};


static int vhost_user_fs_pre_save(void *opaque)
{
    VHostUserFS *s = opaque;

    if (s->migration_type == VHOST_USER_NO_MIGRATABLE)) {
        error_report("Migration of vhost-user-fs devices requires internal FUSE "
                     "state of backend to be preserved. If orchestrator can "
                     "guarantee this (e.g. dst connects to the same backend "
                     "instance or backend state is migrated) set 'vhost-user-fs' "
                     "migration capability to true to enable migration.");
        return -1;
    }
    if (s->migration_type == VHOST_USER_EXTERNAL_MIGRATABLE) {
        return 0;
    }
    if (s->migration_type == VHOST_USER_INTERNAL_MIGRATABLE) {
        error_report("still not implemented");
        return -1;
    }
    assert("we don't reach here");
}

Your initial vmstateDescription

static const VMStateDescription vuf_vmstate = {
    .name = "vhost-user-fs",
    .unmigratable = 1,
    .minimum_version_id = 0,
    .version_id = 0,
    .fields = (VMStateField[]) {
        VMSTATE_INT8(migration_type, struct VHostUserFS),
        VMSTATE_VIRTIO_DEVICE,
        VMSTATE_END_OF_LIST()
    },
    .pre_save = vhost_user_fs_pre_save,
};

And later you change it to something like:

static bool vhost_fs_user_internal_state_needed(void *opaque)
{
    VHostUserFS *s = opaque;

    return s->migration_type == VMOST_USER_INTERNAL_MIGRATABLE;
}

static const VMStateDescription vmstate_vhost_user_fs_internal_sub = {
    .name = "vhost-user-fs/internal",
    .version_id = 1,
    .minimum_version_id = 1,
    .needed = &vhost_fs_user_internal_state_needed,
    .fields = (VMStateField[]) {
        .... // Whatever
        VMSTATE_END_OF_LIST()
    }
};

static const VMStateDescription vuf_vmstate = {
    .name = "vhost-user-fs",
    .minimum_version_id = 0,
    .version_id = 0,
    .fields = (VMStateField[]) {
        VMSTATE_INT8(migration_type, struct VHostUserFS),
        VMSTATE_VIRTIO_DEVICE,
        VMSTATE_END_OF_LIST()
    },
    .pre_save = vhost_user_fs_pre_save,
    .subsections = (const VMStateDescription*[]) {
        &vmstate_vhost_user_fs_internal_sub,
        NULL
    }
};

And you are done.

I will propose to use a property to set migration_type, but I didn't
want to write the code right now.

I think that this proposal will make Stephan happy, and it is just
adding and extra uint8_t that is helpul to implement everything.

Later, Juan.

PD.  One of the few things that Pascal got right and C got completely
     wrong were pascal variant registers vs C union's.  If you have a
     union, if should be "required" that there is a field in the
     enclosing struct that specifies what element of the union we have.
     This is exactly that case.


