Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 681D161DC1D
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 17:37:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orM9W-0001LD-LI; Sat, 05 Nov 2022 12:36:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1orM9U-0001KC-3X; Sat, 05 Nov 2022 12:36:12 -0400
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1orM9R-0001ps-Rb; Sat, 05 Nov 2022 12:36:11 -0400
Received: by mail-vs1-xe29.google.com with SMTP id 1so7076177vsx.1;
 Sat, 05 Nov 2022 09:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pNyo1HecBHGSLI730HEd8hkr/CB7JeSl1fh/dZw9sjw=;
 b=gHATjvlb1GlUI/fxorQIrrrQL9/1IKED6AOcYKP5f1T1haOX11mS5oqbbwMzSPQ6hn
 X89lOgDUREUlDb5P/avxKwvDwCvO4FGdaJJWQrZCUcrgk++6DxK3Nr+GwJPPDsgYJazq
 CSClGdNnbT/GNYZet/1TaH0ve8V+l1Ghv8b3XJXS7SIgy/EexB5smlaRCOVGxEmcge3e
 w/k8YL/hdUk0apCgeuRuKyRQNm5mpKDTp2pcaACoyaXrK9RZOZYYYpqdfKnErC8xCi6M
 s6waGnAj6o8Kt6q5iUhcXtXRoh3oV9aL6wUvXz3FE1sc9fe9pVULcZUlerjX/WqgL30u
 HWdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pNyo1HecBHGSLI730HEd8hkr/CB7JeSl1fh/dZw9sjw=;
 b=DK8tlKyVWwGwvKiGTOyCsfsaeMUAz7qzKV0P/rnMxtyDdUOY2vNUkm0hBq+Ifdx1vL
 3Z7DqZnqH2Dg3cMMjYweOkE5+42n9SgVILE1GZppGskxo4eFAvVxFbsMAavZZWCfE3JA
 CCsq9jR/HnJMvI2ckpN3hDMePL9IOYG7o3sfuJRlXCNNoSQgdW44h2eWfjMeb57AbqCg
 MOhRLu5gC/XTrVe05L+nC5aKjp9O0Ybcz8wqbsSntbdwHwX04CGx5rCVkiAa+dZzuYkb
 2h9m9uavWmEgsK7yAVoa7soN9fQH+RDK+rEmpwrauPLMbcTdKCst7RT6+gQgCADJjMJQ
 mrkA==
X-Gm-Message-State: ACrzQf3op/l2fZBdtOnd+sxX+5hZ9K4N6uOAbbwJ0q7Qi0NxR6eI2QTl
 8a9zyek4WehkaHNLqH5z6Xvtf9dhv7zH1BW+89I=
X-Google-Smtp-Source: AMsMyM5K1ht+XqnKLnIDcv/BaDe6c+MzQ7FytUQ+yGoyNlVXOJWkTOzM4gWMEJKsxeN47Ub2YUGnVGl/Cuu4ec078iw=
X-Received: by 2002:a67:bb03:0:b0:3aa:2566:6a9f with SMTP id
 m3-20020a67bb03000000b003aa25666a9fmr21360778vsn.34.1667666168154; Sat, 05
 Nov 2022 09:36:08 -0700 (PDT)
MIME-Version: 1.0
References: <20221102160336.616599-1-mst@redhat.com>
 <20221102160336.616599-32-mst@redhat.com>
In-Reply-To: <20221102160336.616599-32-mst@redhat.com>
From: Bernhard Beschow <shentey@gmail.com>
Date: Sat, 5 Nov 2022 17:35:57 +0100
Message-ID: <CAG4p6K6=HcZs+TfzC7QMmUxKhity0_dYo4-UWwiXv7oJSvDO2g@mail.gmail.com>
Subject: Re: [PULL v2 31/82] vhost: Change the sequence of device start
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 Yajun Wu <yajunw@nvidia.com>, Parav Pandit <parav@nvidia.com>, 
 Raphael Norwitz <raphael.norwitz@nutanix.com>, Kevin Wolf <kwolf@redhat.com>, 
 Hanna Reitz <hreitz@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-block@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000008e8f9805ecbbc90c"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e29;
 envelope-from=shentey@gmail.com; helo=mail-vs1-xe29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--0000000000008e8f9805ecbbc90c
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 2, 2022 at 5:24 PM Michael S. Tsirkin <mst@redhat.com> wrote:

> From: Yajun Wu <yajunw@nvidia.com>
>
> This patch is part of adding vhost-user vhost_dev_start support. The
> motivation is to improve backend configuration speed and reduce live
> migration VM downtime.
>
> Moving the device start routines after finishing all the necessary device
> and VQ configuration, further aligning to the virtio specification for
> "device initialization sequence".
>
> Following patch will add vhost-user vhost_dev_start support.
>
> Signed-off-by: Yajun Wu <yajunw@nvidia.com>
> Acked-by: Parav Pandit <parav@nvidia.com>
>
> Message-Id: <20221017064452.1226514-2-yajunw@nvidia.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  hw/block/vhost-user-blk.c | 18 +++++++++++-------
>  hw/net/vhost_net.c        | 12 ++++++------
>  2 files changed, 17 insertions(+), 13 deletions(-)
>

A git bisect tells me that this is the first bad commit for failing
qos-tests which only fail when parallel jobs are enabled, e.g. `make
check-qtest -j8`:

Summary of Failures:

 76/541 qemu:qtest+qtest-aarch64 / qtest-aarch64/qos-test
      ERROR          18.68s   killed by signal 6 SIGABRT
 77/541 qemu:qtest+qtest-arm / qtest-arm/qos-test
      ERROR          17.60s   killed by signal 6 SIGABRT
 93/541 qemu:qtest+qtest-i386 / qtest-i386/qos-test
      ERROR          18.98s   killed by signal 6 SIGABRT
108/541 qemu:qtest+qtest-ppc64 / qtest-ppc64/qos-test
      ERROR          16.40s   killed by signal 6 SIGABRT
112/541 qemu:qtest+qtest-i386 / qtest-i386/bios-tables-test
      ERROR          145.94s   killed by signal 6 SIGABRT
130/541 qemu:qtest+qtest-x86_64 / qtest-x86_64/qos-test
      ERROR          17.32s   killed by signal 6 SIGABRT
243/541 qemu:qtest+qtest-x86_64 / qtest-x86_64/bios-tables-test
      ERROR          127.70s   killed by signal 6 SIGABRT

Ok:                 500
Expected Fail:      0
Fail:               7
Unexpected Pass:    0
Skipped:            34
Timeout:            0

Can anyone else reproduce this?

Here is a log of one failed case:

# child process
(/aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/virtio-net-pci/virtio-net/virtio-net-tests/vhost-user/flags-mismatch/subprocess
[384604]) killed by signal 6 (Aborted), core dumped
# child process
(/aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/virtio-net-pci/virtio-net/virtio-net-tests/vhost-user/flags-mismatch/subprocess
[384604]) stdout: ""
# child process
(/aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/virtio-net-pci/virtio-net/virtio-net-tests/vhost-user/flags-mismatch/subprocess
[384604]) stderr: "qemu-system-aarch64: -chardev
socket,id=chr-flags-mismatch,path=/tmp/vhost-test-BBEAV1/flags-mismatch.sock,server=on:
info: QEMU waiting for connection on:
disconnected:unix:/tmp/vhost-test-BBEAV1/flags-mismatch.sock,server=on\nqemu-system-aarch64:
Failed to write msg. Wrote -1 instead of 52.\nqemu-system-aarch64:
vhost_set_mem_table failed: Invalid argument (22)\nqemu-system-aarch64:
Failed to set msg fds.\nqemu-system-aarch64: vhost VQ 0 ring restore
failed: -22: Invalid argument (22)\nBroken
pipe\n../src/tests/qtest/libqtest.c:188: kill_qemu() detected QEMU death
from signal 11 (Segmentation fault) (core dumped)\n"
Bail out! ERROR:../src/tests/qtest/qos-test.c:191:subprocess_run_one_test:
child process
(/aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/virtio-net-pci/virtio-net/virtio-net-tests/vhost-user/flags-mismatch/subprocess
[384604]) failed unexpectedly
----------------------------------- stderr
-----------------------------------
qemu-system-aarch64: Failed to write msg. Wrote -1 instead of 20.
qemu-system-aarch64: vhost VQ 0 ring restore failed: -22: Invalid argument
(22)
qemu-system-aarch64: Failed to set msg fds.
qemu-system-aarch64: vhost VQ 1 ring restore failed: -22: Invalid argument
(22)
qemu-system-aarch64: -chardev
socket,id=chr-reconnect,path=/tmp/vhost-test-FTJ0U1/reconnect.sock,server=on:
info: QEMU waiting for connection on:
disconnected:unix:/tmp/vhost-test-FTJ0U1/reconnect.sock,server=on
qemu-system-aarch64: Failed to write msg. Wrote -1 instead of 20.
qemu-system-aarch64: vhost VQ 0 ring restore failed: -22: Invalid argument
(22)
qemu-system-aarch64: Failed to set msg fds.
qemu-system-aarch64: vhost VQ 1 ring restore failed: -22: Invalid argument
(22)
qemu-system-aarch64: -chardev
socket,id=chr-connect-fail,path=/tmp/vhost-test-4W4DV1/connect-fail.sock,server=on:
info: QEMU waiting for connection on:
disconnected:unix:/tmp/vhost-test-4W4DV1/connect-fail.sock,server=on
qemu-system-aarch64: -netdev
vhost-user,id=hs0,chardev=chr-connect-fail,vhostforce=on: Failed to read
msg header. Read 0 instead of 12. Original request 1.
qemu-system-aarch64: -netdev
vhost-user,id=hs0,chardev=chr-connect-fail,vhostforce=on:
vhost_backend_init failed: Protocol error
qemu-system-aarch64: -netdev
vhost-user,id=hs0,chardev=chr-connect-fail,vhostforce=on: failed to init
vhost_net for queue 0
qemu-system-aarch64: -netdev
vhost-user,id=hs0,chardev=chr-connect-fail,vhostforce=on: info: QEMU
waiting for connection on:
disconnected:unix:/tmp/vhost-test-4W4DV1/connect-fail.sock,server=on
qemu-system-aarch64: Failed to set msg fds.
qemu-system-aarch64: vhost VQ 0 ring restore failed: -22: Invalid argument
(22)
qemu-system-aarch64: Failed to set msg fds.
qemu-system-aarch64: vhost VQ 1 ring restore failed: -22: Invalid argument
(22)
qemu-system-aarch64: -chardev
socket,id=chr-flags-mismatch,path=/tmp/vhost-test-BBEAV1/flags-mismatch.sock,server=on:
info: QEMU waiting for connection on:
disconnected:unix:/tmp/vhost-test-BBEAV1/flags-mismatch.sock,server=on
qemu-system-aarch64: Failed to write msg. Wrote -1 instead of 52.
qemu-system-aarch64: vhost_set_mem_table failed: Invalid argument (22)
qemu-system-aarch64: Failed to set msg fds.
qemu-system-aarch64: vhost VQ 0 ring restore failed: -22: Invalid argument
(22)
Broken pipe
../src/tests/qtest/libqtest.c:188: kill_qemu() detected QEMU death from
signal 11 (Segmentation fault) (core dumped)
**
ERROR:../src/tests/qtest/qos-test.c:191:subprocess_run_one_test: child
process
(/aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/virtio-net-pci/virtio-net/virtio-net-tests/vhost-user/flags-mismatch/subprocess
[384604]) failed unexpectedly

