Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E3B5F3B91
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 05:03:53 +0200 (CEST)
Received: from localhost ([::1]:54000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofYDn-0002j9-OP
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 23:03:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1ofYBB-0001HQ-UH
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 23:01:12 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:43546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1ofYB8-0003re-Uf
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 23:01:09 -0400
Received: by mail-pf1-x432.google.com with SMTP id 83so5001679pfw.10
 for <qemu-devel@nongnu.org>; Mon, 03 Oct 2022 20:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=8chpKPOU/iOby7d4jYTkAyJ1a6jhveqUSMXzG0oQcyU=;
 b=tOxaubuwNSk2+WtDCBM71XIswLH6ygX8E6Clzhh9nkNzltYUkGjahhtK1Z8Mi6DDDe
 QJq9nb5/F5ve0R48K+RrEaW+mtGKXVO9swYhj9C4OASylkaZJ3kX3lQS34qQHNh0Xtc4
 nG0J9SH7fLRtL+EGiOjWeOEdi8EcujvzEqMwN1L109Ncgxrgs6yKLYkR8kwSD/UAfV5S
 A+DfcNZ/s4+8o8v+Ix+qXRD+SC69/IghQgfRe/4Leta9LySa+SVhniL+WL/ezgZMMIzD
 k8fLWWelRiVvj02Icb+967oscLf2vinKgLTbCO4O0HiJoFKEfuMZpnYCgBfhIhQK+Fli
 4T5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=8chpKPOU/iOby7d4jYTkAyJ1a6jhveqUSMXzG0oQcyU=;
 b=Jzy7H4QarzbfDkBc/unIeBpf/CF8Zzo1QZ8ngaXDtSm76ADOLPOYpSika6W2X0YTpp
 OvJftjuRO+c2/JIwIazu5hQuRbOqvYyzY6THKl9jT2ELhOVNTJg5mSAo4ElSG03Vz5lD
 fWUpicR5HfJ5t5LeFYvpNqWZlnE8rKOfJ5EKUBJMd1co+L3ZZ2NgXAtI7Z1OOk+5MSqB
 t7QRVTvGVwv6MbYAf9arPGO6KDFnMtlMzcwmiWY0UUMY7ACxNoKYgz1PLozD2cONKfvR
 hQRbn1ylemk+P84qn1LsmZg0ZhqujjZZtnpz9KHuNsP/hvRNymuyzURNV4YRW/1t4ENO
 tseg==
X-Gm-Message-State: ACrzQf1XJJqx2UdH+wORRJxAYSYUYzgRryxNqDC2WQUlDlyrSHWbu19/
 5MLAebzyHe2xsIAbJXF8RVhkr+lrXQ3YfQ==
X-Google-Smtp-Source: AMsMyM4Ld5NobBhnWMwXbB4ZhjYmh3o665Ehh2kenpbPURDkVvElowx2p3Nzc1F/fTruwdmyuHVv1A==
X-Received: by 2002:a62:52cf:0:b0:561:60a8:5257 with SMTP id
 g198-20020a6252cf000000b0056160a85257mr8458047pfb.13.1664852462995; 
 Mon, 03 Oct 2022 20:01:02 -0700 (PDT)
Received: from [192.168.10.153]
 (ppp121-45-204-168.cbr-trn-nor-bras38.tpg.internode.on.net. [121.45.204.168])
 by smtp.gmail.com with ESMTPSA id
 b7-20020a170902bd4700b00176ca74c58bsm3340804plx.245.2022.10.03.20.01.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Oct 2022 20:01:02 -0700 (PDT)
Message-ID: <e293f12d-0ecf-77d1-28ce-b67c620c953a@ozlabs.ru>
Date: Tue, 4 Oct 2022 14:00:58 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:104.0) Gecko/20100101
 Thunderbird/104.0
Subject: Re: x86, pflash, unassigned memory access
Content-Language: en-US
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: qemu-devel@nongnu.org
Cc: nikunj@amd.com, "Roth, Michael" <Michael.Roth@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <89d24ddd-bff8-53dd-19c9-66ac43ab0b63@ozlabs.ru>
In-Reply-To: <89d24ddd-bff8-53dd-19c9-66ac43ab0b63@ozlabs.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=aik@ozlabs.ru; helo=mail-pf1-x432.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-1.467, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Anyone, ping?

