Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDCD6879AC
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 11:01:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNWNO-0003jb-JL; Thu, 02 Feb 2023 04:59:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNWNN-0003jT-4H
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 04:59:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNWNL-0003uc-Ca
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 04:59:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675331966;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=EqcbAbntqe5q12pGFEyKkh6uMQ+5Yf8cGpYJvcJoNXk=;
 b=VxDMjvF34RBg+1+s4PtABUtFtTIEQ7iWOILHenfBUzrCj8t1hNE3PGOyolaJYYhNC+D/r0
 EDQRli0RMO41ivwBDLXyLNtQ7WNlMTMMHi6EZeBqfaJR7StjBAGAMzNuViSLGVwbffUEn1
 gszeITSzJZHsT46REAE/jcm9SC22dXE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-421-Qp2zWgvkMI252i3NHCsiXg-1; Thu, 02 Feb 2023 04:59:25 -0500
X-MC-Unique: Qp2zWgvkMI252i3NHCsiXg-1
Received: by mail-wm1-f72.google.com with SMTP id
 h2-20020a1ccc02000000b003db1ded176dso693623wmb.5
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 01:59:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EqcbAbntqe5q12pGFEyKkh6uMQ+5Yf8cGpYJvcJoNXk=;
 b=4VW1jFysfrMVCvpt4KxMKDWabldNJPzuYN9T7pX9haD5K4chtxa7jzt3HKxd9/2wMD
 ddEVQeybQ8NnSHzePUzHNigz0XJ8y3GLp+FVI5k3H+WbyTO7BYe9zy0ynAmUMotJIJBv
 pPx0VlBrrcIH73lANHOTPKPKa8CADF+K0PqmR3mo++bbQwx9iC+j+5b7o4hGBSKh1FMd
 vOncFV+m3j+nX9LkM2qXjTy2q90Mdv+eOR6Xni9QTbjKMuxnE7dO7QzHn2be5XSqLkDc
 xt5RIRz7BDyUgi74NVrSKLRq83LYE0etpfaE/eZAaAAj4pUZUhFZy6EQX1NpxtiEkOK6
 JR7Q==
X-Gm-Message-State: AO0yUKViwVKTxqVFZNylbl4WBZ1j66LevATypr7vMeFh2+5I3V6hnwz+
 emAEz3KQCCDsiLOhHBoZQxUf51LxBCeYrEHVleowqQPOrOp5dXFfriNRoD76PSOTrofxiHjC6rZ
 7FKKLRDi1aXlemFY=
X-Received: by 2002:a05:600c:3b18:b0:3df:e1d8:cd8f with SMTP id
 m24-20020a05600c3b1800b003dfe1d8cd8fmr169958wms.6.1675331964133; 
 Thu, 02 Feb 2023 01:59:24 -0800 (PST)
X-Google-Smtp-Source: AK7set8yM4g9/qrZwWmN05voUOGGO0IV0y/Hlltto275e5MhMSN5ABnF43O9w8tf7pAEoPYhbgKFfw==
X-Received: by 2002:a05:600c:3b18:b0:3df:e1d8:cd8f with SMTP id
 m24-20020a05600c3b1800b003dfe1d8cd8fmr169941wms.6.1675331963933; 
 Thu, 02 Feb 2023 01:59:23 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 t4-20020a05600001c400b002bdcce37d31sm20936532wrx.99.2023.02.02.01.59.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 01:59:23 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Anton Kuchin <antonkuchin@yandex-team.ru>
Cc: Stefan Hajnoczi <stefanha@gmail.com>,  qemu-devel@nongnu.org,
 virtio-fs@redhat.com,  Markus Armbruster <armbru@redhat.com>,  Eric Blake
 <eblake@redhat.com>,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,  yc-core@yandex-team.ru,  "Michael
 S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] vhost-user-fs: add capability to allow migration
