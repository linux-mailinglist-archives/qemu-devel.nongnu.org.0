Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FBE619F44
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 18:53:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1or0rT-0002xB-01; Fri, 04 Nov 2022 13:52:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1or0rQ-0002wr-Vz
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 13:52:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1or0rP-0005zw-4J
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 13:52:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667584326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1S+PV3C2q+OCNTaqPyy22QKUdOIqLUgm3GE7bjnGfoM=;
 b=cDGbdNAjLyr5UvHJm1NuJXrbc3yIpDXmNpecBPyPSTuPOeHhO5xx6pKwixHVupIBmtCAE5
 72tQCfOwoxPTsnHvBQmU9y4+StvgAqJzhRU5zDaYGMfK6l0qWLcVLzcyXz3AvOYVKI8iUM
 LmB2XROwVb7zf590o2BymY+bD/XKt1Q=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-526-eDHOSGQRMRucHoJdW5-Ciw-1; Fri, 04 Nov 2022 13:52:04 -0400
X-MC-Unique: eDHOSGQRMRucHoJdW5-Ciw-1
Received: by mail-wm1-f70.google.com with SMTP id
 133-20020a1c028b000000b003cf9d6c4016so31730wmc.8
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 10:52:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1S+PV3C2q+OCNTaqPyy22QKUdOIqLUgm3GE7bjnGfoM=;
 b=SK5QpAG7yNtugMf3Tl7wYz1hvtS4KjF1f5XZsAGvbbBqbXuLPOtApywnsRu9mcJCFR
 LqoxauEW8LlkHd901ArIAyVvxSRIGrdnYFtvL7uKWDZgmuQtvxXQwmlZNXjr+fCGO+5A
 LaALruROlov/ECp8uaQndD3GarTzCF6+LmFLRK2hH3mBZXMeKS7Uk4ZRVRe2KDyfCP/H
 NYV0vgdl3mZNr5yvTtAy4cW7TDduVzvK5xQ/6c2xVerIfmEUqARrfJZMuvtmoSHcvrvc
 8Duwxxx5FKbvAiyuLJHc9OuRvLdYGWqgbxvgSbG66ZCkuFpzz2ks5MtcmngD2E5tOhP6
 iuCw==
X-Gm-Message-State: ACrzQf024TrbEbkpaZ0L/sLrkXuRMnCiJYj4nvQhv7Nv0uRjwXScp60b
 p7+udRCV5S1JeMJ3Asw6Aa/7kEcB+Q0/H9EP3v5AglpkqA2PVHTPJJkQMcY0T/SeJAcZYsNNTyv
 eYMAbaPM7ZpgHHoI=
X-Received: by 2002:adf:e788:0:b0:22e:337a:247 with SMTP id
 n8-20020adfe788000000b0022e337a0247mr268728wrm.216.1667584322930; 
 Fri, 04 Nov 2022 10:52:02 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7KrhKpgRB+9j7IcitPYAuJe0fb9uF1SqZKdC54YrpDtHHJu52lbCVJ0eLUGx4ow1JaOo3xTQ==
X-Received: by 2002:adf:e788:0:b0:22e:337a:247 with SMTP id
 n8-20020adfe788000000b0022e337a0247mr268725wrm.216.1667584322604; 
 Fri, 04 Nov 2022 10:52:02 -0700 (PDT)
Received: from redhat.com ([2.55.180.182]) by smtp.gmail.com with ESMTPSA id
 h8-20020a05600c350800b003c6f426467fsm3760140wmq.40.2022.11.04.10.52.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 10:52:02 -0700 (PDT)
Date: Fri, 4 Nov 2022 13:51:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Subject: Re: [RFC PATCH] virtio: re-order vm_running and use_started checks
Message-ID: <20221104135111-mutt-send-email-mst@kernel.org>
References: <20221014132108.2559156-1-alex.bennee@linaro.org>
 <20221104115340-mutt-send-email-mst@kernel.org>
 <302d7a5f-069a-f071-b1c2-56bdbb1f625f@linux.ibm.com>
 <20221104121339-mutt-send-email-mst@kernel.org>
 <dc6522b4-0bae-d0b9-431a-6c635fe0492c@linux.ibm.com>
 <e858e92d-79db-9e75-f3c2-abd40974dc9f@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e858e92d-79db-9e75-f3c2-abd40974dc9f@linux.ibm.com>
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

