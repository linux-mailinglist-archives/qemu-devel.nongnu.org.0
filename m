Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8794E169CC
	for <lists+qemu-devel@lfdr.de>; Tue,  7 May 2019 20:02:35 +0200 (CEST)
Received: from localhost ([127.0.0.1]:50903 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hO4QE-0000BK-Er
	for lists+qemu-devel@lfdr.de; Tue, 07 May 2019 14:02:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40856)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hO4Ov-0008ED-Rf
	for qemu-devel@nongnu.org; Tue, 07 May 2019 14:01:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hO4Ou-0004hR-Uu
	for qemu-devel@nongnu.org; Tue, 07 May 2019 14:01:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60638)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1hO4Op-0004Xb-Ci; Tue, 07 May 2019 14:01:07 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D51DBCA1FD;
	Tue,  7 May 2019 18:01:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-28.ams2.redhat.com
	[10.36.116.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E317D1001E8D;
	Tue,  7 May 2019 18:01:01 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 5FBEA1132B35; Tue,  7 May 2019 20:01:00 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Xiang Zheng <zhengxiang9@huawei.com>
References: <20190505070059.4664-1-zhengxiang9@huawei.com>
Date: Tue, 07 May 2019 20:01:00 +0200
In-Reply-To: <20190505070059.4664-1-zhengxiang9@huawei.com> (Xiang Zheng's
	message of "Sun, 5 May 2019 15:00:59 +0800")
Message-ID: <87a7fyb0v7.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 07 May 2019 18:01:04 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] pflash: Only read non-zero parts of
 backend image
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-block@nongnu.org,
	ard.biesheuvel@linaro.org, qemu-devel@nongnu.org,
	mreitz@redhat.com, stefanha@redhat.com, guoheyi@huawei.com,
	wanghaibin.wang@huawei.com, lersek@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The subject is slightly misleading.  Holes read as zero.  So do
non-holes full of zeroes.  The patch avoids reading the former, but
still reads the latter.

Xiang Zheng <zhengxiang9@huawei.com> writes:

> Currently we fill the memory space with two 64MB NOR images when
> using persistent UEFI variables on virt board. Actually we only use
> a very small(non-zero) part of the memory while the rest significant
> large(zero) part of memory is wasted.

Neglects to mention that the "virt board" is ARM.

> So this patch checks the block status and only writes the non-zero part
> into memory. This requires pflash devices to use sparse files for
> backends.

I started to draft an improved commit message, but then I realized this
patch can't work.

The pflash_cfi01 device allocates its device memory like this:

    memory_region_init_rom_device(
        &pfl->mem, OBJECT(dev),
        &pflash_cfi01_ops,
        pfl,
        pfl->name, total_len, &local_err);

pflash_cfi02 is similar.

memory_region_init_rom_device() calls
memory_region_init_rom_device_nomigrate() calls qemu_ram_alloc() calls
qemu_ram_alloc_internal() calls g_malloc0().  Thus, all the device
memory gets written to even with this patch.

I'm afraid you neglected to test.

I still believe this approach can be made to work.  Need a replacement
for memory_region_init_rom_device() that uses mmap() with MAP_ANONYMOUS.

