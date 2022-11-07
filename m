Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CD561EED8
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 10:25:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oryM6-0005j0-53; Mon, 07 Nov 2022 04:23:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oryM3-0005gr-MF
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 04:23:43 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oryM1-0006JQ-Pa
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 04:23:43 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 l39-20020a05600c1d2700b003cf93c8156dso5216259wms.4
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 01:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3NaZXVDDvdh3ZdQweFbOyq0/SjShhLBn3jHvrWFLDRs=;
 b=yZokTe0lNTAKtpC73da0g5wQay1YkwvsEhj+TPd0g8Xa6gsX4nvpoUkBjLS54v5/cF
 YZRQcMtZKa1dzyKtbf8Ty4lqlFWPIvBdJRO3SUhvY12tRVqmKbk1Lk/ac62PSAgysZdv
 w8gpWZTtZfKvJv48u4U1kq/XhSz8Yc7GMOjPeDwdJV+JeUtBDlJgfQJ6snN4d9aN4yhF
 8EdRwehd1+CZ8qZAkqOBimVq4utPGK+rvOJR4vZRIiEh9qNDn4tRJhyooTIqS7VB3hqh
 ZRk2MzMQPLM0sdNlh4Y/dTe1cATyXtwkbkmLGlswjq46nGqhztxcBTtIP4hkuv5X51ay
 Viyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3NaZXVDDvdh3ZdQweFbOyq0/SjShhLBn3jHvrWFLDRs=;
 b=4ESfaZn8AzGPZLVIdiZv3vglTaEn5YineHRtH24ONbFR8HcGS9A2ROv7dngDuiRSt8
 SsTRIg9VAIhYjAXefY91sS9CxXj6UDNIJMKZrHC69gGgB0oasSYftTkKJBzd+CZWyFKz
 k/LHpw0Koeu6cOxYLpl4Kjgf2bPa4m41ajrymbAU+QzRgZVdwIA283bAA9F81cIJiDVY
 9LKNKx26CKMhPJOEMY1Cp/v5t1REoGTvlVYWCRv/4WhRqHK71Kv56rJUXwP4D4S8wA4J
 BrXb129t4Zb929JZOkugWFe7mentGLTtbMzA5OUE/PHb7iSvtxNuKp6V7pfx0+4fSrev
 x6Jg==
X-Gm-Message-State: ACrzQf0WudKKYAziaddzmgeO/58kQhSR8UE97+MPmMg97hiSmhvPTujp
 ENN6r8TgLq20YSqnQDVjpOcy6A==
X-Google-Smtp-Source: AMsMyM7rU16KXVrYT7/nz33ygob1uaklKBHlHTUTWsFiv8fsNVO6P2fbOdXG2ZM9WCe847hiy7wTbA==
X-Received: by 2002:a05:600c:3781:b0:3a6:804a:afc with SMTP id
 o1-20020a05600c378100b003a6804a0afcmr42071846wmr.27.1667813019043; 
 Mon, 07 Nov 2022 01:23:39 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 p15-20020adfce0f000000b0022cbf4cda62sm8107394wrn.27.2022.11.07.01.23.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 01:23:38 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6B5B71FFB7;
 Mon,  7 Nov 2022 09:23:37 +0000 (GMT)
References: <20221010172813.204597-1-mst@redhat.com>
 <20221010172813.204597-8-mst@redhat.com>
 <20221105093645-mutt-send-email-mst@kernel.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 virtio-fs@redhat.com, Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PULL 07/55] hw/virtio: move vm_running check to
 virtio_device_started
Date: Mon, 07 Nov 2022 09:21:49 +0000
In-reply-to: <20221105093645-mutt-send-email-mst@kernel.org>
Message-ID: <87y1snglt2.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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


"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Mon, Oct 10, 2022 at 01:29:10PM -0400, Michael S. Tsirkin wrote:
>> From: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>=20
>> All the boilerplate virtio code does the same thing (or should at
>> least) of checking to see if the VM is running before attempting to
>> start VirtIO. Push the logic up to the common function to avoid
>> getting a copy and paste wrong.
>>=20
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> Message-Id: <20220802095010.3330793-11-alex.bennee@linaro.org>
>> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>
> So, looking at the resulting code, I missed the fact that this function
> is also used in virtio core.  So this patch does not do what it's saying
> it does (just refactor code).
> Instead it completely changes the meaning for virtio core.
> I thunk we should revert upstream, however, gpio has grown a
> dependency on this since then.
> Alex, could you take a look please?

So I guess we have three choices:

  new function for use by backends
  new function for use by core
  parameterise virtio_device_started to ignore vm state

I'll add some usage doc comments whichever way.

Do you have a preference?

