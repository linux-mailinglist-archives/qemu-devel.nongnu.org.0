Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFEA2EC046
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 16:19:47 +0100 (CET)
Received: from localhost ([::1]:48866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxAbC-0001z7-5v
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 10:19:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kxAZw-0000fZ-MG
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 10:18:28 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:58024
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kxAZt-0006IR-SI
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 10:18:28 -0500
Received: from host109-146-177-189.range109-146.btcentralplus.com
 ([109.146.177.189] helo=[192.168.1.65])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kxAZn-0007aA-DG; Wed, 06 Jan 2021 15:18:23 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, fam@euphon.net,
 laurent@vivier.eu
References: <20201230153745.30241-1-mark.cave-ayland@ilande.co.uk>
Message-ID: <a19b8f13-df0e-31a7-3f9d-fd669f55b652@ilande.co.uk>
Date: Wed, 6 Jan 2021 15:18:10 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201230153745.30241-1-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.146.177.189
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 00/25] esp: consolidate PDMA transfer buffers
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.249,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/12/2020 15:37, Mark Cave-Ayland wrote:

> This patch series comes from an experimental branch that I've been working on
> to try and boot a MacOS toolbox ROM under the QEMU q800 machine. The effort is
> far from complete, but it seems worth submitting these patches separately since
> they are limited to the ESP device and form a substantial part of the work to
> date.
> 
> As part of Laurent's recent q800 work so-called PDMA (pseudo-DMA) support was
> added to the ESP device. This is whereby the DREQ (DMA request) line is used
> to signal to the host CPU that it can transfer data to/from the device over
> the SCSI bus.
> 
> The existing PDMA tracks 4 separate transfer data sources as indicated by the
> ESP pdma_origin variable: PDMA, TI, CMD and ASYNC with an independent variable
> pdma_len to store the transfer length. This works well with Linux which uses a
> single PDMA request to transfer a number of sectors in a single request.
> 
> Unfortunately the MacOS toolbox ROM has other ideas here: it sends data to the
> ESP as a mixture of FIFO and PDMA transfers and then uses a mixture of the FIFO
> and DMA counters to confirm that the correct number of bytes have been
> transferred. For this to work correctly the PDMA buffers and separate pdma_len
> transfer counter must be consolidated into the FIFO to allow mixing of both
> types of transfer within a single request.
> 
> The patchset is split into several sections:
> 
> - Patches 1-4 are minor patches which make esp.c checkpatch friendly whilst also
>    fixing up some trace events ready for later patches in the series
>    
> - Patches 5-11 unify the DMA transfer count. In particular there are 2 synthetic
>    variables dma_counter and dma_left within ESPState which do not need to exist.
>    DMA transfer lengths are programmed into the TC (transfer count) register which is
>    decremented for each byte transferred, generating an interrupt when it reaches zero.
>    These patches add helper functions to read the TC and STC registers directly and
>    remove these synthetic variables so that the DMA transfer length is now tracked in
>    a single place.
> 
> - Now that the TC register represents the authoritative DMA transfer length, patches
>    12-20 work to eliminate the separate PDMA variables pdma_start, pdma_cur, pdma_len
>    and separate PDMA buffers PDMA and CMD. The PDMA position variables can be replaced
>    by the existing ESP cmdlen and ti_wptr/ti_rptr, whilst the FIFO (TI) buffer is used
>    for incoming data with commands being accumulated in cmdbuf as per standard DMA
>    requests.
> 
> - Patches 21 and 22 fix the detection of missing SCSI targets by the MacOS toolbox ROM
>    on startup at which point it will attempt to start reading information from a CDROM
>    attached to the q800 machine.
> 
> - Patch 23 is the main rework of the PDMA buffer transfers: instead of tracking the
>    SCSI transfers using a separate ASYNC pdma_origin, the contents of the ESPState
>    async_buf are copied to the FIFO buffer in 16-byte chunks with the transfer status
>    and IRQs being set accordingly.
> 
> - Patch 24 removes the last separate PDMA variable pdma_origin, including the separate
>    PDMA migration subsection which is no longer required (see note below about migration
>    compatibility).
>    
> - Finally patch 25 enables 4 byte PDMA reads/writes over the SCSI bus which are used
>    by MacOS when reading the next stage bootloader from CDROM (this is an increase from
>    2 bytes currently implemented and used by Linux).
> 
> 
> Testing
> =======
> 
> I've tested this on my SPARC32 OpenBIOS images which include Linux, OpenBSD, NetBSD,
> and Solaris and all of these continue to boot as before.
> 
> Similarly the q800 m68k Linux test image still boots as before with these patches
> applied. It is possible with lots of hacks to load Laurent's EMILE bootloader using
> a MacOS toolbox ROM - the hope is to try and start upstreaming more of these changes
> as time allows.
> 
> 
> Migration
> =========
> 
> The patchset ensures that ESP devices without PDMA (i.e. everything except the q800
> machine) will migrate successfully. This is fairly simple: the only change required
> here is to copy the old synthetic dma_left value over into the TC.
> 
> Unfortunately migrating the PDMA subsection is a lot harder due to the change in the
> way that the DMA TC and changes to the point at which transfer counters are updated.
> For this reason the patchset will not migrate from older q800 snapshots: I don't
> believe this to be a problem since some devices are still missing VMStateDescription
> plus there are likely to be more breaking changes as the q800 machine matures.
> 
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> 
> 
> Mark Cave-Ayland (25):
>    esp: checkpatch fixes
>    esp: add trace event when receiving a TI command
>    esp: fix esp_reg_read() trace event
>    esp: add PDMA trace events
>    esp: determine transfer direction directly from SCSI phase
>    esp: introduce esp_get_tc() and esp_set_tc()
>    esp: introduce esp_get_stc()
>    esp: apply transfer length adjustment when STC is zero at TC load time
>    esp: remove dma_counter from ESPState
>    esp: remove dma_left from ESPState
>    esp: remove minlen restriction in handle_ti
>    esp: introduce esp_pdma_read() and esp_pdma_write() functions
>    esp: use pdma_origin directly in esp_pdma_read()/esp_pdma_write()
>    esp: move pdma_len and TC logic into esp_pdma_read()/esp_pdma_write()
>    esp: accumulate SCSI commands for PDMA transfers in cmdbuf instead of
>      pdma_buf
>    esp: remove redundant pdma_start from ESPState
>    esp: move PDMA length adjustments into
>      esp_pdma_read()/esp_pdma_write()
>    esp: use ti_wptr/ti_rptr to manage the current FIFO position for PDMA
>    esp: use in-built TC to determine PDMA transfer length
>    esp: remove CMD pdma_origin
>    esp: rename get_cmd_cb() to esp_select()
>    esp: fix PDMA target selection
>    esp: use FIFO for PDMA transfers between initiator and device
>    esp: remove pdma_origin from ESPState
>    esp: add 4 byte PDMA read and write transfers
> 
>   hw/scsi/esp.c         | 461 +++++++++++++++++++++++++-----------------
>   hw/scsi/trace-events  |   5 +
>   include/hw/scsi/esp.h |  20 +-
>   3 files changed, 279 insertions(+), 207 deletions(-)

Please ignore this patchset for now - whilst the changes allow mixed PDMA and FIFO 
requests, they assume that the FIFO request sizes have the same alignment as the PDMA 
request sizes. I've just found a case where this isn't true in the MacOS toolbox ROM, 
so I'll investigate further and then resubmit.


ATB,

Mark.