On 27/09/2022 12:35, Alexey Kardashevskiy wrote:
> Hi!
> 
> I am trying qemu-system-x86_64 with OVMF with the q35 machine, the 
> complete command line is below.
> 
> It works fine (including SEV on AMD EPYC), but these 2 parameters make 
> me wonder if I miss something:
> 
> -drive 
> if=pflash,format=raw,unit=0,file=/home/aik/OVMF_CODE.fd,readonly=on,id=MYPF \
> -d guest_errors
> 
> With this, I see a bunch of
> ===
> Invalid access at addr 0xFFC00000, size 1, region '(null)', reason: 
> rejected
> Invalid access at addr 0xFFC00001, size 1, region '(null)', reason: 
> rejected
> Invalid access at addr 0xFFC00002, size 1, region '(null)', reason: 
> rejected
> ...
> Invalid access at addr 0xFFC00FFF, size 1, region '(null)', reason: 
> rejected
> QEMU Flash: Failed to find probe location
> QEMU flash was not detected. Writable FVB is not being installed.
> ===
> 
> These are the indication of unassigned memory access which always meant 
> a bug in my past experience (which is POWERPC so not so relevant here 
> but nevertheless).
> 
> OVMF is probing the flash at 0xFFC00000 (hardcoded in OVMF) in
> https://github.com/tianocore/edk2/blob/master/OvmfPkg/QemuFlashFvbServicesRuntimeDxe/QemuFlash.c#L65
> but cannot succeed - "info mtree -f" says that at no point there is 
> anything at 0xFFC00000:
> 
> ===
> ...
> 00000000fed1c000-00000000fed1ffff (prio 1, i/o): lpc-rcrb-mmio
> 00000000fee00000-00000000feefffff (prio 4096, i/o): kvm-apic-msi
> 00000000ffc84000-00000000ffffffff (prio 0, romd): system.flash0 KVM
> 0000000800000000-0000000800000fff (prio 0, i/o): 
> virtio-pci-common-virtio-net
> ...
> ===
> 
> hw/block/pflash_cfi01.c suggests QEMU implements this protocol via 
> pflash_cfi01_ops but it is never called as:
> - it is the same memory region as the OVMF code and
> - it is mapped at 0xffc84000 (which is 4G - 
> size("./Build/OvmfX64/DEBUG_GCC5/FV/OVMF_CODE.fd"), not where OVMF 
> expects it) and
> - it has romd==true, it is a KVM memory slot and IO is never emulated in 
> QEMU.
> 
> Adding another IO memory region with pflash_cfi01_ops and mapping it at 
> 0xFFC00000 makes it loop in OVMF somewhere.
> 
> OVMF code is linked to hardcoded 0xffc84000 (FD_SIZE_IN_KB==4096).
> 
> 
> So I wonder - are these illegal accesses a bug of some sort in QEMU or 
> OVMF or command line? Thanks,
> 
> 
> 
> 
> The complete command line is:
> 
> /home/aik/pbuild/qemu-snp-localhost-x86_64/qemu-system-x86_64 \
> -enable-kvm \
> -m 2G \
> -smp 2 \
> -netdev user,id=USER0,hostfwd=tcp::2223-:22 \
> -device 
> virtio-net-pci,id=vnet0,iommu_platform=on,disable-legacy=on,romfile=,netdev=USER0 \
> -machine q35 \
> -device 
> virtio-scsi-pci,id=vscsi0,iommu_platform=on,disable-modern=off,disable-legacy=on \
> -drive 
> id=DRIVE0,if=none,file=img/u2204_128G_aikbook_sev.qcow2,format=qcow2 \
> -device scsi-hd,id=scsi-hd0,drive=DRIVE0 \
> -drive 
> if=pflash,format=raw,unit=0,file=/home/aik/OVMF_CODE.fd,readonly=on,id=MYPF \
> -nographic \
> -chardev stdio,id=STDIO0,signal=off,mux=on \
> -device isa-serial,id=isa-serial0,chardev=STDIO0 \
> -mon id=MON0,chardev=STDIO0,mode=readline \
> -kernel /boot/vmlinuz \
> -append console=ttyS0,115200n1 earlyprintk root=/dev/sda3 \
> -d guest_errors
> 
> 

-- 
Alexey

