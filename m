Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3D65F32F1
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 17:55:02 +0200 (CEST)
Received: from localhost ([::1]:37700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofNmX-0004WS-9e
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 11:55:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1ofNde-0007Sk-Ou; Mon, 03 Oct 2022 11:45:54 -0400
Received: from [200.168.210.66] (port=42785 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1ofNdb-0003RP-Qx; Mon, 03 Oct 2022 11:45:50 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 3 Oct 2022 12:45:40 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 229C88002C5;
 Mon,  3 Oct 2022 12:45:40 -0300 (-03)
Message-ID: <03ad8964-a7c1-5b26-00aa-3b028296e0d0@eldorado.org.br>
Date: Mon, 3 Oct 2022 12:45:39 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Subject: Re: [RFC PATCH v2 00/29] PowerPC interrupt rework
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: danielhb413@gmail.com, david@gibson.dropbear.id.au, groug@kaod.org,
 fbarrat@linux.ibm.com, alex.bennee@linaro.org, farosas@linux.ibm.com
References: <20220927201544.4088567-1-matheus.ferst@eldorado.org.br>
 <9b310cf0-6140-a397-0f7d-a752b1ba4072@kaod.org>
Content-Language: en-US
In-Reply-To: <9b310cf0-6140-a397-0f7d-a752b1ba4072@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 03 Oct 2022 15:45:40.0664 (UTC)
 FILETIME=[30A7BB80:01D8D73F]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.467,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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

On 28/09/2022 14:31, Cédric Le Goater wrote:
> Hello Matheus,
> 
> On 9/27/22 22:15, Matheus Ferst wrote:
>> Link to v1: 
>> https://lists.gnu.org/archive/html/qemu-ppc/2022-08/msg00370.html
>> This series is also available as a git branch: 
>> https://github.com/PPC64/qemu/tree/ferst-interrupt-fix-v2
> 
> This is impressive work on QEMU PPC.
> 
>> This version addresses Fabiano's feedback and fixes some issues found
>> with the tests suggested by Cédric. While working on it, I found two
>> intermittent problems on master:
>>
>>   i) ~10% of boots with pSeries and 970/970mp/POWER5+ hard lockup after
> 
> These CPUs never got real attention with KVM. The FW was even broken
> before 7.0.
> 
>>      either SCSI or network initialization when using -smp 4. With
>>      -smp 2, the problem is harder to reproduce but still happens, and I
>>      couldn't reproduce with thread=single.
>> ii) ~52% of KVM guest initializations on PowerNV hang in different parts
>>      of the boot process when using more than one CPU.
> 
> Do you mean when the guest is SMP or the host ?

I should've added more details, this percentage was testing powernv9 
with "-smp 4" and a pSeries-POWER9 guest with "-smp 4", but I can also 
reproduce with a multithread L0 and single thread L1. The firmware is 
printing messages like:

Could not set special wakeup on 0:1: timeout waiting for SPECIAL_WKUP_DONE.

when it hangs, but I also have this message on some successful boots.

> 
>> With the complete series applied, I couldn't reproduce (i) anymore,
> 
> Super ! Models are getting better. This is nice for the 970.
> 
>> and (ii) became a little more frequent (~58%).
> 
> Have you checked 'info pic' ? XIVE is in charge of vCPU scheduling.

I don't have much knowledge in this area yet, so I don't know what to 
look for, but if it's useful, here is the output of the command when the 
problem occurs with a 4 core L0 and a single core L1:

(qemu) info pic
info pic
CPU[0000]:   QW   NSR CPPR IPB LSMFB ACK# INC AGE PIPR  W2
CPU[0000]: USER    00   00  00    00   00  00  00   00  00000000
CPU[0000]:   OS    00   00  00    ff   ff  00  ff   ff  00000000
CPU[0000]: POOL    00   00  00    ff   00  00  00   00  00000000
CPU[0000]: PHYS    00   ff  00    00   00  00  00   ff  80000000
CPU[0001]:   QW   NSR CPPR IPB LSMFB ACK# INC AGE PIPR  W2
CPU[0001]: USER    00   00  00    00   00  00  00   00  00000000
CPU[0001]:   OS    00   00  00    ff   ff  00  ff   ff  00000000
CPU[0001]: POOL    00   00  00    ff   00  00  00   00  00000001
CPU[0001]: PHYS    00   ff  00    00   00  00  00   ff  80000000
CPU[0002]:   QW   NSR CPPR IPB LSMFB ACK# INC AGE PIPR  W2
CPU[0002]: USER    00   00  00    00   00  00  00   00  00000000
CPU[0002]:   OS    00   00  00    ff   ff  00  ff   ff  00000000
CPU[0002]: POOL    00   00  00    ff   00  00  00   00  00000002
CPU[0002]: PHYS    00   ff  00    00   00  00  00   ff  80000000
CPU[0003]:   QW   NSR CPPR IPB LSMFB ACK# INC AGE PIPR  W2
CPU[0003]: USER    00   00  00    00   00  00  00   00  00000000
CPU[0003]:   OS    00   ff  00    00   ff  00  ff   ff  00000004
CPU[0003]: POOL    00   00  00    ff   00  00  00   00  00000003
CPU[0003]: PHYS    00   ff  00    00   00  00  00   ff  80000000
XIVE[0] #0 Source 00000000 .. 000fffff
   00000014 MSI --
   00000015 MSI --
   00000016 MSI --
   00000017 MSI --
   00000018 MSI --
   00000019 MSI --
   0000001a MSI --
   0000001b MSI --
   0000001e MSI P-
   00000023 MSI --
   00000024 MSI --
   00000025 MSI --
   00000026 MSI --
