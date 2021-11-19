Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3F2456BA3
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 09:27:36 +0100 (CET)
Received: from localhost ([::1]:44988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnzF8-0005de-Tk
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 03:27:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mnz9f-0000nR-Ut
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 03:21:57 -0500
Received: from [2001:41c9:1:41f::167] (port=45652
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mnz9d-0003PK-Sl
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 03:21:55 -0500
Received: from [2a00:23c4:8b9e:9b00:2535:46c:7466:70fe]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mnz9Q-0006GS-HA; Fri, 19 Nov 2021 08:21:44 +0000
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211118192020.61245-1-philmd@redhat.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <776204b8-22df-555b-1836-425995272fd9@ilande.co.uk>
Date: Fri, 19 Nov 2021 08:21:43 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211118192020.61245-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9e:9b00:2535:46c:7466:70fe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH-for-6.2 0/2] hw/display: Do not allow multiple (identical)
 VGA devices
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.727,
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
Cc: Thomas Huth <thuth@redhat.com>, "Jose R . Ziviani" <jziviani@suse.de>,
 John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/11/2021 19:20, Philippe Mathieu-Daudé wrote:

> Commit 7852a77f598 fixed creating multiple TYPE_ISA_VGA devices,
> generalize the fix to all VGA devices.
> 
> See https://gitlab.com/qemu-project/qemu/-/issues/44
> 
> Philippe Mathieu-Daudé (2):
>    hw/display: Add Error* handle to vga_common_init()
>    hw/display: Do not allow multiple identical VGA devices
> 
>   hw/display/vga_int.h        |  2 +-
>   hw/display/ati.c            |  4 +++-
>   hw/display/cirrus_vga.c     |  4 +++-
>   hw/display/cirrus_vga_isa.c |  4 +++-
>   hw/display/qxl.c            |  4 +++-
>   hw/display/vga-isa-mm.c     |  3 ++-
>   hw/display/vga-isa.c        | 11 ++---------
>   hw/display/vga-pci.c        |  8 ++++++--
>   hw/display/vga.c            | 17 ++++++++++++++++-
>   hw/display/virtio-vga.c     |  4 +++-
>   hw/display/vmware_vga.c     |  2 +-
>   11 files changed, 43 insertions(+), 20 deletions(-)

Hi Phil,

I don't think this is correct for non-ISA devices: for example years ago I had a PC 
running Windows 98SE with 2 identical PCI graphics cards configured in dual-head mode.

IIRC the BIOS would bring up the first graphics card and configure it to use the 
legacy ISA VGA ioports for compatibility, and then once the main OS drivers loaded 
both cards were switched to PCI mode and configured using the BARs as normal.


ATB,

Mark.

