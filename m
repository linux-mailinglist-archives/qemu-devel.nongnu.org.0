Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CED09619C73
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 17:03:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqz92-0002l5-1Z; Fri, 04 Nov 2022 12:02:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqz3n-0000AY-KQ
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 11:56:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqz3l-0006Fo-GY
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 11:56:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667577404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TT0x4MD6+BjxkXjny8rtXP7dqbgpjSI8b9fDascw9Xs=;
 b=X4nTB9GW5ypgwbWN6v++KeD75kYQNJXIrRZbrDqdwckOiP1FMuLi0PWvvdDGPm3fzmCZ8D
 UKqSzQ/fPbY1qo4so/GzaFy69TOc/mSxKUYyeYKRWlZJsvN6kAzINg44SV4n3YnEF0oWPY
 NL+/9/d5cOoxbb0wRGLSdzdJYAPVLRA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-326-RZ4fXBMfMduYwZLoc_cPRw-1; Fri, 04 Nov 2022 11:56:40 -0400
X-MC-Unique: RZ4fXBMfMduYwZLoc_cPRw-1
Received: by mail-wm1-f72.google.com with SMTP id
 v191-20020a1cacc8000000b003bdf7b78dccso2512211wme.3
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 08:56:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TT0x4MD6+BjxkXjny8rtXP7dqbgpjSI8b9fDascw9Xs=;
 b=Z8uItalc7i5lp9apJhJ1A25HWjXnny48Kr3Ub+0KX62lkJ9K5afYpNa5THS5HQylL5
 tpES0PJRFRBT76Fxyme5tm/lI/YL6GLhqW2lybHblfWmEtOaENtIwTChco2EzuyvhJ4A
 PqenvwRLMfGyl/6S17GRSo78uPMfg8TXG37d9hGMtpZ90Xy5nbVW0/MSkPMT87kNZ5FY
 n8GwvQugDap1FGx/L9k4JnjLpr3f5e/wRJ2VoV+v7oTPJnfk8DOhdHBWZZfO4suAUzcy
 Jf0m0anIjQXo2RudxCc6yReIDIrfudmGVcZfio0+wdhd+mhWiY0rKh7o/eF5qGdKx7uI
 qqMQ==
X-Gm-Message-State: ACrzQf0zJAfG1lPqKZ26VP31q8Nb+0uWXkMSV3OpMgGH7eA3/E9OhnLW
 UadsoFAlm7JY9TLuNNbnal2F4xCbQV5PujQVUXFg4v3oUl+mfhLTPSwgGuacwU10HEPFdIz9jJc
 Q6Cgy3sTLX3L38Nc=
X-Received: by 2002:a05:600c:2194:b0:3cf:758f:160e with SMTP id
 e20-20020a05600c219400b003cf758f160emr17565631wme.175.1667577399107; 
 Fri, 04 Nov 2022 08:56:39 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM58Vv6aOJPnBs3H0UwTg+eJACNb1YmuAKfCtWfWgEVNne4nOpRdSYRxhjnCg2Ik4Y46gEfLkA==
X-Received: by 2002:a05:600c:2194:b0:3cf:758f:160e with SMTP id
 e20-20020a05600c219400b003cf758f160emr17565619wme.175.1667577398796; 
 Fri, 04 Nov 2022 08:56:38 -0700 (PDT)
Received: from redhat.com ([2.55.180.182]) by smtp.gmail.com with ESMTPSA id
 z21-20020a05600c079500b003b3365b38f9sm3085534wmo.10.2022.11.04.08.56.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 08:56:38 -0700 (PDT)
Date: Fri, 4 Nov 2022 11:56:35 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org,
	Christian Borntraeger <borntraeger@linux.ibm.com>
Subject: Re: [RFC PATCH] virtio: re-order vm_running and use_started checks
Message-ID: <20221104115340-mutt-send-email-mst@kernel.org>
References: <20221014132108.2559156-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221014132108.2559156-1-alex.bennee@linaro.org>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Oct 14, 2022 at 02:21:08PM +0100, Alex Bennée wrote:
> During migration the virtio device state can be restored before we
> restart the VM. As no devices can be running while the VM is paused it
> makes sense to bail out early in that case.
> 
> This returns the order introduced in:
> 
>  9f6bcfd99f (hw/virtio: move vm_running check to virtio_device_started)
> 
> to what virtio-sock was doing longhand.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Christian Borntraeger <borntraeger@linux.ibm.com>


What happens now:

with this applied I get:

https://gitlab.com/mitsirkin/qemu/-/pipelines/685829158/failures

