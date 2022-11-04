Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F351F619F1F
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 18:46:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1or0ly-0008Is-AO; Fri, 04 Nov 2022 13:46:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1or0lm-0008Gm-KD
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 13:46:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1or0lk-0005KA-D8
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 13:46:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667583975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FUHJsVNTBmD+5vFs+oKTZLEPCSc7nyAYfGx1niyhxcw=;
 b=OPHsbtfGe9VOb/swwKxAh/Ypjd0gMXSa61HXoZXRCHlpuA9Ua4k8FU6cZf2ahMBoQ2gTwn
 TPEBa5XI+KLM8F4GSVzThnhVX8W+9WElYMRcCWiryqjU3J1DvIb95gaaQrmz+5y5hWm5xo
 XkhzasryWaamJz2n+h7A8xCDEjzAei4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-357-JyefMGHUPlqdT9yM3aTYTg-1; Fri, 04 Nov 2022 13:46:14 -0400
X-MC-Unique: JyefMGHUPlqdT9yM3aTYTg-1
Received: by mail-wm1-f69.google.com with SMTP id
 133-20020a1c028b000000b003cf9d6c4016so23538wmc.8
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 10:46:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FUHJsVNTBmD+5vFs+oKTZLEPCSc7nyAYfGx1niyhxcw=;
 b=Y+9AtbkXtre3TOOrlpG1ng5hcfluIpdEJOZRKDKHayTOQYrmfig3BPnM4sNYB0l9nF
 Y5Bb8sBziR0Avju3t+m1zfCK6KCCoCU5q1QqF1+E0+lxbikRpybCVdvHZ9GVGy+gXLef
 wBOF3Sj6Ki71JRW70FWS2JcCMNEqckIdTBY7fINGC3xQqcdoRMVVoXyyq9Sd+zPtjodY
 Ll3l73p8NkzD8UISsH6PHD71BrICqbZr0xBrpL8s+j7sAt4oqzEgp/8A2oddCSTIic5P
 W2uY7tqUK8Fe4MU3LRetNGHvHtSk+G06RuVFuRPKC/t3jUEFZyjSu/NMik5dAPQEOyrO
 G5Mg==
X-Gm-Message-State: ACrzQf053zuTtd9qzmKBH3rNpiCab4FD0LGOYK6i7JmJ8Ko+9grC5C0O
 UR5jSRB/xqXD/AGCqr3RoqL6UAFoBKJao/5tI0PXRE2AXRzQayzE2qhiGlmjOkc8GKY+iQIqWLq
 8QoTed3NJgEDN/Ow=
X-Received: by 2002:a1c:4641:0:b0:3cf:4ff3:8d2f with SMTP id
 t62-20020a1c4641000000b003cf4ff38d2fmr25216979wma.107.1667583972830; 
 Fri, 04 Nov 2022 10:46:12 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7laYG9htyiUg2d3+UO2qn8WoUJxOamc0kVs5QHxsbOYx7vw3TNLubpN85V/MTpxo0npTdddg==
X-Received: by 2002:a1c:4641:0:b0:3cf:4ff3:8d2f with SMTP id
 t62-20020a1c4641000000b003cf4ff38d2fmr25216959wma.107.1667583972448; 
 Fri, 04 Nov 2022 10:46:12 -0700 (PDT)
Received: from redhat.com ([2.55.180.182]) by smtp.gmail.com with ESMTPSA id
 j5-20020a5d4485000000b002365730eae8sm3892875wrq.55.2022.11.04.10.46.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 10:46:11 -0700 (PDT)
Date: Fri, 4 Nov 2022 13:46:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org,
	Christian Borntraeger <borntraeger@linux.ibm.com>
Subject: Re: [RFC PATCH] virtio: re-order vm_running and use_started checks
Message-ID: <20221104134508-mutt-send-email-mst@kernel.org>
References: <20221014132108.2559156-1-alex.bennee@linaro.org>
 <20221104115340-mutt-send-email-mst@kernel.org>
 <877d0ak7dp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <877d0ak7dp.fsf@linaro.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Fri, Nov 04, 2022 at 04:31:08PM +0000, Alex Bennée wrote:
