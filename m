Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 084E75EB7C5
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 04:37:19 +0200 (CEST)
Received: from localhost ([::1]:40108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od0TF-0001u0-MF
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 22:37:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1od0Ru-0000Wz-7b
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 22:35:54 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:45669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1od0Rq-0004cB-QF
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 22:35:53 -0400
Received: by mail-pg1-x530.google.com with SMTP id r62so4356384pgr.12
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 19:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date;
 bh=uQzlWUyYz3jhR2wqZgwK64Ici6dYSgND12egyWDe9ts=;
 b=F/s2piRrSeGwDMa4H+eXCznJWqfFkN3VvuIgjGZSGm/ryZWh8EGQwCgFbfcDvKPQcS
 tygFtLPnI7cBtUYGPo8VfFhOx26+0VOas05sLbadvWVRQSPQHKhCi5Z0Khn6v++PsiW4
 Lo57FOOoSOWahylv9BLMMHvBRJsI8yjTsQWQIZ69qAnyiGkXMJ7yIOe+MkcsKpGZHhXg
 ag9dTGaHa5JJuGMZNPxOinmm+/9GAt6z+OTD+9+4Rjw1XXmNvYUBsWlQhu9C17XEd75P
 HvAJ/24UbrYjzqzJnwJL7MaJGFD/5+rN7++cKpu+V7Y+QbTjcX/i0vAFOSzRlmxPYxgN
 g/OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date;
 bh=uQzlWUyYz3jhR2wqZgwK64Ici6dYSgND12egyWDe9ts=;
 b=l7cV6K3Wx/u57bXZgSrBovzRDeNnCiiv4WdQLwXb4u+bbzy0GudBWd/+HoUV1II4wM
 V+qhP3JItnVq64opX5dL8gsKrOqwa/8tb1r9AWTPaqylLI1a7nPIz/cQD4IGCwQuEMET
 Kuw1OvkiV9hXNTJg5G8X5ljiqxPZfWiP1tQodhRaq5zVJH0cWN/JDBmhvwly4aCzrUew
 Hy5n668dxWGUFNAjyNmyFqXD54ggI9zQmsmjHviEgFjh4DaKuo93B9SN1kh00vRA1Q//
 kjZxBuc63IRcWg/UQQ8oLxgKNhmTF0UcE5Pt0VJnRfhg9SQvLZ7xMwscrwvJEY3wp+B4
 oruA==
X-Gm-Message-State: ACrzQf3oMKWOdZ5AzCHYptcGrwi2kV/Nyu5YEvWPrWo/3BYYV2MISI2T
 M0wnRGeNoqrryhYtc4HF7DmDkKBsFQeJYw==
X-Google-Smtp-Source: AMsMyM68+D8N+QuzMORFlG4lrHBfXNgOAiQOd1zPxnwH3Qk0QEqpRk43wxnw5r3hMnPo0Qswb08jJw==
X-Received: by 2002:a63:1849:0:b0:43c:8346:57f7 with SMTP id
 9-20020a631849000000b0043c834657f7mr12292216pgy.222.1664246146593; 
 Mon, 26 Sep 2022 19:35:46 -0700 (PDT)
Received: from [192.168.10.153]
 (ppp121-45-204-168.cbr-trn-nor-bras38.tpg.internode.on.net. [121.45.204.168])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a170902e74d00b00172973d3cd9sm169212plf.55.2022.09.26.19.35.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Sep 2022 19:35:45 -0700 (PDT)
Message-ID: <89d24ddd-bff8-53dd-19c9-66ac43ab0b63@ozlabs.ru>
Date: Tue, 27 Sep 2022 12:35:40 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:104.0) Gecko/20100101
 Thunderbird/104.0
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: nikunj@amd.com, "Roth, Michael" <Michael.Roth@amd.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: x86, pflash, unassigned memory access
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=aik@ozlabs.ru; helo=mail-pg1-x530.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi!

I am trying qemu-system-x86_64 with OVMF with the q35 machine, the 
complete command line is below.

It works fine (including SEV on AMD EPYC), but these 2 parameters make 
me wonder if I miss something:

-drive 
if=pflash,format=raw,unit=0,file=/home/aik/OVMF_CODE.fd,readonly=on,id=MYPF 
\
-d guest_errors

With this, I see a bunch of
===
Invalid access at addr 0xFFC00000, size 1, region '(null)', reason: rejected
Invalid access at addr 0xFFC00001, size 1, region '(null)', reason: rejected
Invalid access at addr 0xFFC00002, size 1, region '(null)', reason: rejected
...
Invalid access at addr 0xFFC00FFF, size 1, region '(null)', reason: rejected
QEMU Flash: Failed to find probe location
QEMU flash was not detected. Writable FVB is not being installed.
===

These are the indication of unassigned memory access which always meant 
a bug in my past experience (which is POWERPC so not so relevant here 
but nevertheless).

OVMF is probing the flash at 0xFFC00000 (hardcoded in OVMF) in
https://github.com/tianocore/edk2/blob/master/OvmfPkg/QemuFlashFvbServicesRuntimeDxe/QemuFlash.c#L65
but cannot succeed - "info mtree -f" says that at no point there is 
anything at 0xFFC00000:

===
...
00000000fed1c000-00000000fed1ffff (prio 1, i/o): lpc-rcrb-mmio
00000000fee00000-00000000feefffff (prio 4096, i/o): kvm-apic-msi
00000000ffc84000-00000000ffffffff (prio 0, romd): system.flash0 KVM
0000000800000000-0000000800000fff (prio 0, i/o): 
virtio-pci-common-virtio-net
...
===

hw/block/pflash_cfi01.c suggests QEMU implements this protocol via 
pflash_cfi01_ops but it is never called as:
- it is the same memory region as the OVMF code and
- it is mapped at 0xffc84000 (which is 4G - 
size("./Build/OvmfX64/DEBUG_GCC5/FV/OVMF_CODE.fd"), not where OVMF 
expects it) and
- it has romd==true, it is a KVM memory slot and IO is never emulated in 
QEMU.

Adding another IO memory region with pflash_cfi01_ops and mapping it at 
0xFFC00000 makes it loop in OVMF somewhere.

OVMF code is linked to hardcoded 0xffc84000 (FD_SIZE_IN_KB==4096).


So I wonder - are these illegal accesses a bug of some sort in QEMU or 
OVMF or command line? Thanks,




The complete command line is:

/home/aik/pbuild/qemu-snp-localhost-x86_64/qemu-system-x86_64 \
-enable-kvm \
-m 2G \
-smp 2 \
-netdev user,id=USER0,hostfwd=tcp::2223-:22 \
-device 
virtio-net-pci,id=vnet0,iommu_platform=on,disable-legacy=on,romfile=,netdev=USER0 
\
-machine q35 \
-device 
virtio-scsi-pci,id=vscsi0,iommu_platform=on,disable-modern=off,disable-legacy=on 
\
-drive 
id=DRIVE0,if=none,file=img/u2204_128G_aikbook_sev.qcow2,format=qcow2 \
-device scsi-hd,id=scsi-hd0,drive=DRIVE0 \
-drive 
if=pflash,format=raw,unit=0,file=/home/aik/OVMF_CODE.fd,readonly=on,id=MYPF 
\
-nographic \
-chardev stdio,id=STDIO0,signal=off,mux=on \
-device isa-serial,id=isa-serial0,chardev=STDIO0 \
-mon id=MON0,chardev=STDIO0,mode=readline \
-kernel /boot/vmlinuz \
-append console=ttyS0,115200n1 earlyprintk root=/dev/sda3 \
-d guest_errors


-- 
Alexey

