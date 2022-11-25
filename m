Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D643363895B
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 13:08:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyXTJ-0004nQ-W7; Fri, 25 Nov 2022 07:06:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oyXSs-0004Zo-51
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 07:06:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oyXSk-0006px-7T
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 07:05:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669377943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f14Roe61rOQhUNaz54CYVqbQAmzby0UvKuMw8EV1jN4=;
 b=WN7LaUer5mb0AyQIGYyvdXPHLVzERZTZZpy5rL9Z7bCIFTjyAB+5sGYc8jvuE7/oMYpHLv
 YWm6cADbjWx0lZ41WvBv/7TqcmHsH7k5d0hsK1VlQTCtCg4cZ/2V6ZnXN/1UuPNPUQdkBI
 3NLoqetaO0V0UV7RG52gXroge0Z9YQA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-128-tz78xx4JM8O8lfe57B7hfA-1; Fri, 25 Nov 2022 07:05:41 -0500
X-MC-Unique: tz78xx4JM8O8lfe57B7hfA-1
Received: by mail-wr1-f69.google.com with SMTP id
 d8-20020adf9b88000000b0024207f09827so192391wrc.20
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 04:05:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f14Roe61rOQhUNaz54CYVqbQAmzby0UvKuMw8EV1jN4=;
 b=r23Ci2T1IEuQ4BJ3+sETm3EStJu7vSiSiH73WXqydCf0N0PCwT+kR78l60/eYMByFy
 aDWtTLeU81/cSu9ZoZfQOwmjCP7TvQbap7vKM3OsNfwvCZ9zjUKYpkA0HEoPHFjXDX2j
 rOlkCULNLysMp89/PSu98n6zHkggyZpt56WL/VE+8QmF4yk+TalhocQ+5tkmmltXGcHi
 eARMww2zkQ/u9hCpRb8q17ryysoF8WpVjmEmyKUYCnhyxl/qgc9cEqhMnFNDEq5jUy1P
 vvn/hY7syNLHHVdxxu2vWAQbe0aqayQUrcD0SVLawC2yOHkFzF2ZG0ekf8NG2FK8/GR0
 qYXw==
X-Gm-Message-State: ANoB5pkyWyU/0YV/Op8huKWIEIkDB4vCVpaQad5ooosjjfkplDarW7nh
 VZiNKlqrU9EDjjF5XsEgZbFH/uEtPLm++SzblSBCHNmOLW/yO531EAfNcqDT7jDt/Wee8lVGN/O
 mp2G0hCri+fqBNvk=
X-Received: by 2002:adf:f60d:0:b0:22e:d91a:231b with SMTP id
 t13-20020adff60d000000b0022ed91a231bmr23731792wrp.78.1669377940579; 
 Fri, 25 Nov 2022 04:05:40 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4x15y4hgoLPm6SckY+uu4GXtHuoMOrEuqc+Tk5hrj9OYTbu6y6iGuYyDLd/jE+yZF4F5rSbA==
X-Received: by 2002:adf:f60d:0:b0:22e:d91a:231b with SMTP id
 t13-20020adff60d000000b0022ed91a231bmr23731757wrp.78.1669377940155; 
 Fri, 25 Nov 2022 04:05:40 -0800 (PST)
Received: from redhat.com ([2.52.16.74]) by smtp.gmail.com with ESMTPSA id
 bd9-20020a05600c1f0900b003c6bd12ac27sm5092705wmb.37.2022.11.25.04.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 04:05:39 -0800 (PST)
Date: Fri, 25 Nov 2022 07:05:36 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, slp@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org
Subject: Re: [PATCH for 7.2-rc3  v1 0/2] virtio fixes
Message-ID: <20221125070510-mutt-send-email-mst@kernel.org>
References: <20221123152134.179929-1-alex.bennee@linaro.org>
 <20221123102522-mutt-send-email-mst@kernel.org>
 <87bkoxbqtd.fsf@linaro.org>
 <20221123110755-mutt-send-email-mst@kernel.org>
 <877czkbtbs.fsf@linaro.org>
 <20221124055230-mutt-send-email-mst@kernel.org>
 <87y1s09edk.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87y1s09edk.fsf@linaro.org>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Nov 24, 2022 at 10:24:14PM +0000, Alex Bennée wrote:
> 
> "Michael S. Tsirkin" <mst@redhat.com> writes:
> 
> > On Thu, Nov 24, 2022 at 09:21:15AM +0000, Alex Bennée wrote:
> >> 
> >> "Michael S. Tsirkin" <mst@redhat.com> writes:
> >> 
> >> > On Wed, Nov 23, 2022 at 04:03:49PM +0000, Alex Bennée wrote:
> >> >> 
> >> >> "Michael S. Tsirkin" <mst@redhat.com> writes:
> >> >> 
> >> >> > On Wed, Nov 23, 2022 at 03:21:32PM +0000, Alex Bennée wrote:
> >> >> >> Hi,
> >> >> >> 
> >> >> >> This hopefully fixes the problems with VirtIO migration caused by the
> >> >> >> previous refactoring of virtio_device_started(). That introduced a
> >> >> >> different order of checking which didn't give the VM state primacy but
> >> >> >> wasn't noticed as we don't properly exercise VirtIO device migration
> >> >> >> and caused issues when dev->started wasn't checked in the core code.
> >> >> >> The introduction of virtio_device_should_start() split the overloaded
> >> >> >> function up but the broken order still remained. The series finally
> >> >> >> fixes that by restoring the original semantics but with the cleaned up
> >> >> >> functions.
> >> >> >> 
> >> >> >> I've added more documentation to the various structures involved as
> >> >> >> well as the functions. There is still some inconsistencies in the
> >> >> >> VirtIO code between different devices but I think that can be looked
> >> >> >> at over the 8.0 cycle.
> >> >> >
> >> >> >
> >> >> > Thanks a lot! Did you try this with gitlab CI? A patch similar to your
> >> >> > 2/2 broke it previously ...
> >> >> 
> >> >> Looking into it now - so far hasn't broken locally but I guess there is
> >> >> something different about the CI.
> >> >
> >> >
> >> > yes - pls push to gitlab, create pipeline e.g. with QEMU_CI set to 2
> >> >
> >> > Or with QEMU_CI set to 1 and then run fedora container and then
> >> > clang-system manually.
> >> 
> >> I'm having trouble re-creating the failures in CI locally on my boxen. I
> >> have triggered a bug on s390 but that looks like a pre-existing problem
> >> with VRING_SET_ENDIAN being triggered for the vhost-user-gpio tests. I
> >> think that is a limitation of the test harness.
> >> 
> >> Will keep looking.
> >
> > Why not just trigger it on gitlab CI - it's very repeatable there?
> 
> I can repeat a problem locally on Debian Bullseye and Ubuntu 22.04 with clang and leak sanitizer:
> 
>   # QEMU configure log Thu 24 Nov 16:02:56 GMT 2022
>   # Configured with: '../../configure' '--cc=clang' '--cxx=clang++' '--enable-sanitizers' '--target-list=arm-softmmu,aarch64-softmmu,i386-softmmu,x86_64-softmmu,ppc64-softmmu'#
> 
> And the command:
> 
>   env QTEST_QEMU_BINARY=./qemu-system-arm QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon QTEST_QEMU_IMG=./qemu-img MALLOC_PERTURB_=178 G_TEST_DBUS_DAEMON=/home/alex.bennee/lsrc/qemu.git/tests/dbus-vmstate-daemon.sh ./tests/qtest/qos-test -p /arm/virt/virtio-mmio/virtio-bus/vhost-user-gpio-device/vhost-user-gpio/vhost-user-gpio-tests/read-guest-mem/memfile/subprocess
> 
> Gives the following failure, while a leak may not be that exciting it
> does point to a potential corruption issue. Unfortunately I don't get a
> decent backtrace from the tool:
> 
>   # random seed: R02S071fe8d68317a8b01e5e7fadbf1ac60a
>   # starting QEMU: exec ./qemu-system-arm -qtest unix:/tmp/qtest-1024352.sock -qtest-log /dev/null -chardev socket,path=/tmp/qtest-1024352.qmp,id=char0 -mon chardev=char0,mode=control -display none -machine none -accel qtest
>   ==1024354==WARNING: ASan doesn't fully support makecontext/swapcontext functions and may produce false positives in some cases!
>   # Start of arm tests
>   # Start of virt tests
>   # Start of virtio-mmio tests
>   # Start of virtio-bus tests
>   # Start of vhost-user-gpio-device tests
>   # Start of vhost-user-gpio tests
>   # Start of vhost-user-gpio-tests tests
>   # Start of read-guest-mem tests
>   # Start of memfile tests
>   # starting QEMU: exec ./qemu-system-arm -qtest unix:/tmp/qtest-1024352.sock -qtest-log /dev/null -chardev socket,path=/tmp/qtest-1024352.qmp,id=char0 -mon chardev=char0,mode=control -display none -M virt  -device vhost-user-gpio-device,id=gpio0,chardev=chr-vhost-user-test -m 256 -object memory-backend-memfd,id=mem,size=256M, -numa node,memdev=mem -chardev socket,id=chr-vhost-user-test,path=/tmp/vhost-test-8DD2V1/vhost-user-test.sock -accel qtest
>   # GLib-DEBUG: setenv()/putenv() are not thread-safe and should not be used after threads are created
>   ==1024371==WARNING: ASan doesn't fully support makecontext/swapcontext functions and may produce false positives in some cases!
>   # set_protocol_features: 0x200
>   # set_owner: start of session
>   # vhost-user: un-handled message: 14
>   # vhost-user: un-handled message: 14
>   # set_vring_num: 0/1024
>   qemu-system-arm: Failed to set msg fds.
>   qemu-system-arm: vhost VQ 0 ring restore failed: -22: Invalid argument (22)
>   qemu-system-arm: Failed to set msg fds.
>   qemu-system-arm: vhost VQ 1 ring restore failed: -22: Invalid argument (22)
>   qemu-system-arm: Failed to set msg fds.
>   qemu-system-arm: vhost_set_vring_call failed: Invalid argument (22)
>   qemu-system-arm: Failed to set msg fds.
>   qemu-system-arm: vhost_set_vring_call failed: Invalid argument (22)
>   ok 1 /arm/virt/virtio-mmio/virtio-bus/vhost-user-gpio-device/vhost-user-gpio/vhost-user-gpio-tests/read-guest-mem/memfile/subprocess # SKIP No memory at address 0x0
>   # End of memfile tests
>   # End of read-guest-mem tests
>   # End of vhost-user-gpio-tests tests
>   # End of vhost-user-gpio tests
>   # End of vhost-user-gpio-device tests
>   # End of virtio-bus tests
>   # End of virtio-mmio tests
>   # End of virt tests
>   # End of arm tests
>   1..1
> 
>   =================================================================
>   ==1024371==ERROR: LeakSanitizer: detected memory leaks
> 
>   Direct leak of 240 byte(s) in 1 object(s) allocated from:
>       #0 0x561d9a5d7a18 in __interceptor_calloc (/home/alex.bennee/lsrc/qemu.git/builds/all.clang-sanitizers/qemu-system-arm+0x1d1fa18) (BuildId: 0bdc7c2ada2277089db16d57f17c314e9e53e41c)
>       #1 0x7f46ee656c40 in g_malloc0 (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0x5ec40) (BuildId: 0ab0b740e34eeb0c84656ba53737f4c440dfbed4)
>       #2 0x561d9bf7875b in virtio_device_realize /home/alex.bennee/lsrc/qemu.git/builds/all.clang-sanitizers/../../hw/virtio/virtio.c:4175:9
>       #3 0x561d9c321bf4 in device_set_realized /home/alex.bennee/lsrc/qemu.git/builds/all.clang-sanitizers/../../hw/core/qdev.c:566:13
>       #4 0x561d9c33dda8 in property_set_bool /home/alex.bennee/lsrc/qemu.git/builds/all.clang-sanitizers/../../qom/object.c:2285:5
>       #5 0x561d9c338fb3 in object_property_set /home/alex.bennee/lsrc/qemu.git/builds/all.clang-sanitizers/../../qom/object.c:1420:5
>       #6 0x561d9c344c7c in object_property_set_qobject /home/alex.bennee/lsrc/qemu.git/builds/all.clang-sanitizers/../../qom/qom-qobject.c:28:10
>       #7 0x561d9b367954 in qdev_device_add /home/alex.bennee/lsrc/qemu.git/builds/all.clang-sanitizers/../../softmmu/qdev-monitor.c:733:11
>       #8 0x561d9b36f832 in qemu_create_cli_devices /home/alex.bennee/lsrc/qemu.git/builds/all.clang-sanitizers/../../softmmu/vl.c:2536:5
>       #9 0x561d9b36f832 in qmp_x_exit_preconfig /home/alex.bennee/lsrc/qemu.git/builds/all.clang-sanitizers/../../softmmu/vl.c:2604:5
>       #10 0x561d9b37613f in qemu_init /home/alex.bennee/lsrc/qemu.git/builds/all.clang-sanitizers/../../softmmu/vl.c:3601:9
>       #11 0x561d9a6125a5 in main /home/alex.bennee/lsrc/qemu.git/builds/all.clang-sanitizers/../../softmmu/main.c:47:5
> 
>   SUMMARY: AddressSanitizer: 240 byte(s) leaked in 1 allocation(s).
>   ../../tests/qtest/libqtest.c:179: kill_qemu() tried to terminate QEMU process but encountered exit status 1 (expected 0)
>   fish: Job 1, 'env QTEST_QEMU_BINARY=./qemu-sy…' terminated by signal SIGABRT (Abort)
>   🕙22:26:18 alex.bennee@hackbox2:qemu.git/builds/all.clang-sanitizers  on  for-7.2/virtio-fixes [$?] [⚡ IOT]
>   ✗


ok ... was gpio always like this? from 1st commit? if not bisect?

> 
> 
> >> >
> >> >> >
> >> >> >> Alex Bennée (2):
> >> >> >>   include/hw: attempt to document VirtIO feature variables
> >> >> >>   include/hw: VM state takes precedence in virtio_device_should_start
> >> >> >> 
> >> >> >>  include/hw/virtio/vhost.h  | 25 +++++++++++++++++++---
> >> >> >>  include/hw/virtio/virtio.h | 43 ++++++++++++++++++++++++++++++++------
> >> >> >>  2 files changed, 59 insertions(+), 9 deletions(-)
> >> >> >> 
> >> >> >> -- 
> >> >> >> 2.34.1
> >> >> 
> >> >> 
> >> >> -- 
> >> >> Alex Bennée
> >> 
> >> 
> >> -- 
> >> Alex Bennée
> 
> 
> -- 
> Alex Bennée


