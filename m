Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1F26A2AB6
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 17:33:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVxSw-0006x1-QV; Sat, 25 Feb 2023 11:32:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pVxSs-0006ua-BK
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 11:32:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pVxSo-0007lP-Kn
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 11:32:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677342712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kyeISwv7IHUwTe+cR1VHFTFAbHTCuDn7BzT16r1rNbY=;
 b=QoueXXvpT9eNjIwCZNIy3vyA4lVJdrAvgkNPPtkqzPvfwU8883j5/6MmiFmj1vkE+nGrAs
 NazJu7/Z3bLrwzka7hkcvw2n96HYp0tCCqsd5WiRutRF3hmWGrQZSbu/z0WtPzWsHSdPk5
 6vv7Do0fxVRSXJuYxxIkxVfAGuvJhCw=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-593-LLsbr7LIPM24GjP34QXyWA-1; Sat, 25 Feb 2023 11:31:50 -0500
X-MC-Unique: LLsbr7LIPM24GjP34QXyWA-1
Received: by mail-qk1-f197.google.com with SMTP id
 x5-20020a05620a01e500b007428997e800so872150qkn.10
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 08:31:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kyeISwv7IHUwTe+cR1VHFTFAbHTCuDn7BzT16r1rNbY=;
 b=2K+VvTsgXZ9bL/QhPIdMmPlvPo+jppW26mrhaYO4aKHDV34p4b84rTEq13J1jfDuCm
 diN0Cai+ZZkrqy+HKF1iILpe9Mp4BJMIcEIS+lTKwDzbke/pRP3LaLbucbVu3EYojasr
 JK8ELUuG4mZ1LqkQTRapmiAa2xAb3mdXlDxP4X8EYpetOT92yJTBAxrXeJf7luT5PDYQ
 ngricVmSoTq8ajYwqZfkOudn2L8Gc9nrZw4kEd1YMTvhyqZW3K2J7AqF/stOiJSdlMwP
 /7ryVH3UV7Ys6eSshWoCzrC1LSJUlFieXwnA29yhYIXqGIzI7Gv+W9pAmPA98/OH5Zrk
 qCMg==
X-Gm-Message-State: AO0yUKVV17mO6s+dFpPgC6J8XK3o+2iSD9oGWqRXbTbZ0juuiazWnnBo
 67MqeCk2zPyzAMxdLemvkoRGBsLDtSuPkwO+PmPIReePe2/Rq93tYNojKyZGV+EdXB/4/Dzw1ho
 pL1Etw0rwhgNClQh9vLsyY++CNAe78A4wSKWp9igR6aRyN9NFptL8F7SCxaVg63xtYQUQjw==
X-Received: by 2002:ac8:59c1:0:b0:3ba:1ace:8bae with SMTP id
 f1-20020ac859c1000000b003ba1ace8baemr38850565qtf.0.1677342704698; 
 Sat, 25 Feb 2023 08:31:44 -0800 (PST)
X-Google-Smtp-Source: AK7set/ih3wWFbW5hAUmMXwcauuKgbi2NLku4xI198ZYYXu603UUadRamD4KbVPKKwL+bG0FWesvoA==
X-Received: by 2002:ac8:59c1:0:b0:3ba:1ace:8bae with SMTP id
 f1-20020ac859c1000000b003ba1ace8baemr38850495qtf.0.1677342704176; 
 Sat, 25 Feb 2023 08:31:44 -0800 (PST)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca. [70.30.145.63])
 by smtp.gmail.com with ESMTPSA id
 t8-20020ac85888000000b003bb8c60cdf1sm1558142qta.78.2023.02.25.08.31.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 08:31:43 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Maxim Levitsky <mlevitsk@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Chuang Xu <xuchuangxclwt@bytedance.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 peterx@redhat.com
Subject: [PATCH RFC 0/4] memory: Fix (/ Discuss) a few rcu issues
Date: Sat, 25 Feb 2023 11:31:37 -0500
Message-Id: <20230225163141.1209368-1-peterx@redhat.com>
X-Mailer: git-send-email 2.39.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

