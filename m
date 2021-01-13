Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B17B82F5531
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 00:27:59 +0100 (CET)
Received: from localhost ([::1]:59736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzpYU-0004BK-My
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 18:27:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kzpXC-0003l4-9X
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 18:26:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kzpXA-0002r3-3p
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 18:26:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610580394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yzNehRg5XMA8qRXkxvWSSpOdiEPtL/2IpNFP/4wAtCg=;
 b=AMUq1unRcClUOwqka85ftLZw47BHO1tg/S6zy8fOyOCPUENmhdgMFoybWfeO2v6W3E6HRH
 akLKF925q+616Qz9R3APaSK4UeByqylP+oRFJ0zI62Qcwqr1Uk2C9SIVNscsqSgOKS2R/e
 IOJGuIlutAMr7LxdFJUAzTFe0kGrqJU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-NYaCM5dkPeizHJQm0eAQlQ-1; Wed, 13 Jan 2021 18:26:32 -0500
X-MC-Unique: NYaCM5dkPeizHJQm0eAQlQ-1
Received: by mail-wr1-f72.google.com with SMTP id e12so1697400wrp.10
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 15:26:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yzNehRg5XMA8qRXkxvWSSpOdiEPtL/2IpNFP/4wAtCg=;
 b=GekVBHZG964r6JBbdnBo2NusFJOFevReKDJjLjvMSPa6w6LoJDTm4ImNyGUmO1RWAo
 Jo1UalojTZ5ykjOwyfAAv3Bos1MHulVzAWWvVXODsfCv2h6UR4MNVxFiRkojSELrK1zO
 aAEsodOF+Ggbl0smJBrkKCugKzVodHcN2nOG0jfLF10WNHbImgU2vxkPjJmLEb2KcBBO
 csWZYtvLvU525g3bvX71YRF88o2QSfX+aeFxDNOLD3qmfUawKE5oiuQzM2cg89WoXVyv
 18t1qm05TYpqmsOEj9WB9zTh7KNpkk+rMo75fu0vD+vzXSTalpty9EUCEKfc+lzQmnpw
 EK/A==
X-Gm-Message-State: AOAM5322fx/fpYqXmOblPHza3q7mxeAuPgN5oiXCJJaRvTSssf7w1Usb
 R2vdIFPhoZRyAmDzyraVwjMvqHrkmcObjuwebLuUV+/mdYKkOwTLyDxgyld1awLWfjPpf9gORjy
 Y8pRzHApjbp1AqMM=
X-Received: by 2002:a05:600c:2042:: with SMTP id
 p2mr1328620wmg.152.1610580391393; 
 Wed, 13 Jan 2021 15:26:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJybX6bE6vroGs8Xh0kFsZ0ez+FiCEoAvByY8NMFQHQ+ybRa2luqaE+J2gxfxvMcXxuTpzSJww==
X-Received: by 2002:a05:600c:2042:: with SMTP id
 p2mr1328601wmg.152.1610580391134; 
 Wed, 13 Jan 2021 15:26:31 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id b132sm5433112wmh.21.2021.01.13.15.26.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jan 2021 15:26:30 -0800 (PST)
Subject: Re: [PATCH] tests/acceptance: Test PMON with Loongson-3A1000 CPU
To: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20210112020708.62922-1-jiaxun.yang@flygoat.com>
 <eb1cf209-b0fb-7009-bd29-1627cb839774@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <157b53d5-37e9-31ed-00b4-55cc88795481@redhat.com>
Date: Thu, 14 Jan 2021 00:26:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <eb1cf209-b0fb-7009-bd29-1627cb839774@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Huacai Chen <chenhuacai@kernel.org>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/12/21 3:05 PM, Wainer dos Santos Moschetta wrote:
> Hi,
> 
> On 1/11/21 11:07 PM, Jiaxun Yang wrote:
>> Test booting of PMON bootloader on loongson3-virt platform.
>>
>> $ (venv) AVOCADO_ALLOW_UNTRUSTED_CODE=1 \
>>      avocado --show=app,console \
>>        run -t machine:loongson3-virt tests/acceptance
>> Fetching asset from
>> tests/acceptance/machine_mips_loongson3v.py:MipsLoongson3v.test_pmon_serial_console
>>
>> JOB ID     : 8e202b3727847c9104d0d3d6546ed225d35f6706
>> JOB LOG    :
>> /home/flygoat/avocado/job-results/job-2021-01-12T10.02-8e202b3/job.log
>>   (1/1)
>> tests/acceptance/machine_mips_loongson3v.py:MipsLoongson3v.test_pmon_serial_console: 
>> console: PMON2000 MIPS Initializing. Standby...
>> console: 00000000Jump to 9fc
> <snip>
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> ---
>>   MAINTAINERS                                 |  1 +
>>   tests/acceptance/machine_mips_loongson3v.py | 39 +++++++++++++++++++++
>>   2 files changed, 40 insertions(+)
>>   create mode 100644 tests/acceptance/machine_mips_loongson3v.py
> 
> Allow me to use this new test as an example to start a discussion about
> the organization of the acceptance files.
> 
> The mips64le tests currently are:
> 
> $ ./venv/bin/avocado list -t arch:mips64el acceptance/
> 
> INSTRUMENTED
> acceptance/boot_linux_console.py:BootLinuxConsole.test_mips64el_malta
> INSTRUMENTED
> acceptance/boot_linux_console.py:BootLinuxConsole.test_mips64el_fuloong2e
> INSTRUMENTED
> acceptance/boot_linux_console.py:BootLinuxConsole.test_mips64el_malta_5KEc_cpio
> 
> INSTRUMENTED
> acceptance/linux_ssh_mips_malta.py:LinuxSSH.test_mips_malta64el_kernel3_2_0
> INSTRUMENTED
> acceptance/machine_mips_loongson3v.py:MipsLoongson3v.test_pmon_serial_console
> 
> INSTRUMENTED
> acceptance/machine_mips_malta.py:MaltaMachineFramebuffer.test_mips_malta_i6400_framebuffer_logo_1core
> 
> INSTRUMENTED
> acceptance/machine_mips_malta.py:MaltaMachineFramebuffer.test_mips_malta_i6400_framebuffer_logo_7cores
> 
> INSTRUMENTED
> acceptance/machine_mips_malta.py:MaltaMachineFramebuffer.test_mips_malta_i6400_framebuffer_logo_8cores
> 
> INSTRUMENTED
> acceptance/replay_kernel.py:ReplayKernelNormal.test_mips64el_malta
> INSTRUMENTED
> acceptance/replay_kernel.py:ReplayKernelSlow.test_mips64el_malta_5KEc_cpio
> 
> Most of them are simple "boot linux (or firmware) and check the console"
> tests. The replay_kernel.py contain tests for a given feature and happen
> to be testing on mips64el as well. So on tests/acceptance directory
> we've got boot tests spread across files and mixed with "generic"
> feature tests.
> 
> I think we should find a home for those boot tests. Maybe throw them all
> in a sub-directory called "boot_tests", or in arch-oriented directories
> (boot_tests/mips64el, boot_tests/x86_64, ...) which would make easier to
> reference them in the MAINTAINERS file.
> 
> Any thought?

[thread hijack...]

A tests might be multi-arch. If you think it is easier to have the
tests sorted in subfolders, go ahead :) Where is a test is not a
problem. The problem we have to solve is how to relate a test with
its maintainers / developers interested in it.