(test program exited with status code -6)
==============================================================================

=================================== 77/541
===================================
test:         qemu:qtest+qtest-arm / qtest-arm/qos-test
start time:   16:04:10
duration:     17.60s
result:       killed by signal 6 SIGABRT
command:      MALLOC_PERTURB_=98 QTEST_QEMU_IMG=./qemu-img
QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon
QTEST_QEMU_BINARY=./qemu-system-arm
G_TEST_DBUS_DAEMON=../src/tests/dbus-vmstate-daemon.sh
./tests/qtest/qos-test --tap -k

Best regards,
Bernhard

--0000000000008e8f9805ecbbc90c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 2, 2022 at 5:24 PM Michae=
l S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com">mst@redhat.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Yaju=
n Wu &lt;<a href=3D"mailto:yajunw@nvidia.com" target=3D"_blank">yajunw@nvid=
ia.com</a>&gt;<br>
<br>
This patch is part of adding vhost-user vhost_dev_start support. The<br>
motivation is to improve backend configuration speed and reduce live<br>
migration VM downtime.<br>
<br>
Moving the device start routines after finishing all the necessary device<b=
r>
and VQ configuration, further aligning to the virtio specification for<br>
&quot;device initialization sequence&quot;.<br>
<br>
Following patch will add vhost-user vhost_dev_start support.<br>
<br>
Signed-off-by: Yajun Wu &lt;<a href=3D"mailto:yajunw@nvidia.com" target=3D"=
_blank">yajunw@nvidia.com</a>&gt;<br>
Acked-by: Parav Pandit &lt;<a href=3D"mailto:parav@nvidia.com" target=3D"_b=
lank">parav@nvidia.com</a>&gt;<br>
<br>
Message-Id: &lt;<a href=3D"mailto:20221017064452.1226514-2-yajunw@nvidia.co=
m" target=3D"_blank">20221017064452.1226514-2-yajunw@nvidia.com</a>&gt;<br>
Reviewed-by: Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com" targe=
t=3D"_blank">mst@redhat.com</a>&gt;<br>
Signed-off-by: Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com" tar=
get=3D"_blank">mst@redhat.com</a>&gt;<br>
---<br>
=C2=A0hw/block/vhost-user-blk.c | 18 +++++++++++-------<br>
=C2=A0hw/net/vhost_net.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 12 ++++++------<br>
=C2=A02 files changed, 17 insertions(+), 13 deletions(-)<br></blockquote><d=
iv><br></div><div>A git bisect tells me that this is the first bad commit f=
or failing qos-tests which only fail when  parallel jobs are enabled, e.g. =
`make check-qtest -j8`:<br></div><div><br></div><div>Summary of Failures:<b=
r><br>=C2=A076/541 qemu:qtest+qtest-aarch64 / qtest-aarch64/qos-test =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ERROR =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A018.68s =C2=A0 killed by signal =
6 SIGABRT<br>=C2=A077/541 qemu:qtest+qtest-arm / qtest-arm/qos-test =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ERROR =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A017.=
60s =C2=A0 killed by signal 6 SIGABRT<br>=C2=A093/541 qemu:qtest+qtest-i386=
 / qtest-i386/qos-test =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ERROR =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A018.98s =C2=A0 killed by signal 6 SIGABRT<br>108/541 qem=