XIVE[0] #0 EAT 00000000 .. 000fffff
   00000014   end:00/000f data:00000010
   00000015   end:00/0017 data:00000010
   00000016   end:00/001f data:00000010
   00000017   end:00/0027 data:00000010
   00000018   end:00/004e data:00000010
   00000019   end:00/004e data:00000012
   0000001a   end:00/004e data:0000001b
   0000001b   end:00/004e data:00000013
   0000001e   end:00/004e data:00000016
   00000023   end:00/004e data:00000017
   00000024   end:00/004e data:00000018
   00000025   end:00/004e data:00000019
   00000026   end:00/004e data:0000001a
   000fb000   end:00/001f data:00000030
   000fb001   end:00/0027 data:00000031
   000fb002   end:00/000f data:00000032
   000fb003   end:00/000f data:00000033
   000fb004   end:00/0017 data:00000034
   000fb005   end:00/001f data:00000035
   000fb006   end:00/0027 data:00000036
   000fb7fe   end:00/000f data:00000029
   000fb7ff   end:00/0017 data:0000002a
   000fbffe   end:00/001f data:00000027
   000fbfff   end:00/0027 data:00000028
   000fcffe   end:00/000f data:00000025
   000fcfff   end:00/0017 data:00000026
   000fd000   end:00/001f data:00000037
   000fd001   end:00/000f data:00000038
   000fd002   end:00/0017 data:00000039
   000fd003   end:00/001f data:0000003a
   000fd004   end:00/0027 data:0000003b
   000fd7fe   end:00/001f data:00000023
   000fd7ff   end:00/0027 data:00000024
   000fdffe   end:00/000f data:00000021
   000fdfff   end:00/0017 data:00000022
   000feffe   end:00/001f data:0000001f
   000fefff   end:00/0027 data:00000020
   000ffff0   end:00/000f data:00000011
   000ffff1   end:00/0017 data:00000012
   000ffff2   end:00/001f data:00000013
   000ffff3   end:00/0027 data:00000014
   000ffff4   end:00/000f data:00000015
   000ffff5   end:00/0017 data:00000016
   000ffff6   end:00/001f data:00000017
   000ffff7   end:00/0027 data:00000018
   000ffff8   end:00/000f data:00000019
   000ffff9   end:00/0017 data:0000001a
   000ffffa   end:00/001f data:0000001b
   000ffffb   end:00/0027 data:0000001c
   000ffffc   end:00/000f data:0000001d
   000ffffd   end:00/0017 data:0000001e
XIVE[0] #0 ENDT
   0000000f -Q vqnb---f prio:7 nvt:00/0080 eq:@03400000   825/16384 ^1 [ 
8000004f 8000004f 80000
04f 8000004f 8000004f ^00000000 ]
   00000017 -Q vqnb---f prio:7 nvt:00/0084 eq:@03750000  1048/16384 ^1 [ 
8000001e 8000001e 80000
01e 8000001e 8000001e ^00000000 ]
   0000001f -Q vqnb---f prio:7 nvt:00/0088 eq:@037f0000   154/16384 ^1 [ 
8000003a 8000003a 80000
03a 8000003a 8000003a ^00000000 ]
   00000027 -Q vqnb---f prio:7 nvt:00/008c eq:@038a0000   340/16384 ^1 [ 
80000014 80000014 80000
014 80000014 8000003b ^00000000 ]
   0000004e -Q vqnbeu-- prio:6 nvt:00/0004 eq:@1d170000  1104/16384 ^1 [ 
80000016 80000016 80000
016 80000016 80000016 ^00000000 ]
   0000004f -Q v--be-s- prio:0 nvt:00/0000
