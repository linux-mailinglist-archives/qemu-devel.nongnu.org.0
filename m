Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3561A629C29
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 15:33:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouwz3-000308-2t; Tue, 15 Nov 2022 09:32:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ouwz0-0002wy-5I
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 09:32:14 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ouwyw-00069G-ST
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 09:32:13 -0500
Received: by mail-wr1-x432.google.com with SMTP id v1so24553378wrt.11
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 06:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PgVwtIZ7pkX7b6jkS79qHqnp5KPqyhBZAcmOhgJgt6E=;
 b=jnS/W0gxyD/ph1tMAGSKBaAnRGm2BxHsM+Zg8oq6WZ2+kPlq/ERulwcFyS5on/gEJM
 vpAyOodBGBtlsoxl80i5CvDRHIbEKPWDgSE62Pdn7+lsBFbZEKEQBHXr6pBZcFiN/TkN
 S8YbkX+3f2ME8UAt+79iRaQcXV+QKc1RbMPiPhsFstBIvhTR+bYD4NOklxPdb+owu9ov
 rZwX41YtIGuFp0KRSkvHe6yEEL1A1X6wH3wMOuEW9CR+C4Ec2SoAS9tUfvyCk6DmUAtp
 Fd9P2MaGF0qnLaZRsWfr4FnXplBXT/wlmSWGslQB1gZXgcKohGv3AF0qn+BYwN749Ett
 mnPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=PgVwtIZ7pkX7b6jkS79qHqnp5KPqyhBZAcmOhgJgt6E=;
 b=IMcGHViDwEv5OfzwRiwu5AplfYVGlhRseauBB2JQ+MUld4T3xKxVpUJfXkBSMCx81y
 zvCB/olUgM1xoD3ICfhFmcLOSHCYs5FdUyZmDUx1tWN/ORt9W45Swu6DAc3vFIAhatmW
 4SsWGGuHZE+8NR7DKHxh4mifvx5cYt5fk4AP2gW0Rv2rkzFgJWUmbBL4eWQzNRlmjSQI
 F3udSDsQbEmlrje22xWnXK91ftSoKEFgqG6wLVwJmsQarIz0WQi9SRaTuudp5lBKPNzd
 7SrnDQUrzzczKB0Z66gui3DcMbDugUJEvpAXw6PCjrgvT6pUPyCOBPrdVLrjNZN+6Okd
 1AVQ==
X-Gm-Message-State: ANoB5plUEioK31hduL+eLfPzB38EsMq0lFcs2TfLYvJW66W2gCnvV+Gz
 2xAzZjdDIUsoMryRVjrS5O0/vg==
X-Google-Smtp-Source: AA0mqf7yg6ObZCuA5H2ig5oeAbW5z1Co2mrj5wEOjKqrcdc/jDdiZRqnFREWK8P3O6NpJ6GLFGg/Tw==
X-Received: by 2002:adf:f7d1:0:b0:236:8ef4:6ee2 with SMTP id
 a17-20020adff7d1000000b002368ef46ee2mr10532437wrq.683.1668522729049; 
 Tue, 15 Nov 2022 06:32:09 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bh9-20020a05600005c900b0022e36c1113fsm12868241wrb.13.2022.11.15.06.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 06:32:08 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C4EF01FFB7;
 Tue, 15 Nov 2022 14:32:07 +0000 (GMT)
References: <20221108092308.1717426-1-alex.bennee@linaro.org>
 <20221108092308.1717426-6-alex.bennee@linaro.org>
 <2277569a-c218-30d1-4d88-9b77d3604513@linux.ibm.com>
 <20221114113518-mutt-send-email-mst@kernel.org>
 <aaae3f2a-c5bb-8e62-09d4-4f6f43efe37b@linux.ibm.com>
 <20221114115549-mutt-send-email-mst@kernel.org>
 <2bd5f801-a203-2598-3e6e-ed8f5dad5159@linux.ibm.com>
 <20221114121959-mutt-send-email-mst@kernel.org>