[not for merging, but for discussion; this is something I found when
 looking at another issue on Chuang's optimization for migration downtime]

Summary: we tried to access memory_listeners, address_spaces, etc. in RCU
way.  However we didn't implement them with RCU-safety. This patchset is
trying to do that; at least making it closer.

NOTE!  It's doing it wrongly for now, so please feel free to see this as a
thread to start discussing this problem, as in subject.

The core problem here is how to make sure memory listeners will be freed in
RCU ways, per when unlinking them from the global memory_listeners list.

The current patchset (in patch 1) did it with drain_call_rcu(), but of
course it's wrong, because of at least two things:

  (1) drain_call_rcu() will release BQL; currently there's no way to me to
      guarantee that releasing BQL is safe here.

  (2) memory_listener_unregister() can be called within a RCU read lock
      itself (we're so happy to take rcu read lock in many places but we
      don't think much on how long it'll be taken; at least not as strict
      as the kernel variance, so we're just less care about that fact yet).
      It means, drain_call_rcu() should deadlock there waiting for itself.
      For an example, see Appendix A.

Side question to Stefan / Maxim: why do we need drain_call_rcu() and what's
its difference from synchronize_rcu() in API level besides releasing and
retaking BQL when taken?

I have a few solutions in mind, none of them look pretty, though.  Before
going further, I think I should raise this to the list and discuss.  The
good thing is I don't think the fix is urgently needed, because hitting the
bug should be very rare in real life (I do think we have yet another bug to
sometimes not taking RCU lock for memory_region_clear_dirty_bitmap too; see
patch 3, which I think is only used during virtio-mem / virtio-balloon
migrating).  However I think it should still be important to discuss this
or it'll be even harder to maintain in the future with more things piled
up.

Solution A
==========

We can logically release everything that contains a MemoryListener with
g_free_rcu() rather than g_free().  It can be actually quite
straightforward for some cases (e.g. VFIOContainer, where we can simply do
s/g_free/g_free_rcu/ with the two call sites), but not for some others
(vhost_dev, where there can be tons of other structures wrapping vhost_dev
and it's sometimes not straightforward when the object got freed).

Solution B
==========

Can we omit taking RCU read lock if we already hold BQL?  Logically it's
safe for most of the cases we're using RCU with BQL modifying the protected
strucuture, but it may have issue when we extend RCU to outside-BQL usages,
IOW, we may need to have a BQL-flavoured rcu_read_lock_bql() that we use to
reference things that will be protected by BQL, then replace most of the
RCU read locks in QEMU to use that, then I think maybe we can safely not
taking RCU read lock when BQL is taken, but I am really not that sure yet.

Thoughts?  Is there any better way to do so?  Or am I perhaps over worried?

Thanks,

Appendix A
==========

Sample of calling memory_listener_unregister() with both BQL & RCU held
(RCU held in address_space_write).

  3  0x0000562b8da6bd60 in memory_listener_unregister (listener=0x562b8feeae48) at ../softmmu/memory.c:3065
  4  0x0000562b8da1ad47 in virtio_device_unrealize (dev=0x562b8feead60) at ../hw/virtio/virtio.c:3631
  5  0x0000562b8db1e2f1 in device_set_realized (obj=0x562b8feead60, value=false, errp=0x562b8e617138 <error_abort>) at ../hw/core/qdev.c:599
  6  0x0000562b8db27e45 in property_set_bool (obj=0x562b8feead60, v=0x562b90715670, name=0x562b8dec2b19 "realized", opaque=0x562b8fc46070, errp=0x562b8e617138 <error_abort>)
     at ../qom/object.c:2285
  7  0x0000562b8db25e16 in object_property_set (obj=0x562b8feead60, name=0x562b8dec2b19 "realized", v=0x562b90715670, errp=0x562b8e617138 <error_abort>) at ../qom/object.c:1420
  8  0x0000562b8db2a2ad in object_property_set_qobject (obj=0x562b8feead60, name=0x562b8dec2b19 "realized", value=0x562b8ff09800, errp=0x562b8e617138 <error_abort>)
     at ../qom/qom-qobject.c:28
  9  0x0000562b8db26181 in object_property_set_bool (obj=0x562b8feead60, name=0x562b8dec2b19 "realized", value=false, errp=0x562b8e617138 <error_abort>) at ../qom/object.c:1489
  10 0x0000562b8db1d82a in qdev_unrealize (dev=0x562b8feead60) at ../hw/core/qdev.c:306
  11 0x0000562b8db1a500 in bus_set_realized (obj=0x562b8feeace0, value=false, errp=0x562b8e617138 <error_abort>) at ../hw/core/bus.c:205
  12 0x0000562b8db27e45 in property_set_bool (obj=0x562b8feeace0, v=0x562b90e71800, name=0x562b8dec21f8 "realized", opaque=0x562b908fc660, errp=0x562b8e617138 <error_abort>)
     at ../qom/object.c:2285
  13 0x0000562b8db25e16 in object_property_set (obj=0x562b8feeace0, name=0x562b8dec21f8 "realized", v=0x562b90e71800, errp=0x562b8e617138 <error_abort>) at ../qom/object.c:1420
  14 0x0000562b8db2a2ad in object_property_set_qobject (obj=0x562b8feeace0, name=0x562b8dec21f8 "realized", value=0x562b8ff097e0, errp=0x562b8e617138 <error_abort>)
     at ../qom/qom-qobject.c:28
  15 0x0000562b8db26181 in object_property_set_bool (obj=0x562b8feeace0, name=0x562b8dec21f8 "realized", value=false, errp=0x562b8e617138 <error_abort>) at ../qom/object.c:1489
  16 0x0000562b8db1a3eb in qbus_unrealize (bus=0x562b8feeace0) at ../hw/core/bus.c:179
  17 0x0000562b8db1e25f in device_set_realized (obj=0x562b8fee29a0, value=false, errp=0x562b8e617138 <error_abort>) at ../hw/core/qdev.c:593
  18 0x0000562b8db27e45 in property_set_bool (obj=0x562b8fee29a0, v=0x562b90e6eac0, name=0x562b8dec2b19 "realized", opaque=0x562b8fc46070, errp=0x562b8e617138 <error_abort>)
     at ../qom/object.c:2285
  19 0x0000562b8db25e16 in object_property_set (obj=0x562b8fee29a0, name=0x562b8dec2b19 "realized", v=0x562b90e6eac0, errp=0x562b8e617138 <error_abort>) at ../qom/object.c:1420
  20 0x0000562b8db2a2ad in object_property_set_qobject (obj=0x562b8fee29a0, name=0x562b8dec2b19 "realized", value=0x562b908fc800, errp=0x562b8e617138 <error_abort>)
     at ../qom/qom-qobject.c:28
  21 0x0000562b8db26181 in object_property_set_bool (obj=0x562b8fee29a0, name=0x562b8dec2b19 "realized", value=false, errp=0x562b8e617138 <error_abort>) at ../qom/object.c:1489
  22 0x0000562b8db1d82a in qdev_unrealize (dev=0x562b8fee29a0) at ../hw/core/qdev.c:306
  23 0x0000562b8d603a4a in acpi_pcihp_device_unplug_cb (hotplug_dev=0x562b90add210, s=0x562b90ade510, dev=0x562b8fee29a0, errp=0x562b8e617138 <error_abort>) at ../hw/acpi/pcihp.c:415
  24 0x0000562b8d601397 in piix4_device_unplug_cb (hotplug_dev=0x562b90add210, dev=0x562b8fee29a0, errp=0x562b8e617138 <error_abort>) at ../hw/acpi/piix4.c:394
  25 0x0000562b8db2265d in hotplug_handler_unplug (plug_handler=0x562b90add210, plugged_dev=0x562b8fee29a0, errp=0x562b8e617138 <error_abort>) at ../hw/core/hotplug.c:56
  26 0x0000562b8d603386 in acpi_pcihp_eject_slot (s=0x562b90ade510, bsel=0, slots=64) at ../hw/acpi/pcihp.c:251
  27 0x0000562b8d603e5f in pci_write (opaque=0x562b90ade510, addr=8, data=64, size=4) at ../hw/acpi/pcihp.c:528
  28 0x0000562b8da641cd in memory_region_write_accessor (mr=0x562b90adf120, addr=8, value=0x7fff5484aae8, size=4, shift=0, mask=4294967295, attrs=...) at ../softmmu/memory.c:493
  29 0x0000562b8da6441a in access_with_adjusted_size
      (addr=8, value=0x7fff5484aae8, size=4, access_size_min=1, access_size_max=4, access_fn=0x562b8da640d7 <memory_region_write_accessor>, mr=0x562b90adf120, attrs=...) at ../softmmu/memory5
  30 0x0000562b8da676ba in memory_region_dispatch_write (mr=0x562b90adf120, addr=8, data=64, op=MO_32, attrs=...) at ../softmmu/memory.c:1515
  31 0x0000562b8da752a4 in flatview_write_continue (fv=0x562b8fefc190, addr=44552, attrs=..., ptr=0x7fff5484ac64, len=4, addr1=8, l=4, mr=0x562b90adf120) at ../softmmu/physmem.c:2826
  32 0x0000562b8da75407 in flatview_write (fv=0x562b8fefc190, addr=44552, attrs=..., buf=0x7fff5484ac64, len=4) at ../softmmu/physmem.c:2868
  -Type <RET> for more, q to quit, c to continue without paging--
  33 0x0000562b8da757b7 in address_space_write (as=0x562b8e5f9f60 <address_space_io>, addr=44552, attrs=..., buf=0x7fff5484ac64, len=4) at ../softmmu/physmem.c:2964
  34 0x0000562b8da60ad9 in cpu_outl (addr=44552, val=64) at ../softmmu/ioport.c:80
  35 0x0000562b8da7a952 in qtest_process_command (chr=0x562b8fc49070, words=0x562b90e57cb0) at ../softmmu/qtest.c:482
  36 0x0000562b8da7c565 in qtest_process_inbuf (chr=0x562b8fc49070, inbuf=0x562b8fe11da0) at ../softmmu/qtest.c:802
  37 0x0000562b8da7c5f6 in qtest_read (opaque=0x562b8fc49070, buf=0x7fff5484afc0 "outl 0xae08 0x40\n306c\n", size=17) at ../softmmu/qtest.c:814
  38 0x0000562b8dc3bc25 in qemu_chr_be_write_impl (s=0x562b8fe3f800, buf=0x7fff5484afc0 "outl 0xae08 0x40\n306c\n", len=17) at ../chardev/char.c:202
  39 0x0000562b8dc3bc89 in qemu_chr_be_write (s=0x562b8fe3f800, buf=0x7fff5484afc0 "outl 0xae08 0x40\n306c\n", len=17) at ../chardev/char.c:214
  40 0x0000562b8dc37846 in tcp_chr_read (chan=0x562b8fdf5e80, cond=G_IO_IN, opaque=0x562b8fe3f800) at ../chardev/char-socket.c:508
  41 0x0000562b8db30e65 in qio_channel_fd_source_dispatch (source=0x562b90028ea0, callback=0x562b8dc376cb <tcp_chr_read>, user_data=0x562b8fe3f800) at ../io/channel-watch.c:84
  42 0x00007f1d80e7cfaf in g_main_dispatch (context=0x562b8fc43e80) at ../glib/gmain.c:3417
  43 g_main_context_dispatch (context=0x562b8fc43e80) at ../glib/gmain.c:4135
  44 0x0000562b8dd1d9c4 in glib_pollfds_poll () at ../util/main-loop.c:294
  45 0x0000562b8dd1da41 in os_host_main_loop_wait (timeout=27462700) at ../util/main-loop.c:317
  46 0x0000562b8dd1db4f in main_loop_wait (nonblocking=0) at ../util/main-loop.c:603
  47 0x0000562b8d822785 in qemu_main_loop () at ../softmmu/runstate.c:730
  48 0x0000562b8d5ad486 in qemu_default_main () at ../softmmu/main.c:37
  49 0x0000562b8d5ad4bc in main (argc=21, argv=0x7fff5484c2c8) at ../softmmu/main.c:48

Peter Xu (4):
  memory: Make memory_listeners RCU-safe for real
  memory: Use rcu list variance for address_spaces modifications
  memory: Protect memory_region_clear_dirty_bitmap with RCU
  memory: Use rcu traversal in memory_region_to_address_space

 softmmu/memory.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

-- 
2.39.1


