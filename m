Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8B841FC70
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 16:12:02 +0200 (CEST)
Received: from localhost ([::1]:51840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWfk9-0002m9-Gu
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 10:12:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mWfj7-00021z-PB
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 10:10:58 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:37206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mWfj4-0000MN-Be
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 10:10:56 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id DD7157462D3;
 Sat,  2 Oct 2021 16:10:50 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id A466F745953; Sat,  2 Oct 2021 16:10:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id A18E87457EE;
 Sat,  2 Oct 2021 16:10:50 +0200 (CEST)
Date: Sat, 2 Oct 2021 16:10:50 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Howard Spoelstra <hsp.cat7@gmail.com>
Subject: Re: [RFC PATCH 0/4] Misc OHCI patches
In-Reply-To: <CABLmASG_Coop-fMRdv_PvBorO1fQUrhY3h+-PGts_ixhhkaADA@mail.gmail.com>
Message-ID: <ec83e981-8830-683-ae96-e8aef68c23e6@eik.bme.hu>
References: <cover.1633122670.git.balaton@eik.bme.hu>
 <CABLmASG_Coop-fMRdv_PvBorO1fQUrhY3h+-PGts_ixhhkaADA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-devel qemu-devel <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 2 Oct 2021, Howard Spoelstra wrote:
> Hi all,
>
> I've booted Fedora12 and MacOS 9.2/OSX10.4 ppc with these patches applied.
> All boot OK.
> (Fedora12 requires -mac99,via=pmu. Here there seems to be some interference
> with the kbd, due to via=pmu presenting usb mouse and kdb to the guest. So
> I could not test this further.).
> All tests done in Fedora 34 host with current master and patched build.
>
> ./qemu-system-ppc-ohcipatch02102021 \
> -M mac99 \
> -L pc-bios \
> -display gtk \
> -m 512 \
> -boot c \
> -hda /home/hsp/Mac-disks/10.4.qcow2 \
> -device
> usb-host,loglevel=4,vendorid=0x046d,productid=0x0a37,pcap=ohci-usb1headset-usb1port-ohcipatchV1-macos104.pcap
> \
> -trace "usb_*" -D ohci-usb1headset-usb1port-ohcipatchV1-macos104.txt
>
> Endpoint 4 is the interrupt-based hid device, endpoint 1 would be the
> isochronous audio stream if it showed up.
> Each test consisted of booting to the desktop, opening the system
> profiler/system report to check of the presence of the usb device, push the
> various buttons on the headset, attempt to play a sound, unplug-replug and
> attempt to play a sound again. Then shut down.
>
> Both succesfully open the usb device:
> usb_ohci_init_time usb_bit_time=1000000 usb_frame_time=83
> usb_port_claim bus 0, port 1
> usb_host_auto_scan_enabled
> usb_ohci_reset pci-ohci
> usb_ohci_stop pci-ohci: USB Suspended
> usb_ohci_stop pci-ohci: USB Suspended
> usb_host_open_started dev 3:29
> usb_host_detach_kernel dev 3:29, if 0
> usb_host_detach_kernel dev 3:29, if 1
> usb_host_detach_kernel dev 3:29, if 2
> usb_host_detach_kernel dev 3:29, if 3
> usb_host_parse_config dev 3:29, value 1, active 1
> usb_host_parse_interface dev 3:29, num 0, alt 0, active 1
> usb_host_parse_interface dev 3:29, num 1, alt 0, active 1
> usb_host_parse_interface dev 3:29, num 2, alt 0, active 1
> usb_host_parse_interface dev 3:29, num 3, alt 0, active 1
> usb_host_parse_endpoint dev 3:29, ep 4, in, int, active 1
> usb_port_attach bus 0, port 1, devspeed full, portspeed full
> usb_ohci_port_attach port #0
> usb_host_open_success dev 3:29
>
> Master with Mac OS 9.2:
> usb_ohci_ed_pkt ED @ 0x00152920 h=0 c=0
>  head=0x00164000 tailp=0x00164030 next=0x00152020
> usb_ohci_ed_pkt_flags fa=37 en=4 d=2 s=0 k=0 f=0 mps=37
> usb_ohci_td_skip_async

Maybe we need to look a bit before this when the async packet still 
waiting here is submitted and see what is that and why it's not 
completing. At this point we only have everything waiting for that.

> usb_ohci_ed_pkt ED @ 0x00152900 h=0 c=0
>  head=0x001645a0 tailp=0x00164660 next=0x001528a0
> usb_ohci_ed_pkt_flags fa=37 en=0 d=0 s=0 k=0 f=0 mps=64
> usb_ohci_td_pkt_hdr  TD @ 0x001645a0 8 of 8 bytes setup r=1 cbp=0x01661b90
> be=0x01661b97
> usb_ohci_td_pkt_full OUT data:  01 0b 00 00 01 00 00 00
> usb_ohci_td_too_many_pending
> usb_ohci_ed_pkt ED @ 0x00152920 h=0 c=0
>  head=0x00164000 tailp=0x00164030 next=0x00152020
> usb_ohci_ed_pkt_flags fa=37 en=4 d=2 s=0 k=0 f=0 mps=37
> usb_ohci_td_skip_async
> usb_ohci_ed_pkt ED @ 0x00152900 h=0 c=0
>  head=0x001645a0 tailp=0x00164660 next=0x001528a0
> usb_ohci_ed_pkt_flags fa=37 en=0 d=0 s=0 k=0 f=0 mps=64
> usb_ohci_td_pkt_hdr  TD @ 0x001645a0 8 of 8 bytes setup r=1 cbp=0x01661b90
> be=0x01661b97
> usb_ohci_td_pkt_full OUT data:  01 0b 00 00 01 00 00 00
> usb_ohci_td_too_many_pending
> usb_ohci_ed_pkt ED @ 0x00152920 h=0 c=0
>  head=0x00164000 tailp=0x00164030 next=0x00152020
> usb_ohci_ed_pkt_flags fa=37 en=4 d=2 s=0 k=0 f=0 mps=37
> usb_ohci_td_skip_async
> usb_ohci_ed_pkt ED @ 0x00152900 h=0 c=0
>  head=0x001645a0 tailp=0x00164660 next=0x001528a0
> usb_ohci_ed_pkt_flags fa=37 en=0 d=0 s=0 k=0 f=0 mps=64
> usb_ohci_td_pkt_hdr  TD @ 0x001645a0 8 of 8 bytes setup r=1 cbp=0x01661b90
> be=0x01661b97
> usb_ohci_td_pkt_full OUT data:  01 0b 00 00 01 00 00 00
> usb_ohci_td_too_many_pending
> usb_ohci_ed_pkt ED @ 0x00152920 h=0 c=0
>  head=0x00164000 tailp=0x00164030 next=0x00152020
> usb_ohci_ed_pkt_flags fa=37 en=4 d=2 s=0 k=0 f=0 mps=37
> usb_ohci_td_skip_async
> usb_ohci_ed_pkt ED @ 0x00152900 h=0 c=0
>  head=0x001645a0 tailp=0x00164660 next=0x001528a0
> usb_ohci_ed_pkt_flags fa=37 en=0 d=0 s=0 k=0 f=0 mps=64
> usb_ohci_td_pkt_hdr  TD @ 0x001645a0 8 of 8 bytes setup r=1 cbp=0x01661b90
> be=0x01661b97
> usb_ohci_td_pkt_full OUT data:  01 0b 00 00 01 00 00 00
> usb_ohci_td_too_many_pending
> usb_ohci_ed_pkt ED @ 0x00152920 h=0 c=0
>  head=0x00164000 tailp=0x00164030 next=0x00152020
> usb_ohci_ed_pkt_flags fa=37 en=4 d=2 s=0 k=0 f=0 mps=37
> usb_ohci_td_skip_async
>
> OHCI patch with MacOS 9.2:
> usb_ohci_ed_pkt ED @ 0x001528e0 h=0 c=0
>  head=0x001609c0 tailp=0x001609f0 next=0x00152020
> usb_ohci_ed_pkt_flags fa=41 en=4 d=2 s=0 k=0 f=0 mps=37
> usb_ohci_td_skip_async
> usb_ohci_ed_pkt ED @ 0x001528c0 h=0 c=0
>  head=0x00161030 tailp=0x001610c0 next=0x001528a0
> usb_ohci_ed_pkt_flags fa=41 en=0 d=0 s=0 k=0 f=0 mps=64
> usb_ohci_td_pkt_hdr  TD @ 0x00161030 8 of 8 bytes setup r=1 cbp=0x01587b08
> be=0x01587b0f
> usb_ohci_td_pkt_full OUT data:  80 06 00 02 00 00 0a 00
> usb_ohci_td_too_many_pending

This does not seem to have changed with the patch so maybe the iso 
transfer is not the cause as what the patch does is making the iso 
transfers independent of other traffic so a waiting async packet will not 
cause those iso packets rejected but this does not seem to change this so 
the question is still what's the waiting async packet and why it's not 
completing. I don't know how to read these traces so can't really tell 
which endpoint these are for and what these packets could be related to.

Regards,
BALATON Zoltan

> usb_ohci_ed_pkt ED @ 0x001528e0 h=0 c=0
>  head=0x001609c0 tailp=0x001609f0 next=0x00152020
> usb_ohci_ed_pkt_flags fa=41 en=4 d=2 s=0 k=0 f=0 mps=37
> usb_ohci_td_skip_async
> usb_ohci_ed_pkt ED @ 0x001528c0 h=0 c=0
>  head=0x00161030 tailp=0x001610c0 next=0x001528a0
> usb_ohci_ed_pkt_flags fa=41 en=0 d=0 s=0 k=0 f=0 mps=64
> usb_ohci_td_pkt_hdr  TD @ 0x00161030 8 of 8 bytes setup r=1 cbp=0x01587b08
> be=0x01587b0f
> usb_ohci_td_pkt_full OUT data:  80 06 00 02 00 00 0a 00
> usb_ohci_td_too_many_pending
> usb_ohci_ed_pkt ED @ 0x001528e0 h=0 c=0
>  head=0x001609c0 tailp=0x001609f0 next=0x00152020
> usb_ohci_ed_pkt_flags fa=41 en=4 d=2 s=0 k=0 f=0 mps=37
> usb_ohci_td_skip_async
> usb_ohci_ed_pkt ED @ 0x001528c0 h=0 c=0
>  head=0x00161030 tailp=0x001610c0 next=0x001528a0
> usb_ohci_ed_pkt_flags fa=41 en=0 d=0 s=0 k=0 f=0 mps=64
> usb_ohci_td_pkt_hdr  TD @ 0x00161030 8 of 8 bytes setup r=1 cbp=0x01587b08
> be=0x01587b0f
> usb_ohci_td_pkt_full OUT data:  80 06 00 02 00 00 0a 00
> usb_ohci_td_too_many_pending
> usb_ohci_ed_pkt ED @ 0x001528e0 h=0 c=0
>  head=0x001609c0 tailp=0x001609f0 next=0x00152020
> usb_ohci_ed_pkt_flags fa=41 en=4 d=2 s=0 k=0 f=0 mps=37
> usb_ohci_td_skip_async
> usb_ohci_ed_pkt ED @ 0x001528c0 h=0 c=0
>  head=0x00161030 tailp=0x001610c0 next=0x001528a0
> usb_ohci_ed_pkt_flags fa=41 en=0 d=0 s=0 k=0 f=0 mps=64
> usb_ohci_td_pkt_hdr  TD @ 0x00161030 8 of 8 bytes setup r=1 cbp=0x01587b08
> be=0x01587b0f
> usb_ohci_td_pkt_full OUT data:  80 06 00 02 00 00 0a 00
> usb_ohci_td_too_many_pending
>
> Both have issues communicating with endpoint 4 (the hid controls volume
> up/down and mute).
> Endpoint 1 should receive the isochronous audio stream, but never does.
>
> After some experimentation with unplugging/plugging the headset and probing
> the usb stack (using the usb prober from the mac usb ddk for Mac OS 9.2) at
> some point endpoint 4 communication works for both guests tested. Only once
> was I able to get sound out and in working in Mac OS 9.2. For OSX I could
> only once get audio in working.
>
> Pcap and text logs for both MacOS 9.2 and OSX 10.4 tests included...
>
> Best,
> Howard
>

