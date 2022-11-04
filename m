Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5775A619247
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 08:59:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqrbg-0002Si-0w; Fri, 04 Nov 2022 03:59:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqrbb-0002SF-J1
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 03:59:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqrbX-00078F-MS
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 03:59:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667548746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/0ol5Lyvq6MsDs+W7RXp58hpokdEIUpmHyN4rUJlHkU=;
 b=AORgj4RPYaN9dmfKXb0xvbbwGtuDLH2CbJ+s/34zA52Jlvuno9HlKr1FuyI7sOo3xedJht
 eWfCNJaIpVKSqhva4doh8Ylj2dCoZROazR2Lgmnfo9kcf8OpT+EENSMJDy1nO0N3dybo36
 Gw8gExLRwUhqYbOGQbhP+eLStAUpThY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-627-EVjxGMl-MjKIuuP2-Kj5aw-1; Fri, 04 Nov 2022 03:59:05 -0400
X-MC-Unique: EVjxGMl-MjKIuuP2-Kj5aw-1
Received: by mail-wm1-f71.google.com with SMTP id
 v191-20020a1cacc8000000b003bdf7b78dccso1981198wme.3
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 00:59:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/0ol5Lyvq6MsDs+W7RXp58hpokdEIUpmHyN4rUJlHkU=;
 b=Jjqmiq8gJFusGyoD+7vRoE1l+udkJ2iiOH0MhKqke36GHCaOd9jfuNKmkKgukLi24r
 7WEACji/LljhhStzldCXLNTfJVe9c6C6ODiMTgJYQyD/kka1E7Up9AQenvOWRGlw7YY6
 lGi8OvF9djH0+LreotldiCDZ27Ai8Qwf/wvg3V7wfl6DobYiYH6yuuG2T/181tFR8lb8
 i6XrU2qwOGsVSC5bCuRRcoq2p62lrkLUZPQVJbFHzZX/BbHMJElP29CsSpDJtWdUyEmu
 b6PUwicj/MZLol//uv64OpZA24zquQAk5ae/acFQVcy05JI8gEVH6FYPh4+taH3zlwIA
 fjxA==
X-Gm-Message-State: ACrzQf10q1lIn5IvjO79vrTCVNaQ/HFO04z+HDG46qPWfLIcCHUc1QrW
 TBSfr7HP+9XQyfohJM3jJT+sXZtbnLXhP0jvLuIkCGSBrcpFYg1BW86Y5gubi4bA4XKH6MWGmhn
 rAO6sEzTNMwU5Zrs=
X-Received: by 2002:a05:600c:3b82:b0:3cf:6cc7:5b7b with SMTP id
 n2-20020a05600c3b8200b003cf6cc75b7bmr18650258wms.126.1667548743749; 
 Fri, 04 Nov 2022 00:59:03 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7u+SF+Bxnkkh+Lr31ejQWHGUXqKNm/9CvOPaer/Wwkoxy5ET9tK+Y3UIWt6q7Yh6TFyH73fg==
X-Received: by 2002:a05:600c:3b82:b0:3cf:6cc7:5b7b with SMTP id
 n2-20020a05600c3b8200b003cf6cc75b7bmr18650246wms.126.1667548743427; 
 Fri, 04 Nov 2022 00:59:03 -0700 (PDT)
Received: from redhat.com ([2.52.149.81]) by smtp.gmail.com with ESMTPSA id
 d22-20020a1c7316000000b003cdf141f363sm2070588wmb.11.2022.11.04.00.59.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Nov 2022 00:59:02 -0700 (PDT)
Date: Fri, 4 Nov 2022 03:58:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Yajun Wu <yajunw@nvidia.com>
Cc: qemu-devel@nongnu.org, parav@nvidia.com
Subject: Re: [PATCH v3 0/2] vhost-user: Support vhost_dev_start
Message-ID: <20221104035133-mutt-send-email-mst@kernel.org>
References: <20220629022517.2600911-1-yajunw@nvidia.com>
 <20221017064452.1226514-1-yajunw@nvidia.com>
 <20221104025833-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221104025833-mutt-send-email-mst@kernel.org>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
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

