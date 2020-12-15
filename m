Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2CF2DB468
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 20:22:14 +0100 (CET)
Received: from localhost ([::1]:58246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpFtk-0007lj-It
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 14:22:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1kpFqf-0006kf-61
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 14:19:01 -0500
Received: from relay64.bu.edu ([128.197.228.104]:49484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1kpFqU-00045R-OJ
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 14:19:00 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 0BFJIPIY010299
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 15 Dec 2020 14:18:28 -0500
Date: Tue, 15 Dec 2020 14:18:24 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH] fuzz: Add more i386 configurations for fuzzing
Message-ID: <20201215191824.p6vafdvhvzlxnsgw@mozz.bu.edu>
References: <20201123184352.242907-1-alxndr@bu.edu>
 <20201202164002.sot3byy2jesllmlb@mozz.bu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201202164002.sot3byy2jesllmlb@mozz.bu.edu>
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, GOOG_STO_NOIMG_HTML=2.999,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Hannes Reinecke <hare@suse.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Jason Wang <jasowang@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bandan Das <bsd@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 201202 1140, Alexander Bulekov wrote:
> On 201123 1343, Alexander Bulekov wrote:
> > 
> > Hello,
> > If you are CC-ed on this email, this patch will likely enable continuous
> > fuzzing for a device that you are listed under in MAINTAINERS. If this is
> > accepted, these devices will be continuously fuzzed over their PCI, PIO,
> > MMIO and DMA interfaces. The fuzzer will start qemu with the arguments
> > specified by ".args" and we will use the globs specified under
> > ".objects" to match the Object/MemoryRegion names that we should fuzz.
> > The fuzzer will find and report issues such as memory-corruptions and
> > aborts. For now, I am manually reproducing each issue and opening a
> > bug-report with a qtest-based reproducer, so the process is still quite
> > flexible.
> > 
> > The current code-coverage achieved by fuzzing using the
> > existing-configurations is available here:
> > https://storage.googleapis.com/oss-fuzz-coverage/qemu/reports/20201122/linux/src/qemu/hw/report.html
> > I am slowly trying to fill in the blanks.
> > 
> > I have little context for how useful these configurations are for
> > fuzzing. I appreciate if you can Ack/Nack them or provide feedback if
> > the devices should be configured differently.  Of course, if you think
> > we should be fuzzing some additional device configurations, you can also
> > submit a patch adding the necessary lines to this generic_fuzz_configs.h
> > file. 
> > Thanks
> > -Alex
> > 
> 
> Ping. We could just add all of these configurations and, later, remove
> any that produce too many useless reports.
> -Alex

Ping. On the fuzzing call, we discussed that this is ok for now (doesn't
add any new features - just configs for existing code), and we can
switch to a QOS-based solution, when we come up with a good integration.
-Alex

> 
> 
> >  tests/qtest/fuzz/generic_fuzz_configs.h | 80 +++++++++++++++++++++++++
> >  1 file changed, 80 insertions(+)
> > 
> > diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
> > index c4d925f9e6..0b1fe0f836 100644
> > --- a/tests/qtest/fuzz/generic_fuzz_configs.h
> > +++ b/tests/qtest/fuzz/generic_fuzz_configs.h
> > @@ -115,6 +115,86 @@ const generic_fuzz_config predefined_configs[] = {
> >          .name = "pc-q35",
> >          .args = "-machine q35",
> >          .objects = "*",
> > +    },{
> > +        .name = "vmxnet3",
> > +        .args = "-machine q35 -nodefaults "
> > +        "-device vmxnet3,netdev=net0 -netdev user,id=net0",
> > +        .objects = "vmxnet3"
> > +    },{
> > +        .name = "ne2k_pci",
> > +        .args = "-machine q35 -nodefaults "
> > +        "-device ne2k_pci,netdev=net0 -netdev user,id=net0",
> > +        .objects = "ne2k*"
> > +    },{
> > +        .name = "pcnet",
> > +        .args = "-machine q35 -nodefaults "
> > +        "-device pcnet,netdev=net0 -netdev user,id=net0",
> > +        .objects = "pcnet"
> > +    },{
> > +        .name = "rtl8139",
> > +        .args = "-machine q35 -nodefaults "
> > +        "-device rtl8139,netdev=net0 -netdev user,id=net0",
> > +        .objects = "rtl8139"
> > +    },{
> > +        .name = "i82550",
> > +        .args = "-machine q35 -nodefaults "
> > +        "-device i82550,netdev=net0 -netdev user,id=net0",
> > +        .objects = "eepro*"
> > +    },{
> > +        .name = "sdhci-v3",
> > +        .args = "-nodefaults -device sdhci-pci,sd-spec-version=3 "
> > +        "-device sd-card,drive=mydrive "
> > +        "-drive if=sd,index=0,file=null-co://,format=raw,id=mydrive -nographic",
> > +        .objects = "sd*"
> > +    },{
> > +        .name = "ehci",
> > +        .args = "-machine q35 -nodefaults "
> > +        "-device ich9-usb-ehci1,bus=pcie.0,addr=1d.7,"
> > +        "multifunction=on,id=ich9-ehci-1 "
> > +        "-device ich9-usb-uhci1,bus=pcie.0,addr=1d.0,"
> > +        "multifunction=on,masterbus=ich9-ehci-1.0,firstport=0 "
> > +        "-device ich9-usb-uhci2,bus=pcie.0,addr=1d.1,"
> > +        "multifunction=on,masterbus=ich9-ehci-1.0,firstport=2 "
> > +        "-device ich9-usb-uhci3,bus=pcie.0,addr=1d.2,"
> > +        "multifunction=on,masterbus=ich9-ehci-1.0,firstport=4 "
> > +        "-drive if=none,id=usbcdrom,media=cdrom "
> > +        "-device usb-tablet,bus=ich9-ehci-1.0,port=1,usb_version=1 "
> > +        "-device usb-storage,bus=ich9-ehci-1.0,port=2,drive=usbcdrom",
> > +        .objects = "*usb* *hci*",
> > +    },{
> > +        .name = "ohci",
> > +        .args = "-machine q35 -nodefaults  -device pci-ohci -device usb-kbd",
> > +        .objects = "*usb* *ohci*",
> > +    },{
> > +        .name = "megaraid",
> > +        .args = "-machine q35 -nodefaults -device megasas -device scsi-cd,drive=null0 "
> > +        "-blockdev driver=null-co,read-zeroes=on,node-name=null0",
> > +        .objects = "megasas*",
> > +    },{
> > +        .name = "ac97",
> > +        .args = "-machine q35 -nodefaults "
> > +        "-device ac97,audiodev=snd0 -audiodev none,id=snd0 -nodefaults",
> > +        .objects = "ac97*",
> > +    },{
> > +        .name = "cs4231a",
> > +        .args = "-machine q35 -nodefaults "
> > +        "-device cs4231a,audiodev=snd0 -audiodev none,id=snd0 -nodefaults",
> > +        .objects = "cs4231a* i8257*",
> > +    },{
> > +        .name = "es1370",
> > +        .args = "-machine q35 -nodefaults "
> > +        "-device es1370,audiodev=snd0 -audiodev none,id=snd0 -nodefaults",
> > +        .objects = "es1370*",
> > +    },{
> > +        .name = "sb16",
> > +        .args = "-machine q35 -nodefaults "
> > +        "-device sb16,audiodev=snd0 -audiodev none,id=snd0 -nodefaults",
> > +        .objects = "sb16* i8257*",
> > +    },{
> > +        .name = "parallel",
> > +        .args = "-machine q35 -nodefaults "
> > +        "-parallel file:/dev/null",
> > +        .objects = "parallel*",
> >      }
> >  };
> >  
> > -- 
> > 2.28.0
> > 