――――――――――――――――――――――――――――――――――――― ✀  ―――――――――――――――――――――――――――――――――――――
stderr:
qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
qemu-system-arm: Failed to set msg fds.
qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
qemu-system-arm: -chardev socket,id=chr-reconnect,path=/tmp/vhost-test-QLKXU1/reconnect.sock,server=on: info: QEMU waiting for connection on: disconnected:unix:/tmp/vhost-test-QLKXU1/reconnect.sock,server=on
qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
qemu-system-arm: Failed to set msg fds.
qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
qemu-system-arm: -chardev socket,id=chr-connect-fail,path=/tmp/vhost-test-L9Q6U1/connect-fail.sock,server=on: info: QEMU waiting for connection on: disconnected:unix:/tmp/vhost-test-L9Q6U1/connect-fail.sock,server=on
qemu-system-arm: -netdev vhost-user,id=hs0,chardev=chr-connect-fail,vhostforce=on: Failed to read msg header. Read 0 instead of 12. Original request 1.
qemu-system-arm: -netdev vhost-user,id=hs0,chardev=chr-connect-fail,vhostforce=on: vhost_backend_init failed: Protocol error
qemu-system-arm: -netdev vhost-user,id=hs0,chardev=chr-connect-fail,vhostforce=on: failed to init vhost_net for queue 0
qemu-system-arm: -netdev vhost-user,id=hs0,chardev=chr-connect-fail,vhostforce=on: info: QEMU waiting for connection on: disconnected:unix:/tmp/vhost-test-L9Q6U1/connect-fail.sock,server=on
qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
qemu-system-arm: Failed to set msg fds.
qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
qemu-system-arm: -chardev socket,id=chr-flags-mismatch,path=/tmp/vhost-test-3MO5U1/flags-mismatch.sock,server=on: info: QEMU waiting for connection on: disconnected:unix:/tmp/vhost-test-3MO5U1/flags-mismatch.sock,server=on
qemu-system-arm: Failed to write msg. Wrote -1 instead of 52.
qemu-system-arm: vhost_set_mem_table failed: Invalid argument (22)
qemu-system-arm: unable to start vhost net: 22: falling back on userspace virtio
vhost lacks feature mask 0x40000000 for backend
qemu-system-arm: failed to init vhost_net for queue 0
qemu-system-arm: Failed to set msg fds.
qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
qemu-system-arm: Failed to set msg fds.
qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
qemu-system-arm: Failed to set msg fds.
qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
qemu-system-arm: Failed to set msg fds.
qemu-system-arm: vhost VQ 2 ring restore failed: -22: Invalid argument (22)
qemu-system-arm: Failed to set msg fds.
qemu-system-arm: vhost VQ 3 ring restore failed: -22: Invalid argument (22)
qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
qemu-system-arm: Failed to set msg fds.
qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
qemu-system-arm: Failed to set msg fds.
qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
qemu-system-arm: Failed to set msg fds.
qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
qemu-system-arm: Failed to set msg fds.
qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
qemu-system-arm: Failed to set msg fds.
qemu-system-arm: vhost_set_vring_call failed: Invalid argument (22)
qemu-system-arm: Failed to set msg fds.
qemu-system-arm: vhost_set_vring_call failed: Invalid argument (22)
qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
qemu-system-arm: vhost VQ 0 ring restore failed: -5: Input/output error (5)
qemu-system-arm: ../hw/virtio/virtio-bus.c:211: void virtio_bus_release_ioeventfd(VirtioBusState *): Assertion `bus->ioeventfd_grabbed != 0' failed.
../tests/qtest/libqtest.c:188: kill_qemu() detected QEMU death from signal 6 (Aborted) (core dumped)
**
ERROR:../tests/qtest/qos-test.c:191:subprocess_run_one_test: child process (/arm/virt/virtio-mmio/virtio-bus/vhost-user-gpio-device/vhost-user-gpio/vhost-user-gpio-tests/read-guest-mem/memfile/subprocess [8735]) failed unexpectedly
(test program exited with status code -6)
――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――




without this it passes:

https://gitlab.com/mitsirkin/qemu/-/jobs/3275949777


this only triggers under github, clang-system job.
trying to decide what to do now. revert just this?


> ---
>  include/hw/virtio/virtio.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index f41b4a7e64..ebb58feaac 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -385,14 +385,14 @@ static inline bool virtio_is_big_endian(VirtIODevice *vdev)
>  
>  static inline bool virtio_device_started(VirtIODevice *vdev, uint8_t status)
>  {
> -    if (vdev->use_started) {
> -        return vdev->started;
> -    }
> -
>      if (!vdev->vm_running) {
>          return false;
>      }
>  
> +    if (vdev->use_started) {
> +        return vdev->started;
> +    }
> +
>      return status & VIRTIO_CONFIG_S_DRIVER_OK;
>  }
>  
> -- 
> 2.34.1


