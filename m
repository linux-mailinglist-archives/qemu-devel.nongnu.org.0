Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F6958FA1F
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 11:33:36 +0200 (CEST)
Received: from localhost ([::1]:58030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM4ZL-0007On-Tw
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 05:33:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1oM4Vo-0003ii-8L
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 05:29:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1oM4Vk-0006VR-H3
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 05:29:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660210190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QBYeSbXiBdo9p2qUWh2FD66vIzZT3oD4/WofbJnHkZo=;
 b=fw70B7SAbhnf+CaC9ihD9dvYVD184QAP5hWgwjXZnMrHRwnTP3PBkTPhiJJkE06fXmyyn+
 OfxTnQAUQg5zJSwcrmok8+laPYHuk76sx+VmgAuhLaGYcAs+T/puVAVRusvVRvN54GvxyJ
 jQN3WjrgXvs6RSptFU2GZXWxLifrSJM=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-586-BVmno11rM8aWKPxJNS78Nw-1; Thu, 11 Aug 2022 05:29:49 -0400
X-MC-Unique: BVmno11rM8aWKPxJNS78Nw-1
Received: by mail-ua1-f72.google.com with SMTP id
 g47-20020ab059b2000000b0038425bf3de7so3378259uad.1
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 02:29:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc;
 bh=QBYeSbXiBdo9p2qUWh2FD66vIzZT3oD4/WofbJnHkZo=;
 b=ZqEux8E5+rUvODgyBZ+Oifc6mRS4KmTBS7KRsh8u4I1ZNiSr1vyIu969wyhCBpu6hA
 mq98qHMbww2+54eXyXoc/OoGGvq2SXWIohxFWud/KfiQTOf/LhAn8r0qwVdqk6xBOXus
 L3CAB/4QbhgZclOmZcLWi3INJXBkQRdH2r25Abxf9ThX2JDT6WH4Ldz+ha+YSbDTAUZc
 fzj/vK7bQzBzcuJyJlj5dy/Y3or02jjIPapEFbbQ9Qv6vqH23vdFaqOlLR1DzrJBpBfj
 IhrZYb0i4Y3v02E45G7aFurIys29SIbf4cXDxwheUYvqVHW9AoLP+SCr2FAAK+dt11TA
 LcIw==
X-Gm-Message-State: ACgBeo1NHbqtAy4WyAkLI90pfCZXRKKJtBur4fMteR8mE0js4EsTWwye
 vbTsmX/y4vhW4eUUbAc4AmTZRA6ZoO9IRC+TXtGtq2s0Yxc8OAmj81dU0Q5XiAILqpcVtgslo62
 b4perhfEwha+Cqig=
X-Received: by 2002:a1f:9d13:0:b0:376:7f81:9b85 with SMTP id
 g19-20020a1f9d13000000b003767f819b85mr13905332vke.18.1660210188711; 
 Thu, 11 Aug 2022 02:29:48 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6bh8o5Uwm+uW+lfzucx535abSdFscTGkOe4wU1uI12wsAfWvmFq3ANI1wwcSq3dlqRs288Pg==
X-Received: by 2002:a1f:9d13:0:b0:376:7f81:9b85 with SMTP id
 g19-20020a1f9d13000000b003767f819b85mr13905325vke.18.1660210188494; 
 Thu, 11 Aug 2022 02:29:48 -0700 (PDT)
Received: from ?IPv6:2804:1b3:a800:5713:6880:fd74:a3e5:2086?
 ([2804:1b3:a800:5713:6880:fd74:a3e5:2086])
 by smtp.gmail.com with ESMTPSA id
 m19-20020a1f2613000000b00374a2176ffbsm1527534vkm.43.2022.08.11.02.29.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 02:29:47 -0700 (PDT)
Message-ID: <cdf15834492aa55215ef75b6a963e1c7b3ff49a9.camel@redhat.com>
Subject: Re: [PATCH v7 08/12] multifd: Add capability to enable/disable
 zero_page
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras@redhat.com>
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>, Eric Blake
 <eblake@redhat.com>, Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?=
 <f4bug@amsat.org>,  Yanan Wang <wangyanan55@huawei.com>, Markus Armbruster
 <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
Date: Thu, 11 Aug 2022 06:29:44 -0300
In-Reply-To: <20220802063907.18882-9-quintela@redhat.com>
References: <20220802063907.18882-1-quintela@redhat.com>
 <20220802063907.18882-9-quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.3 
MIME-Version: 1.0
Received-SPF: pass client-ip=170.10.133.124; envelope-from=leobras@redhat.com;
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

On Tue, 2022-08-02 at 08:39 +0200, Juan Quintela wrote:
> We have to enable it by default until we introduce the new code.
>=20
> Signed-off-by: Juan Quintela <quintela@redhat.com>
>=20
> ---
>=20
> Change it to a capability.  As capabilities are off by default, have
> to change MULTIFD_ZERO_PAGE to MAIN_ZERO_PAGE, so it is false for
> default, and true for older versions.

IIUC, the idea of a capability is to introduce some new features to the cod=
e,
and let users enable or disable it.=20

If it introduce a new capability, is not very intuitive to think that it wi=
ll be
always true for older versions, and false for new ones.

I would suggest adding it as MULTIFD_ZERO_PAGE, and let it disabled for now=
.
When the full feature gets introduced, the capability could be enabled by
default, if desired.

What do you think?

Best regards,
Leo


> ---
>  qapi/migration.json   |  8 +++++++-
>  migration/migration.h |  1 +
>  hw/core/machine.c     |  1 +
>  migration/migration.c | 16 +++++++++++++++-
>  4 files changed, 24 insertions(+), 2 deletions(-)
>=20
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 81185d4311..dc981236ff 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -472,12 +472,18 @@
>  #                  Requires that QEMU be permitted to use locked memory
>  #                  for guest RAM pages.
>  #                  (since 7.1)
> +#
>  # @postcopy-preempt: If enabled, the migration process will allow postco=
py
>  #                    requests to preempt precopy stream, so postcopy req=
uests
>  #                    will be handled faster.  This is a performance feat=
ure and
>  #                    should not affect the correctness of postcopy migra=
tion.
>  #                    (since 7.1)
>  #
> +# @main-zero-page: If enabled, the detection of zero pages will be
> +#                  done on the main thread.  Otherwise it is done on
> +#                  the multifd threads.
> +#                  (since 7.1)
> +#
>  # Features:
>  # @unstable: Members @x-colo and @x-ignore-shared are experimental.
>  #
> @@ -492,7 +498,7 @@
>             'dirty-bitmaps', 'postcopy-blocktime', 'late-block-activate',
>             { 'name': 'x-ignore-shared', 'features': [ 'unstable' ] },
>             'validate-uuid', 'background-snapshot',
> -           'zero-copy-send', 'postcopy-preempt'] }
> +           'zero-copy-send', 'postcopy-preempt', 'main-zero-page'] }
> =20
>  ##
>  # @MigrationCapabilityStatus:
> diff --git a/migration/migration.h b/migration/migration.h
> index cdad8aceaa..58b245b138 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -415,6 +415,7 @@ int migrate_multifd_channels(void);
>  MultiFDCompression migrate_multifd_compression(void);
>  int migrate_multifd_zlib_level(void);
>  int migrate_multifd_zstd_level(void);
> +bool migrate_use_main_zero_page(void);
> =20
>  #ifdef CONFIG_LINUX
>  bool migrate_use_zero_copy_send(void);
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index a673302cce..2624b75ab4 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -43,6 +43,7 @@
>  GlobalProperty hw_compat_7_0[] =3D {
>      { "arm-gicv3-common", "force-8-bit-prio", "on" },
>      { "nvme-ns", "eui64-default", "on"},
> +    { "migration", "main-zero-page", "true" },
>  };
>  const size_t hw_compat_7_0_len =3D G_N_ELEMENTS(hw_compat_7_0);
> =20
> diff --git a/migration/migration.c b/migration/migration.c
> index e03f698a3c..ce3e5cc0cd 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -164,7 +164,8 @@ INITIALIZE_MIGRATE_CAPS_SET(check_caps_background_sna=
pshot,
>      MIGRATION_CAPABILITY_XBZRLE,
>      MIGRATION_CAPABILITY_X_COLO,
>      MIGRATION_CAPABILITY_VALIDATE_UUID,
> -    MIGRATION_CAPABILITY_ZERO_COPY_SEND);
> +    MIGRATION_CAPABILITY_ZERO_COPY_SEND,
> +    MIGRATION_CAPABILITY_MAIN_ZERO_PAGE);
> =20
>  /* When we add fault tolerance, we could have several
>     migrations at once.  For now we don't need to add
> @@ -2592,6 +2593,17 @@ bool migrate_use_multifd(void)
>      return s->enabled_capabilities[MIGRATION_CAPABILITY_MULTIFD];
>  }
> =20
> +bool migrate_use_main_zero_page(void)
> +{
> +    MigrationState *s;
> +
> +    s =3D migrate_get_current();
> +
> +    // We will enable this when we add the right code.
> +    // return s->enabled_capabilities[MIGRATION_CAPABILITY_MAIN_ZERO_PAG=
E];
> +    return true;
> +}
> +
>  bool migrate_pause_before_switchover(void)
>  {
>      MigrationState *s;
> @@ -4406,6 +4418,8 @@ static Property migration_properties[] =3D {
>      DEFINE_PROP_MIG_CAP("x-zero-copy-send",
>              MIGRATION_CAPABILITY_ZERO_COPY_SEND),
>  #endif
> +    DEFINE_PROP_MIG_CAP("main-zero-page",
> +            MIGRATION_CAPABILITY_MAIN_ZERO_PAGE),
> =20
>      DEFINE_PROP_END_OF_LIST(),
>  };


