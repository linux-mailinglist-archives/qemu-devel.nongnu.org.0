Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8C6589B34
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 13:50:26 +0200 (CEST)
Received: from localhost ([::1]:55116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJZMv-0002ph-Pp
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 07:50:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oJZHR-000678-Bt
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 07:44:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1oJZHN-0002dc-UX
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 07:44:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659613481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qGUgdNZOpqhptyxWX57AXLZa9Rrvi3bP4c6znlUiWHM=;
 b=csR6hH2t4VAZBdTg9WazQQsrf/Kz7ezl+5r6+LEC4Bh6hIyRAAuI1EX+XmCTSw5QB8By+3
 L1JQF7ISSIlweFTmXUcFLg9uXFABq2Zu1qwrwbpPFT5uNZoz60ABTSZCBZZmOl7bFYNPwY
 TotBTH2EGI7WJmG5TG4BGbPPuv0FfdM=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-z3XeflMjOtmKn6-o9eP0Ag-1; Thu, 04 Aug 2022 07:44:40 -0400
X-MC-Unique: z3XeflMjOtmKn6-o9eP0Ag-1
Received: by mail-ot1-f72.google.com with SMTP id
 o10-20020a0568300aca00b0060becb83666so8632585otu.14
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 04:44:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=qGUgdNZOpqhptyxWX57AXLZa9Rrvi3bP4c6znlUiWHM=;
 b=iPMlrYlTLAISPPWxmCPfpEnerPt6DxPA1qlnZB5bjap89py94dE1oRgwchsuPbawU6
 0w9NgUULk7gB9Rm3mlN6FjreGu4R4Grr7Xqyon0v3/LFbtoQdPQ9+StRjxRsHSv8DpHr
 NQaK8zj9rdyrjIMsSfEJSmD/MvSR0aFpDva6eEfh9kkom34tTF1otDQnN23y4pUONETS
 rnNi/1ABxQlQAuGHEPMyPnHqWVc0pH2eYPfSgBxT2Zqu2gx455FjTT+lOBlr/DX6QChb
 uS/f3n6H6cm5VatvJsO0VFsf2OepPgA+yohhHZ797ajQ0xdAonLmLO0T/EFpJAltfoWY
 xNiA==
X-Gm-Message-State: ACgBeo2NdqEy8ef6B0ttbrHMfLM1l3phm4wsOsQfeQJLd0qp7yV4uH5T
 hmGvw0H5DtON4YgMOSvtBpcmJUZD6kb/rM71w+3yFV1lMCKXBGKZSA7ApwB4eOMGEohK4oRqV2Z
 nU649CNFcsiieGiwmcCx25naAgozvKm8=
X-Received: by 2002:a05:6808:2187:b0:33a:c507:d4f3 with SMTP id
 be7-20020a056808218700b0033ac507d4f3mr3818838oib.205.1659613479158; 
 Thu, 04 Aug 2022 04:44:39 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7CvLNiv7ihbP3vmMtIxLNq2FMsyngO6KymXwziIXsiatyNW+aiMIFSUucXkpOhEe5YRj5ZG7xxdz695BM04Ec=
X-Received: by 2002:a05:6808:2187:b0:33a:c507:d4f3 with SMTP id
 be7-20020a056808218700b0033ac507d4f3mr3818772oib.205.1659613477336; Thu, 04
 Aug 2022 04:44:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220729130040.1428779-1-afaria@redhat.com>
In-Reply-To: <20220729130040.1428779-1-afaria@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Thu, 4 Aug 2022 15:44:26 +0400
Message-ID: <CAMxuvazGhtbPUSoM-NiAbTnRnOQ=MEnkMAVyVgOg4zc37HJ1-w@mail.gmail.com>
Subject: Re: [RFC v2 00/10] Introduce an extensible static analyzer
To: Alberto Faria <afaria@redhat.com>
Cc: qemu-devel@nongnu.org, Stefano Garzarella <sgarzare@redhat.com>, 
 Hannes Reinecke <hare@suse.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>, 
 "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>, Peter Lieven <pl@kamp.de>,
 kvm@vger.kernel.org, 
 Xie Yongji <xieyongji@bytedance.com>, Eric Auger <eric.auger@redhat.com>, 
 Hanna Reitz <hreitz@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Eric Blake <eblake@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Stefan Weil <sw@weilnetz.de>, 
 Klaus Jensen <its@irrelevant.dk>, Laurent Vivier <lvivier@redhat.com>, 
 Alberto Garcia <berto@igalia.com>, Michael Roth <michael.roth@amd.com>, 
 Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 qemu-block@nongnu.org, 
 Konstantin Kostiuk <kkostiuk@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Marcelo Tosatti <mtosatti@redhat.com>, Greg Kurz <groug@kaod.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Amit Shah <amit@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Alex Williamson <alex.williamson@redhat.com>, Peter Xu <peterx@redhat.com>, 
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
 Jason Wang <jasowang@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, 
 Eduardo Habkost <eduardo@habkost.net>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Keith Busch <kbusch@kernel.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 "Richard W.M. Jones" <rjones@redhat.com>, John Snow <jsnow@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Fri, Jul 29, 2022 at 5:01 PM Alberto Faria <afaria@redhat.com> wrote:
>
> This series introduces a static analyzer for QEMU. It consists of a
> single static-analyzer.py script that relies on libclang's Python
> bindings, and provides a common framework on which arbitrary static
> analysis checks can be developed and run against QEMU's code base.
>
> Summary of the series:
>
>   - Patch 1 adds the base static analyzer, along with a simple check
>     that finds static functions whose return value is never used, and
>     patch 2 fixes many occurrences of this.
>
>   - Patch 3 introduces support for output-comparison check tests, and
>     adds some tests to the abovementioned check.
>
>   - Patch 4 makes the analyzer skip checks on a translation unit when it
>     hasn't been modified since the last time those checks passed.
>
>   - Patch 5 adds a check to ensure that non-coroutine_fn functions don't
>     perform direct calls to coroutine_fn functions, and patch 6 fixes
>     some violations of this rule.
>
>   - Patch 7 adds a check to ensure that operations on coroutine_fn
>     pointers make sense, like assignment and indirect calls, and patch 8
>     fixes some problems detected by the check. (Implementing this check
>     properly is complicated, since AFAICT annotation attributes cannot
>     be applied directly to types. This part still needs a lot of work.)
>
>   - Patch 9 introduces a no_coroutine_fn marker for functions that
>     should not be called from coroutines, makes generated_co_wrapper
>     evaluate to no_coroutine_fn, and adds a check enforcing this rule.
>     Patch 10 fixes some violations that it finds.
>
> The current primary motivation for this work is enforcing rules around
> block layer coroutines, which is why most of the series focuses on that.
> However, the static analyzer is intended to be sufficiently generic to
> satisfy other present and future QEMU static analysis needs.
>
> Performance isn't great, but with some more optimization, the analyzer
> should be fast enough to be used iteratively during development, given
> that it avoids reanalyzing unmodified translation units, and that users
> can restrict the set of translation units under consideration. It should
> also be fast enough to run in CI (?).
>
> Consider a small QEMU configuration and build (all commands were run on
> the same 12-thread laptop):
>
>     $ cd build && time ../configure --target-list=x86_64-softmmu && cd ..
>     [...]
>
>     real    0m17.232s
>     user    0m13.261s
>     sys     0m3.895s
>
>     $ time make -C build -j $(nproc) all
>     [...]
>
>     real    2m39.029s
>     user    14m49.370s
>     sys     1m57.364s
>
>     $ time make -C build -j $(nproc) check
>     [...]
>
>     real    2m46.349s
>     user    6m4.718s
>     sys     4m15.660s
>
> We can run the static analyzer against all translation units enabled in
> this configuration:
>
>     $ time ./static-analyzer.py build
>     util/qemu-coroutine.c:122:23: non-coroutine_fn function calls coroutine_fn qemu_coroutine_self()
>     io/channel.c:152:17: non-coroutine_fn function calls coroutine_fn qio_channel_yield()
>     [...]
>     Analyzed 1649 translation units in 520.3 seconds.
>
>     real    8m42.342s
>     user    95m51.759s
>     sys     0m21.576s
>
> You will need libclang's Python bindings to run this. Try `dnf install
> python3-clang` or `apt install python3-clang`.
>
> It takes around 1 to 2 seconds for the analyzer to load the compilation
> database, determine which translation units to analyze, etc. The
> durations reported by the analyzer itself don't include those steps,
> which is why they differ from what `time` reports.
>
> We can also analyze only some of the translation units:
>
>     $ time ./static-analyzer.py build block
>     block/raw-format.c:420:12: non-coroutine_fn function calls coroutine_fn bdrv_co_ioctl()
>     block/blkverify.c:266:12: non-coroutine_fn function calls coroutine_fn bdrv_co_flush()
>     [...]
>     Analyzed 21 translation units (58 other were up-to-date) in 5.8 seconds.
>
>     real    0m7.031s
>     user    0m40.951s
>     sys     0m1.299s
>
> Since the previous command had already analyzed all translation units,
> only the ones that had problems were reanalyzed.
>
> Now skipping all the actual checks, but still parsing and building the
> AST for each translation unit, and adding --force to reanalyze all
> translation units:
>
>     $ time ./static-analyzer.py build --force --skip-checks
>     Analyzed 1649 translation units in 41.2 seconds.
>
>     real    0m42.296s
>     user    7m14.256s
>     sys     0m15.803s
>
> And now running a single check:
>
>     $ time ./static-analyzer.py build --force --check return-value-never-used
>     Analyzed 1649 translation units in 157.6 seconds.
>
>     real    2m38.759s
>     user    29m28.930s
>     sys     0m17.968s
>
> TODO:
>   - Run in GitLab CI (?).
>   - Finish the "coroutine_fn" check.
>   - Add check tests where missing.
>   - Avoid redundant AST traversals while keeping checks modular.
>   - More optimization.

Great work so far! This seems easier to hack than my attempt to use
clang-tidy to write some qemu checks
(https://github.com/elmarco/clang-tools-extra)

The code seems quite generic, I wonder if such a tool in python wasn't
already developed (I couldn't find it easily searching on github).

Why not make it standalone from qemu? Similar to
https://gitlab.com/qemu-project/python-qemu-qmp, you could have your
own release management, issue tracker, code formatting, license, CI
etc. (you should add copyright header in each file, at least that's
pretty much required in qemu nowadays). You could also have the
qemu-specific checks there imho (clang-tidy has google & llvm specific
checks too)

It would be nice to write some docs, in docs/devel/testing.rst and
some new meson/ninja/make targets to run the checks directly from a
build tree.

On fc36, I had several dependencies I needed to install manually (imho
they should have been pulled by python3-clang), but more annoyingly I
got:
clang.cindex.LibclangError: libclang.so: cannot open shared object
file: No such file or directory. To provide a path to libclang use
Config.set_library_path() or Config.set_library_file().

clang-libs doesn't install libclang.so, I wonder why. I made a link
manually and it works, but it's probably incorrect. I'll try to open
issues for the clang packaging.

cheers


>
> v2:
>   - Fix parsing of compilation database commands.
>   - Reorganize checks and split them into separate modules.
>   - Make "return-value-never-used" ignore __attribute__((unused)) funcs.
>   - Add a visitor() abstraction wrapping clang_visitChildren() that is
>     faster than using Cursor.get_children() with recursion.
>   - Add support for implementing tests for checks, and add some tests to
>     "return-value-never-used".
>   - Use dependency information provided by Ninja to skip checks on
>     translation units that haven't been modified since they last passed
>     those checks.
>   - Ignore translation units from git submodules.
>   - And more.
>
> Alberto Faria (10):
>   Add an extensible static analyzer
>   Drop unused static function return values
>   static-analyzer: Support adding tests to checks
>   static-analyzer: Avoid reanalyzing unmodified translation units
>   static-analyzer: Enforce coroutine_fn restrictions for direct calls
>   Fix some direct calls from non-coroutine_fn to coroutine_fn
>   static-analyzer: Enforce coroutine_fn restrictions on function
>     pointers
>   Fix some bad coroutine_fn indirect calls and pointer assignments
>   block: Add no_coroutine_fn marker
>   Fix some calls from coroutine_fn to no_coroutine_fn
>
>  accel/kvm/kvm-all.c                        |  12 +-
>  accel/tcg/plugin-gen.c                     |   9 +-
>  accel/tcg/translate-all.c                  |   9 +-
>  audio/audio.c                              |   5 +-
>  block.c                                    |   2 +-
>  block/backup.c                             |   2 +-
>  block/block-copy.c                         |   4 +-
>  block/commit.c                             |   2 +-
>  block/dirty-bitmap.c                       |   6 +-
>  block/file-posix.c                         |   6 +-
>  block/io.c                                 |  52 +-
>  block/mirror.c                             |   4 +-
>  block/monitor/block-hmp-cmds.c             |   2 +-
>  block/nvme.c                               |   3 +-
>  block/parallels.c                          |  28 +-
>  block/qcow.c                               |  10 +-
>  block/qcow2-bitmap.c                       |   6 +-
>  block/qcow2-snapshot.c                     |   6 +-
>  block/qcow2.c                              |  38 +-
>  block/qcow2.h                              |  14 +-
>  block/qed-table.c                          |   2 +-
>  block/qed.c                                |  14 +-
>  block/quorum.c                             |   7 +-
>  block/ssh.c                                |   6 +-
>  block/throttle-groups.c                    |   3 +-
>  block/vdi.c                                |  17 +-
>  block/vhdx.c                               |   8 +-
>  block/vmdk.c                               |  11 +-
>  block/vpc.c                                |   4 +-
>  block/vvfat.c                              |  11 +-
>  blockdev.c                                 |   2 +-
>  chardev/char-ringbuf.c                     |   4 +-
>  contrib/ivshmem-server/main.c              |   4 +-
>  contrib/vhost-user-blk/vhost-user-blk.c    |   5 +-
>  dump/dump.c                                |   4 +-
>  fsdev/virtfs-proxy-helper.c                |   3 +-
>  gdbstub.c                                  |  18 +-
>  hw/audio/intel-hda.c                       |   7 +-
>  hw/audio/pcspk.c                           |   7 +-
>  hw/char/virtio-serial-bus.c                |  14 +-
>  hw/display/cirrus_vga.c                    |   5 +-
>  hw/hyperv/vmbus.c                          |  10 +-
>  hw/i386/intel_iommu.c                      |  28 +-
>  hw/i386/pc_q35.c                           |   5 +-
>  hw/ide/pci.c                               |   4 +-
>  hw/net/rtl8139.c                           |   3 +-
>  hw/net/virtio-net.c                        |   6 +-
>  hw/net/vmxnet3.c                           |   3 +-
>  hw/nvme/ctrl.c                             |  17 +-
>  hw/nvram/fw_cfg.c                          |   3 +-
>  hw/scsi/megasas.c                          |   6 +-
>  hw/scsi/mptconfig.c                        |   7 +-
>  hw/scsi/mptsas.c                           |  14 +-
>  hw/scsi/scsi-bus.c                         |   6 +-
>  hw/usb/dev-audio.c                         |  13 +-
>  hw/usb/hcd-ehci.c                          |   6 +-
>  hw/usb/hcd-ohci.c                          |   4 +-
>  hw/usb/hcd-xhci.c                          |  56 +-
>  hw/vfio/common.c                           |  21 +-
>  hw/virtio/vhost-vdpa.c                     |   3 +-
>  hw/virtio/vhost.c                          |  11 +-
>  hw/virtio/virtio-iommu.c                   |   4 +-
>  hw/virtio/virtio-mem.c                     |   9 +-
>  include/block/block-common.h               |   2 +-
>  include/block/block-hmp-cmds.h             |   2 +-
>  include/block/block-io.h                   |   5 +-
>  include/block/block_int-common.h           |  12 +-
>  include/qemu/coroutine.h                   |  43 +-
>  io/channel-command.c                       |  10 +-
>  migration/migration.c                      |  12 +-
>  net/dump.c                                 |  16 +-
>  net/vhost-vdpa.c                           |   8 +-
>  qemu-img.c                                 |   6 +-
>  qga/commands-posix-ssh.c                   |  10 +-
>  softmmu/physmem.c                          |  18 +-
>  softmmu/qtest.c                            |   5 +-
>  static-analyzer.py                         | 801 +++++++++++++++++++++
>  static_analyzer/__init__.py                | 348 +++++++++
>  static_analyzer/coroutine_fn.py            | 280 +++++++
>  static_analyzer/no_coroutine_fn.py         | 111 +++
>  static_analyzer/return_value_never_used.py | 220 ++++++
>  subprojects/libvduse/libvduse.c            |  12 +-
>  subprojects/libvhost-user/libvhost-user.c  |  24 +-
>  target/i386/host-cpu.c                     |   3 +-
>  target/i386/kvm/kvm.c                      |  19 +-
>  tcg/optimize.c                             |   3 +-
>  tests/qtest/libqos/malloc.c                |   5 +-
>  tests/qtest/libqos/qgraph.c                |   3 +-
>  tests/qtest/test-x86-cpuid-compat.c        |   8 +-
>  tests/qtest/virtio-9p-test.c               |   6 +-
>  tests/unit/test-aio-multithread.c          |   5 +-
>  tests/vhost-user-bridge.c                  |  19 +-
>  ui/vnc.c                                   |  23 +-
>  util/aio-posix.c                           |   7 +-
>  util/uri.c                                 |  18 +-
>  95 files changed, 2160 insertions(+), 519 deletions(-)
>  create mode 100755 static-analyzer.py
>  create mode 100644 static_analyzer/__init__.py
>  create mode 100644 static_analyzer/coroutine_fn.py
>  create mode 100644 static_analyzer/no_coroutine_fn.py
>  create mode 100644 static_analyzer/return_value_never_used.py
>
> --
> 2.37.1
>