XIVE[0] #0 END Escalation EAT
   0000004e -Q    end:00/004f data:00000000
   0000004f P-    end:00/000f data:0000004f
XIVE[0] #0 NVTT 00000000 .. 0007ffff
   00000000 end:00/0028 IPB:00
   00000001 end:00/0030 IPB:00
   00000002 end:00/0038 IPB:00
00000003 end:00/0040 IPB:00
   00000004 end:00/0048 IPB:02
   00000080 end:00/0008 IPB:00
   00000084 end:00/0010 IPB:00
   00000088 end:00/0018 IPB:00
   0000008c end:00/0020 IPB:00
PSIHB Source 000ffff0 .. 000ffffd
   000ffff0 LSI --
   000ffff1 LSI --
   000ffff2 LSI --
   000ffff3 LSI --
   000ffff4 LSI --
   000ffff5 LSI --
   000ffff6 LSI --
   000ffff7 LSI --
   000ffff8 LSI --
   000ffff9 LSI --
   000ffffa LSI --
   000ffffb LSI --
   000ffffc LSI --
   000ffffd LSI --
PHB4[0:0] Source 000fe000 .. 000fefff  @6030203110100
   00000ffe LSI --
   00000fff LSI --
PHB4[0:5] Source 000fb000 .. 000fb7ff  @6030203110228
   00000000 MSI --
   00000001 MSI --
   00000002 MSI --
   00000003 MSI --
   00000004 MSI --
   00000005 MSI --
   00000006 MSI --
   000007fe LSI --
   000007ff LSI --
PHB4[0:4] Source 000fb800 .. 000fbfff  @6030203110220
   000007fe LSI --
   000007ff LSI --
PHB4[0:3] Source 000fc000 .. 000fcfff  @6030203110218
   00000ffe LSI --
   00000fff LSI --
PHB4[0:2] Source 000fd000 .. 000fd7ff  @6030203110210
   00000000 MSI --
   00000001 MSI --
   00000002 MSI --
   00000003 MSI --
   00000004 MSI --
   000007fe LSI --
   000007ff LSI --
PHB4[0:1] Source 000fd800 .. 000fdfff  @6030203110208
   000007fe LSI --
   000007ff LSI --

> Could you please check with powersave=off in the host kernel also ?
> 

It still hangs with this option.

>> I've tested each patch of this series with [1], modified to use -smp for
>> machines that support more than one CPU. The machines I can currently
>> boot with FreeBSD (970/970,p/POWER5+/POWER7/POWER8/POWER9 pSeries,
>> POWER8/POWER9 PowerNV, and mpc8544ds) were tested with the images from
>> [2] and still boot after applying the patch series. Booting nested
>> guests inside a TCG pSeries machine also seems to be working fine.
>>
>> Using command lines like:
>>
>> ./qemu-system-ppc64 -M powernv9 -cpu POWER9 -accel tcg,thread=multi \
>>                  -m 8G -smp $SMP -vga none -nographic -kernel zImage \
>>                  -append 'console=hvc0' -initrdootfs.cpio.xz \
>>                  -serial pipe:pipe -monitor unix:mon,server,nowait
>>
>> and
>>
>> ./qemu-system-ppc64 -M pseries -cpu POWER9 -accel tcg,thread=multi \
>>                  -m 8G -smp $SMP -vga none -nographic -kernel zImage \
>>                  -append 'console=hvc0' -initrd rootfs.cpio.xz \
>>                  -serial pipe:pipe -monitor unix:mon,server,nowait
>>
>> to measure the time to boot, login, and shut down a compressed kernel
>> with a buildroot initramfs, with 100 iteration we get:
>>
>> +-----+------------------------------+-----------------------------+
>> |     |            PowerNV           |           pSeries           |
>> |-smp |------------------------------+-----------------------------+
>> |     |     master    | patch series |    master    | patch series |
>> +-----+------------------------------+-----------------------------+
>> |  1  |  45,84 ± 0,92 | 38,08 ± 0,66 | 23,56 ± 1,16 | 23,76 ± 1,04 |
>> |  2  |  80,21 ± 8,03 | 40,81 ± 0,45 | 26,59 ± 0,92 | 26,88 ± 0,99 |
>> |  4  | 115,98 ± 9,85 | 38,80 ± 0,44 | 28,83 ± 0,84 | 28,46 ± 0,94 |
>> |  6  | 199,14 ± 6,36 | 39,32 ± 0,50 | 29,22 ± 0,78 | 29,45 ± 0,86 |
>> |  8  | 47,85 ± 27,50 | 38,98 ± 0,49 | 29,63 ± 0,80 | 29,60 ± 0,78 |
>> +-----+------------------------------+-----------------------------+
>>
>> This results shows that the problem reported in [3] is solved, while
> 
> Yes. Nice work ! The PowerNV results with -smp 8 on master are unexpected.
> Did you do some profiling also ?
> 