On Fri, Nov 04, 2022 at 03:11:44AM -0400, Michael S. Tsirkin wrote:
> On Mon, Oct 17, 2022 at 02:44:50PM +0800, Yajun Wu wrote:
> > The motivation of adding vhost-user vhost_dev_start support is to
> > improve backend configuration speed and reduce live migration VM
> > downtime.
> > 
> > Today VQ configuration is issued one by one. For virtio net with
> > multi-queue support, backend needs to update RSS (Receive side
> > scaling) on every rx queue enable. Updating RSS is time-consuming
> > (typical time like 7ms).
> > 
> > Implement already defined vhost status and message in the vhost
> > specification [1].
> > (a) VHOST_USER_PROTOCOL_F_STATUS
> > (b) VHOST_USER_SET_STATUS
> > (c) VHOST_USER_GET_STATUS
> > 
> > Send message VHOST_USER_SET_STATUS with VIRTIO_CONFIG_S_DRIVER_OK for
> > device start and reset(0) for device stop.
> > 
> > On reception of the DRIVER_OK message, backend can apply the needed setting
> > only once (instead of incremental) and also utilize parallelism on enabling
> > queues.
> > 
> > This improves QEMU's live migration downtime with vhost user backend
> > implementation by great margin, specially for the large number of VQs of 64
> > from 800 msec to 250 msec.
> > 
> > Another change is to move the device start routines after finishing all the
> > necessary device and VQ configuration, further aligning to the virtio
> > specification for "device initialization sequence".
> > 
> > [1] https://qemu-project.gitlab.io/qemu/interop/vhost-user.html#introduction
> 
> 
> This patchset seems to trip up ubsan.
> https://gitlab.com/mitsirkin/qemu/-/pipelines/684763327/failures
> 
> 
> specifially:
> 
> passes before this patchset:
> https://gitlab.com/mitsirkin/qemu/-/jobs/3269302594
> 
> fails with this patchset:
> https://gitlab.com/mitsirkin/qemu/-/pipelines/684763327/failures
> 
> (there's one patch on top but it seems unrelated)
> 

And this is with just this patchset:
https://gitlab.com/mitsirkin/qemu/-/pipelines/685419082/failures
in fact it's just the 1st patch:
https://gitlab.com/mitsirkin/qemu/-/pipelines/685417959/failures

log here:
https://gitlab.com/mitsirkin/qemu/-/jobs/3273601845

emu-system-arm: Failed to write msg. Wrote -1 instead of 20.
qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
qemu-system-arm: Failed to set msg fds.
qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
qemu-system-arm: -chardev socket,id=chr-reconnect,path=/tmp/vhost-test-U5G0U1/reconnect.sock,server=on: info: QEMU waiting for connection on: disconnected:unix:/tmp/vhost-test-U5G0U1/reconnect.sock,server=on
qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
qemu-system-arm: Failed to set msg fds.
qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
qemu-system-arm: -chardev socket,id=chr-connect-fail,path=/tmp/vhost-test-CN7ZU1/connect-fail.sock,server=on: info: QEMU waiting for connection on: disconnected:unix:/tmp/vhost-test-CN7ZU1/connect-fail.sock,server=on
qemu-system-arm: -netdev vhost-user,id=hs0,chardev=chr-connect-fail,vhostforce=on: Failed to read msg header. Read 0 instead of 12. Original request 1.
qemu-system-arm: -netdev vhost-user,id=hs0,chardev=chr-connect-fail,vhostforce=on: vhost_backend_init failed: Protocol error
qemu-system-arm: -netdev vhost-user,id=hs0,chardev=chr-connect-fail,vhostforce=on: failed to init vhost_net for queue 0
qemu-system-arm: -netdev vhost-user,id=hs0,chardev=chr-connect-fail,vhostforce=on: info: QEMU waiting for connection on: disconnected:unix:/tmp/vhost-test-CN7ZU1/connect-fail.sock,server=on
qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
qemu-system-arm: Failed to set msg fds.
qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
qemu-system-arm: -chardev socket,id=chr-flags-mismatch,path=/tmp/vhost-test-4KRYU1/flags-mismatch.sock,server=on: info: QEMU waiting for connection on: disconnected:unix:/tmp/vhost-test-4KRYU1/flags-mismatch.sock,server=on
qemu-system-arm: Failed to write msg. Wrote -1 instead of 52.
qemu-system-arm: vhost_set_mem_table failed: Invalid argument (22)
qemu-system-arm: Failed to set msg fds.
qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
UndefinedBehaviorSanitizer:DEADLYSIGNAL
==8621==ERROR: UndefinedBehaviorSanitizer: SEGV on unknown address 0x000000000000 (pc 0x55c91aca0620 bp 0x000000000000 sp 0x7ffd150b8600 T8621)
==8621==The signal is caused by a READ memory access.
==8621==Hint: address points to the zero page.
    #0 0x55c91aca0620 in ldl_he_p /builds/mitsirkin/qemu/include/qemu/bswap.h:301:5
    #1 0x55c91aca0620 in ldn_he_p /builds/mitsirkin/qemu/include/qemu/bswap.h:440:1
    #2 0x55c91aca0620 in flatview_write_continue /builds/mitsirkin/qemu/build/../softmmu/physmem.c:2824:19
    #3 0x55c91ac9da91 in flatview_write /builds/mitsirkin/qemu/build/../softmmu/physmem.c:2867:12
    #4 0x55c91ac9da91 in address_space_write /builds/mitsirkin/qemu/build/../softmmu/physmem.c:2963:18
    #5 0x55c91ac9e857 in address_space_unmap /builds/mitsirkin/qemu/build/../softmmu/physmem.c:3306:9
    #6 0x55c91ac461ec in vhost_memory_unmap /builds/mitsirkin/qemu/build/../hw/virtio/vhost.c:342:9
    #7 0x55c91ac461ec in vhost_virtqueue_stop /builds/mitsirkin/qemu/build/../hw/virtio/vhost.c:1242:5
    #8 0x55c91ac46484 in vhost_dev_stop /builds/mitsirkin/qemu/build/../hw/virtio/vhost.c:1882:9
    #9 0x55c91a664cc4 in vhost_net_stop_one /builds/mitsirkin/qemu/build/../hw/net/vhost_net.c:329:5
    #10 0x55c91a6646a6 in vhost_net_start /builds/mitsirkin/qemu/build/../hw/net/vhost_net.c:402:13
    #11 0x55c91abdfda6 in virtio_net_vhost_status /builds/mitsirkin/qemu/build/../hw/net/virtio-net.c:297:13
    #12 0x55c91abdfda6 in virtio_net_set_status /builds/mitsirkin/qemu/build/../hw/net/virtio-net.c:378:5
    #13 0x55c91ac322a9 in virtio_set_status /builds/mitsirkin/qemu/build/../hw/virtio/virtio.c:2442:9
    #14 0x55c91a7f69a0 in virtio_mmio_write /builds/mitsirkin/qemu/build/../hw/virtio/virtio-mmio.c:428:9
    #15 0x55c91ac882b6 in memory_region_write_accessor /builds/mitsirkin/qemu/build/../softmmu/memory.c:492:5
    #16 0x55c91ac8809a in access_with_adjusted_size /builds/mitsirkin/qemu/build/../softmmu/memory.c:554:18
    #17 0x55c91ac87e3d in memory_region_dispatch_write /builds/mitsirkin/qemu/build/../softmmu/memory.c
    #18 0x55c91aca0661 in flatview_write_continue /builds/mitsirkin/qemu/build/../softmmu/physmem.c:2825:23
    #19 0x55c91ac9da91 in flatview_write /builds/mitsirkin/qemu/build/../softmmu/physmem.c:2867:12
    #20 0x55c91ac9da91 in address_space_write /builds/mitsirkin/qemu/build/../softmmu/physmem.c:2963:18
    #21 0x55c91aca4766 in qtest_process_command /builds/mitsirkin/qemu/build/../softmmu/qtest.c
    #22 0x55c91aca3bfd in qtest_process_inbuf /builds/mitsirkin/qemu/build/../softmmu/qtest.c:796:9
    #23 0x55c91aedd672 in tcp_chr_read /builds/mitsirkin/qemu/build/../chardev/char-socket.c:508:13
    #24 0x7f199db120ae in g_main_context_dispatch (/lib64/libglib-2.0.so.0+0x550ae)
    #25 0x55c91afcfd2c in glib_pollfds_poll /builds/mitsirkin/qemu/build/../util/main-loop.c:297:9
    #26 0x55c91afcfd2c in os_host_main_loop_wait /builds/mitsirkin/qemu/build/../util/main-loop.c:320:5
    #27 0x55c91afcfd2c in main_loop_wait /builds/mitsirkin/qemu/build/../util/main-loop.c:596:11
    #28 0x55c91a826d36 in qemu_main_loop /builds/mitsirkin/qemu/build/../softmmu/runstate.c:739:9
    #29 0x55c91a3df4e5 in qemu_default_main /builds/mitsirkin/qemu/build/../softmmu/main.c:37:14
    #30 0x7f199b85aeaf in __libc_start_call_main (/lib64/libc.so.6+0x3feaf)
    #31 0x7f199b85af5f in __libc_start_main@GLIBC_2.2.5 (/lib64/libc.so.6+0x3ff5f)
    #32 0x55c91a3b6084 in _start (/builds/mitsirkin/qemu/build/qemu-system-arm+0xc16084)
UndefinedBehaviorSanitizer can not provide additional info.
SUMMARY: UndefinedBehaviorSanitizer: SEGV /builds/mitsirkin/qemu/include/qemu/bswap.h:301:5 in ldl_he_p
==8621==ABORTING
Broken pipe
../tests/qtest/libqtest.c:179: kill_qemu() tried to terminate QEMU process but encountered exit status 1 (expected 0)
**
ERROR:../tests/qtest/qos-test.c:191:subprocess_run_one_test: child process (/arm/virt/virtio-mmio/virtio-bus/virtio-net-device/virtio-net/virtio-net-tests/vhost-user/flags-mismatch/subprocess [8612]) failed unexpectedly
(test program exited with status code -6)







> Seems hard to debug, only reproduced under gitlab though Stefan reports
> reproducing this locally.
> I'm thinking of dropping this patchset for now, deferring to next
> release - thoughts?
> 
> 
> 
> > v3:
> > - rebase
> > 
> > v2:
> > - add setting status bit VIRTIO_CONFIG_S_FEATURES_OK
> > - avoid adding status bits already set
> > 
> > Yajun Wu (2):
> >   vhost: Change the sequence of device start
> >   vhost-user: Support vhost_dev_start
> > 
> >  hw/block/vhost-user-blk.c | 18 ++++++----
> >  hw/net/vhost_net.c        | 12 +++----
> >  hw/virtio/vhost-user.c    | 74 ++++++++++++++++++++++++++++++++++++++-
> >  3 files changed, 90 insertions(+), 14 deletions(-)
> > 
> > -- 
> > 2.27.0


