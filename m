Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9234D4CCD
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 16:37:17 +0100 (CET)
Received: from localhost ([::1]:45026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSKqq-0006DK-QY
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 10:37:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nSKom-0003QX-MD
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 10:35:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nSKoi-00047Y-NW
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 10:35:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646926502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hq/2ZC6NkGE2rvgs/HSsVvJRWgtnsipHo8JogHBVzsk=;
 b=hzdKFERXGUuLGY4H9XIiadfaup2WDFU/BQCX+tNVBtvh11ZixwiKrMpGzpqc1QciGA3fnZ
 MnCZ7pZpTwvaSHoCWTwv79J3QZvgvOpwGXNjxqFAHUlKwXYhRKyrSLE+0EoQaQ2Ka6Bog0
 6Umns93RvrPMCvi6uRLSgimUvaSiDdw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-491-pRgqG5u0MrKEYJGCd2EV4Q-1; Thu, 10 Mar 2022 10:34:59 -0500
X-MC-Unique: pRgqG5u0MrKEYJGCd2EV4Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 338C41006AA8;
 Thu, 10 Mar 2022 15:34:58 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 432258379E;
 Thu, 10 Mar 2022 15:34:54 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 0/8] Migration: Transmit and detect zero pages in the
 multifd threads
Date: Thu, 10 Mar 2022 16:34:46 +0100
Message-Id: <20220310153454.3929-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, Leonardo Bras <leobras@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi=0D
=0D
In this version:=0D
- Rebase to latest=0D
- Address all comments=0D
- statistics about zero pages are right now (or at least much better than b=
efore)=0D
- changed how we calculate the amount of transferred ram=0D
- numbers, who don't like numbers.=0D
=0D
Everything has been checked with a guest launched like the following=0D
command.  Migration is running through localhost.  Will send numbers=0D
with real hardware as soon as I get access to the machines that have=0D
it (I checked with previous versions already, but not this one).=0D
=0D
/scratch/qemu/multifd/x64/x86_64-softmmu/qemu-system-x86_64=0D
-name guest=3Dsrc,debug-threads=3Don=0D
-m 16G=0D
-smp 6=0D
-machine q35,accel=3Dkvm,usb=3Doff,dump-guest-core=3Doff=0D
-boot strict=3Don=0D
-cpu host=0D
-no-hpet=0D
-rtc base=3Dutc,driftfix=3Dslew=0D
-global kvm-pit.lost_tick_policy=3Ddelay=0D
-global ICH9-LPC.disable_s3=3D1=0D
-global ICH9-LPC.disable_s4=3D1=0D
-device pcie-root-port,id=3Droot.1,chassis=3D1,addr=3D0x2.0,multifunction=
=3Don=0D
-device pcie-root-port,id=3Droot.2,chassis=3D2,addr=3D0x2.1=0D
-device pcie-root-port,id=3Droot.3,chassis=3D3,addr=3D0x2.2=0D
-device pcie-root-port,id=3Droot.4,chassis=3D4,addr=3D0x2.3=0D
-device pcie-root-port,id=3Droot.5,chassis=3D5,addr=3D0x2.4=0D
-device pcie-root-port,id=3Droot.6,chassis=3D6,addr=3D0x2.5=0D
-device pcie-root-port,id=3Droot.7,chassis=3D7,addr=3D0x2.6=0D
-device pcie-root-port,id=3Droot.8,chassis=3D8,addr=3D0x2.7=0D
-blockdev driver=3Dfile,node-name=3Dstorage0,filename=3D/mnt/vm/test/a3.qco=
w2,auto-read-only=3Dtrue,discard=3Dunmap=0D
-blockdev driver=3Dqcow2,node-name=3Dformat0,read-only=3Dfalse,file=3Dstora=
ge0=0D
-device virtio-blk-pci,id=3Dvirtio-disk0,drive=3Dformat0,bootindex=3D1,bus=
=3Droot.1=0D
-netdev tap,id=3Dhostnet0,vhost=3Don,script=3D/etc/kvm-ifup,downscript=3D/e=
tc/kvm-ifdown=0D
-device virtio-net-pci,id=3Dnet0,netdev=3Dhostnet0,mac=3D52:54:00:9d:30:23,=
bus=3Droot.2=0D
-device virtio-serial-pci,id=3Dvirtio-serial0,bus=3Droot.3=0D
-device virtio-balloon-pci,id=3Dballoon0,bus=3Droot.4 -display none=0D
-chardev socket,id=3Dcharconsole0,path=3D/tmp/console-src,server=3Doff=0D
-device virtconsole,id=3Dconsole0,chardev=3Dcharconsole0=0D
-uuid 9d3be7da-e1ff-41a0-ac39-8b2e04de2c19=0D
-nodefaults=0D
-msg timestamp=3Don=0D
-no-user-config=0D
-chardev socket,id=3Dmonitor0,path=3D/tmp/monitor-src,server=3Doff=0D
-mon monitor0=0D
-trace events=3D/home/quintela/tmp/events=0D
-global migration.x-multifd=3Don=0D
-global migration.multifd-channels=3D4=0D
-global migration.x-max-bandwidth=3D6442450944=0D
=0D
Using maximum bandwith of 6GB/s (on my test machine bigger than that=0D
will not help, and then we are not checking that limitation works).=0D
=0D
First, the part where multifd + zero pages don't shine.=0D
=0D
Migrate the guest just booted and idle.=0D
=0D
Precopy (changed multifd=3Doff on the command line)=0D
=0D
Migration status: completed=0D
total time: 851 ms=0D
downtime: 29 ms=0D
setup: 4 ms=0D
transferred ram: 634400 kbytes=0D
throughput: 6139.32 mbps=0D
duplicate: 4045125 pages=0D
normal: 149420 pages=0D
normal bytes: 597680 kbytes=0D
dirty sync count: 3=0D
multifd bytes: 0 kbytes=0D
pages-per-second: 3088960=0D
precopy ram: 598949 kbytes=0D
downtime ram: 35450 kbytes=0D
=0D
Current multifd:=0D
=0D
Migration status: completed=0D
total time: 922 ms=0D
downtime: 27 ms=0D
setup: 4 ms=0D
transferred ram: 621342 kbytes=0D
throughput: 5547.97 mbps=0D
total ram: 16777992 kbytes=0D
duplicate: 4048826 pages=0D
normal: 146032 pages=0D
normal bytes: 584128 kbytes=0D
dirty sync count: 3=0D
multifd bytes: 585757 kbytes=0D
pages-per-second: 5918137=0D
precopy ram: 35585 kbytes=0D
=0D
Migration status: completed=0D
total time: 946 ms=0D
downtime: 60 ms=0D
setup: 10 ms=0D
transferred ram: 621784 kbytes=0D
throughput: 5445.14 mbps=0D
total ram: 16777992 kbytes=0D
duplicate: 4048586 pages=0D
normal: 146146 pages=0D
normal bytes: 584584 kbytes=0D
dirty sync count: 3=0D
multifd bytes: 586201 kbytes=0D
pages-per-second: 5297106=0D
precopy ram: 35582 kbytes=0D
downtime ram: 1 kbytes=0D
=0D
See that times are similar, accounting is wrong for multifd of=0D
downtime ram, for instance.  Notice that multifd is almosnt not used,=0D
because almost everything is a zero page that is sent through the main=0D
channel.=0D
=0D
Multifd + zero page:=0D
=0D
Migration status: completed=0D
total time: 1854 ms=0D
downtime: 150 ms=0D
setup: 4 ms=0D
transferred ram: 12086679 kbytes=0D
throughput: 53522.74 mbps=0D
total ram: 16777992 kbytes=0D
duplicate: 4039509 pages=0D
normal: 146476 pages=0D
normal bytes: 585904 kbytes=0D
dirty sync count: 3=0D
multifd bytes: 12086679 kbytes=0D
pages-per-second: 2274851=0D
precopy ram: 10698366 kbytes=0D
downtime ram: 1388313 kbytes=0D
=0D
Migration status: completed=0D
total time: 1547 ms=0D
downtime: 143 ms=0D
setup: 4 ms=0D
transferred ram: 9877449 kbytes=0D
throughput: 52442.68 mbps=0D
total ram: 16777992 kbytes=0D
duplicate: 4037502 pages=0D
normal: 149056 pages=0D
normal bytes: 596224 kbytes=0D
dirty sync count: 3=0D
multifd bytes: 9877449 kbytes=0D
pages-per-second: 3011840=0D
precopy ram: 8811411 kbytes=0D
downtime ram: 1066038 kbytes=0D
=0D
Here, we are sending zero pages through multifd channels, so the=0D
packages that we sent through multifd channels are smaller, and the=0D
bandwidth that we got is worse than sending them through the main=0D
channel.  Notice that the bandwidth numbers are now correct.=0D
=0D
Now a better scenary.  We use the same guest, but we run on it:=0D
=0D
 stress --vm 4 --vm-keep --vm-bytes 400M=0D
