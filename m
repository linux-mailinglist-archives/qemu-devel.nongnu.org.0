Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFC9629E75
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 17:07:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouyRq-0002KU-9u; Tue, 15 Nov 2022 11:06:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ouyRl-0002Hk-HD
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 11:06:01 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ouyRj-0005Qe-7c
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 11:06:01 -0500
Received: by mail-wr1-x432.google.com with SMTP id cl5so25068063wrb.9
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 08:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6FrAOMTYOu0TkZEfIz9xUZ6R3ix7uaO/Ijo+WidGHtw=;
 b=JsgGYV46WLAUyjOgWIgFUM5oQGj7IKCL/tRjCxu6EqSJk8Bg2kp2Jb7VRv4VWhKOOp
 JX+lJ9U24k3DSlkG1vc0PDtk2v6+oz8NjdF1kwy3nkExUWH1TYIpyDIgYQ08Zz/9L5qI
 QIbMGBGgvR9E4caa0/AgZLhIuwFZp4pi7ExUppHOSN5jSWX/wSIi+FgL8uTjroeD+tAN
 ML+gnXReNXpIdsJFiVfnuktbvgY7Hsd7YJtZgDtp3v2SkfDB0ZQRLi1rvpQJ5jcpdZjU
 SzshmKM2XmSzX7ezU77e92IEPQOQtxl2xMU3sDoHjklGIdHbCCOBbozyqMjHhMSf6WWI
 84wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6FrAOMTYOu0TkZEfIz9xUZ6R3ix7uaO/Ijo+WidGHtw=;
 b=MpQ564hgqrv6mea1A9ZSHQQwA0b99J7GEXs4A5JWAMfpIhfGyUclKs0G7Mcb/ATYGr
 HJra8UjBVO6xWM4vXY9ckQrASLi4kTrGxIjEjmOV+Ys4SfPowR+B8KklYbnZHAuRSPgO
 daublAVqI8vh5L469c9NvxPeqpdQlwFRzitnLTrwkcopY36SgvhiZlK33GKawS91nP6d
 E/zsFR53HyJTVk5lXBD9fBiRwXPjITKd4OPzC5RDVM6uSyMk6uSrW36NgunQctu9/XBI
 ik9xAfnyToZHjEKkT4DGmxMG7BupCG+BVT8w11MXMjs3sM/iN0AcLYjWs0M4vTIFOKTV
 F5Wg==
X-Gm-Message-State: ANoB5pnOay0OTd7nC8cHks4W6emRCSEXBnhcn/j3t1L17+09ItQkWB7q
 4SIh6RJ5gF/Tp25ajD5ZPs2EHQ==
X-Google-Smtp-Source: AA0mqf6XTFYjOR0HNKZOww07+JIYDDtOAjHgPaBe2Wu1QwHSvrk+aC+P2hMaEwv6zGUGznF/i2BgDg==
X-Received: by 2002:adf:ec92:0:b0:236:78d0:5223 with SMTP id
 z18-20020adfec92000000b0023678d05223mr11510961wrn.250.1668528356563; 
 Tue, 15 Nov 2022 08:05:56 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n41-20020a05600c502900b003c65c9a36dfsm16505344wmr.48.2022.11.15.08.05.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 08:05:55 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 564531FFB7;
 Tue, 15 Nov 2022 16:05:55 +0000 (GMT)
References: <20221108092308.1717426-1-alex.bennee@linaro.org>
 <20221108092308.1717426-6-alex.bennee@linaro.org>
 <2277569a-c218-30d1-4d88-9b77d3604513@linux.ibm.com>
 <20221114113518-mutt-send-email-mst@kernel.org>
 <aaae3f2a-c5bb-8e62-09d4-4f6f43efe37b@linux.ibm.com>
 <20221114115549-mutt-send-email-mst@kernel.org>
 <2bd5f801-a203-2598-3e6e-ed8f5dad5159@linux.ibm.com>
 <20221114121959-mutt-send-email-mst@kernel.org>
 <87tu309tlk.fsf@linaro.org>
 <26b4e8d8-784d-d1ce-67a3-b61896701bf7@linux.ibm.com>
