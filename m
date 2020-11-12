Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1452B0223
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 10:41:39 +0100 (CET)
Received: from localhost ([::1]:48918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kd96n-00014q-Qe
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 04:41:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kd95M-000050-EC; Thu, 12 Nov 2020 04:40:08 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:46502
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kd95J-0005Pd-MD; Thu, 12 Nov 2020 04:40:08 -0500
Received: from host109-155-147-35.range109-155.btcentralplus.com
 ([109.155.147.35] helo=[192.168.1.110])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kd95P-0007ZQ-Mr; Thu, 12 Nov 2020 09:40:16 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: thuth@redhat.com, armbru@redhat.com, david@gibson.dropbear.id.au,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-trivial@nongnu.org
References: <thuth@redhat.com, armbru@redhat.com, david@gibson.dropbear.id.au, 
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 qemu-trivial@nongnu.org>
 <20201110103111.18395-1-mark.cave-ayland@ilande.co.uk>
Message-ID: <1fd15956-056c-3a7e-7696-0ba09f116122@ilande.co.uk>
Date: Thu, 12 Nov 2020 09:39:52 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201110103111.18395-1-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.155.147.35
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2-for-5.2] macio: set user_creatable to false in
 macio_class_init()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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

On 10/11/2020 10:31, Mark Cave-Ayland wrote:

> Commit 348b8d1a76 "macio: don't reference serial_hd() directly within the device"
> removed the setting of user_creatable to false on the basis that the restriction
> was due to the use of serial_hd() in macio_instance_init().
> 
> Unfortunately this isn't the full story since the PIC object property links
> must still be set before the device is realized. Whilst it is possible to update
> the macio device and Mac machines to resolve this, the fix is too invasive at
> this point in the release cycle.
> 
> For now simply set user_creatable back to false in macio_class_init() to
> prevent QEMU from segfaulting in anticipation of the proper fix arriving in
> QEMU 6.0.
> 
> Reported-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> ---
>   hw/misc/macio/macio.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> v2:
> - Rebase onto master
> - Add for-5.2 into subject prefix
> - Add R-B tags from Philippe and Thomas
> 
> 
> diff --git a/hw/misc/macio/macio.c b/hw/misc/macio/macio.c
> index 51368884d0..bb601f782c 100644
> --- a/hw/misc/macio/macio.c
> +++ b/hw/misc/macio/macio.c
> @@ -456,6 +456,8 @@ static void macio_class_init(ObjectClass *klass, void *data)
>       k->class_id = PCI_CLASS_OTHERS << 8;
>       device_class_set_props(dc, macio_properties);
>       set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
> +    /* Reason: requires PIC property links to be set in macio_*_realize() */
> +    dc->user_creatable = false;
>   }
>   
>   static const TypeInfo macio_bus_info = {

Applied to my qemu-macppc branch.


ATB,

Mark.