=0D
i.e. 4 threads dirtying 1.6GB in total in the 6GB test.=0D
=0D
Precopy:=0D
=0D
total time: 120947 ms=0D
expected downtime: 678 ms=0D
setup: 5 ms=0D
transferred ram: 283655333 kbytes=0D
throughput: 19818.30 mbps=0D
remaining ram: 1048116 kbytes=0D
total ram: 16777992 kbytes=0D
duplicate: 3635761 pages=0D
normal: 70767622 pages=0D
normal bytes: 283070488 kbytes=0D
dirty sync count: 286=0D
multifd bytes: 0 kbytes=0D
pages-per-second: 603627=0D
dirty pages rate: 598555 pages=0D
precopy ram: 283655333 kbytes=0D
=0D
As you can see, it will never converge.=0D
=0D
Current multifd:=0D
=0D
Migration status: completed=0D
total time: 2249 ms=0D
downtime: 273 ms=0D
setup: 6 ms=0D
transferred ram: 5432984 kbytes=0D
throughput: 19843.96 mbps=0D
total ram: 16777992 kbytes=0D
duplicate: 3635610 pages=0D
normal: 1346731 pages=0D
normal bytes: 5386924 kbytes=0D
dirty sync count: 7=0D
multifd bytes: 5401030 kbytes=0D
pages-per-second: 1388326=0D
precopy ram: 31953 kbytes=0D
=0D
Migration status: completed=0D
total time: 3383 ms=0D
downtime: 230 ms=0D
setup: 4 ms=0D
transferred ram: 10828047 kbytes=0D
throughput: 26252.25 mbps=0D
total ram: 16777992 kbytes=0D
duplicate: 3638556 pages=0D
normal: 2691985 pages=0D
normal bytes: 10767940 kbytes=0D
dirty sync count: 22=0D
page size: 4 kbytes=0D
multifd bytes: 10796067 kbytes=0D
pages-per-second: 1375137=0D
precopy ram: 31980 kbytes=0D
=0D
see, that it depends on luck what time we get, but we end converging=0D
sooner or later (yes, I started with 512MB, but multifd will not=0D
converge with that).=0D
=0D
Multifd + zero page=0D
=0D
Migration status: completed=0D
total time: 2785 ms=0D
downtime: 292 ms=0D
setup: 4 ms=0D
transferred ram: 16108184 kbytes=0D
throughput: 47451.00 mbps=0D
total ram: 16777992 kbytes=0D
duplicate: 3633781 pages=0D
normal: 957319 pages=0D
normal bytes: 3829276 kbytes=0D
dirty sync count: 4=0D
multifd bytes: 16108184 kbytes=0D
pages-per-second: 1861120=0D
precopy ram: 14303936 kbytes=0D
downtime ram: 1804247 kbytes=0D
=0D
Migration status: completed=0D
total time: 2789 ms=0D
downtime: 302 ms=0D
setup: 6 ms=0D
transferred ram: 16198682 kbytes=0D
throughput: 47683.29 mbps=0D
total ram: 16777992 kbytes=0D
duplicate: 3631338 pages=0D
normal: 959689 pages=0D
normal bytes: 3838756 kbytes=0D
dirty sync count: 4=0D
multifd bytes: 16198681 kbytes=0D
pages-per-second: 1820160=0D
precopy ram: 14385777 kbytes=0D
downtime ram: 1812904 kbytes=0D
=0D
Notice that we only need 4 iterations, on normal multd, it depends on luck.=
=0D
Statistics are right here, and we are much more consistent in the total tim=
e that we need.=0D
=0D
Please review, Juan.=0D
=0D
[v4]=0D
In this version=0D
- Rebase to latest=0D
- Address all comments from previous versions=0D
- code cleanup=0D
=0D
Please review.=0D
=0D
[v2]=0D
This is a rebase against last master.=0D
=0D
And the reason for resend is to configure properly git-publish and=0D
hope this time that git-publish send all the patches.=0D
=0D
Please, review.=0D
=0D
[v1]=0D
Since Friday version:=0D
- More cleanups on the code=0D
- Remove repeated calls to qemu_target_page_size()=0D
- Establish normal pages and zero pages=0D
- detect zero pages on the multifd threads=0D
- send zero pages through the multifd channels.=0D
- reviews by Richard addressed.=0D
=0D
It pases migration-test, so it should be perfect O:+)=0D
=0D
ToDo for next version:=0D
- check the version changes=0D
  I need that 6.2 is out to check for 7.0.=0D
  This code don't exist at all due to that reason.=0D