> 
> "Michael S. Tsirkin" <mst@redhat.com> writes:
> 
> > On Fri, Oct 14, 2022 at 02:21:08PM +0100, Alex Bennée wrote:
> >> During migration the virtio device state can be restored before we
> >> restart the VM. As no devices can be running while the VM is paused it
> >> makes sense to bail out early in that case.
> >> 
> >> This returns the order introduced in:
> >> 
> >>  9f6bcfd99f (hw/virtio: move vm_running check to virtio_device_started)
> >> 
> >> to what virtio-sock was doing longhand.
> >> 
> >> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> >> Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
> >
> >
> > What happens now:
> >
> > with this applied I get:
> >
> > https://gitlab.com/mitsirkin/qemu/-/pipelines/685829158/failures
> >
> > ――――――――――――――――――――――――――――――――――――― ✀  ―――――――――――――――――――――――――――――――――――――
> > stderr:
> > qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
> > qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
> > qemu-system-arm: Failed to set msg fds.
> > qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
> > qemu-system-arm: -chardev
> > socket,id=chr-reconnect,path=/tmp/vhost-test-QLKXU1/reconnect.sock,server=on:
> > info: QEMU waiting for connection on:
> > disconnected:unix:/tmp/vhost-test-QLKXU1/reconnect.sock,server=on
> > qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
> > qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
> > qemu-system-arm: Failed to set msg fds.
> > qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
> > qemu-system-arm: -chardev
> > socket,id=chr-connect-fail,path=/tmp/vhost-test-L9Q6U1/connect-fail.sock,server=on:
> > info: QEMU waiting for connection on:
> > disconnected:unix:/tmp/vhost-test-L9Q6U1/connect-fail.sock,server=on
> > qemu-system-arm: -netdev
> > vhost-user,id=hs0,chardev=chr-connect-fail,vhostforce=on: Failed to
> > read msg header. Read 0 instead of 12. Original request 1.
> > qemu-system-arm: -netdev
> > vhost-user,id=hs0,chardev=chr-connect-fail,vhostforce=on:
> > vhost_backend_init failed: Protocol error
> > qemu-system-arm: -netdev
> > vhost-user,id=hs0,chardev=chr-connect-fail,vhostforce=on: failed to
> > init vhost_net for queue 0
> > qemu-system-arm: -netdev
> > vhost-user,id=hs0,chardev=chr-connect-fail,vhostforce=on: info: QEMU
> > waiting for connection on:
> > disconnected:unix:/tmp/vhost-test-L9Q6U1/connect-fail.sock,server=on
> > qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
> > qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
> > qemu-system-arm: Failed to set msg fds.
> > qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
> > qemu-system-arm: -chardev
> > socket,id=chr-flags-mismatch,path=/tmp/vhost-test-3MO5U1/flags-mismatch.sock,server=on:
> > info: QEMU waiting for connection on:
> > disconnected:unix:/tmp/vhost-test-3MO5U1/flags-mismatch.sock,server=on
> > qemu-system-arm: Failed to write msg. Wrote -1 instead of 52.
> > qemu-system-arm: vhost_set_mem_table failed: Invalid argument (22)
> > qemu-system-arm: unable to start vhost net: 22: falling back on userspace virtio
> > vhost lacks feature mask 0x40000000 for backend
> > qemu-system-arm: failed to init vhost_net for queue 0
> > qemu-system-arm: Failed to set msg fds.
> > qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
> > qemu-system-arm: Failed to set msg fds.
> > qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
> > qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
> > qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
> > qemu-system-arm: Failed to set msg fds.
> > qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
> > qemu-system-arm: Failed to set msg fds.
> > qemu-system-arm: vhost VQ 2 ring restore failed: -22: Invalid argument (22)
> > qemu-system-arm: Failed to set msg fds.
> > qemu-system-arm: vhost VQ 3 ring restore failed: -22: Invalid argument (22)
> > qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
> > qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
> > qemu-system-arm: Failed to set msg fds.
> > qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
> > qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
> > qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
> > qemu-system-arm: Failed to set msg fds.
> > qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
> > qemu-system-arm: Failed to set msg fds.
> > qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
> > qemu-system-arm: Failed to set msg fds.
> > qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
> > qemu-system-arm: Failed to set msg fds.
> > qemu-system-arm: vhost_set_vring_call failed: Invalid argument (22)
> > qemu-system-arm: Failed to set msg fds.
> > qemu-system-arm: vhost_set_vring_call failed: Invalid argument (22)
> > qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
> > qemu-system-arm: vhost VQ 0 ring restore failed: -5: Input/output error (5)
> > qemu-system-arm: ../hw/virtio/virtio-bus.c:211: void
> > virtio_bus_release_ioeventfd(VirtioBusState *): Assertion
> > `bus->ioeventfd_grabbed != 0' failed.
> > ../tests/qtest/libqtest.c:188: kill_qemu() detected QEMU death from signal 6 (Aborted) (core dumped)
> > **
> > ERROR:../tests/qtest/qos-test.c:191:subprocess_run_one_test: child
> > process
> > (/arm/virt/virtio-mmio/virtio-bus/vhost-user-gpio-device/vhost-user-gpio/vhost-user-gpio-tests/read-guest-mem/memfile/subprocess
> > [8735]) failed unexpectedly
> > (test program exited with status code -6)
> > ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
> >
> >
> >
> >
> > without this it passes:
> >
> > https://gitlab.com/mitsirkin/qemu/-/jobs/3275949777
> >
> >
> > this only triggers under github, clang-system job.
> > trying to decide what to do now. revert just this?
> 
> I must admit I didn't run that directly. My build box is currently out
> of commission but can we get more detail about the abort?

Just run it under gitlab. The only trick is to set QEMU_CI to 1
when running the pipeline.


> It looks like the vhost negotiation is totally broken and can't even
> find the VQs

Donnu really. I'm trying to figure out what kind of revert gets
a working tree.


> >
> >
> >> ---
> >>  include/hw/virtio/virtio.h | 8 ++++----
> >>  1 file changed, 4 insertions(+), 4 deletions(-)
> >> 
> >> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> >> index f41b4a7e64..ebb58feaac 100644
> >> --- a/include/hw/virtio/virtio.h
> >> +++ b/include/hw/virtio/virtio.h
> >> @@ -385,14 +385,14 @@ static inline bool virtio_is_big_endian(VirtIODevice *vdev)
> >>  
> >>  static inline bool virtio_device_started(VirtIODevice *vdev, uint8_t status)
> >>  {
> >> -    if (vdev->use_started) {
> >> -        return vdev->started;
> >> -    }
> >> -
> >>      if (!vdev->vm_running) {
> >>          return false;
> >>      }
> >>  
> >> +    if (vdev->use_started) {
> >> +        return vdev->started;
> >> +    }
> >> +
> >>      return status & VIRTIO_CONFIG_S_DRIVER_OK;
> >>  }
> >>  
> >> -- 
> >> 2.34.1
> 
> 
> -- 
> Alex Bennée