u:qtest+qtest-ppc64 / qtest-ppc64/qos-test =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ERROR =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A016.40s =C2=A0 killed by signal 6 SIGABRT<=
br>112/541 qemu:qtest+qtest-i386 / qtest-i386/bios-tables-test =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ERROR =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0145.94s =C2=A0 killed by signal 6 SIGABRT=
<br>130/541 qemu:qtest+qtest-x86_64 / qtest-x86_64/qos-test =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ERROR =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A017.32s =C2=A0 killed by signal =
6 SIGABRT<br>243/541 qemu:qtest+qtest-x86_64 / qtest-x86_64/bios-tables-tes=
t =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ERROR =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0127.70s =C2=A0 killed by signal 6 SIGABRT<br=
><br>Ok: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 500 <br>Ex=
pected Fail: =C2=A0 =C2=A0 =C2=A00 =C2=A0 <br>Fail: =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 7 =C2=A0 <br>Unexpected Pass: =C2=A0 =C2=A00 =
=C2=A0 <br>Skipped: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A034 =C2=A0<br>T=
imeout: =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =C2=A0 <br></div><div><b=
r></div><div>Can anyone else reproduce this?</div><div><br></div><div>Here =
is a log of one failed case:</div><div><br></div><div># child process (/aar=
ch64/virt/generic-pcihost/pci-bus-generic/pci-bus/virtio-net-pci/virtio-net=
/virtio-net-tests/vhost-user/flags-mismatch/subprocess [384604]) killed by =
signal 6 (Aborted), core dumped<br># child process (/aarch64/virt/generic-p=
cihost/pci-bus-generic/pci-bus/virtio-net-pci/virtio-net/virtio-net-tests/v=
host-user/flags-mismatch/subprocess [384604]) stdout: &quot;&quot;<br># chi=
ld process (/aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/virtio-ne=
t-pci/virtio-net/virtio-net-tests/vhost-user/flags-mismatch/subprocess [384=
604]) stderr: &quot;qemu-system-aarch64: -chardev socket,id=3Dchr-flags-mis=
match,path=3D/tmp/vhost-test-BBEAV1/flags-mismatch.sock,server=3Don: info: =
QEMU waiting for connection on: disconnected:unix:/tmp/vhost-test-BBEAV1/fl=
ags-mismatch.sock,server=3Don\nqemu-system-aarch64: Failed to write msg. Wr=
ote -1 instead of 52.\nqemu-system-aarch64: vhost_set_mem_table failed: Inv=
alid argument (22)\nqemu-system-aarch64: Failed to set msg fds.\nqemu-syste=
m-aarch64: vhost VQ 0 ring restore failed: -22: Invalid argument (22)\nBrok=
en pipe\n../src/tests/qtest/libqtest.c:188: kill_qemu() detected QEMU death=
 from signal 11 (Segmentation fault) (core dumped)\n&quot;<br>Bail out! ERR=
OR:../src/tests/qtest/qos-test.c:191:subprocess_run_one_test: child process=
 (/aarch64/virt/generic-pcihost/pci-bus-generic/pci-bus/virtio-net-pci/virt=
io-net/virtio-net-tests/vhost-user/flags-mismatch/subprocess [384604]) fail=
ed unexpectedly<br>----------------------------------- stderr -------------=
----------------------<br>qemu-system-aarch64: Failed to write msg. Wrote -=
1 instead of 20.<br>qemu-system-aarch64: vhost VQ 0 ring restore failed: -2=
2: Invalid argument (22)<br>qemu-system-aarch64: Failed to set msg fds.<br>=
qemu-system-aarch64: vhost VQ 1 ring restore failed: -22: Invalid argument =
(22)<br>qemu-system-aarch64: -chardev socket,id=3Dchr-reconnect,path=3D/tmp=
/vhost-test-FTJ0U1/reconnect.sock,server=3Don: info: QEMU waiting for conne=
ction on: disconnected:unix:/tmp/vhost-test-FTJ0U1/reconnect.sock,server=3D=
on<br>qemu-system-aarch64: Failed to write msg. Wrote -1 instead of 20.<br>=
qemu-system-aarch64: vhost VQ 0 ring restore failed: -22: Invalid argument =
(22)<br>qemu-system-aarch64: Failed to set msg fds.<br>qemu-system-aarch64:=
 vhost VQ 1 ring restore failed: -22: Invalid argument (22)<br>qemu-system-=