- Send measurements of the differences=0D
=0D
Please, review.=0D
=0D
[=0D
=0D
Friday version that just created a single writev instead of=0D
write+writev.=0D
=0D
]=0D
=0D
Right now, multifd does a write() for the header and a writev() for=0D
each group of pages.  Simplify it so we send the header as another=0D
member of the IOV.=0D
=0D
Once there, I got several simplifications:=0D
* is_zero_range() was used only once, just use its body.=0D
* same with is_zero_page().=0D
* Be consintent and use offset insed the ramblock everywhere.=0D
* Now that we have the offsets of the ramblock, we can drop the iov.=0D
* Now that nothing uses iov's except NOCOMP method, move the iovs=0D
  from pages to methods.=0D
* Now we can use iov's with a single field for zlib/zstd.=0D
* send_write() method is the same in all the implementaitons, so use=0D
  it directly.=0D
* Now, we can use a single writev() to write everything.=0D
=0D
ToDo: Move zero page detection to the multifd thrteads.=0D
=0D
With RAM in the Terabytes size, the detection of the zero page takes=0D
too much time on the main thread.=0D
=0D
Last patch on the series removes the detection of zero pages in the=0D
main thread for multifd.  In the next series post, I will add how to=0D
detect the zero pages and send them on multifd channels.=0D
=0D
Please review.=0D
=0D
Later, Juan.=0D
=0D
Juan Quintela (8):=0D
  migration: Export ram_transferred_ram()=0D
  multifd: Count the number of sent bytes correctly=0D
  migration: Make ram_save_target_page() a pointer=0D
  multifd: Add property to enable/disable zero_page=0D
  migration: Export ram_release_page()=0D
  multifd: Support for zero pages transmission=0D
  multifd: Zero pages transmission=0D
  migration: Use multifd before we check for the zero page=0D
=0D
 migration/migration.h  |  3 ++=0D
 migration/multifd.h    | 24 ++++++++++-=0D
 migration/ram.h        |  3 ++=0D
 hw/core/machine.c      |  4 +-=0D
 migration/migration.c  | 11 +++++=0D
 migration/multifd.c    | 93 ++++++++++++++++++++++++++++++++++--------=0D
 migration/ram.c        | 48 ++++++++++++++++++----=0D
 migration/trace-events |  8 ++--=0D
 8 files changed, 162 insertions(+), 32 deletions(-)=0D
=0D
--=20=0D
2.34.1=0D
=0D


