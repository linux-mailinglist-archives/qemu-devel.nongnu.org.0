Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1F0617DF6
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 14:32:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqaKG-00061O-Dq; Thu, 03 Nov 2022 09:32:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oqaKD-0005zW-NW
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 09:32:05 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oqaKA-0000ge-9V
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 09:32:05 -0400
Received: by mail-wr1-x432.google.com with SMTP id v1so2758222wrt.11
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 06:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DmPebXKIXSAybjAMxkQ6F59pOZx/Q7tQrrRqNhLKxUM=;
 b=G8hfzdBWQ4rUEp0Zjwx0aZFITMp7AeENJR3YgmA5Ym73ssAU2bmKgnMFBZT6x5Uc+V
 zAgY4mvHwCjYkDL60rmyDmgx0xSA1oyO9pDvw1DNDyDY4H5rndY3tRBkI0MuONz57Mh5
 D3BrBgQn6DRcAFwyjjndpAWXKNyjxjyZXtWj+lxpWucav3tZtjfeMtCYXe8ls5ZJLbQq
 MFzXpKQCXA3DGX1UZ30KgBcf1fuEn5TLnMuXBHrpIj3FyBi4EDHhzKO2DG08WuyPVkc8
 RbMm8jHTLG+dUjzrK2u90OOcOhmvgH1RY73LejfwoEIH84JubampyGBhviEtoAuc/VwK
 ZPPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DmPebXKIXSAybjAMxkQ6F59pOZx/Q7tQrrRqNhLKxUM=;
 b=aigoj+GZFBDm7rsbEYy6I8rQ9FxjZkVMramqbty5tNkV6ym1USGRp2VzSPCysiQcS+
 0PWvVvgdctHhXa75knlNz6AfDMnAVrJYas6RrA/5AGqmzEUaM0FMqau+gJSUuEkv9GlM
 q+3KLJyFXqht+L8pnNiirOiuYDxMxib26pq7nPlQJdoIecMWYwHtCnUMIRU4O0KNMf6w
 CWg29yvxPQ+buHR+kiaUNAjXg7P63sIJGqyJjSZBRnwN771PgPltMdJzr21jrORtLnuq
 6XcCj1kEC3HLTrKL5lT0vHEmcAQDSdYdzSQXLE4lHI1JHWp2Zs+vNeczZbK48dYIW8PB
 RgMg==
X-Gm-Message-State: ACrzQf1RwicsE3N1mynRrAjH9tUCvSFQRccMurHFzFsFo+lz8znNMHDy
 VKLAhnBoxAmfOLjVPJ+YBMKqiw==
X-Google-Smtp-Source: AMsMyM73dOtVtzu7kARNjnSD70QyRU9EKVLIDbbBLNnYNrr9avvmOIzKJ5oRxiyGnI2plBVT8wvcSQ==
X-Received: by 2002:a5d:494f:0:b0:236:a691:676c with SMTP id
 r15-20020a5d494f000000b00236a691676cmr19403353wrs.51.1667482320134; 
 Thu, 03 Nov 2022 06:32:00 -0700 (PDT)
Received: from [192.168.157.175] (97.red-88-29-176.dynamicip.rima-tde.net.
 [88.29.176.97]) by smtp.gmail.com with ESMTPSA id
 p14-20020a5d4e0e000000b0022cc6b8df5esm907844wrt.7.2022.11.03.06.31.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 06:31:59 -0700 (PDT)
Message-ID: <2821393d-21fe-cb7b-1396-dac6fe4dfa6b@linaro.org>
Date: Thu, 3 Nov 2022 14:31:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PULL v2 00/82] pci,pc,virtio: features, tests, fixes, cleanups
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20221102160336.616599-1-mst@redhat.com> <Y2LJX2HHiHpiKzKd@fedora>
 <20221103081148-mutt-send-email-mst@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221103081148-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 3/11/22 13:13, Michael S. Tsirkin wrote:
