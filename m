Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 234C161DC21
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 17:45:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMGa-0003wY-OE; Sat, 05 Nov 2022 12:43:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMGY-0003vz-6V
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 12:43:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMGW-0002k6-B6
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 12:43:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667666605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZbgdQBT26sSe+OBSdhm68ikrU2gfhpY1IDfefjLX5aI=;
 b=NW+lMfrWFKvQn2JDU3y3ZtJOp8HTrXycngO9P07I55feH4/Dv5mMpbbPzOyDN/EP+18d6P
 kyfaLM8HuqlRqXacUg2ps650ZwLkWGGcaIcfbgkkhAmU9S+rzCIL1M+WU8lXz3TfW2DPHb
 JzhiyuieFj1xlkk79ghArtotge53NYs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-423-M_n0hMCUP365gYU4pmdilg-1; Sat, 05 Nov 2022 12:43:24 -0400
X-MC-Unique: M_n0hMCUP365gYU4pmdilg-1
Received: by mail-wm1-f70.google.com with SMTP id
 j2-20020a05600c1c0200b003cf7397fc9bso3804289wms.5
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 09:43:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZbgdQBT26sSe+OBSdhm68ikrU2gfhpY1IDfefjLX5aI=;
 b=MgBI6se2HzhmQY38ZerdN9k85sCZX7w80ry845ReI0XPeloSkw1CQfvzECQeBk8utC
 3QgS6g8HVkooRNud7Mop5Aw3N4ZYsIynW/cczV+b/aKIJ/arfKSiKHcT+xAazRZCFmVo
 JbOpn0S+Mu/dLC5Il73TCeG4virtNmNNwVbzO9TthEuhVbaVwVn0Eo6nNI+kQZeujh2j
 aHmvlGUAN1DA54/BVCcQA0XTm2jj5H6iVF9srb6Pnk/cGlIar946ddOsLfsBQ953rBNE
 rB4AQIGJ7vWwDmbcipoLMpa2LuSzrlQ3q0bIkUHhtH4uk3TYJth21T/x9Mr4ppAFrQLr
 xu+A==
X-Gm-Message-State: ACrzQf2MrgXlhV3HXGCmr6+PfN3kf41syLiozvo6r+T8CUOzCXzuWlt2
 Je2FKEz0BXG2/ADLEfPr39RDs3w1SZ/FNQdHBwVbX+b1sEw1bWmK0FtoELaqkEg2iVnwGgqjg+5
 +zC5ouLxmc+pUNeI=
X-Received: by 2002:a05:600c:54d1:b0:3cf:a39f:eafe with SMTP id
 iw17-20020a05600c54d100b003cfa39feafemr1497154wmb.159.1667666602888; 
 Sat, 05 Nov 2022 09:43:22 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7JYnTgckzxd6BiBtZHbu5yn/L3Nwsh8yg0Um0rpI5FFjylMV8sXWwDK2TGrNYqWiFL0DOf8A==
X-Received: by 2002:a05:600c:54d1:b0:3cf:a39f:eafe with SMTP id
 iw17-20020a05600c54d100b003cfa39feafemr1497135wmb.159.1667666602597; 
 Sat, 05 Nov 2022 09:43:22 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 v14-20020adfedce000000b00236883f2f5csm2534550wro.94.2022.11.05.09.43.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 09:43:22 -0700 (PDT)
Date: Sat, 5 Nov 2022 12:43:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Yajun Wu <yajunw@nvidia.com>, Parav Pandit <parav@nvidia.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-block@nongnu.org
Subject: Re: [PULL v2 31/82] vhost: Change the sequence of device start
Message-ID: <20221105124218-mutt-send-email-mst@kernel.org>
References: <20221102160336.616599-1-mst@redhat.com>
 <20221102160336.616599-32-mst@redhat.com>
 <CAG4p6K6=HcZs+TfzC7QMmUxKhity0_dYo4-UWwiXv7oJSvDO2g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG4p6K6=HcZs+TfzC7QMmUxKhity0_dYo4-UWwiXv7oJSvDO2g@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sat, Nov 05, 2022 at 05:35:57PM +0100, Bernhard Beschow wrote:
> 
> 
> On Wed, Nov 2, 2022 at 5:24 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> 
>     From: Yajun Wu <yajunw@nvidia.com>
> 
>     This patch is part of adding vhost-user vhost_dev_start support. The
>     motivation is to improve backend configuration speed and reduce live
>     migration VM downtime.
> 
>     Moving the device start routines after finishing all the necessary device
>     and VQ configuration, further aligning to the virtio specification for
>     "device initialization sequence".
> 
>     Following patch will add vhost-user vhost_dev_start support.
> 
>     Signed-off-by: Yajun Wu <yajunw@nvidia.com>
>     Acked-by: Parav Pandit <parav@nvidia.com>
> 
>     Message-Id: <20221017064452.1226514-2-yajunw@nvidia.com>
>     Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>     Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>     ---
>      hw/block/vhost-user-blk.c | 18 +++++++++++-------
>      hw/net/vhost_net.c        | 12 ++++++------
>      2 files changed, 17 insertions(+), 13 deletions(-)
> 
> 
> A git bisect tells me that this is the first bad commit for failing qos-tests
> which only fail when parallel jobs are enabled, e.g. `make check-qtest -j8`:
> 
> Summary of Failures:
> 
>  76/541 qemu:qtest+qtest-aarch64 / qtest-aarch64/qos-test                      
>   ERROR          18.68s   killed by signal 6 SIGABRT
>  77/541 qemu:qtest+qtest-arm / qtest-arm/qos-test                              
>   ERROR          17.60s   killed by signal 6 SIGABRT
>  93/541 qemu:qtest+qtest-i386 / qtest-i386/qos-test                            
>   ERROR          18.98s   killed by signal 6 SIGABRT
> 108/541 qemu:qtest+qtest-ppc64 / qtest-ppc64/qos-test                          
>   ERROR          16.40s   killed by signal 6 SIGABRT
> 112/541 qemu:qtest+qtest-i386 / qtest-i386/bios-tables-test                    
>   ERROR          145.94s   killed by signal 6 SIGABRT
> 130/541 qemu:qtest+qtest-x86_64 / qtest-x86_64/qos-test                        
>   ERROR          17.32s   killed by signal 6 SIGABRT
> 243/541 qemu:qtest+qtest-x86_64 / qtest-x86_64/bios-tables-test                
>   ERROR          127.70s   killed by signal 6 SIGABRT
> 
> Ok:                 500
> Expected Fail:      0  
> Fail:               7  
> Unexpected Pass:    0  
> Skipped:            34  
> Timeout:            0  
> 
> Can anyone else reproduce this?

Could you pls try latest for_upstream in my tree?
That should have this fixed.

Thanks!