We've noticed that in the original thread when Frederic reported the 
issue, this happens when the -smp >= $(nproc), but I haven't looked too 
deep in this case. Maybe some magic optimization on Linux mutex 
implementation that helps on the higher contention case?

>> pSeries boot time is essentially unchanged.
>>
>>
>> With a non-compressed kernel, the difference with PowerNV is smaller,
>> and pSeries stills the same:
>>
>> +-----+------------------------------+-----------------------------+
>> |     |            PowerNV           |           pSeries           |
>> |-smp |------------------------------+-----------------------------+
>> |     |     master    | patch series |    master    | patch series |
>> +-----+------------------------------+-----------------------------+
>> |  1  |  42,17 ± 0,92 | 38,13 ± 0,59 | 23,15 ± 1,02 | 23,46 ± 1,02 |
>> |  2  |  55,72 ± 3,54 | 40,30 ± 0,56 | 26,26 ± 0,82 | 26,38 ± 0,80 |
>> |  4  |  67,09 ± 3,02 | 38,26 ± 0,47 | 28,36 ± 0,77 | 28,19 ± 0,78 |
>> |  6  |  98,96 ± 2,49 | 39,01 ± 0,38 | 28,68 ± 0,75 | 29,02 ± 0,88 |
>> |  8  |  39,68 ± 0,42 | 38,44 ± 0,41 | 29,24 ± 0,81 | 29,44 ± 0,75 |
>> +-----+------------------------------+-----------------------------+
>>
>> Finally, using command lines like
>>
>> ./qemu-system-ppc64 -M powernv9 -cpu POWER9 -accel tcg,thread=multi \
>>      -m 8G -smp 4 -device virtio-scsi-pci -boot c -vga none -nographic \
>>      -device nvme,bus=pcie.2,addr=0x0,drive=drive0,serial=1234 \
>>      -drive file=rootfs.ext2,if=none,id=drive0,format=raw,cache=none \
>>      -snapshot -serial pipe:pipe -monitor unix:mon,server,nowait \
>>      -kernel zImage -append 'console=hvc0 rootwait root=/dev/nvme0n1' \
>>      -device virtio-net-pci,netdev=br0,mac=52:54:00:12:34:57,bus=pcie.0 \
>>      -netdev bridge,id=br0
>>
>> and
>>
>> ./qemu-system-ppc64 -M pseries -cpu POWER9 -accel tcg,thread=multi \
>>      -m 8G -smp 4 -device virtio-scsi-pci -boot c -vga none -nographic \
>>      -drive file=rootfs.ext2,if=scsi,index=0,format=raw -snapshot \
>>      -kernel zImage -append 'console=hvc0 rootwait root=/dev/sda' \
>>      -serial pipe:pipe -monitor unix:mon,server,nowait \
>>      -device virtio-net-pci,netdev=br0,mac=52:54:00:12:34:57 \
>>      -netdev bridge,id=br0
>>
>> to tests IO performance, with iperf to test network and a 4Gb scp
>> transfer to test disk+network, in 100 iterations we saw:
>>
>> +---------------------+---------------+-----------------+
>> |                     |    scp (s)    |   iperf (MB/s)  |
>> +---------------------+---------------+-----------------+
>> |PowerNV master       | 166,91 ± 8,37 | 918,06 ± 114,78 |
>> |PowerNV patch series | 166,25 ± 8,85 | 916,91 ± 107,56 |
>> |pSeries master       | 175,70 ± 8,22 | 958,73 ± 115,09 |
>> |pSeries patch series | 173,62 ± 8,13 | 893,42 ±  87,77 |
>> +---------------------+---------------+-----------------+
> 
> These are SMP machines under high IO load using MTTCG. It means
> that the models are quite robust now.
> 
>> The scp data shows little difference, while testing just network shows
>> that it's a bit slower with the patch series applied (although, with
>> this variation, we'd probably need to repeat this test more times to
>> have a more robust result...)
> 
> You could try with powersave=off.
> 

Not a big difference, with 50 iterations:

+---------------------+---------------+-----------------+
|                     |    scp (s)    |   iperf (MB/s)  |
+---------------------+---------------+-----------------+
|PowerNV master       | 142.73 ± 8.38 | 924.34 ± 353.93 |
|PowerNV patch series | 145.75 ± 9.18 | 874.52 ± 286.21 |
+---------------------+---------------+-----------------+

Thanks,
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