In-Reply-To: <ed9832ec-eaf0-68a4-b7c1-9f1691ab149e@yandex-team.ru> (Anton
 Kuchin's message of "Thu, 2 Feb 2023 02:54:40 +0200")
References: <20230115170903.3416105-1-antonkuchin@yandex-team.ru>
 <CAJSP0QVKUKgkBMw1PiN8-L8Ykhq=gfvNTTs4sf1tuzoqHu+GXw@mail.gmail.com>
 <0d57cc40-693b-b36c-a135-fdac60dd00ec@yandex-team.ru>
 <CAJSP0QUXB0kgsCSsmi8dpnJFYho2cR_2Liep=pGmp6WzDZ_7pw@mail.gmail.com>
 <d6bf0b9a-a167-817d-2c17-c2e472961155@yandex-team.ru>
 <CAJSP0QXXe6KgLN2PJvi-5GqcELhUKJPB2pUARL2ktO9TQYAq=g@mail.gmail.com>
 <2fb6efb4-9155-99ad-3acd-c274783436ed@yandex-team.ru>
 <87h6w5ea1m.fsf@secure.mitica>
 <ed9832ec-eaf0-68a4-b7c1-9f1691ab149e@yandex-team.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 02 Feb 2023 10:59:22 +0100
Message-ID: <874js4v151.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
> On 01/02/2023 16:26, Juan Quintela wrote:
>> Anton Kuchin <antonkuchin@yandex-team.ru> wrote:
>>> On 19/01/2023 18:02, Stefan Hajnoczi wrote:
>>>> On Thu, 19 Jan 2023 at 10:29, Anton Kuchin <antonkuchin@yandex-team.ru> wrote:
>>>>> On 19/01/2023 16:30, Stefan Hajnoczi wrote:
>>>>>> On Thu, 19 Jan 2023 at 07:43, Anton Kuchin <antonkuchin@yandex-team.ru> wrote:
>>>>>>> On 18/01/2023 17:52, Stefan Hajnoczi wrote:
>>>>>>>> On Sun, 15 Jan 2023 at 12:21, Anton Kuchin <antonkuchin@yandex-team.ru> wrote:
>> Once told that, I think that you are making your live harder in the
>> future when you add the other migratable devices.
>>
>> I am assuming here that your "underlying device" is:
>>
>> enum VhostUserFSType {
>>      VHOST_USER_NO_MIGRATABLE = 0,
>>      // The one we are doing here
>>      VHOST_USER_EXTERNAL_MIGRATABLE,
>>      // The one you describe for the future
>>      VHOST_USER_INTERNAL_MIGRATABLE,
>> };
>>
>> struct VHostUserFS {
>>      /*< private >*/
>>      VirtIODevice parent;
>>      VHostUserFSConf conf;
>>      struct vhost_virtqueue *vhost_vqs;
>>      struct vhost_dev vhost_dev;
>>      VhostUserState vhost_user;
>>      VirtQueue **req_vqs;
>>      VirtQueue *hiprio_vq;
>>      int32_t bootindex;
>>      enum migration_type;
>>      /*< public >*/
>> };
>>
>>
>> static int vhost_user_fs_pre_save(void *opaque)
>> {
>>      VHostUserFS *s = opaque;
>>
>>      if (s->migration_type == VHOST_USER_NO_MIGRATABLE)) {
>>          error_report("Migration of vhost-user-fs devices requires internal FUSE "
>>                       "state of backend to be preserved. If orchestrator can "
>>                       "guarantee this (e.g. dst connects to the same backend "
>>                       "instance or backend state is migrated) set 'vhost-user-fs' "
>>                       "migration capability to true to enable migration.");
>>          return -1;
>>      }
>>      if (s->migration_type == VHOST_USER_EXTERNAL_MIGRATABLE) {
>>          return 0;
>>      }
>>      if (s->migration_type == VHOST_USER_INTERNAL_MIGRATABLE) {
>>          error_report("still not implemented");
>>          return -1;
>>      }
>>      assert("we don't reach here");
>> }
>>
>> Your initial vmstateDescription
>>
>> static const VMStateDescription vuf_vmstate = {
>>      .name = "vhost-user-fs",
>>      .unmigratable = 1,
>>      .minimum_version_id = 0,
>>      .version_id = 0,
>>      .fields = (VMStateField[]) {
>>          VMSTATE_INT8(migration_type, struct VHostUserFS),
>>          VMSTATE_VIRTIO_DEVICE,
>>          VMSTATE_END_OF_LIST()
>>      },
>>      .pre_save = vhost_user_fs_pre_save,
>> };
>>
>> And later you change it to something like:
>>
>> static bool vhost_fs_user_internal_state_needed(void *opaque)
>> {
>>      VHostUserFS *s = opaque;
>>
>>      return s->migration_type == VMOST_USER_INTERNAL_MIGRATABLE;
>> }
>>
>> static const VMStateDescription vmstate_vhost_user_fs_internal_sub = {
>>      .name = "vhost-user-fs/internal",
>>      .version_id = 1,
>>      .minimum_version_id = 1,
>>      .needed = &vhost_fs_user_internal_state_needed,
>>      .fields = (VMStateField[]) {
>>          .... // Whatever
>>          VMSTATE_END_OF_LIST()
>>      }
>> };
>>
>> static const VMStateDescription vuf_vmstate = {
>>      .name = "vhost-user-fs",
>>      .minimum_version_id = 0,
>>      .version_id = 0,
>>      .fields = (VMStateField[]) {
>>          VMSTATE_INT8(migration_type, struct VHostUserFS),
>>          VMSTATE_VIRTIO_DEVICE,
>>          VMSTATE_END_OF_LIST()
>>      },
>>      .pre_save = vhost_user_fs_pre_save,
>>      .subsections = (const VMStateDescription*[]) {
>>          &vmstate_vhost_user_fs_internal_sub,
>>          NULL
>>      }
>> };
>>
>> And you are done.
>>
>> I will propose to use a property to set migration_type, but I didn't
>> want to write the code right now.
>>
>> I think that this proposal will make Stephan happy, and it is just
>> adding and extra uint8_t that is helpul to implement everything.
>
> That is exactly the approach I'm trying to implement it right now. Single
> flag can be convenient for orchestrator but makes it too hard to account in
> all cases for all devices on qemu side without breaking future
> compatibility.
> So I'm rewriting it with properties.

Nice.  That would be my proposal.  Just a bit complicated for a proof of concetp.

> BTW do you think each vhost-user device should have its own enum of
> migration
> types or maybe we could make them common for all device types?

I will put it for vhost-user, because as far as I know nobody else is
asking for this functionality.

The most similar device that I can think of right now is vfio devices.
But they are implemeting callbacks to save hardware device state, and
they go device by device, i.e. there is nothing general there.

Later, Juan.


