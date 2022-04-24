Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0455750D27E
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Apr 2022 16:56:26 +0200 (CEST)
Received: from localhost ([::1]:36554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nidey-0007te-Sx
	for lists+qemu-devel@lfdr.de; Sun, 24 Apr 2022 10:56:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1niddQ-0006Zx-Fl; Sun, 24 Apr 2022 10:54:48 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:36020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1niddP-00087s-2z; Sun, 24 Apr 2022 10:54:48 -0400
Received: from [2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nidcQ-000Afo-PK; Sun, 24 Apr 2022 15:53:50 +0100
Message-ID: <3c6b79e8-0705-eed8-5024-66b7e14bee00@ilande.co.uk>
Date: Sun, 24 Apr 2022 15:54:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: pbonzini@redhat.com, laurent@vivier.eu, fam@euphon.net,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
References: <20220421065155.31276-1-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220421065155.31276-1-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 0/6] scsi: add support for FORMAT UNIT command and quirks
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 21/04/2022 07:51, Mark Cave-Ayland wrote:

> Here are the next set of patches from my ongoing work to allow the q800
> machine to boot MacOS related to SCSI devices.
> 
> The first patch implements a dummy FORMAT UNIT command which is used by
> the Apple HD SC Setup program when preparing an empty disk to install
> MacOS.
> 
> Patches 2 adds a new quirks bitmap to SCSIDiskState to allow buggy and/or
> legacy features to enabled on an individual device basis. Once the quirks
> bitmap has been added, patch 3 uses the quirks feature to implement an
> Apple-specific mode page which is required to allow the disk to be recognised
> and used by Apple HD SC Setup.
> 
> Patch 4 adds compat_props to the q800 machine which enable the MODE_PAGE_APPLE
> quirk for all scsi-hd devices attached to the machine.
> 
> Finally patches 5 and 6 augment the compat_props to set the default vendor,
> product and version information for all scsi-hd and scsi-cd devices attached
> to the q800 machine, taken from real drives. This is because MacOS will only
> allow a known set of SCSI devices to be recognised during the installation
> process.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> 
> 
> Mark Cave-Ayland (6):
>    scsi-disk: add FORMAT UNIT command
>    scsi-disk: add new quirks bitmap to SCSIDiskState
>    scsi-disk: add MODE_PAGE_APPLE quirk for Macintosh
>    q800: implement compat_props to enable quirk_mode_page_apple for
>      scsi-hd devices
>    q800: add default vendor, product and version information for scsi-hd
>      devices
>    q800: add default vendor, product and version information for scsi-cd
>      devices
> 
>   hw/m68k/q800.c           | 12 ++++++++++++
>   hw/scsi/scsi-disk.c      | 24 ++++++++++++++++++++++++
>   hw/scsi/trace-events     |  1 +
>   include/hw/scsi/scsi.h   |  3 +++
>   include/scsi/constants.h |  1 +
>   5 files changed, 41 insertions(+)

I was fortunate enough to find a really good reference to some work done over on 
68mla.org reverse engineering Apple's HD SC Setup and SCSI device detection. This 
pointed me towards a couple of additional SCSI changes for QEMU that also fix CDROM 
access under A/UX which I shall include in an updated v2.


ATB,

Mark.