>
>> ---
>>  include/hw/virtio/virtio.h   | 5 +++++
>>  hw/virtio/vhost-user-fs.c    | 6 +-----
>>  hw/virtio/vhost-user-i2c.c   | 6 +-----
>>  hw/virtio/vhost-user-rng.c   | 6 +-----
>>  hw/virtio/vhost-user-vsock.c | 6 +-----
>>  hw/virtio/vhost-vsock.c      | 6 +-----
>>  6 files changed, 10 insertions(+), 25 deletions(-)
>>=20
>> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
>> index 9bb2485415..74e7ad5a92 100644
>> --- a/include/hw/virtio/virtio.h
>> +++ b/include/hw/virtio/virtio.h
>> @@ -100,6 +100,7 @@ struct VirtIODevice
>>      VirtQueue *vq;
>>      MemoryListener listener;
>>      uint16_t device_id;
>> +    /* @vm_running: current VM running state via virtio_vmstate_change(=
) */
>>      bool vm_running;
>>      bool broken; /* device in invalid state, needs reset */
>>      bool use_disabled_flag; /* allow use of 'disable' flag when needed =
*/
>> @@ -376,6 +377,10 @@ static inline bool virtio_device_started(VirtIODevi=
ce *vdev, uint8_t status)
>>          return vdev->started;
>>      }
>>=20=20
>> +    if (!vdev->vm_running) {
>> +        return false;
>> +    }
>> +
>>      return status & VIRTIO_CONFIG_S_DRIVER_OK;
>>  }
>>=20=20
>> diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
>> index e513e4fdda..d2bebba785 100644
>> --- a/hw/virtio/vhost-user-fs.c
>> +++ b/hw/virtio/vhost-user-fs.c
>> @@ -122,11 +122,7 @@ static void vuf_stop(VirtIODevice *vdev)
>>  static void vuf_set_status(VirtIODevice *vdev, uint8_t status)
>>  {
>>      VHostUserFS *fs =3D VHOST_USER_FS(vdev);
>> -    bool should_start =3D status & VIRTIO_CONFIG_S_DRIVER_OK;
>> -
>> -    if (!vdev->vm_running) {
>> -        should_start =3D false;
>> -    }
>> +    bool should_start =3D virtio_device_started(vdev, status);
>>=20=20
>>      if (fs->vhost_dev.started =3D=3D should_start) {
>>          return;
>> diff --git a/hw/virtio/vhost-user-i2c.c b/hw/virtio/vhost-user-i2c.c
>> index 6020eee093..b930cf6d5e 100644
>> --- a/hw/virtio/vhost-user-i2c.c
>> +++ b/hw/virtio/vhost-user-i2c.c
>> @@ -93,11 +93,7 @@ static void vu_i2c_stop(VirtIODevice *vdev)
>>  static void vu_i2c_set_status(VirtIODevice *vdev, uint8_t status)
>>  {
>>      VHostUserI2C *i2c =3D VHOST_USER_I2C(vdev);
>> -    bool should_start =3D status & VIRTIO_CONFIG_S_DRIVER_OK;
>> -
>> -    if (!vdev->vm_running) {
>> -        should_start =3D false;
>> -    }
>> +    bool should_start =3D virtio_device_started(vdev, status);
>>=20=20
>>      if (i2c->vhost_dev.started =3D=3D should_start) {
>>          return;
>> diff --git a/hw/virtio/vhost-user-rng.c b/hw/virtio/vhost-user-rng.c
>> index 3a7bf8e32d..a9c1c4bc79 100644
>> --- a/hw/virtio/vhost-user-rng.c
>> +++ b/hw/virtio/vhost-user-rng.c
>> @@ -90,11 +90,7 @@ static void vu_rng_stop(VirtIODevice *vdev)
>>  static void vu_rng_set_status(VirtIODevice *vdev, uint8_t status)
>>  {
>>      VHostUserRNG *rng =3D VHOST_USER_RNG(vdev);
>> -    bool should_start =3D status & VIRTIO_CONFIG_S_DRIVER_OK;
>> -
>> -    if (!vdev->vm_running) {
>> -        should_start =3D false;
>> -    }
>> +    bool should_start =3D virtio_device_started(vdev, status);
>>=20=20
>>      if (rng->vhost_dev.started =3D=3D should_start) {
>>          return;
>> diff --git a/hw/virtio/vhost-user-vsock.c b/hw/virtio/vhost-user-vsock.c
>> index 0f8ff99f85..22c1616ebd 100644
>> --- a/hw/virtio/vhost-user-vsock.c
>> +++ b/hw/virtio/vhost-user-vsock.c
>> @@ -55,11 +55,7 @@ const VhostDevConfigOps vsock_ops =3D {
>>  static void vuv_set_status(VirtIODevice *vdev, uint8_t status)
>>  {
>>      VHostVSockCommon *vvc =3D VHOST_VSOCK_COMMON(vdev);
>> -    bool should_start =3D status & VIRTIO_CONFIG_S_DRIVER_OK;
>> -
>> -    if (!vdev->vm_running) {
>> -        should_start =3D false;
>> -    }
>> +    bool should_start =3D virtio_device_started(vdev, status);
>>=20=20
>>      if (vvc->vhost_dev.started =3D=3D should_start) {
>>          return;
>> diff --git a/hw/virtio/vhost-vsock.c b/hw/virtio/vhost-vsock.c
>> index 0338de892f..8031c164a5 100644
>> --- a/hw/virtio/vhost-vsock.c
>> +++ b/hw/virtio/vhost-vsock.c
>> @@ -70,13 +70,9 @@ static int vhost_vsock_set_running(VirtIODevice *vdev=
, int start)
>>  static void vhost_vsock_set_status(VirtIODevice *vdev, uint8_t status)
>>  {
>>      VHostVSockCommon *vvc =3D VHOST_VSOCK_COMMON(vdev);
>> -    bool should_start =3D status & VIRTIO_CONFIG_S_DRIVER_OK;
>> +    bool should_start =3D virtio_device_started(vdev, status);
>>      int ret;
>>=20=20
>> -    if (!vdev->vm_running) {
>> -        should_start =3D false;
>> -    }
>> -
>>      if (vvc->vhost_dev.started =3D=3D should_start) {
>>          return;
>>      }
>> --=20
>> MST
>>=20


--=20
Alex Benn=C3=A9e