User-agent: mu4e 1.9.2; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>,
 qemu-devel@nongnu.org, fam@euphon.net, berrange@redhat.com,
 f4bug@amsat.org, aurelien@aurel32.net, pbonzini@redhat.com,
 stefanha@redhat.com, crosa@redhat.com, Raphael Norwitz
 <raphael.norwitz@nutanix.com>, Kevin Wolf <kwolf@redhat.com>, Hanna Reitz
 <hreitz@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, "open list:Block layer core"
 <qemu-block@nongnu.org>, "open list:virtiofs" <virtio-fs@redhat.com>
Subject: Re: [PATCH v1 5/9] hw/virtio: introduce virtio_device_should_start
Date: Tue, 15 Nov 2022 14:31:51 +0000
In-reply-to: <20221114121959-mutt-send-email-mst@kernel.org>
Message-ID: <87tu309tlk.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Mon, Nov 14, 2022 at 06:15:30PM +0100, Christian Borntraeger wrote:
>>=20
>>=20
>> Am 14.11.22 um 18:10 schrieb Michael S. Tsirkin:
>> > On Mon, Nov 14, 2022 at 05:55:09PM +0100, Christian Borntraeger wrote:
>> > >=20
>> > >=20
>> > > Am 14.11.22 um 17:37 schrieb Michael S. Tsirkin:
>> > > > On Mon, Nov 14, 2022 at 05:18:53PM +0100, Christian Borntraeger wr=
ote:
>> > > > > Am 08.11.22 um 10:23 schrieb Alex Benn=C3=A9e:
>> > > > > > The previous fix to virtio_device_started revealed a problem i=
n its
>> > > > > > use by both the core and the device code. The core code should=
 be able