We once said what really matters are Avocado tags. This might be an
underused feature of Avocado. Maybe what we need is a script to
relate test tags with MAINTAINERS?

Let's say we use the 'A' tag for that:

-- >8 --
diff --git a/MAINTAINERS b/MAINTAINERS
index cb0656aec3d..a484d429d78 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -646,6 +646,7 @@ M: Anup Patel <anup.patel@wdc.com>
 M: Alistair Francis <Alistair.Francis@wdc.com>
 L: qemu-riscv@nongnu.org
 S: Maintained
+A: device:goldfish_rtc
 F: hw/rtc/goldfish_rtc.c
 F: include/hw/rtc/goldfish_rtc.h

@@ -1160,6 +1161,11 @@ Loongson-3 virtual platforms
 M: Huacai Chen <chenhuacai@kernel.org>
 R: Jiaxun Yang <jiaxun.yang@flygoat.com>
 S: Maintained
+A: machine:loongson3-virt
+A: cpu:Loongson-3A1000
+A: device:liointc
+A: device:goldfish_rtc
 F: hw/intc/loongson_liointc.c
 F: hw/mips/loongson3_bootp.c
 F: hw/mips/loongson3_bootp.h
---

If this test fails, it should list the maintainers of the
loongson3-virt machine and the goldfish RTC.

Maintainers add their tags of interest, and can Ack when a
developer add a tag to their MAINTAINERS entry.

Thought? :)


