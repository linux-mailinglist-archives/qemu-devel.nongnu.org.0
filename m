Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5986D6999BB
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 17:18:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSgwm-0004Di-Jn; Thu, 16 Feb 2023 11:17:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSgwk-0004CS-FO
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:17:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSgwi-0004kw-Nf
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 11:17:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676564238;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=iU2IFh8ZNZx9upEErzOfH16BKAa6ktDhpA2Z2H7zrWE=;
 b=jVUvJfua6zVnh+RKQKCrzI/VayKcUoyv18NjJCP/x4o0DHg8QJkJUYTj1hPWH0s6QxRN2p
 CfVoUQhQ4Tnadl/QANb9XTHezYKtjveN5oVIi6fhO71/9hHzWBxZAC3nehNFQ2KeSQRkWO
 pixLgmd35gBmEDSf2WN0bzG74NBlYz4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-630-oDU1vBE-Pd6qwMuiIomeEA-1; Thu, 16 Feb 2023 11:17:16 -0500
X-MC-Unique: oDU1vBE-Pd6qwMuiIomeEA-1
Received: by mail-wm1-f70.google.com with SMTP id
 o42-20020a05600c512a00b003dc5341afbaso1354405wms.7
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 08:17:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iU2IFh8ZNZx9upEErzOfH16BKAa6ktDhpA2Z2H7zrWE=;
 b=hTAaUNlxvxEDHjW5nZgRmV8mslgdeROZtYDdJpKT0HfOZr8ubbOY7VqldH1VxXfo2Y
 cNer4BZhQhnQNlurHu7BzAA6SMSAmziI4iP5BUCKWLxDXXdS1vNLUpI2u4cZJJVa8lom
 oO/snUijcQ5cfPK2qWwiM+GWZjLuI+neJ6O2IYYrV+sC4GgF0t7j4Z99iso9dSYis6VV
 kxKxMmk7GTuGDhRvH/wRW8rJ4mezh0hzYXpbwOFD4AE/oFbNPopJWuyhSxfZu9wkOT+n
 pHiDuviJ1YRuXNqOxVLrH2eCpL43fYcqWYx68SRc8bTDvNexex0hfIWzcO9rfJ00dZOA
 SgZg==
X-Gm-Message-State: AO0yUKVUSF4oba7M8950FidVtB9XmeMXgHu30aCvH4NlD1fJ7VWjgirt
 fQ300ZzSMnaGfI4f99eXTy+j9d/R07objQkVuXil1Bm5NIaXjkFrepKF4nwS5eboPZpbl+0rfpz
 PSS1HHWSrZrdObFw=
X-Received: by 2002:adf:e701:0:b0:2c5:5331:5516 with SMTP id
 c1-20020adfe701000000b002c553315516mr5262542wrm.51.1676564235073; 
 Thu, 16 Feb 2023 08:17:15 -0800 (PST)
X-Google-Smtp-Source: AK7set9P+Waab5AdIfmCzuDd1lJw9iGZAWdYqMdqJ8ShpOReyqXDVUR+B5UWYfZpmn/IpNFlxtXubQ==
X-Received: by 2002:adf:e701:0:b0:2c5:5331:5516 with SMTP id
 c1-20020adfe701000000b002c553315516mr5262520wrm.51.1676564234799; 
 Thu, 16 Feb 2023 08:17:14 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 r9-20020adff709000000b002c55efa9cbesm1917889wrp.39.2023.02.16.08.17.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 08:17:13 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Anton Kuchin <antonkuchin@yandex-team.ru>,  qemu-devel@nongnu.org,  "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>,  Eduardo Habkost
 <eduardo@habkost.net>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Markus
 Armbruster <armbru@redhat.com>,  yc-core@yandex-team.ru,  Stefan Hajnoczi
 <stefanha@redhat.com>,  virtio-fs@redhat.com,  Eric Blake
 <eblake@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 1/1] vhost-user-fs: add property to allow migration