> Here is a log of one failed case:
> 
> # child process (/aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/
> virtio-net-pci/virtio-net/virtio-net-tests/vhost-user/flags-mismatch/subprocess
> [384604]) killed by signal 6 (Aborted), core dumped
> # child process (/aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/
> virtio-net-pci/virtio-net/virtio-net-tests/vhost-user/flags-mismatch/subprocess
> [384604]) stdout: ""
> # child process (/aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/
> virtio-net-pci/virtio-net/virtio-net-tests/vhost-user/flags-mismatch/subprocess
> [384604]) stderr: "qemu-system-aarch64: -chardev socket,id=
> chr-flags-mismatch,path=/tmp/vhost-test-BBEAV1/flags-mismatch.sock,server=on:
> info: QEMU waiting for connection on: disconnected:unix:/tmp/vhost-test-BBEAV1/
> flags-mismatch.sock,server=on\nqemu-system-aarch64: Failed to write msg. Wrote
> -1 instead of 52.\nqemu-system-aarch64: vhost_set_mem_table failed: Invalid
> argument (22)\nqemu-system-aarch64: Failed to set msg fds.\
> nqemu-system-aarch64: vhost VQ 0 ring restore failed: -22: Invalid argument
> (22)\nBroken pipe\n../src/tests/qtest/libqtest.c:188: kill_qemu() detected QEMU
> death from signal 11 (Segmentation fault) (core dumped)\n"
> Bail out! ERROR:../src/tests/qtest/qos-test.c:191:subprocess_run_one_test:
> child process (/aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/
> virtio-net-pci/virtio-net/virtio-net-tests/vhost-user/flags-mismatch/subprocess
> [384604]) failed unexpectedly
> ----------------------------------- stderr -----------------------------------
> qemu-system-aarch64: Failed to write msg. Wrote -1 instead of 20.
> qemu-system-aarch64: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
> qemu-system-aarch64: Failed to set msg fds.
> qemu-system-aarch64: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
> qemu-system-aarch64: -chardev socket,id=chr-reconnect,path=/tmp/
> vhost-test-FTJ0U1/reconnect.sock,server=on: info: QEMU waiting for connection
> on: disconnected:unix:/tmp/vhost-test-FTJ0U1/reconnect.sock,server=on
> qemu-system-aarch64: Failed to write msg. Wrote -1 instead of 20.
> qemu-system-aarch64: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
> qemu-system-aarch64: Failed to set msg fds.
> qemu-system-aarch64: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
> qemu-system-aarch64: -chardev socket,id=chr-connect-fail,path=/tmp/
> vhost-test-4W4DV1/connect-fail.sock,server=on: info: QEMU waiting for
> connection on: disconnected:unix:/tmp/vhost-test-4W4DV1/
> connect-fail.sock,server=on
> qemu-system-aarch64: -netdev vhost-user,id=hs0,chardev=
> chr-connect-fail,vhostforce=on: Failed to read msg header. Read 0 instead of
> 12. Original request 1.
> qemu-system-aarch64: -netdev vhost-user,id=hs0,chardev=
> chr-connect-fail,vhostforce=on: vhost_backend_init failed: Protocol error
> qemu-system-aarch64: -netdev vhost-user,id=hs0,chardev=
> chr-connect-fail,vhostforce=on: failed to init vhost_net for queue 0
> qemu-system-aarch64: -netdev vhost-user,id=hs0,chardev=
> chr-connect-fail,vhostforce=on: info: QEMU waiting for connection on:
> disconnected:unix:/tmp/vhost-test-4W4DV1/connect-fail.sock,server=on
> qemu-system-aarch64: Failed to set msg fds.
> qemu-system-aarch64: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
> qemu-system-aarch64: Failed to set msg fds.
> qemu-system-aarch64: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
> qemu-system-aarch64: -chardev socket,id=chr-flags-mismatch,path=/tmp/
> vhost-test-BBEAV1/flags-mismatch.sock,server=on: info: QEMU waiting for
> connection on: disconnected:unix:/tmp/vhost-test-BBEAV1/
> flags-mismatch.sock,server=on
> qemu-system-aarch64: Failed to write msg. Wrote -1 instead of 52.
> qemu-system-aarch64: vhost_set_mem_table failed: Invalid argument (22)
> qemu-system-aarch64: Failed to set msg fds.
> qemu-system-aarch64: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
> Broken pipe
> ../src/tests/qtest/libqtest.c:188: kill_qemu() detected QEMU death from signal
> 11 (Segmentation fault) (core dumped)
> **
> ERROR:../src/tests/qtest/qos-test.c:191:subprocess_run_one_test: child process
> (/aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/virtio-net-pci/
> virtio-net/virtio-net-tests/vhost-user/flags-mismatch/subprocess [384604])
> failed unexpectedly
> 
> (test program exited with status code -6)
> ==============================================================================
> 
> =================================== 77/541 ===================================
> test:         qemu:qtest+qtest-arm / qtest-arm/qos-test
> start time:   16:04:10
> duration:     17.60s
> result:       killed by signal 6 SIGABRT
> command:      MALLOC_PERTURB_=98 QTEST_QEMU_IMG=./qemu-img
> QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon
> QTEST_QEMU_BINARY=./qemu-system-arm G_TEST_DBUS_DAEMON=../src/tests/
> dbus-vmstate-daemon.sh ./tests/qtest/qos-test --tap -k
> 
> Best regards,
> Bernhard


