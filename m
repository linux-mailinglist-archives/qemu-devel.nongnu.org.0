Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E36E2F4D6B
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 15:44:38 +0100 (CET)
Received: from localhost ([::1]:59440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzhO1-0003o0-Fp
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 09:44:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kzhJC-0006fn-DI
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 09:39:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kzhJA-00010e-B4
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 09:39:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610548775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C3dsbt0q+G/WVGWknAnWE2lhCvvQ4ibGFuW/owEhKNg=;
 b=IzcDnldlDZDluHXUP3qF/inJwXAlGmni8+VjuhplWXQNZUW0dn8y6G+BStxnxLjkXa1CxK
 pgE3vH46DYeXCijpO1yFp5OY2UuzyEmwL6UeMf13URWdJ8Eg++lR/35b6JFXM2TveMReic
 ofW8uBRtJbbpfbvN1VvflmcphAGtRjA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-eoTmksBBN0Sdp0ErWD9U3w-1; Wed, 13 Jan 2021 09:39:33 -0500
X-MC-Unique: eoTmksBBN0Sdp0ErWD9U3w-1
Received: by mail-ej1-f69.google.com with SMTP id m11so934888ejr.20
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 06:39:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=C3dsbt0q+G/WVGWknAnWE2lhCvvQ4ibGFuW/owEhKNg=;
 b=dMmo/x/XXkH9qva4HkNMKzzMRas4pxukYQHxx0+6rXYTPXgWIW2KaILnD1BYdx9S9L
 EUVm96j9b4aAwGk1mbjgZsBZFk9ScxNe6ji29wZGiTvfLOx+F3TUAYgTwzfV2Ups4Nau
 FLf/kRCsWseRWSxSEeEFmPIq/OzdihvDJJ8d/pPJJHiw9NqxCRnfxIPgiVhft4oN7Pa5
 A1gasRJDaupYJ/4NcQsomq4VYy8jWwZx6UEqQzD1pSJt6hM59Sc2Cfe2M+NiWrJoiYXM
 sXUcPWAOwhK09RtE8AfG6/KvcbuJrA3rGenOG0Oj0YQcsPh1a82uqVkgttEwzjUqlJKd
 Btjg==
X-Gm-Message-State: AOAM532810a3cBbaTlCI21z/+K++H6/IYZTIwZ1SQIEU2lV0NOUhZcVB
 zkg3PM/ApUBaNodoxvPFbS6Z5C6nLuPsToopwBpiPdzQub7ioJB80s/ID9Ghnubj8gaLrLqab17
 KkseqBMQrQcU8P14=
X-Received: by 2002:a05:6402:40c4:: with SMTP id
 z4mr1995245edb.233.1610548771605; 
 Wed, 13 Jan 2021 06:39:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxeKgy5cNVjIVLA3x/p0orKXKAIeizI+TEUVwWt5uwSwCapnwRyguPvMaqC2JhgZggFUJ84ag==
X-Received: by 2002:a05:6402:40c4:: with SMTP id
 z4mr1995226edb.233.1610548771371; 
 Wed, 13 Jan 2021 06:39:31 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ch30sm929479edb.8.2021.01.13.06.39.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jan 2021 06:39:30 -0800 (PST)
Subject: Re: [PATCH 00/25] esp: consolidate PDMA transfer buffers
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 fam@euphon.net, laurent@vivier.eu
References: <20201230153745.30241-1-mark.cave-ayland@ilande.co.uk>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5af57492-a070-b109-8daa-ba3eb2ea1855@redhat.com>
Date: Wed, 13 Jan 2021 15:39:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201230153745.30241-1-mark.cave-ayland@ilande.co.uk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/12/20 16:37, Mark Cave-Ayland wrote:
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

This is all esp.c, so if Laurent and you are fine just send a pull request.

Thanks!

Paolo



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
> 


