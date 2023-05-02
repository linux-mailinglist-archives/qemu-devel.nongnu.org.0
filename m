Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D4F6F42C7
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 13:27:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pto9q-0001lK-Ag; Tue, 02 May 2023 07:26:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pto9o-0001lC-Mu
 for qemu-devel@nongnu.org; Tue, 02 May 2023 07:26:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pto9m-0005ps-I5
 for qemu-devel@nongnu.org; Tue, 02 May 2023 07:26:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683026813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jedsS8JKIMupMkZYMv8Ut/nYhvUVvkUu8MiQSqe9o2s=;
 b=Iqk3Zlz3tsCROqYJEKQI/x4xc5U48ZtwuwWjf3/8Hw2IkBt0MNwCYn02UaNYpVj08nBEtl
 mB8qB+k3fofAyJCA91GKGmr5y3InnFpyGYIJfhFsGJ2XjzQTBLBAerURYoSX9VYUqINzE3
 lhpbIqHN8bAxnvimRZZxRaOWHNQRB1E=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-252-lhLg6k7LNs6PXlMbKcrOXw-1; Tue, 02 May 2023 07:26:50 -0400
X-MC-Unique: lhLg6k7LNs6PXlMbKcrOXw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f1757ebb1eso10775615e9.2
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 04:26:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683026809; x=1685618809;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jedsS8JKIMupMkZYMv8Ut/nYhvUVvkUu8MiQSqe9o2s=;
 b=O24QGnoaH3E5WSzMjXYJF7nx+CIhT5eH7bg8vBkjNh7+FP5fELrP/LIzci2/ovKWkg
 3pxE9ZGJJcRK+FuCNzDw/OcfST1YH5zDp8VGXL6YL41GaCmEi0QDiTxHLNysffc727E6
 gjl/sruHR0FsJleNJXr0j0iCHj/Qa6m/Drlcsac5rBYeQUdELvq67JDihGC8agk88Dy4
 TLHKyIkzWUmAH4yjthgWS2JA4pIG3/3nFuFMITcr0X04Rx/svXrHKtbvZ/CrJ71d2k5l
 RWefWAy/QbcOAA4r4/TCkSBIMk4URxOHqyYeKXHlcJ99b65AH5aR3oiALDaqypjt/AKk
 s4kQ==
X-Gm-Message-State: AC+VfDxDtnBVveguN5LvKW3AUkiYkGX60eiaTq9ICf3mcRfsLhBeklfS
 pHdd09oG2BgKJfmViWGS/NOGjXT9jh3HMBRNZjDoU0otNqXVGQFXzrDyj9eNY2slZUfciG/ivcq
 JzQARGlPTsMSxT9c=
X-Received: by 2002:a1c:f20b:0:b0:3f3:1299:5625 with SMTP id
 s11-20020a1cf20b000000b003f312995625mr11866635wmc.30.1683026809021; 
 Tue, 02 May 2023 04:26:49 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5oQUY4ir/b7dyVwHyTXhgNw2impEOlE4WI4QgPe0PGNqWEysNQubXc7pVl54kwZEf63Eqfdw==
X-Received: by 2002:a1c:f20b:0:b0:3f3:1299:5625 with SMTP id
 s11-20020a1cf20b000000b003f312995625mr11866616wmc.30.1683026808719; 
 Tue, 02 May 2023 04:26:48 -0700 (PDT)
Received: from redhat.com ([185.234.71.33]) by smtp.gmail.com with ESMTPSA id
 w9-20020a05600c474900b003f17e37ce60sm38869179wmo.47.2023.05.02.04.26.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 04:26:48 -0700 (PDT)
Date: Tue, 2 May 2023 07:26:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com,
 philmd@linaro.org, david@redhat.com, peterx@redhat.com,
 pbonzini@redhat.com, den-plotnikov@yandex-team.ru,
 lersek@redhat.com, kraxel@redhat.com, dgilbert@redhat.com,
 armbru@redhat.com
Subject: Re: [PATCH v2 3/3] pci: ROM preallocation for incoming migration
Message-ID: <20230502072501-mutt-send-email-mst@kernel.org>
References: <20230425161434.173022-1-vsementsov@yandex-team.ru>
 <20230425161434.173022-4-vsementsov@yandex-team.ru>
 <20230426002135-mutt-send-email-mst@kernel.org>
 <bf295d76-9c33-4eca-4b88-2d1a299c8b94@yandex-team.ru>
 <20230502054519-mutt-send-email-mst@kernel.org>
 <875y9bujol.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875y9bujol.fsf@secure.mitica>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, May 02, 2023 at 12:11:38PM +0200, Juan Quintela wrote:
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> >> > CC pbonzini,dgilbert,quintela,armbru : guys, is poking at runstate_check like
> >> > this the right way to figure out we are not going to use the
> >> > device locally before incoming migration will overwrite ROM contents?
> >> 
> >> RUN_STATE_INMIGRATE is set in the only one place in qemu_init() when
> >> we parse cmdline option -incoming. VM is not running for sure. And
> >> starting the VM comes with changing the state. So it's OK.
> >> 
> >> The possible problem, if we add netcard on target which we didn't
> >> have on source. I now checked, this works.. But that doesn't seem
> >> correct to add device that was not present on source - how would it
> >> work - it's not guaranteed anyway.
> >
> > You can add it on source too while migration is in progress, no?
> 
> DeviceState *qdev_device_add_from_qdict(const QDict *opts,
>                                         bool from_json, Error **errp)
> {
>     ....
>     if (!migration_is_idle()) {
>         error_setg(errp, "device_add not allowed while migrating");
>         return NULL;
>     }
> 
> It should be similar for unplug.
> 
> We only support hotplug for some devices during migration, and we
> shouldn't need any.
> 
> What I think he means is that you can add a device on the command line
> on destination that don't exist on the source machine, and that will
> confuse things.
> 
> In that case, I would say that the problem is that you are doing
> something not supported.  You are expected that when you run migration
> you use the same command line that on source, module whatever
> hot[un]plug operations you have done before migration.
> 
> Anything else is not supported.
> And for instance, if you are using libvirt, it will do the right thing.
> 
> Later, Juan.

OK, so you ack this patch?

-- 
MST


