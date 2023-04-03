Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3566D53B9
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 23:38:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjRrl-0007RF-Mc; Mon, 03 Apr 2023 17:37:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pjRrj-0007R6-I1
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 17:37:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1pjRr2-0002Wp-EH
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 17:37:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680557802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0aX3C6PzDeAmHttIb0a7lAmd3nwV2gv0QuACd65iBTY=;
 b=SLKnDioNofPkTS4e2aBxkEb5tcbFx3uSTcL47nWhlDKKqPdMJA9yzTYGIsLOrb38hM5fb4
 lRLFXNR8/RZKCpGHgSVk9ccJdKOVaSncsQ7pXbPdVMhZZMxe9bRwYoCrd2IH7vqFHNTjcu
 7oyEp41JfnAba8HQx5UMZ2o0FFfc2TU=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-mAd4ysRPP9eZouuSuEwEzg-1; Mon, 03 Apr 2023 17:36:35 -0400
X-MC-Unique: mAd4ysRPP9eZouuSuEwEzg-1
Received: by mail-il1-f199.google.com with SMTP id
 a9-20020a921a09000000b003264524481cso7701188ila.7
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 14:36:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680557795;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0aX3C6PzDeAmHttIb0a7lAmd3nwV2gv0QuACd65iBTY=;
 b=zc/c5wb0fNyw7f18u2/HhPmu+XSKOKWklAmtQn+Pe8smr1pAXYBy3qqOabJ/7KlzmH
 e5rxHt2uBdHUJh379gwemIEI5/WE1o1FJ4v1WSGP+jEzHhXXWMB7brcQ3KieHHE3eSL4
 hNbK9SrrlcnxAQwQxs2NtPluz+dCrIhYDsVYhzgn1jzkg1W+WWNW5wV7b9nUssTusBDR
 UYXtAAHaSb/9nrJ0ELzNICtMYeEoS8iITPhzHLZNocPyZIktWUGZvkw4yQILJZAg0zDN
 ukgmP2eFXDiwed+PFdozL4fHukAm7MRAR5+IsYAr0MOTQp1Hibna6Vhad+aGXDc52GLX
 etoQ==
X-Gm-Message-State: AAQBX9eUXd0bKC2Sb6jzyuVtQcCcEfUUjamLM5uiLMJhbeClGj5v830Q
 pEbbcP5wMMjuSpCIa+ECPpB7ULix/S79PARWlA4Q2MGGaIBrzzPnuGagzLOqob56dtJdyBbdLOu
 V2JvTVHL+IE0BIlg=
X-Received: by 2002:a5e:de4c:0:b0:750:6c44:3454 with SMTP id
 e12-20020a5ede4c000000b007506c443454mr604764ioq.12.1680557795110; 
 Mon, 03 Apr 2023 14:36:35 -0700 (PDT)
X-Google-Smtp-Source: AKy350b5/vWErZS4EimYlkocTjMJol+k5vYj68cztvjr7tHmFwuSkt3zBhr4VgtqV4pHvHVjdJLAVw==
X-Received: by 2002:a5e:de4c:0:b0:750:6c44:3454 with SMTP id
 e12-20020a5ede4c000000b007506c443454mr604754ioq.12.1680557794839; 
 Mon, 03 Apr 2023 14:36:34 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 z2-20020a05663822a200b00408f47b0369sm2941018jas.24.2023.04.03.14.36.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 14:36:34 -0700 (PDT)
Date: Mon, 3 Apr 2023 15:36:33 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@redhat.com>
Cc: Avihai Horon <avihaih@nvidia.com>, qemu-devel@nongnu.org, Keqian Zhu
 <zhukeqian1@huawei.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH] vfio/migration: Skip log_sync during migration SETUP state
Message-ID: <20230403153633.1aeeceec.alex.williamson@redhat.com>
In-Reply-To: <bebd7827-1d72-9572-ea1a-d41d8b856dbe@redhat.com>
References: <20230403130000.6422-1-avihaih@nvidia.com>
 <bebd7827-1d72-9572-ea1a-d41d8b856dbe@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 3 Apr 2023 22:36:42 +0200
C=C3=A9dric Le Goater <clg@redhat.com> wrote:

> On 4/3/23 15:00, Avihai Horon wrote:
> > Currently, VFIO log_sync can be issued while migration is in SETUP
> > state. However, doing this log_sync is at best redundant and at worst
> > can fail.
> >=20
> > Redundant -- all RAM is marked dirty in migration SETUP state and is
> > transferred only after migration is set to ACTIVE state, so doing
> > log_sync during migration SETUP is pointless.
> >=20
> > Can fail -- there is a time window, between setting migration state to
> > SETUP and starting dirty tracking by RAM save_live_setup handler, during
> > which dirty tracking is still not started. Any VFIO log_sync call that
> > is issued during this time window will fail. For example, this error can
> > be triggered by migrating a VM when a GUI is active, which constantly
> > calls log_sync.
> >=20
> > Fix it by skipping VFIO log_sync while migration is in SETUP state.
> >=20
> > Fixes: 758b96b61d5c ("vfio/migrate: Move switch of dirty tracking into =
vfio_memory_listener")
> > Signed-off-by: Avihai Horon <avihaih@nvidia.com> =20
> migration is still experimental, so this can wait 8.1. Correct me if not.

Agreed, this doesn't seem nearly catastrophic enough as an experimental
feature that it can't wait for the 8.1 devel cycle to open.  Thanks,

Alex

> > ---
> >   hw/vfio/common.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> > index 4d01ea3515..78358ede27 100644
> > --- a/hw/vfio/common.c
> > +++ b/hw/vfio/common.c
> > @@ -478,7 +478,8 @@ static bool vfio_devices_all_dirty_tracking(VFIOCon=
tainer *container)
> >       VFIODevice *vbasedev;
> >       MigrationState *ms =3D migrate_get_current();
> >  =20
> > -    if (!migration_is_setup_or_active(ms->state)) {
> > +    if (ms->state !=3D MIGRATION_STATUS_ACTIVE &&
> > +        ms->state !=3D MIGRATION_STATUS_DEVICE) {
> >           return false;
> >       }
> >    =20
>=20


