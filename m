Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CD3619CCB
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 17:15:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqzKz-00044f-IY; Fri, 04 Nov 2022 12:14:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqzKt-0003uw-OE
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 12:14:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqzKr-0000Ox-NJ
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 12:14:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667578465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t1v4NnqYdmYaTo8+dLm7heZ6NBB2BOQlnA3xQtfHe8g=;
 b=MVHzrCAepFSLMnBD8VnHnM6aQdOnyHOyG4swHF56wYSDl1u08R6P5+/Y6aXwfhcxqGIM25
 xaTaL2e6XjmCUKm8kqhfTjpVTMK5E6HJ5EJNNRb/tIm3ekCSlEb46DTNRviOa1Dbqwm6yC
 dTT1tAXKTuaJ0sDeSDFuPRP97AnCHVQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-553-6kz2yE_nPd6EQCE2myzU8Q-1; Fri, 04 Nov 2022 12:14:23 -0400
X-MC-Unique: 6kz2yE_nPd6EQCE2myzU8Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 l42-20020a05600c1d2a00b003cf8e70c1ecso940929wms.4
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 09:14:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t1v4NnqYdmYaTo8+dLm7heZ6NBB2BOQlnA3xQtfHe8g=;
 b=WjTcJmkvsepjbpl4/GRVMdsmMbsa3UHtKLfgoQsvJZgDlEp3u3xPCTdcsRZ25it6M7
 wm9uQqFE8SfdyefQ/7CL9iSDpqbDdPNz+Seta4hAegLCMJDu5VL+1RQRrWKHVRNHryB5
 lwpwiSnLxj8QRfgaLNXTMIfFT5am1SOikdDePDY+nPOtZlNPQV7L5xwF/Q16A00uHYbP
 8GGNG6jbOjoW3OyH/aQwWwpSLzW02iMphE7B2s3RbKmnicn8h0EE6caZJQKU7sd+r5Cr
 KE5VcHtI4hjCNkscWkvixZluzD1J+nJi1XXE+UkitPNA2jzqDqt7yziJZmy3gYc7+fxl
 Mp2A==
X-Gm-Message-State: ACrzQf0n5J/dMHiXyWqHhubgKjGP4zVb3XWyEoUWoys/8cdiDfsSmOA4
 tufHWPg8Svo7D0RxftBNnMjv3Emm5vqO2KdvtqUkeCQ2I6PFu52ftvSe6zb32LxVQ11SGXWaTiE
 NyUL+rR0MLbxJ/k8=
X-Received: by 2002:a05:600c:15c9:b0:3cf:6054:3b3b with SMTP id
 v9-20020a05600c15c900b003cf60543b3bmr27058295wmf.167.1667578462271; 
 Fri, 04 Nov 2022 09:14:22 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7eyYUzb/qGCcecphUZr0+aKlOS/1DdtMBNuOeNQp12kGbc6Ojv5fTFqpkLoUmmdhZuyI49tw==
X-Received: by 2002:a05:600c:15c9:b0:3cf:6054:3b3b with SMTP id
 v9-20020a05600c15c900b003cf60543b3bmr27058264wmf.167.1667578461893; 
 Fri, 04 Nov 2022 09:14:21 -0700 (PDT)
Received: from redhat.com ([2.55.180.182]) by smtp.gmail.com with ESMTPSA id
 w8-20020adfd4c8000000b0023672104c24sm3734375wrk.74.2022.11.04.09.14.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 09:14:21 -0700 (PDT)
Date: Fri, 4 Nov 2022 12:14:18 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Subject: Re: [RFC PATCH] virtio: re-order vm_running and use_started checks
Message-ID: <20221104121339-mutt-send-email-mst@kernel.org>
References: <20221014132108.2559156-1-alex.bennee@linaro.org>
 <20221104115340-mutt-send-email-mst@kernel.org>
 <302d7a5f-069a-f071-b1c2-56bdbb1f625f@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <302d7a5f-069a-f071-b1c2-56bdbb1f625f@linux.ibm.com>
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

On Fri, Nov 04, 2022 at 04:59:35PM +0100, Christian Borntraeger wrote:
> 
> 
> Am 04.11.22 um 16:56 schrieb Michael S. Tsirkin:
> > On Fri, Oct 14, 2022 at 02:21:08PM +0100, Alex Bennée wrote:
> > > During migration the virtio device state can be restored before we
> > > restart the VM. As no devices can be running while the VM is paused it
> > > makes sense to bail out early in that case.
> > > 
> > > This returns the order introduced in:
> > > 
> > >   9f6bcfd99f (hw/virtio: move vm_running check to virtio_device_started)
> > > 
> > > to what virtio-sock was doing longhand.
> > > 
> > > Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> > > Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
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
> > qemu-system-arm: -chardev socket,id=chr-reconnect,path=/tmp/vhost-test-QLKXU1/reconnect.sock,server=on: info: QEMU waiting for connection on: disconnected:unix:/tmp/vhost-test-QLKXU1/reconnect.sock,server=on
> > qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
> > qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
> > qemu-system-arm: Failed to set msg fds.
> > qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
> > qemu-system-arm: -chardev socket,id=chr-connect-fail,path=/tmp/vhost-test-L9Q6U1/connect-fail.sock,server=on: info: QEMU waiting for connection on: disconnected:unix:/tmp/vhost-test-L9Q6U1/connect-fail.sock,server=on
> > qemu-system-arm: -netdev vhost-user,id=hs0,chardev=chr-connect-fail,vhostforce=on: Failed to read msg header. Read 0 instead of 12. Original request 1.
> > qemu-system-arm: -netdev vhost-user,id=hs0,chardev=chr-connect-fail,vhostforce=on: vhost_backend_init failed: Protocol error
> > qemu-system-arm: -netdev vhost-user,id=hs0,chardev=chr-connect-fail,vhostforce=on: failed to init vhost_net for queue 0
> > qemu-system-arm: -netdev vhost-user,id=hs0,chardev=chr-connect-fail,vhostforce=on: info: QEMU waiting for connection on: disconnected:unix:/tmp/vhost-test-L9Q6U1/connect-fail.sock,server=on
> > qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
> > qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
> > qemu-system-arm: Failed to set msg fds.
> > qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
> > qemu-system-arm: -chardev socket,id=chr-flags-mismatch,path=/tmp/vhost-test-3MO5U1/flags-mismatch.sock,server=on: info: QEMU waiting for connection on: disconnected:unix:/tmp/vhost-test-3MO5U1/flags-mismatch.sock,server=on
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
> > qemu-system-arm: ../hw/virtio/virtio-bus.c:211: void virtio_bus_release_ioeventfd(VirtioBusState *): Assertion `bus->ioeventfd_grabbed != 0' failed.
> > ../tests/qtest/libqtest.c:188: kill_qemu() detected QEMU death from signal 6 (Aborted) (core dumped)
> > **
> > ERROR:../tests/qtest/qos-test.c:191:subprocess_run_one_test: child process (/arm/virt/virtio-mmio/virtio-bus/vhost-user-gpio-device/vhost-user-gpio/vhost-user-gpio-tests/read-guest-mem/memfile/subprocess [8735]) failed unexpectedly
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
> When we revert this save/restore for vsock is broken. Not sure, maybe we must use a more fine-grained fix as outlined in my initial mail?



Could you take a look here pls?

https://gitlab.com/mitsirkin/qemu/-/tree/testrevert1



-- 
MST