User-agent: mu4e 1.9.2; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Raphael Norwitz <raphael.norwitz@nutanix.com>, Kevin
 Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>, Viresh Kumar <viresh.kumar@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, "open list:Block layer core"
 <qemu-block@nongnu.org>, "open list:virtiofs" <virtio-fs@redhat.com>
Subject: Re: [PATCH v1 5/9] hw/virtio: introduce virtio_device_should_start
Date: Tue, 15 Nov 2022 16:05:29 +0000
In-reply-to: <26b4e8d8-784d-d1ce-67a3-b61896701bf7@linux.ibm.com>
Message-ID: <87leoc9p98.fsf@linaro.org>
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


Christian Borntraeger <borntraeger@linux.ibm.com> writes:

> Am 15.11.22 um 15:31 schrieb Alex Benn=C3=A9e:
>> "Michael S. Tsirkin" <mst@redhat.com> writes:
>>=20
>>> On Mon, Nov 14, 2022 at 06:15:30PM +0100, Christian Borntraeger wrote:
>>>>
>>>>
>>>> Am 14.11.22 um 18:10 schrieb Michael S. Tsirkin:
>>>>> On Mon, Nov 14, 2022 at 05:55:09PM +0100, Christian Borntraeger wrote:
>>>>>>
>>>>>>
>>>>>> Am 14.11.22 um 17:37 schrieb Michael S. Tsirkin:
>>>>>>> On Mon, Nov 14, 2022 at 05:18:53PM +0100, Christian Borntraeger wro=
te:
>>>>>>>> Am 08.11.22 um 10:23 schrieb Alex Benn=C3=A9e:
>>>>>>>>> The previous fix to virtio_device_started revealed a problem in i=
ts
>>>>>>>>> use by both the core and the device code. The core code should be=
 able
>>>>>>>>> to handle the device "starting" while the VM isn't running to han=
dle
>>>>>>>>> the restoration of migration state. To solve this dual use introd=
uce a
>>>>>>>>> new helper for use by the vhost-user backends who all use it to f=
eed a
>>>>>>>>> should_start variable.
>>>>>>>>>
>>>>>>>>> We can also pick up a change vhost_user_blk_set_status while we a=
re at
>>>>>>>>> it which follows the same pattern.
>>>>>>>>>
>>>>>>>>> Fixes: 9f6bcfd99f (hw/virtio: move vm_running check to virtio_dev=
ice_started)
>>>>>>>>> Fixes: 27ba7b027f (hw/virtio: add boilerplate for vhost-user-gpio=
 device)
