Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3BF30CFA9
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 00:09:10 +0100 (CET)
Received: from localhost ([::1]:45928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l74nF-0008GV-T0
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 18:09:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l74cL-0007G2-MG
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 17:57:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l74cH-0002nN-U9
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 17:57:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612306669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hNk5tozw0vbTGbyrIdrroXUO5AzudPZMYaC/YhzvlmQ=;
 b=iYAKEtrTWZQMMpZFZlJACk89S03ABsLJnc+un2SxAsg5+IXDWZHqay287FJ+kCSZoDUTgz
 TCNl+hd2NYAGeCQzM2n+yNul3sIKkKP6y8KKx4wzHqjeTr4GqQrhxlX5cs/niqbt9KRPwD
 7KuMwgNV7TTO5j2Q9iKp1DTZQKxecLo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-90-y58p9SSeNFiTPQk_K5WyEg-1; Tue, 02 Feb 2021 17:57:46 -0500
X-MC-Unique: y58p9SSeNFiTPQk_K5WyEg-1
Received: by mail-wr1-f69.google.com with SMTP id c1so13352625wrx.2
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 14:57:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=hNk5tozw0vbTGbyrIdrroXUO5AzudPZMYaC/YhzvlmQ=;
 b=nrlkxPJkzIM/dTT0OWgnliLNhvzghWYFlIfSnqYs4YhaMBYLdqdCvfmyjxQZeWEoQl
 LdqFtl0dNwplw7y+lD2pc5hfsrSelcTSjxDrv/YYKpvXOEch4IvXGRd7CTs6uDWLEspy
 +KEoydeY44FiF1Qcx8bUOBZ0ieDjq4D0rSXwBt3Cj2CvmuxlUsyd/D77MR1awBxHxm9v
 mjeRbBopiCOK7sume3TV+FcQuWlfvOE7E0uVcfjCoJaGNHoVEqykFvkATYsgWMzym0oF
 l5p50h+BSr48cZkLE/ORVJwjhAwtpd2n3Mzhw3TNzvy7wv5CXjyzG2HoNnJpUUvA8rYr
 lLyw==
X-Gm-Message-State: AOAM532H1Hr/NIukaeL87qbaz0AxDaKLC/qzAsFRKFuJH1KB5jI9gK/j
 ZwaRkhYOHK4su+fn+y23hmtsu4if3q96guq2Ad6jeDw/8kanDAtlQO9a+Btij4h4mDfUAV60gnm
 Tf/j9zHWvTAl4mjw=
X-Received: by 2002:a1c:9c01:: with SMTP id f1mr184092wme.159.1612306664795;
 Tue, 02 Feb 2021 14:57:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwB502qpiRiQaAHRRzMtNrWkTM/7pdh7InHUds9D2h72siXZXszNvKiUwelqTV2z6cA+RSd1g==
X-Received: by 2002:a1c:9c01:: with SMTP id f1mr184081wme.159.1612306664570;
 Tue, 02 Feb 2021 14:57:44 -0800 (PST)
Received: from redhat.com (bzq-79-177-39-148.red.bezeqint.net. [79.177.39.148])
 by smtp.gmail.com with ESMTPSA id v1sm1276wmj.31.2021.02.02.14.57.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 14:57:43 -0800 (PST)
Date: Tue, 2 Feb 2021 17:57:41 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 0/9] pc,virtio: fixes, features
Message-ID: <20210202175645-mutt-send-email-mst@kernel.org>
References: <20210202151116.1573669-1-mst@redhat.com>
 <CAFEAcA8aZ6qTLjp00FyqYUwtqk0tAFYUpjW0FeepPMMVfOUbPg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8aZ6qTLjp00FyqYUwtqk0tAFYUpjW0FeepPMMVfOUbPg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 02, 2021 at 10:44:28PM +0000, Peter Maydell wrote:
> On Tue, 2 Feb 2021 at 15:12, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > The following changes since commit 9cd69f1a270235b652766f00b94114f48a2d603f:
> >
> >   Merge remote-tracking branch 'remotes/stefanberger/tags/pull-tpm-2021-01-25-1' into staging (2021-01-26 09:51:02 +0000)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> >
> > for you to fetch changes up to 737242ed5be0a7119aad55894148b3f5dec41200:
> >
> >   virtio-pmem: add trace events (2021-01-27 08:02:39 -0500)
> >
> > ----------------------------------------------------------------
> > pc,virtio: fixes, features
> >
> > Fixes all over the place.
> > Ability to control ACPI OEM ID's.
> >
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> >
> > ----------------------------------------------------------------
> > Eugenio Pérez (1):
> >       virtio: Add corresponding memory_listener_unregister to unrealize
> >
> > Laurent Vivier (1):
> >       virtio-mmio: fix guest kernel crash with SHM regions
> >
> > Marian Postevca (5):
> >       tests/acpi: allow updates for expected data files
> >       acpi: Permit OEM ID and OEM table ID fields to be changed
> >       tests/acpi: add OEM ID and OEM TABLE ID test
> >       tests/acpi: update expected data files
> >       tests/acpi: disallow updates for expected data files
> >
> > Pankaj Gupta (1):
> >       virtio-pmem: add trace events
> >
> > Stefano Garzarella (1):
> >       virtio: move 'use-disabled-flag' property to hw_compat_4_2
> 
> Fails to build, aarch64:
> 
> In file included from /usr/include/string.h:495,
>                  from /home/pm/qemu/include/qemu/osdep.h:87,
>                  from ../../hw/arm/virt.c:31:
> In function ‘strncpy’,
>     inlined from ‘virt_set_oem_table_id’ at ../../hw/arm/virt.c:2197:5:
> /usr/include/aarch64-linux-gnu/bits/string_fortified.h:106:10: error:
> ‘__builtin_strncpy’ specified bound depends on the length of the
> source argument [-Werror=stringop-overflow=]
>   106 |   return __builtin___strncpy_chk (__dest, __src, __len, __bos (__dest));
>       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../../hw/arm/virt.c: In function ‘virt_set_oem_table_id’:
> ../../hw/arm/virt.c:2190:18: note: length computed here
>  2190 |     size_t len = strlen(value);
>       |                  ^~~~~~~~~~~~~
> In file included from /usr/include/string.h:495,
>                  from /home/pm/qemu/include/qemu/osdep.h:87,
>                  from ../../hw/arm/virt.c:31:
> In function ‘strncpy’,
>     inlined from ‘virt_set_oem_id’ at ../../hw/arm/virt.c:2176:5:
> /usr/include/aarch64-linux-gnu/bits/string_fortified.h:106:10: error:
> ‘__builtin_strncpy’ specified bound depends on the length of the
> source argument [-Werror=stringop-overflow=]
>   106 |   return __builtin___strncpy_chk (__dest, __src, __len, __bos (__dest));
>       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../../hw/arm/virt.c: In function ‘virt_set_oem_id’:
> ../../hw/arm/virt.c:2168:18: note: length computed here
>  2168 |     size_t len = strlen(value);
>       |                  ^~~~~~~~~~~~~
> 

I added a fixup on top, and pushed.


> Also iotest 030 failed on openbsd, which might be an intermittent rather
> than anything to do with this patchset:
> 
>   TEST   iotest-qcow2: 030 [fail]
> QEMU          --
> "/home/qemu/qemu-test.vl8fUt/build/tests/qemu-iotests/../../qemu-system-aarch64"
> -nodefaults -di
> splay none -accel qtest -machine virt
> QEMU_IMG      --
> "/home/qemu/qemu-test.vl8fUt/build/tests/qemu-iotests/../../qemu-img"
> QEMU_IO       --
> "/home/qemu/qemu-test.vl8fUt/build/tests/qemu-iotests/../../qemu-io"
> --cache writeback --aio thr
> eads -f qcow2
> QEMU_NBD      --
> "/home/qemu/qemu-test.vl8fUt/build/tests/qemu-iotests/../../qemu-nbd"
> IMGFMT        -- qcow2
> IMGPROTO      -- file
> PLATFORM      -- OpenBSD/amd64 openbsd.localnet 6.8
> TEST_DIR      -- /home/qemu/qemu-test.vl8fUt/build/tests/qemu-iotests/scratch
> SOCK_DIR      -- /tmp/tmpu4236zgh
> SOCKET_SCM_HELPER --
> --- /home/qemu/qemu-test.vl8fUt/src/tests/qemu-iotests/030.out
> +++ 030.out.bad
> @@ -1,5 +1,17 @@
> -...........................
> +.........F.................
> +======================================================================
> fcntl(): Invalid argument
> +FAIL: test_overlapping_5 (__main__.TestParallelOps)
> +----------------------------------------------------------------------
> +Traceback (most recent call last):
> +  File "/home/qemu/qemu-test.vl8fUt/src/tests/qemu-iotests/030", line
> 424, in test_overlapping_5
> +    self.assert_qmp(result, 'return', {})
> +  File "/home/qemu/qemu-test.vl8fUt/src/tests/qemu-iotests/iotests.py",
> line 925, in assert_qmp
> +    result = self.dictpath(d, path)
> +  File "/home/qemu/qemu-test.vl8fUt/src/tests/qemu-iotests/iotests.py",
> line 899, in dictpath
> +    self.fail(f'failed path traversal for "{path}" in "{d}"')
> +AssertionError: failed path traversal for "return" in "{'error':
> {'class': 'DeviceNotActive', 'desc': "Block job
>  'drive0' not found"}}"
> +
>  ----------------------------------------------------------------------
>  Ran 27 tests


Can not see how it can be related ATM.

> -OK
> +FAILED (failures=1, skipped=1)
> 
> -- PMM