>> > > > > > to handle the device "starting" while the VM isn't running to =
handle
>> > > > > > the restoration of migration state. To solve this dual use int=
roduce a
>> > > > > > new helper for use by the vhost-user backends who all use it t=
o feed a
>> > > > > > should_start variable.
>> > > > > >=20
>> > > > > > We can also pick up a change vhost_user_blk_set_status while w=
e are at
>> > > > > > it which follows the same pattern.
>> > > > > >=20
>> > > > > > Fixes: 9f6bcfd99f (hw/virtio: move vm_running check to virtio_=
device_started)
>> > > > > > Fixes: 27ba7b027f (hw/virtio: add boilerplate for vhost-user-g=
pio device)
>> > > > > > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> > > > > > Cc: "Michael S. Tsirkin" <mst@redhat.com>
>> > > > >=20
>> > > > > Hmmm, is this
>> > > > > commit 259d69c00b67c02a67f3bdbeeea71c2c0af76c35
>> > > > > Author:     Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> > > > > AuthorDate: Mon Nov 7 12:14:07 2022 +0000
>> > > > > Commit:     Michael S. Tsirkin <mst@redhat.com>
>> > > > > CommitDate: Mon Nov 7 14:08:18 2022 -0500
>> > > > >=20
>> > > > >       hw/virtio: introduce virtio_device_should_start
>> > > > >=20
>> > > > > and older version?
>> > > >=20
>> > > > This is what got merged:
>> > > > https://lore.kernel.org/r/20221107121407.1010913-1-alex.bennee%40l=
inaro.org
>> > > > This patch was sent after I merged the RFC.
>> > > > I think the only difference is the commit log but I might be missi=
ng
>> > > > something.
>> > > >=20
>> > > > > This does not seem to fix the regression that I have reported.
>> > > >=20
>> > > > This was applied on top of 9f6bcfd99f which IIUC does, right?
>> > > >=20
>> > > >=20
>> > >=20
>> > > QEMU master still fails for me for suspend/resume to disk:
>> > >=20
>> > > #0  0x000003ff8e3980a6 in __pthread_kill_implementation () at /lib64=
/libc.so.6
>> > > #1  0x000003ff8e348580 in raise () at /lib64/libc.so.6
>> > > #2  0x000003ff8e32b5c0 in abort () at /lib64/libc.so.6
>> > > #3  0x000003ff8e3409da in __assert_fail_base () at /lib64/libc.so.6
>> > > #4  0x000003ff8e340a4e in  () at /lib64/libc.so.6
>> > > #5 0x000002aa1ffa8966 in vhost_vsock_common_pre_save
>> > > (opaque=3D<optimized out>) at
>> > > ../hw/virtio/vhost-vsock-common.c:203
>> > > #6  0x000002aa1fe5e0ee in vmstate_save_state_v
>> > >      (f=3Df@entry=3D0x2aa21bdc170, vmsd=3D0x2aa204ac5f0
>> > > <vmstate_virtio_vhost_vsock>, opaque=3D0x2aa21bac9f8,
>> > > vmdesc=3Dvmdesc@entry=3D0x3fddc08eb30,
>> > > version_id=3Dversion_id@entry=3D0) at ../migration/vmstate.c:329
>> > > #7 0x000002aa1fe5ebf8 in vmstate_save_state
>> > > (f=3Df@entry=3D0x2aa21bdc170, vmsd=3D<optimized out>,
>> > > opaque=3D<optimized out>, vmdesc_id=3Dvmdesc_id@entry=3D0x3fddc08eb3=
0)
>> > > at ../migration/vmstate.c:317
>> > > #8 0x000002aa1fe75bd0 in vmstate_save (f=3Df@entry=3D0x2aa21bdc170,
>> > > se=3Dse@entry=3D0x2aa21bdbe90, vmdesc=3Dvmdesc@entry=3D0x3fddc08eb30=
) at
>> > > ../migration/savevm.c:908
>> > > #9 0x000002aa1fe79584 in
>> > > qemu_savevm_state_complete_precopy_non_iterable
>> > > (f=3Df@entry=3D0x2aa21bdc170, in_postcopy=3Din_postcopy@entry=3Dfals=
e,
>> > > inactivate_disks=3Dinactivate_disks@entry=3Dtrue)
>> > >      at ../migration/savevm.c:1393
>> > > #10 0x000002aa1fe79a96 in qemu_savevm_state_complete_precopy
>> > > (f=3D0x2aa21bdc170, iterable_only=3Diterable_only@entry=3Dfalse,
>> > > inactivate_disks=3Dinactivate_disks@entry=3Dtrue) at
>> > > ../migration/savevm.c:1459
>> > > #11 0x000002aa1fe6d6ee in migration_completion (s=3D0x2aa218ef600) a=
t ../migration/migration.c:3314
>> > > #12 migration_iteration_run (s=3D0x2aa218ef600) at ../migration/migr=
ation.c:3761
>> > > #13 migration_thread (opaque=3Dopaque@entry=3D0x2aa218ef600) at ../m=
igration/migration.c:3989
>> > > #14 0x000002aa201f0b8c in qemu_thread_start (args=3D<optimized out>)=
 at ../util/qemu-thread-posix.c:505
>> > > #15 0x000003ff8e396248 in start_thread () at /lib64/libc.so.6
>> > > #16 0x000003ff8e41183e in thread_start () at /lib64/libc.so.6
>> > >=20
>> > > Michael, your previous branch did work if I recall correctly.
>> >=20
>> > That one was failing under github CI though (for reasons we didn't
>> > really address, such as disconnect during stop causing a recursive
>> > call to stop, but there you are).
>> Even the double revert of everything?
>
> I don't remember at this point.
>
>> So how do we proceed now?
>
> I'm hopeful Alex will come up with a fix.

I need to replicate the failing test for that. Which test is failing?

--=20
Alex Benn=C3=A9e

