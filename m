Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 815142B5BBB
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 10:23:35 +0100 (CET)
Received: from localhost ([::1]:55036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kexD4-0001f9-Kq
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 04:23:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kexAi-000631-DT
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 04:21:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kexAe-0007Ah-6Q
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 04:21:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605604863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lKA+Yv2HI9tGZibW3JduDbJ6e12Feg+Lsq8EgUpbKHY=;
 b=FIjEU8oHFy/wMQ8gfjqgF91nEBDuSqx7NEx5pYQAIjY4dm2TFHcdl7xQbLKHx0qdzi7Gfb
 TvtH1OXVIKKoYyvX7AOiZRaKc2VmtarW+jLAElCutFOoIQTxTlpDIASOEYR5q5hPwvxWp5
 62Ukb1TWFiGCl6wu5KpWBuIrOn8F46s=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-OE_L_h-NPUCnLc4vCUxGyQ-1; Tue, 17 Nov 2020 04:21:00 -0500
X-MC-Unique: OE_L_h-NPUCnLc4vCUxGyQ-1
Received: by mail-wm1-f72.google.com with SMTP id y26so1238801wmj.7
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 01:21:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lKA+Yv2HI9tGZibW3JduDbJ6e12Feg+Lsq8EgUpbKHY=;
 b=cZmpuVOL4CTRRPLtasRqhi8UjqrLeqO0nGv1x88qUEiH6SkFRxDzysBZvJzmaKfkLr
 agB+GlsrCxX5vKFa6DI5beF0aDmGse5CvIJvGmDV4NAr7M6/ise+eS2zCDTdZrLt3x3G
 mNYmnsy/u8fiziVRnEKxop2SNus6depGag5eL0YFkS+Y1QhAIJc29xvDSCnDWFZNGC16
 /d7KtrAaa8fkvXstX8XyG9OVzY5jC1zcdr3vbEfsugLVUndexsX4m72DKl8/9BjN+7aF
 a86Mbd2Z2scXOE30LALv4ccNZlmQFa1Dx4AGw75/TiqnSBP2vWqgqHMcMuZfGCrkGuxU
 V3qg==
X-Gm-Message-State: AOAM531Kv6JsgpndBVMFIE/UwaMjOWh5VNEHgy++pMvwmabdpnc53Gev
 TPeERVmluovybznzFGWWek2hq0ArIVevbmKM4kDT5Z1MeMILc6dU2SSG/s3I77j9WB7VGpntpMa
 eJrPiZpXouJddLm0=
X-Received: by 2002:a1c:a752:: with SMTP id q79mr3193006wme.24.1605604859524; 
 Tue, 17 Nov 2020 01:20:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzFkHmrRLiKZOc70B3QdwYwYb3fXmDykKC/WDP2taUMt2JXppoA5F2U7SCmR1sfgwWgljgjMA==
X-Received: by 2002:a1c:a752:: with SMTP id q79mr3192982wme.24.1605604859278; 
 Tue, 17 Nov 2020 01:20:59 -0800 (PST)
Received: from redhat.com (bzq-79-176-118-93.red.bezeqint.net. [79.176.118.93])
 by smtp.gmail.com with ESMTPSA id g11sm26926415wrq.7.2020.11.17.01.20.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 01:20:58 -0800 (PST)
Date: Tue, 17 Nov 2020 04:20:56 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/17] pc,vhost: fixes, new test
Message-ID: <20201117041924-mutt-send-email-mst@kernel.org>
References: <20201115220740.488850-1-mst@redhat.com>
 <CAFEAcA9JdRPcEcKTqCHOMSeKpduy6jWS=kMa2sZCxa1BjGTzYg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9JdRPcEcKTqCHOMSeKpduy6jWS=kMa2sZCxa1BjGTzYg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 00:41:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU Developers <qemu-devel@nongnu.org>, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 16, 2020 at 02:19:11PM +0000, Peter Maydell wrote:
> On Sun, 15 Nov 2020 at 22:27, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > The following changes since commit c6f28ed5075df79fef39c500362a3f4089256c9c:
> >
> >   Update version for v5.2.0-rc1 release (2020-11-10 22:29:57 +0000)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> >
> > for you to fetch changes up to fe8d9946228d4df6c020f2cb38b6ac08981727cf:
> >
> >   vhost-user-blk/scsi: Fix broken error handling for socket call (2020-11-15 17:05:47 -0500)
> >
> > ----------------------------------------------------------------
> > pc,vhost: fixes, new test
> >
> > Lots of fixes all over the place.
> > A new test case which seems like a good idea even at
> > this late stage: can't break things and will make
> > sure we don't introduce regressions.
> >
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> >
> > ----------------------------------------------------------------
> 
> Something in this seems to cause hangs in 'make check' on
> my x86-64 Linux box: sample 'ps wafux' output:
> 
> petmay01 30354  0.0  0.0  17392  9348 ?        S    13:40   0:00
>                    \_ make --output-sync -C build/a
> ll check V=1 -j8
> petmay01  7093  0.0  0.0  13916  3608 ?        S    13:41   0:00
>                        \_ bash -o pipefail -c echo
> 'MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
> QTEST_QEMU_IMG=./qemu-img
> G_TEST_DBUS_DAEMON=/home/petmay01/linaro/qemu-for-merges/tests/dbus-vmstate-daemon.sh
> QTEST_QEMU_BINARY=./qemu-system-i386 tests/qtest/qos-test --tap -k' &&
> MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
> QTEST_QEMU_IMG=./qemu-img
> G_TEST_DBUS_DAEMON=/home/petmay01/linaro/qemu-for-merges/tests/dbus-vmstate-daemon.sh
> QTEST_QEMU_BINARY=./qemu-system-i386 tests/qtest/qos-test --tap -k <
> /dev/null | ./scripts/tap-driver.pl --test-name="qtest-i386/qos-test"
> petmay01  7095  0.0  0.0  37764 11744 ?        S    13:41   0:00
>                        |   \_ perl ./scripts/tap-driver.pl
> --test-name=qtest-i386/qos-test
> petmay01 14023  0.0  0.0  13916  3568 ?        S    13:41   0:00
>                        \_ bash -o pipefail -c echo
> 'MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
> QTEST_QEMU_IMG=./qemu-img
> G_TEST_DBUS_DAEMON=/home/petmay01/linaro/qemu-for-merges/tests/dbus-vmstate-daemon.sh
> QTEST_QEMU_BINARY=./qemu-system-ppc64 tests/qtest/qos-test --tap -k'
> && MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
> QTEST_QEMU_IMG=./qemu-img
> G_TEST_DBUS_DAEMON=/home/petmay01/linaro/qemu-for-merges/tests/dbus-vmstate-daemon.sh
> QTEST_QEMU_BINARY=./qemu-system-ppc64 tests/qtest/qos-test --tap -k <
> /dev/null | ./scripts/tap-driver.pl --test-name="qtest-ppc64/qos-test"
> petmay01 14025  0.0  0.0  37828 11760 ?        S    13:41   0:00
>                        |   \_ perl ./scripts/tap-driver.pl
> --test-name=qtest-ppc64/qos-test
> petmay01 22886  0.0  0.0  13916  3716 ?        S    13:42   0:00
>                        \_ bash -o pipefail -c echo
> 'MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
> QTEST_QEMU_IMG=./qemu-img
> G_TEST_DBUS_DAEMON=/home/petmay01/linaro/qemu-for-merges/tests/dbus-vmstate-daemon.sh
> QTEST_QEMU_BINARY=./qemu-system-x86_64 tests/qtest/qos-test --tap -k'
> && MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
> QTEST_QEMU_IMG=./qemu-img
> G_TEST_DBUS_DAEMON=/home/petmay01/linaro/qemu-for-merges/tests/dbus-vmstate-daemon.sh
> QTEST_QEMU_BINARY=./qemu-system-x86_64 tests/qtest/qos-test --tap -k <
> /dev/null | ./scripts/tap-driver.pl
> --test-name="qtest-x86_64/qos-test"
> petmay01 22888  0.0  0.0  37764 11836 ?        S    13:42   0:00
>                            \_ perl ./scripts/tap-driver.pl
> --test-name=qtest-x86_64/qos-test
> 
> 
> Something somewhere is also apparently leaving a qemu-storage-daemon
> process running on bigendian hosts only (?): I see this on my s390x
> test box:
> 
> ubuntu   26700  0.0  0.5 330776 21552 ?        Sl   08:40   0:00
> ./storage-daemon/qemu-storage-daemon --chardev
> socket,id=qmp,fd=11,server,nowait --monitor chardev=qmp --blockdev
> driver=file,node-name=disk0,filename=qtest.V5gfPm --export
> type=vhost-user-blk,id=disk0,addr.type=fd,addr.str=16,node-name=disk0,writable=on,num-queues=8
> --blockdev driver=file,node-name=disk1,filename=qtest.JM24xB --export
> type=vhost-user-blk,id=disk1,addr.type=fd,addr.str=17,node-name=disk1,writable=on,num-queues=8
> 
> and similarly on the ppc64be box (but not on other machines).
> This seems to be associated with this test failure:
> 
> ERROR:../../tests/qtest/vhost-user-blk-test.c:738:multiqueue:
> assertion failed (num_queues == 8): (2048 == 8)
> ERROR qtest-i386/qos-test - Bail out!
> ERROR:../../tests/qtest/vhost-user-blk-test.c:738:multiqueue:
> assertion failed (num_queues == 8): (2048 == 8)
> Makefile.mtest:1857: recipe for target 'run-test-230' failed
> 
> which looks suspiciously like an endianness bug somewhere.
> 
> Ideally if the test case starts external processes it should
> make sure they're cleaned up even if the test fails.
> 
> thanks
> -- PMM


Must be vhost user blk test patch exposing some more latent races ...
I dropped that for now, and sent pull v2.
Same tag.

-- 
MST


