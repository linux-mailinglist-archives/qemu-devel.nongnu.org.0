Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4596531C4FB
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 02:32:23 +0100 (CET)
Received: from localhost ([::1]:45080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBpDv-00063G-PC
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 20:32:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1lBpAw-00055V-Om; Mon, 15 Feb 2021 20:29:19 -0500
Received: from relay64.bu.edu ([128.197.228.104]:59487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1lBpAu-0005us-Qb; Mon, 15 Feb 2021 20:29:14 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 11G1RYwb004236
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 15 Feb 2021 20:27:39 -0500
Date: Mon, 15 Feb 2021 20:27:34 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH 0/4] hw/sd: sdhci: Fixes to CVE-2020-17380,
 CVE-2020-25085, CVE-2021-3409
Message-ID: <20210216012734.l5rohadx57bgvhzt@mozz.bu.edu>
References: <1613401871-59515-1-git-send-email-bmeng.cn@gmail.com>
 <20210215164646.zqjbsd7mtiwqvyaj@mozz.bu.edu>
 <CAEUhbmVgP08pO2LqFOcYja2vuOPw7C_py7F9r9dKkbwAt70m7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEUhbmVgP08pO2LqFOcYja2vuOPw7C_py7F9r9dKkbwAt70m7Q@mail.gmail.com>
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Mauro Matteo Cascella <mcascell@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-stable@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 Li Qiang <liq3ea@163.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Prasad J Pandit <ppandit@redhat.com>, Bandan Das <bsd@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210216 0855, Bin Meng wrote:
> Hi Alex,
> 
> On Tue, Feb 16, 2021 at 12:48 AM Alexander Bulekov <alxndr@bu.edu> wrote:
> >
> > Hi Bin,
> > Thank you for this. I ran through the OSS-Fuzz tests again, and it found
> > one thing:
> 
> Thanks for testing. Are there instructions to run OSS-Fuzz tests myself?

Yes we have some documentation in docs/devel/fuzzing.rst, but it
doesn't talk about using the OSS-Fuzz corpus.  The OSS-Fuzz corpus is
private, by default, but I uploaded a copy of the current sdhci corpus
here:
https://drive.google.com/file/d/1PcwFbY9YXPdaJ3aapIV2BI-bN5mbBgif/view?usp=sharing

To build the fuzzer, you need clang:

build the fuzzers
$ CC=clang CXX=clang++ ../configure --enable-fuzzing --enable-sanitizers \
--disable-werror
$ ninja -j`nproc` qemu-fuzz-i386

untar the corpus somewhere (~300 MB uncompressed)
$ tar -xvf sdhci-corpus.tar.gz

run through all the inputs once
$ ./qemu-fuzz-i386 --fuzz-target=generic-fuzz-sdhci-v3 \
  ~/path/to/corpus/qemu_qemu-fuzz-i386-target-generic-fuzz-sdhci-v3/* &> out

That will take some minutes, but you can look at the out file and search
for "ERROR" to find crashing inputs. 

-Alex
> 
> > Maybe this is already much better than the current state of the code, so
> > this one can be fixed in a later patch?
> 
> Depend on when Philippe can pick up this sereis, but I can also try to
> have a quick look :)
> 
> >
> > cat << EOF | ./qemu-system-i386 -display none -machine accel=qtest \
> > -m 512M -nodefaults -device sdhci-pci,sd-spec-version=3 \
> > -device sd-card,drive=mydrive \
> > -drive if=sd,index=0,file=null-co://,format=raw,id=mydrive \
> > -nographic -qtest stdio
> > outl 0xcf8 0x80001010
> > outl 0xcfc 0xe0000000
> > outl 0xcf8 0x80001001
> > outl 0xcfc 0x06000000
> > write 0xe000002c 0x1 0x05
> > write 0xe0000005 0x1 0x02
> > write 0xe0000007 0x1 0x01
> > write 0xe0000028 0x1 0x10
> > write 0x0 0x1 0x23
> > write 0x2 0x1 0x08
> > write 0xe000000c 0x1 0x01
> > write 0xe000000e 0x1 0x20
> > write 0xe000000f 0x1 0x00
> > write 0xe000000c 0x1 0x32
> > write 0xe0000004 0x2 0x0200
> > write 0xe0000028 0x1 0x00
> > write 0xe0000003 0x1 0x40
> > EOF
> >
> >
> > ==1730971==ERROR: AddressSanitizer: heap-buffer-overflow on address
> > 0x615000031880 at pc 0x55d070f2c6d9 bp 0x7ffdcb63f130 sp 0x7ffdcb63f128
> > READ of size 4 at 0x615000031880 thread T0
> > #0 0x55d070f2c6d8 in ldl_he_p bswap.h:347:5
> > #1 0x55d070f2c6d8 in ldn_he_p bswap.h:546:1
> > #2 0x55d070f2c6d8 in flatview_write_continue build/../softmmu/physmem.c:2775:19
> > #3 0x55d070f219eb in flatview_write build/../softmmu/physmem.c:2816:14
> > #4 0x55d070f219eb in address_space_write build/../softmmu/physmem.c:2908:18
> > #5 0x55d07040de4a in dma_memory_rw_relaxed include/sysemu/dma.h:88:12
> > #6 0x55d07040de4a in dma_memory_rw include/sysemu/dma.h:127:12
> > #7 0x55d07040de4a in dma_memory_write include/sysemu/dma.h:163:12
> > #8 0x55d07040de4a in sdhci_sdma_transfer_multi_blocks build/../hw/sd/sdhci.c:619:13
> > #9 0x55d07041d15b in sdhci_write build/../hw/sd/sdhci.c:1134:21
> > #10 0x55d07123b1ac in memory_region_write_accessor build/../softmmu/memory.c:491:5
> > #11 0x55d07123acab in access_with_adjusted_size build/../softmmu/memory.c:552:18
> > #12 0x55d07123a4b0 in memory_region_dispatch_write build/../softmmu/memory.c
> > #13 0x55d070f2c29b in flatview_write_continue build/../softmmu/physmem.c:2776:23
> > #14 0x55d070f219eb in flatview_write build/../softmmu/physmem.c:2816:14
> > #15 0x55d070f219eb in address_space_write build/../softmmu/physmem.c:2908:18
> 
> Regards,
> Bin