On Fri, Nov 04, 2022 at 05:58:17PM +0100, Christian Borntraeger wrote:
> Am 04.11.22 um 17:51 schrieb Christian Borntraeger:
> > 
> > 
> > Am 04.11.22 um 17:14 schrieb Michael S. Tsirkin:
> > > On Fri, Nov 04, 2022 at 04:59:35PM +0100, Christian Borntraeger wrote:
> > > > 
> > > > 
> > > > Am 04.11.22 um 16:56 schrieb Michael S. Tsirkin:
> > > > > On Fri, Oct 14, 2022 at 02:21:08PM +0100, Alex Bennée wrote:
> > > > > > During migration the virtio device state can be restored before we
> > > > > > restart the VM. As no devices can be running while the VM is paused it
> > > > > > makes sense to bail out early in that case.
> > > > > > 
> > > > > > This returns the order introduced in:
> > > > > > 
> > > > > >    9f6bcfd99f (hw/virtio: move vm_running check to virtio_device_started)
> > > > > > 
> > > > > > to what virtio-sock was doing longhand.
> > > > > > 
> > > > > > Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> > > > > > Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
> > > > > 
> > > > > 
> > > > > What happens now:
> > > > > 
> > > > > with this applied I get:
> > > > > 
> > > > > https://gitlab.com/mitsirkin/qemu/-/pipelines/685829158/failures
> > > > > 
> > > > > ――――――――――――――――――――――――――――――――――――― ✀  ―――――――――――――――――――――――――――――――――――――
> > > > > stderr:
> > > > > qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
> > > > > qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
> > > > > qemu-system-arm: Failed to set msg fds.
> > > > > qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
> > > > > qemu-system-arm: -chardev socket,id=chr-reconnect,path=/tmp/vhost-test-QLKXU1/reconnect.sock,server=on: info: QEMU waiting for connection on: disconnected:unix:/tmp/vhost-test-QLKXU1/reconnect.sock,server=on
> > > > > qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
> > > > > qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
> > > > > qemu-system-arm: Failed to set msg fds.
> > > > > qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
> > > > > qemu-system-arm: -chardev socket,id=chr-connect-fail,path=/tmp/vhost-test-L9Q6U1/connect-fail.sock,server=on: info: QEMU waiting for connection on: disconnected:unix:/tmp/vhost-test-L9Q6U1/connect-fail.sock,server=on
> > > > > qemu-system-arm: -netdev vhost-user,id=hs0,chardev=chr-connect-fail,vhostforce=on: Failed to read msg header. Read 0 instead of 12. Original request 1.
> > > > > qemu-system-arm: -netdev vhost-user,id=hs0,chardev=chr-connect-fail,vhostforce=on: vhost_backend_init failed: Protocol error
> > > > > qemu-system-arm: -netdev vhost-user,id=hs0,chardev=chr-connect-fail,vhostforce=on: failed to init vhost_net for queue 0
> > > > > qemu-system-arm: -netdev vhost-user,id=hs0,chardev=chr-connect-fail,vhostforce=on: info: QEMU waiting for connection on: disconnected:unix:/tmp/vhost-test-L9Q6U1/connect-fail.sock,server=on
> > > > > qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
> > > > > qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
> > > > > qemu-system-arm: Failed to set msg fds.
> > > > > qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
> > > > > qemu-system-arm: -chardev socket,id=chr-flags-mismatch,path=/tmp/vhost-test-3MO5U1/flags-mismatch.sock,server=on: info: QEMU waiting for connection on: disconnected:unix:/tmp/vhost-test-3MO5U1/flags-mismatch.sock,server=on
> > > > > qemu-system-arm: Failed to write msg. Wrote -1 instead of 52.
> > > > > qemu-system-arm: vhost_set_mem_table failed: Invalid argument (22)
> > > > > qemu-system-arm: unable to start vhost net: 22: falling back on userspace virtio
> > > > > vhost lacks feature mask 0x40000000 for backend
> > > > > qemu-system-arm: failed to init vhost_net for queue 0
> > > > > qemu-system-arm: Failed to set msg fds.
> > > > > qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
> > > > > qemu-system-arm: Failed to set msg fds.
> > > > > qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
> > > > > qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
> > > > > qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
> > > > > qemu-system-arm: Failed to set msg fds.
> > > > > qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
> > > > > qemu-system-arm: Failed to set msg fds.
> > > > > qemu-system-arm: vhost VQ 2 ring restore failed: -22: Invalid argument (22)
> > > > > qemu-system-arm: Failed to set msg fds.
> > > > > qemu-system-arm: vhost VQ 3 ring restore failed: -22: Invalid argument (22)
> > > > > qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
> > > > > qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
> > > > > qemu-system-arm: Failed to set msg fds.
> > > > > qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
> > > > > qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
> > > > > qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
> > > > > qemu-system-arm: Failed to set msg fds.
> > > > > qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
> > > > > qemu-system-arm: Failed to set msg fds.
> > > > > qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
> > > > > qemu-system-arm: Failed to set msg fds.
> > > > > qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
> > > > > qemu-system-arm: Failed to set msg fds.
> > > > > qemu-system-arm: vhost_set_vring_call failed: Invalid argument (22)
> > > > > qemu-system-arm: Failed to set msg fds.
> > > > > qemu-system-arm: vhost_set_vring_call failed: Invalid argument (22)
> > > > > qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
> > > > > qemu-system-arm: vhost VQ 0 ring restore failed: -5: Input/output error (5)
> > > > > qemu-system-arm: ../hw/virtio/virtio-bus.c:211: void virtio_bus_release_ioeventfd(VirtioBusState *): Assertion `bus->ioeventfd_grabbed != 0' failed.
> > > > > ../tests/qtest/libqtest.c:188: kill_qemu() detected QEMU death from signal 6 (Aborted) (core dumped)
> > > > > **
> > > > > ERROR:../tests/qtest/qos-test.c:191:subprocess_run_one_test: child process (/arm/virt/virtio-mmio/virtio-bus/vhost-user-gpio-device/vhost-user-gpio/vhost-user-gpio-tests/read-guest-mem/memfile/subprocess [8735]) failed unexpectedly
> > > > > (test program exited with status code -6)
> > > > > ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
> > > > > 
> > > > > 
> > > > > 
> > > > > 
> > > > > without this it passes:
> > > > > 
> > > > > https://gitlab.com/mitsirkin/qemu/-/jobs/3275949777
> > > > > 
> > > > > 
> > > > > this only triggers under github, clang-system job.
> > > > > trying to decide what to do now. revert just this?
> > > > When we revert this save/restore for vsock is broken. Not sure, maybe we must use a more fine-grained fix as outlined in my initial mail?
> > > 
> > > 
> > > 
> > > Could you take a look here pls?
> > > 
> > > https://gitlab.com/mitsirkin/qemu/-/tree/testrevert1
> > 
> > I kicked of our regression test suite for s390.
> 
> This branch also seems to fix my original problem.
> Regression is still running but looks good so far.

Good to know. And I think that's a better fix in fact it's just a
couple of lines. However, the original gitlab failure is still
with us there :( Trying to figure out what is going on.


