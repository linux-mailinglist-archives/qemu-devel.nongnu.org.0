Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BABD02FABBB
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 21:43:07 +0100 (CET)
Received: from localhost ([::1]:43884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1bMg-0005pP-QO
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 15:43:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1l1ay3-0004ae-Fg
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 15:17:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1l1ay1-0003Pg-DU
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 15:17:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611001055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dQroBxjwrzS931alxGXATn99mt0PDII9I/oK7ry28As=;
 b=TGYhJe9WLAZ4UYMEohEvvz353uFMPSnvPjr6HUUkFZgD6BgFaDiknV3ZjqlIgDGsK1CBRH
 /cwd2ZYohi0PYApkXMgmF3/NW83u1+FB4MRcvs6g2A2cMeqVp0ucu5ISUR3LzaN3NoNO71
 l21NsuK3P2x8eJTkoj+1JAuvrOeOrQg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-PmhEMeFYNiSYk7p-7EAtXQ-1; Mon, 18 Jan 2021 15:17:32 -0500
X-MC-Unique: PmhEMeFYNiSYk7p-7EAtXQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F19C0107ACF7;
 Mon, 18 Jan 2021 20:17:30 +0000 (UTC)
Received: from [10.36.113.27] (ovpn-113-27.ams2.redhat.com [10.36.113.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 04A785D9CD;
 Mon, 18 Jan 2021 20:17:29 +0000 (UTC)
Subject: Re: [PULL 11/24] tcg/optimize: Use tcg_constant_internal with
 constant folding
To: Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair23@gmail.com>
References: <20210114021654.647242-1-richard.henderson@linaro.org>
 <20210114021654.647242-12-richard.henderson@linaro.org>
 <CAKmqyKOezdn_bjyjAsAbiXQj_Cz-fphYCezo-tbBAjGR=Emgng@mail.gmail.com>
 <ccc7858f-46e7-0634-cad3-fe5bb0d5e99a@linaro.org>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <aec0a4e1-31e3-7fde-d8d9-3f81d9a16383@redhat.com>
Date: Mon, 18 Jan 2021 21:17:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <ccc7858f-46e7-0634-cad3-fe5bb0d5e99a@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.194, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/01/2021 18:24, Richard Henderson wrote:
> On 1/15/21 1:03 PM, Alistair Francis wrote:
>> I run QEMU with these arguments:
>>
>> ./build/riscv32-softmmu/qemu-system-riscv32 \
>>     -machine virt -serial mon:stdio -serial null -nographic \
>>     -append "root=/dev/vda rw highres=off  console=ttyS0 ip=dhcp earlycon=sbi" \
>>     -device virtio-net-device,netdev=net0,mac=52:54:00:12:34:02
>> -netdev user,id=net0 \
>>     -object rng-random,filename=/dev/urandom,id=rng0 -device
>> virtio-rng-device,rng=rng0 \
>>     -smp 4 -d guest_errors -m 256M \
>>     -kernel ./Image \
>>     -drive id=disk0,file=./core-image-minimal-qemuriscv32.ext4,if=none,format=raw
>> \
>>     -device virtio-blk-device,drive=disk0 \
>>     -bios default
>>
>> I am uploading the images to:
>> https://nextcloud.alistair23.me/index.php/s/MQFyGGNLPZjLZPH
> 
> I don't replicate the assertion failure, I get to
> 
> /sbin/init: error while loading shared libraries: libkmod.so.2: cannot open
> shared object file: Error 74
> [    0.819845] Kernel panic - not syncing: Attempted to kill init!
> exitcode=0x00007f00
> [    0.820430] CPU: 1 PID: 1 Comm: init Not tainted 5.11.0-rc3 #1

This commit breaks the build of my hello world test program with mips64el/stretch guest
(and I guess some others too).

cat > $CHROOT/tmp/hello.c <<EOF
#include <stdio.h>
int main(void)
{
    printf("Hello World!\n");
    return 0;
}
EOF

unshare --time --ipc --uts --pid --fork --kill-child --mount --mount-proc --root \
        $CHROOT gcc /tmp/hello.c -o /tmp/hello
/tmp/hello.c:1:0: internal compiler error: Segmentation fault
 #include <stdio.h>

executable file is not ELF
Please submit a full bug report,
with preprocessed source if appropriate.
See <file:///usr/share/doc/gcc-6/README.Bugs> for instructions.

# gcc --version
gcc (Debian 6.3.0-18+deb9u1) 6.3.0 20170516
Copyright (C) 2016 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

Any idea?

Thanks,
Laurent