In-Reply-To: <20230216110952-mutt-send-email-mst@kernel.org> (Michael
 S. Tsirkin's message of "Thu, 16 Feb 2023 11:11:18 -0500")
References: <20230216140003.1103681-1-antonkuchin@yandex-team.ru>
 <20230216140003.1103681-2-antonkuchin@yandex-team.ru>
 <87v8k1itoy.fsf@secure.mitica>
 <20230216110952-mutt-send-email-mst@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 16 Feb 2023 17:17:12 +0100
Message-ID: <87cz69h9fb.fsf@secure.mitica>
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

"Michael S. Tsirkin" <mst@redhat.com> wrote:
> On Thu, Feb 16, 2023 at 03:14:05PM +0100, Juan Quintela wrote:
>> Anton Kuchin <antonkuchin@yandex-team.ru> wrote:
>> > Now any vhost-user-fs device makes VM unmigratable, that also prevents
>> > qemu update without stopping the VM. In most cases that makes sense
>> > because qemu has no way to transfer FUSE session state.
>> >
>> > But it is good to have an option for orchestrator to tune this according to
>> > backend capabilities and migration configuration.
>> >
>> > This patch adds device property 'migration' that is 'none' by default
>> > to keep old behaviour but can be set to 'external' to explicitly allow
>> > migration with minimal virtio device state in migration stream if daemon
>> > has some way to sync FUSE state on src and dst without help from qemu.
>> >
>> > Signed-off-by: Anton Kuchin <antonkuchin@yandex-team.ru>
>> 
>> Reviewed-by: Juan Quintela <quintela@redhat.com>
>> 
>> The migration bits are correct.
>> 
>> And I can think a better way to explain that one device is migrated
>> externally.
>> 
>> If you have to respin:
>> 
>> > +static int vhost_user_fs_pre_save(void *opaque)
>> > +{
>> > +    VHostUserFS *fs = (VHostUserFS *)opaque;
>> 
>> This hack is useless.
>
> meaning the cast? yes.

Yeap.  Sorry.


>> I know that there are still lots of code that still have it.
>> 
>> 
>> Now remember that I have no clue about vhost-user-fs.
>> 
>> But this looks fishy
>> >  static const VMStateDescription vuf_vmstate = {
>> >      .name = "vhost-user-fs",
>> > -    .unmigratable = 1,
>> > +    .minimum_version_id = 0,
>> > +    .version_id = 0,
>> > +    .fields = (VMStateField[]) {
>> > +        VMSTATE_VIRTIO_DEVICE,
>> > +        VMSTATE_UINT8(migration_type, VHostUserFS),
>> > +        VMSTATE_END_OF_LIST()
>> > +    },
>> > +   .pre_save = vhost_user_fs_pre_save,
>> >  };
>> >  
>> >  static Property vuf_properties[] = {
>> > @@ -309,6 +337,10 @@ static Property vuf_properties[] = {
>> >      DEFINE_PROP_UINT16("num-request-queues", VHostUserFS,
>> >                         conf.num_request_queues, 1),
>> >      DEFINE_PROP_UINT16("queue-size", VHostUserFS, conf.queue_size, 128),
>> > +    DEFINE_PROP_UNSIGNED("migration", VHostUserFS, migration_type,
>> > +                         VHOST_USER_MIGRATION_TYPE_NONE,
>> > +                         qdev_prop_vhost_user_migration_type,
>> > +                         uint8_t),
>> >      DEFINE_PROP_END_OF_LIST(),
>> 
>> We have four properties here (5 with the new migration one), and you
>> only migrate one.
>> 
>> This looks fishy, but I don't know if it makes sense.
>> If they _have_ to be configured the same on source and destination, I
>> would transfer them and check in post_load that the values are correct.
>> 
>> Later, Juan.
>
> Weird suggestion.  We generally don't do this kind of check - that
> would be open-coding each property. It's management's job to make
> sure things are consistent.

I was wondering why we don't need the other properties.
If you think we don't need them, fine with me.

Later, Juan.