>>>>>>>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>>>>>>>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>>>>>>>>
>>>>>>>> Hmmm, is this
>>>>>>>> commit 259d69c00b67c02a67f3bdbeeea71c2c0af76c35
>>>>>>>> Author:     Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>>>>>>> AuthorDate: Mon Nov 7 12:14:07 2022 +0000
>>>>>>>> Commit:     Michael S. Tsirkin <mst@redhat.com>
>>>>>>>> CommitDate: Mon Nov 7 14:08:18 2022 -0500
>>>>>>>>
>>>>>>>>        hw/virtio: introduce virtio_device_should_start
>>>>>>>>
>>>>>>>> and older version?
>>>>>>>
>>>>>>> This is what got merged:
>>>>>>> https://lore.kernel.org/r/20221107121407.1010913-1-alex.bennee%40li=
naro.org
>>>>>>> This patch was sent after I merged the RFC.
>>>>>>> I think the only difference is the commit log but I might be missing
>>>>>>> something.
>>>>>>>
>>>>>>>> This does not seem to fix the regression that I have reported.
>>>>>>>
>>>>>>> This was applied on top of 9f6bcfd99f which IIUC does, right?
>>>>>>>
>>>>>>>
>>>>>>
>>>>>> QEMU master still fails for me for suspend/resume to disk:
>>>>>>
>>>>>> #0  0x000003ff8e3980a6 in __pthread_kill_implementation () at /lib64=
/libc.so.6
>>>>>> #1  0x000003ff8e348580 in raise () at /lib64/libc.so.6
>>>>>> #2  0x000003ff8e32b5c0 in abort () at /lib64/libc.so.6
>>>>>> #3  0x000003ff8e3409da in __assert_fail_base () at /lib64/libc.so.6
>>>>>> #4  0x000003ff8e340a4e in  () at /lib64/libc.so.6
>>>>>> #5 0x000002aa1ffa8966 in vhost_vsock_common_pre_save
>>>>>> (opaque=3D<optimized out>) at
>>>>>> ../hw/virtio/vhost-vsock-common.c:203
>>>>>> #6  0x000002aa1fe5e0ee in vmstate_save_state_v
>>>>>>       (f=3Df@entry=3D0x2aa21bdc170, vmsd=3D0x2aa204ac5f0
>>>>>> <vmstate_virtio_vhost_vsock>, opaque=3D0x2aa21bac9f8,
>>>>>> vmdesc=3Dvmdesc@entry=3D0x3fddc08eb30,
>>>>>> version_id=3Dversion_id@entry=3D0) at ../migration/vmstate.c:329
>>>>>> #7 0x000002aa1fe5ebf8 in vmstate_save_state
>>>>>> (f=3Df@entry=3D0x2aa21bdc170, vmsd=3D<optimized out>,
>>>>>> opaque=3D<optimized out>, vmdesc_id=3Dvmdesc_id@entry=3D0x3fddc08eb3=
0)
>>>>>> at ../migration/vmstate.c:317
>>>>>> #8 0x000002aa1fe75bd0 in vmstate_save (f=3Df@entry=3D0x2aa21bdc170,
>>>>>> se=3Dse@entry=3D0x2aa21bdbe90, vmdesc=3Dvmdesc@entry=3D0x3fddc08eb30=
) at
>>>>>> ../migration/savevm.c:908
>>>>>> #9 0x000002aa1fe79584 in
>>>>>> qemu_savevm_state_complete_precopy_non_iterable
>>>>>> (f=3Df@entry=3D0x2aa21bdc170, in_postcopy=3Din_postcopy@entry=3Dfals=
e,
>>>>>> inactivate_disks=3Dinactivate_disks@entry=3Dtrue)
>>>>>>       at ../migration/savevm.c:1393
>>>>>> #10 0x000002aa1fe79a96 in qemu_savevm_state_complete_precopy
>>>>>> (f=3D0x2aa21bdc170, iterable_only=3Diterable_only@entry=3Dfalse,
>>>>>> inactivate_disks=3Dinactivate_disks@entry=3Dtrue) at
>>>>>> ../migration/savevm.c:1459
>>>>>> #11 0x000002aa1fe6d6ee in migration_completion (s=3D0x2aa218ef600) a=
t ../migration/migration.c:3314
>>>>>> #12 migration_iteration_run (s=3D0x2aa218ef600) at ../migration/migr=
ation.c:3761
>>>>>> #13 migration_thread (opaque=3Dopaque@entry=3D0x2aa218ef600) at ../m=
igration/migration.c:3989
>>>>>> #14 0x000002aa201f0b8c in qemu_thread_start (args=3D<optimized out>)=
 at ../util/qemu-thread-posix.c:505
>>>>>> #15 0x000003ff8e396248 in start_thread () at /lib64/libc.so.6
>>>>>> #16 0x000003ff8e41183e in thread_start () at /lib64/libc.so.6
>>>>>>
>>>>>> Michael, your previous branch did work if I recall correctly.
>>>>>
>>>>> That one was failing under github CI though (for reasons we didn't
>>>>> really address, such as disconnect during stop causing a recursive
>>>>> call to stop, but there you are).
>>>> Even the double revert of everything?
>>>
>>> I don't remember at this point.
>>>
>>>> So how do we proceed now?
>>>
>>> I'm hopeful Alex will come up with a fix.
>> I need to replicate the failing test for that. Which test is
>> failing?
>
>
> Pretty much the same as before. guest with vsock, managedsave and
> restore.

If this isn't in our test suite I'm going to need exact steps.

--=20
Alex Benn=C3=A9e

