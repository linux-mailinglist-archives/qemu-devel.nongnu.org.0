Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0F74559DC
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 12:14:28 +0100 (CET)
Received: from localhost ([::1]:54116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnfN5-00076y-Nt
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 06:14:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mnfLs-00066z-3P; Thu, 18 Nov 2021 06:13:12 -0500
Received: from [2001:41c9:1:41f::167] (port=44670
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mnfLq-0003J6-0p; Thu, 18 Nov 2021 06:13:11 -0500
Received: from [2a00:23c4:8b9e:9b00:2535:46c:7466:70fe]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mnfLe-0000ZL-GZ; Thu, 18 Nov 2021 11:13:02 +0000
To: Finn Thain <fthain@linux-m68k.org>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <cover.1632437396.git.fthain@linux-m68k.org>
 <e0411348-abd7-3db9-b5bd-8f1d52c1226f@linux-m68k.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <2fb3d9f8-0f20-082d-d9f1-ab2984356866@ilande.co.uk>
Date: Thu, 18 Nov 2021 11:13:01 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <e0411348-abd7-3db9-b5bd-8f1d52c1226f@linux-m68k.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9e:9b00:2535:46c:7466:70fe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v1 0/9] hw/mos6522: VIA timer emulation fixes and
 improvements
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.084,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/11/2021 03:03, Finn Thain wrote:

> On Fri, 24 Sep 2021, I wrote:
> 
>> This is a patch series for QEMU that I started last year. The aim was to
>> try to get a monotonic clocksource for Linux/m68k guests. That hasn't
>> been achieved yet (for q800 machines). I'm submitting the patch series
>> because,
>>
>>   - it improves 6522 emulation fidelity, although slightly slower, and
>>
> 
> I did some more benchmarking to examine the performance implications.
> 
> I measured a performance improvement with this patch series. For a
> Linux/m68k guest, the execution time for a gettimeofday syscall dropped
> from 9 us to 5 us. (This is a fairly common syscall.)
> 
> The host CPU time consumed by qemu in starting the guest kernel and
> executing a benchmark involving 20 million gettimeofday calls was as
> follows.
> 
> qemu-system-m68k mainline (42f6c9179b):
>      real     198 s
>      sys      123 s
>      user     73 s
>      sys/user 1.68
> 
> qemu-system-m68k patched (0a0bca4711):
>      real     112 s
>      sys      63 s
>      user     47 s
>      sys/user 1.34
> 
> As with any microbenchmark, this workload is not a real-world one. For
> comparison, here are measurements of the time to fully startup and
> immediately shut down Debian Linux/m68k SID (systemd):
> 
> qemu-system-m68k mainline (42f6c9179b)
>      real     31.5 s
>      sys      1.59 s
>      user     27.4 s
>      sys/user 0.06
> 
> qemu-system-m68k patched (0a0bca4711)
>      real     31.2 s
>      sys      1.17 s
>      user     27.6 s
>      sys/user 0.04
> 
> The decrease in sys/user ratio reflects the small cost that has to be paid
> for the improvement in 6522 emulation fidelity and timer accuracy. But
> note that in both benchmarks wallclock execution time dropped, meaning
> that the system is faster overall.
> 
> The gettimeofday testing revealed that the Linux kernel does not properly
> protect userland from pathological hardware timers, and the gettimeofday
> result was seen to jump backwards (that was unexpected, though Mark did
> predict it).
> 
> This backwards jump was often observed in the mainline build during the
> gettimeofday benchmark and is result of bugs in mos6522.c. The patched
> build did not exhibit this problem (as yet).
> 
> The two benefits described here are offered in addition to all of the
> other benefits described in the patches themselves. Please consider
> merging this series.

Hi Finn,

I've not forgotten about this series - we're now in 6.2 freeze, but it's on my TODO 
list to revisit in the next development cycle this along with the ESP stress-ng 
changes which I've also been looking at. As mentioned in my previous reviews the 
patch will need some further analysis: particularly the logic in mos6522_read() that 
can generate a spurious interrupt on a register read needs to be removed, and also 
testing is required to ensure that these changes don't affect the CUDA clock warping 
which allows OS X to boot under qemu-system-ppc.

I'm confident that qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) is monotonic, since if it 
were not then there would be huge numbers of complaints from QEMU users. It appears 
that Linux can potentially alter the ticks in mac_read_clk() at 
https://github.com/torvalds/linux/blob/master/arch/m68k/mac/via.c#L624 which suggests 
the issue is related to timer wraparound. I'd like to confirm exactly which part of 
your series fixes the specific problem of the clock jumping backwards before merging 
these changes.

I realized that I could easily cross-compile a 5.14 kernel to test this theory with 
the test root image and .config you supplied at 
https://gitlab.com/qemu-project/qemu/-/issues/611 using the QEMU docker-m68k-cross 
image to avoid having to build a complete toolchain by hand. The kernel builds 
successfully using this method, but during boot it hangs sending the first SCSI CDB 
to the ESP device, failing to send the last byte using PDMA.

Are there known issues cross-compiling an m68k kernel on an x86 host? Or are your 
current kernels being built from a separate branch outside of mainline Linux git?


ATB,

Mark.

