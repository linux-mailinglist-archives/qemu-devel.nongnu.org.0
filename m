Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CF46188AE
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 20:21:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqfka-0003jD-BA; Thu, 03 Nov 2022 15:19:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oqfkY-0003ho-Pu
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 15:19:38 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oqfkW-0004RG-Ua
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 15:19:38 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 a11-20020a05600c2d4b00b003cf6f5fd9f1so1859364wmg.2
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 12:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2Cfn9bH7b27+UeGs7PnYSrN7hcG7yRWRpV2ezOZwKxk=;
 b=cgJruDjXPzsqjv/TJ0gzC3FI3Fm4bo8VSViEZEueKGkY6fmM3SYkUY58hfyts9kwfE
 n7CkHNU21WqajQrrU9hZXiHCyrcpCGquYd1s3722rozeW/qSMplg3fwXq4J8Q9vijB1Z
 LJmkyfVuHe5UBIckZ2ytiSzAmn4C4UJUhYvXqlI+jkl5ezYYMA30HY8q3H+hqR4PDYhx
 ieKJOBs/GqJFc0XaqOUV7aJgKQ8aR/1Zukc6WAcKMPtON5sO17EA6Kx4TuXrpMWP4Y8o
 R+GfbICpTOnHFTiQmbtSzyiJm1sFz0scBOtBxgBuGVacml7Qo84c4WqnqCVtT1FpghTt
 Ibww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=2Cfn9bH7b27+UeGs7PnYSrN7hcG7yRWRpV2ezOZwKxk=;
 b=lHwAjEQZbAED6tm7q+BkO9LNJ2W6UsvrNdRspeMbdPZsxd3VTK38ZBPjWSS5vqiybY
 Yy9hkRm7l2nQCYj+VkVoSxYTWxn7Xx7ST2wTVykSVpwAkp0ykZPoX3Ibmq0HRSEGddVz
 9B6iDJaImGQBhcu+bxrGxeceLsngsr651CJ0mnm3ckzUUS7T1CnvWyxofSO/5I33Ve6T
 aNQB5TiODQJRxw2GpjwulJCGtRapO3eQmS8qVobZKzBjUW41aGqvuqlhiKBmtvqPtDd4
 FaPy3qz3WxhIB9nu8NMLWabjSjcQ0GKAgDynYoywC5gPIBl234F0cYV5UZV7MCybz/4v
 WtNA==
X-Gm-Message-State: ACrzQf2A928+hVGcszs/xyV/+BBIvvtGrLTVHPRaO4a3MgT23yX3eyNO
 dbgYht9u170vwFtF0DIG4RzoQQ==
X-Google-Smtp-Source: AMsMyM5H3ynuRM5EKw56JE038pvL8ENXZr5uiYvOYJ9gb5N5UbdtQZws3O26NUEKkN5ZQJPu0BNScA==
X-Received: by 2002:a1c:2743:0:b0:3b3:4066:fa61 with SMTP id
 n64-20020a1c2743000000b003b34066fa61mr31436247wmn.79.1667503174687; 
 Thu, 03 Nov 2022 12:19:34 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n21-20020a05600c3b9500b003b4c979e6bcsm871113wms.10.2022.11.03.12.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 12:19:33 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 73A691FFB7;
 Thu,  3 Nov 2022 19:19:33 +0000 (GMT)
References: <20220802095010.3330793-1-alex.bennee@linaro.org>
 <20220802095010.3330793-11-alex.bennee@linaro.org>
 <20221103123856-mutt-send-email-mst@kernel.org>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, slp@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, "open list:virtiofs"
 <virtio-fs@redhat.com>
Subject: Re: [PATCH  v4 10/22] hw/virtio: move vm_running check to
 virtio_device_started
Date: Thu, 03 Nov 2022 19:18:30 +0000
In-reply-to: <20221103123856-mutt-send-email-mst@kernel.org>
Message-ID: <87o7tnkfqy.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Tue, Aug 02, 2022 at 10:49:58AM +0100, Alex Benn=C3=A9e wrote:
>> All the boilerplate virtio code does the same thing (or should at
>> least) of checking to see if the VM is running before attempting to
>> start VirtIO. Push the logic up to the common function to avoid
>> getting a copy and paste wrong.
>>=20
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> How bad is it if we drop this?


I assume it will break gpio. Why do we want to drop this now? It has
been merged awhile. However there was a follow-up patch which tweaked
the order of checks in virtio_device_started.

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
>> 2.30.2


--=20
Alex Benn=C3=A9e