> On Wed, Nov 02, 2022 at 03:47:43PM -0400, Stefan Hajnoczi wrote:
>> On Wed, Nov 02, 2022 at 12:02:14PM -0400, Michael S. Tsirkin wrote:
>>> Changes from v1:
>>>
>>> Applied and squashed fixes by Igor, Lei He, Hesham Almatary for
>>> bugs that tripped up the pipeline.
>>> Updated expected files for core-count test.
>>
>> Several "make check" CI failures have occurred. They look like they are
>> related. Here is one (see the URLs at the bottom of this email for more
>> details):
>>
>> 17/106 ERROR:../tests/qtest/qos-test.c:191:subprocess_run_one_test: child process (/arm/virt/virtio-mmio/virtio-bus/virtio-net-device/virtio-net/virtio-net-tests/vhost-user/flags-mismatch/subprocess [8609]) failed unexpectedly ERROR
>>   17/106 qemu:qtest+qtest-arm / qtest-arm/qos-test                     ERROR          31.44s   killed by signal 6 SIGABRT
>>>>> G_TEST_DBUS_DAEMON=/builds/qemu-project/qemu/tests/dbus-vmstate-daemon.sh MALLOC_PERTURB_=49 QTEST_QEMU_IMG=./qemu-img QTEST_QEMU_BINARY=./qemu-system-arm QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon /builds/qemu-project/qemu/build/tests/qtest/qos-test --tap -k
>> ――――――――――――――――――――――――――――――――――――― ✀  ―――――――――――――――――――――――――――――――――――――
>> stderr:
>> qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
>> qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
>> qemu-system-arm: Failed to set msg fds.
>> qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
>> qemu-system-arm: -chardev socket,id=chr-reconnect,path=/tmp/vhost-test-6PT2U1/reconnect.sock,server=on: info: QEMU waiting for connection on: disconnected:unix:/tmp/vhost-test-6PT2U1/reconnect.sock,server=on
>> qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
>> qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
>> qemu-system-arm: Failed to set msg fds.
>> qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
>> qemu-system-arm: -chardev socket,id=chr-connect-fail,path=/tmp/vhost-test-H8G7U1/connect-fail.sock,server=on: info: QEMU waiting for connection on: disconnected:unix:/tmp/vhost-test-H8G7U1/connect-fail.sock,server=on
>> qemu-system-arm: -netdev vhost-user,id=hs0,chardev=chr-connect-fail,vhostforce=on: Failed to read msg header. Read 0 instead of 12. Original request 1.
>> qemu-system-arm: -netdev vhost-user,id=hs0,chardev=chr-connect-fail,vhostforce=on: vhost_backend_init failed: Protocol error
>> qemu-system-arm: -netdev vhost-user,id=hs0,chardev=chr-connect-fail,vhostforce=on: failed to init vhost_net for queue 0
>> qemu-system-arm: -netdev vhost-user,id=hs0,chardev=chr-connect-fail,vhostforce=on: info: QEMU waiting for connection on: disconnected:unix:/tmp/vhost-test-H8G7U1/connect-fail.sock,server=on
>> qemu-system-arm: Failed to write msg. Wrote -1 instead of 20.
>> qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
>> qemu-system-arm: Failed to set msg fds.
>> qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
>> qemu-system-arm: -chardev socket,id=chr-flags-mismatch,path=/tmp/vhost-test-94UYU1/flags-mismatch.sock,server=on: info: QEMU waiting for connection on: disconnected:unix:/tmp/vhost-test-94UYU1/flags-mismatch.sock,server=on
>> qemu-system-arm: Failed to write msg. Wrote -1 instead of 52.
>> qemu-system-arm: vhost_set_mem_table failed: Invalid argument (22)
>> qemu-system-arm: Failed to set msg fds.
>> qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
>> UndefinedBehaviorSanitizer:DEADLYSIGNAL
>> ==8618==ERROR: UndefinedBehaviorSanitizer: SEGV on unknown address 0x000000000000 (pc 0x55e34deccab0 bp 0x000000000000 sp 0x7ffc94894710 T8618)
>> ==8618==The signal is caused by a READ memory access.
>> ==8618==Hint: address points to the zero page.
>>      #0 0x55e34deccab0 in ldl_he_p /builds/qemu-project/qemu/include/qemu/bswap.h:301:5
>>      #1 0x55e34deccab0 in ldn_he_p /builds/qemu-project/qemu/include/qemu/bswap.h:440:1
>>      #2 0x55e34deccab0 in flatview_write_continue /builds/qemu-project/qemu/build/../softmmu/physmem.c:2824:19
>>      #3 0x55e34dec9f21 in flatview_write /builds/qemu-project/qemu/build/../softmmu/physmem.c:2867:12
>>      #4 0x55e34dec9f21 in address_space_write /builds/qemu-project/qemu/build/../softmmu/physmem.c:2963:18
>>      #5 0x55e34decace7 in address_space_unmap /builds/qemu-project/qemu/build/../softmmu/physmem.c:3306:9
>>      #6 0x55e34de6d4ec in vhost_memory_unmap /builds/qemu-project/qemu/build/../hw/virtio/vhost.c:342:9
>>      #7 0x55e34de6d4ec in vhost_virtqueue_stop /builds/qemu-project/qemu/build/../hw/virtio/vhost.c:1242:5
>>      #8 0x55e34de72904 in vhost_dev_stop /builds/qemu-project/qemu/build/../hw/virtio/vhost.c:1882:9
>>      #9 0x55e34d890514 in vhost_net_stop_one /builds/qemu-project/qemu/build/../hw/net/vhost_net.c:331:5
>>      #10 0x55e34d88fef6 in vhost_net_start /builds/qemu-project/qemu/build/../hw/net/vhost_net.c:404:13
>>      #11 0x55e34de0bec6 in virtio_net_vhost_status /builds/qemu-project/qemu/build/../hw/net/virtio-net.c:307:13
>>      #12 0x55e34de0bec6 in virtio_net_set_status /builds/qemu-project/qemu/build/../hw/net/virtio-net.c:388:5
>>      #13 0x55e34de5e409 in virtio_set_status /builds/qemu-project/qemu/build/../hw/virtio/virtio.c:2442:9
>>      #14 0x55e34da22a50 in virtio_mmio_write /builds/qemu-project/qemu/build/../hw/virtio/virtio-mmio.c:428:9
>>      #15 0x55e34deb44a6 in memory_region_write_accessor /builds/qemu-project/qemu/build/../softmmu/memory.c:493:5
>>      #16 0x55e34deb428a in access_with_adjusted_size /builds/qemu-project/qemu/build/../softmmu/memory.c:555:18
>>      #17 0x55e34deb402d in memory_region_dispatch_write /builds/qemu-project/qemu/build/../softmmu/memory.c
>>      #18 0x55e34deccaf1 in flatview_write_continue /builds/qemu-project/qemu/build/../softmmu/physmem.c:2825:23
>>      #19 0x55e34dec9f21 in flatview_write /builds/qemu-project/qemu/build/../softmmu/physmem.c:2867:12
>>      #20 0x55e34dec9f21 in address_space_write /builds/qemu-project/qemu/build/../softmmu/physmem.c:2963:18
>>      #21 0x55e34ded0bf6 in qtest_process_command /builds/qemu-project/qemu/build/../softmmu/qtest.c
>>      #22 0x55e34ded008d in qtest_process_inbuf /builds/qemu-project/qemu/build/../softmmu/qtest.c:796:9
>>      #23 0x55e34e109b02 in tcp_chr_read /builds/qemu-project/qemu/build/../chardev/char-socket.c:508:13
>>      #24 0x7fc6c665d0ae in g_main_context_dispatch (/lib64/libglib-2.0.so.0+0x550ae)
>>      #25 0x55e34e1fc1bc in glib_pollfds_poll /builds/qemu-project/qemu/build/../util/main-loop.c:297:9
>>      #26 0x55e34e1fc1bc in os_host_main_loop_wait /builds/qemu-project/qemu/build/../util/main-loop.c:320:5
>>      #27 0x55e34e1fc1bc in main_loop_wait /builds/qemu-project/qemu/build/../util/main-loop.c:596:11
>>      #28 0x55e34da52de6 in qemu_main_loop /builds/qemu-project/qemu/build/../softmmu/runstate.c:739:9
>>      #29 0x55e34d60a4f5 in qemu_default_main /builds/qemu-project/qemu/build/../softmmu/main.c:37:14
>>      #30 0x7fc6c43a5eaf in __libc_start_call_main (/lib64/libc.so.6+0x3feaf)
>>      #31 0x7fc6c43a5f5f in __libc_start_main@GLIBC_2.2.5 (/lib64/libc.so.6+0x3ff5f)
>>      #32 0x55e34d5e1094 in _start (/builds/qemu-project/qemu/build/qemu-system-arm+0xc17094)
>> UndefinedBehaviorSanitizer can not provide additional info.
>> SUMMARY: UndefinedBehaviorSanitizer: SEGV /builds/qemu-project/qemu/include/qemu/bswap.h:301:5 in ldl_he_p
>> ==8618==ABORTING
>> Broken pipe
>> ../tests/qtest/libqtest.c:179: kill_qemu() tried to terminate QEMU process but encountered exit status 1 (expected 0)
>> **
>> ERROR:../tests/qtest/qos-test.c:191:subprocess_run_one_test: child process (/arm/virt/virtio-mmio/virtio-bus/virtio-net-device/virtio-net/virtio-net-tests/vhost-user/flags-mismatch/subprocess [8609]) failed unexpectedly
>> (test program exited with status code -6)
>>
>> https://gitlab.com/qemu-project/qemu/-/jobs/3265209698
>> https://gitlab.com/qemu-project/qemu/-/pipelines/683909108
>>
>> Stefan
> 
> 
> Ugh. I need to build with ubsan to reproduce yes? didn't trigger for me
> I am wondering how to bisect on gitlab.

GitLab build within a container, you can pull it and run within it
locally. Per https://gitlab.com/qemu-project/qemu/-/jobs/3265209698#L23

Using Docker executor with image 
registry.gitlab.com/qemu-project/[MASKED]/fedora:latest ...
Using docker image 
sha256:3a352388ce66a26d125a580b1a09c8c9884e47caac07a36dda834f8e3b3fff97 
for registry.gitlab.com/qemu-project/[MASKED]/fedora:latest with digest 
registry.gitlab.com/qemu-project/[MASKED]/fedora@sha256:d6d20c1c6aede3a652eb01b781530cc10392de2764503c84f9bf4eb1d7a89d26 
...

To pull this image:

$ docker pull registry.gitlab.com/qemu-project/qemu/fedora:latest

(or to be sure to pull the very same:)

$ docker pull 
registry.gitlab.com/qemu-project/qemu/fedora:d6d20c1c6aede3a652eb01b781530cc10392de2764503c84f9bf4eb1d7a89d26

Then you can reproduce the same build steps within a container instance.

Regards,

Phil.

