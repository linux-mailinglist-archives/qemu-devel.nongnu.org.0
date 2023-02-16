Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 319F16996DB
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 15:14:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSf1b-00081l-DX; Thu, 16 Feb 2023 09:14:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSf1Z-000810-GK
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:14:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSf1X-0001jg-RN
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:14:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676556850;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=m2C6J5PMwsEk/KBvueIlmMF5jh81DAmeEV1PkIPqo74=;
 b=fbstjk8bdSHN47NYR8rDXYdx0v/DDht25MTAdPvyZhrrG5VUNP+U4n6Cmxhor2E5fLH/lE
 D5QeBpiNUvAusTwSFxcoE2Tpo7lsjbdlitrQIKDwwe03+xD9qImjBHi7E6MyHFTbYArEFI
 5E/MR5V9Nfm5RIM8xpLBlBJXXeHXLOQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-369-CRfY_l0_MGyervNvP73MZQ-1; Thu, 16 Feb 2023 09:14:09 -0500
X-MC-Unique: CRfY_l0_MGyervNvP73MZQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 k9-20020a05600c1c8900b003dc5dec2ac6so3212577wms.4
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 06:14:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m2C6J5PMwsEk/KBvueIlmMF5jh81DAmeEV1PkIPqo74=;
 b=51mxAe+FBE8NW9wNq+j475q84woPnlzjKe3ZOso9R+f01QPzm3Qug+6HgL/BOaPwWk
 xGws/nJvl5zB+Zz+AL3pdewuWb6Kf8r/oqf2K6Qyqjy/N4Lv3GQwxlg7maDCLSayFUvv
 xOdTpFhOWyIjJh3kBZnF1wNXdht8fdqVtNe2vU1Pa2Oi9FIkioByd2PgvGRdf/8Ra7I+
 Iso+mIF61NquAmUr68CAXhPoaUl8zsJvqDUBbV25Fj3NZdVv/bMlKM/4jZ/h53GvAXNg
 a2F7s7c2tjVmwoOOaRECB+PG8WBfBF0WT4pK1rx56nspjTfvamyf/VlEnu3wvgp56djh
 lKBw==
X-Gm-Message-State: AO0yUKUEwZThdbm/MWqIrqFlqar+wdehAd3D4vJNscfa+gozmVkjBjH8
 Kfv8hRRFPl1sqWo63BS9k/RT2X0auu4qq1Tc2LeCM+sFv+gmlIcKZMDWM0gpHQg30I1+Bkl1Xb5
 LWm0UBySVr1teF7o=
X-Received: by 2002:a5d:574a:0:b0:2c5:582b:bad1 with SMTP id
 q10-20020a5d574a000000b002c5582bbad1mr5214200wrw.30.1676556848065; 
 Thu, 16 Feb 2023 06:14:08 -0800 (PST)
X-Google-Smtp-Source: AK7set95fMwjAzqp0D6G8Itj5BHo/yIzahNihA0bzzO/tWQI53JBgS30I2eZOj0S5HzhsjeIz46svQ==
X-Received: by 2002:a5d:574a:0:b0:2c5:582b:bad1 with SMTP id
 q10-20020a5d574a000000b002c5582bbad1mr5214174wrw.30.1676556847755; 
 Thu, 16 Feb 2023 06:14:07 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 c1-20020adfe701000000b002c5526234d2sm1644269wrm.8.2023.02.16.06.14.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 06:14:06 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Anton Kuchin <antonkuchin@yandex-team.ru>
Cc: qemu-devel@nongnu.org,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,  Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9?=
 <berrange@redhat.com>,  "Michael S. Tsirkin" <mst@redhat.com>,  Markus
 Armbruster <armbru@redhat.com>,  yc-core@yandex-team.ru,  Stefan Hajnoczi
 <stefanha@redhat.com>,  virtio-fs@redhat.com,  Eric Blake
 <eblake@redhat.com>,  Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 1/1] vhost-user-fs: add property to allow migration
In-Reply-To: <20230216140003.1103681-2-antonkuchin@yandex-team.ru> (Anton
 Kuchin's message of "Thu, 16 Feb 2023 16:00:03 +0200")
References: <20230216140003.1103681-1-antonkuchin@yandex-team.ru>
 <20230216140003.1103681-2-antonkuchin@yandex-team.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 16 Feb 2023 15:14:05 +0100
Message-ID: <87v8k1itoy.fsf@secure.mitica>
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
> Now any vhost-user-fs device makes VM unmigratable, that also prevents
> qemu update without stopping the VM. In most cases that makes sense
> because qemu has no way to transfer FUSE session state.
>
> But it is good to have an option for orchestrator to tune this according to
> backend capabilities and migration configuration.
>
> This patch adds device property 'migration' that is 'none' by default
> to keep old behaviour but can be set to 'external' to explicitly allow
> migration with minimal virtio device state in migration stream if daemon
> has some way to sync FUSE state on src and dst without help from qemu.
>
> Signed-off-by: Anton Kuchin <antonkuchin@yandex-team.ru>

Reviewed-by: Juan Quintela <quintela@redhat.com>

The migration bits are correct.

And I can think a better way to explain that one device is migrated
externally.

If you have to respin:

> +static int vhost_user_fs_pre_save(void *opaque)
> +{
> +    VHostUserFS *fs = (VHostUserFS *)opaque;

This hack is useless.
I know that there are still lots of code that still have it.


Now remember that I have no clue about vhost-user-fs.

But this looks fishy
>  static const VMStateDescription vuf_vmstate = {
>      .name = "vhost-user-fs",
> -    .unmigratable = 1,
> +    .minimum_version_id = 0,
> +    .version_id = 0,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_VIRTIO_DEVICE,
> +        VMSTATE_UINT8(migration_type, VHostUserFS),
> +        VMSTATE_END_OF_LIST()
> +    },
> +   .pre_save = vhost_user_fs_pre_save,
>  };
>  
>  static Property vuf_properties[] = {
> @@ -309,6 +337,10 @@ static Property vuf_properties[] = {
>      DEFINE_PROP_UINT16("num-request-queues", VHostUserFS,
>                         conf.num_request_queues, 1),
>      DEFINE_PROP_UINT16("queue-size", VHostUserFS, conf.queue_size, 128),
> +    DEFINE_PROP_UNSIGNED("migration", VHostUserFS, migration_type,
> +                         VHOST_USER_MIGRATION_TYPE_NONE,
> +                         qdev_prop_vhost_user_migration_type,
> +                         uint8_t),
>      DEFINE_PROP_END_OF_LIST(),

We have four properties here (5 with the new migration one), and you
only migrate one.

This looks fishy, but I don't know if it makes sense.
If they _have_ to be configured the same on source and destination, I
would transfer them and check in post_load that the values are correct.

Later, Juan.