aarch64: -chardev socket,id=3Dchr-connect-fail,path=3D/tmp/vhost-test-4W4DV=
1/connect-fail.sock,server=3Don: info: QEMU waiting for connection on: disc=
onnected:unix:/tmp/vhost-test-4W4DV1/connect-fail.sock,server=3Don<br>qemu-=
system-aarch64: -netdev vhost-user,id=3Dhs0,chardev=3Dchr-connect-fail,vhos=
tforce=3Don: Failed to read msg header. Read 0 instead of 12. Original requ=
est 1.<br>qemu-system-aarch64: -netdev vhost-user,id=3Dhs0,chardev=3Dchr-co=
nnect-fail,vhostforce=3Don: vhost_backend_init failed: Protocol error<br>qe=
mu-system-aarch64: -netdev vhost-user,id=3Dhs0,chardev=3Dchr-connect-fail,v=
hostforce=3Don: failed to init vhost_net for queue 0<br>qemu-system-aarch64=
: -netdev vhost-user,id=3Dhs0,chardev=3Dchr-connect-fail,vhostforce=3Don: i=
nfo: QEMU waiting for connection on: disconnected:unix:/tmp/vhost-test-4W4D=
V1/connect-fail.sock,server=3Don<br>qemu-system-aarch64: Failed to set msg =
fds.<br>qemu-system-aarch64: vhost VQ 0 ring restore failed: -22: Invalid a=
rgument (22)<br>qemu-system-aarch64: Failed to set msg fds.<br>qemu-system-=
aarch64: vhost VQ 1 ring restore failed: -22: Invalid argument (22)<br>qemu=
-system-aarch64: -chardev socket,id=3Dchr-flags-mismatch,path=3D/tmp/vhost-=
test-BBEAV1/flags-mismatch.sock,server=3Don: info: QEMU waiting for connect=
ion on: disconnected:unix:/tmp/vhost-test-BBEAV1/flags-mismatch.sock,server=
=3Don<br>qemu-system-aarch64: Failed to write msg. Wrote -1 instead of 52.<=
br>qemu-system-aarch64: vhost_set_mem_table failed: Invalid argument (22)<b=
r>qemu-system-aarch64: Failed to set msg fds.<br>qemu-system-aarch64: vhost=
 VQ 0 ring restore failed: -22: Invalid argument (22)<br>Broken pipe<br>../=
src/tests/qtest/libqtest.c:188: kill_qemu() detected QEMU death from signal=
 11 (Segmentation fault) (core dumped)<br>**<br>ERROR:../src/tests/qtest/qo=
s-test.c:191:subprocess_run_one_test: child process (/aarch64/virt/generic-=
pcihost/pci-bus-generic/pci-bus/virtio-net-pci/virtio-net/virtio-net-tests/=
vhost-user/flags-mismatch/subprocess [384604]) failed unexpectedly<br><br>(=
test program exited with status code -6)<br>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br><br>=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D 77/541 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>test: =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 qemu:qtest+qtest-arm / qtest-arm/qos-test<br>start tim=
e: =C2=A0 16:04:10<br>duration: =C2=A0 =C2=A0 17.60s<br>result: =C2=A0 =C2=
=A0 =C2=A0 killed by signal 6 SIGABRT<br>command: =C2=A0 =C2=A0 =C2=A0MALLO=
C_PERTURB_=3D98 QTEST_QEMU_IMG=3D./qemu-img QTEST_QEMU_STORAGE_DAEMON_BINAR=
Y=3D./storage-daemon/qemu-storage-daemon QTEST_QEMU_BINARY=3D./qemu-system-=
arm G_TEST_DBUS_DAEMON=3D../src/tests/dbus-vmstate-daemon.sh ./tests/qtest/=
qos-test --tap -k</div><div><br></div><div>Best regards,</div><div>Bernhard=
<br></div></div></div>

--0000000000008e8f9805ecbbc90c--

