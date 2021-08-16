Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA053ED7FA
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 15:54:34 +0200 (CEST)
Received: from localhost ([::1]:38904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFd4T-0007UE-DJ
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 09:54:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1mFd3M-0006dz-Ix
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 09:53:26 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:35484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1mFd3K-0004Lx-RH
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 09:53:24 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E41671FE70;
 Mon, 16 Aug 2021 13:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1629122000; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/1T95nZHaFTOkm3QSEtxKO0uYo+9Ykf2GUUxNk7lpuQ=;
 b=CX8a6pKMqKKTWCQdADgWrXhIWzbTGF+dpdrL1AOxddp4ADNSFQl5i34+1jhBC9hMhdDeRw
 asCxIB232h4K8C42pji2QQTZHenBnFy+jcY+tyGCKN21GXmYEDuPIHRFIcQ7QDSHjuBBdC
 wLNihFJdXPfDyhL+pwSmvWgtlhuP9tY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1629122000;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/1T95nZHaFTOkm3QSEtxKO0uYo+9Ykf2GUUxNk7lpuQ=;
 b=gbe14RwPk8RkUJ9UNvZuNSdzKVqc+c5bs280H84rwXfb6bnm1NL97a5gUfXagXF8BWmM3w
 kFDgM7FOVV9o9RBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BC32F13DC7;
 Mon, 16 Aug 2021 13:53:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Q7mOIM9tGmFlEwAAMHmgww
 (envelope-from <jziviani@suse.de>); Mon, 16 Aug 2021 13:53:19 +0000
Subject: Re: [PATCH v2] vga: don't abort when adding a duplicate isa-vga device
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210816123611.28183-1-jziviani@suse.de>
 <ef1d3843-2917-e35a-be23-6953aa270f25@redhat.com>
From: Jose Ricardo Ziviani <jziviani@suse.de>
Message-ID: <81c22b6a-a7d8-3773-db22-69b468a38b06@suse.de>
Date: Mon, 16 Aug 2021 10:53:00 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <ef1d3843-2917-e35a-be23-6953aa270f25@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=195.135.220.29; envelope-from=jziviani@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -80
X-Spam_score: -8.1
X-Spam_bar: --------
X-Spam_report: (-8.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.71,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: thuth@redhat.com, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Philippe!

On 16/08/2021 10:01, Philippe Mathieu-Daudé wrote:
> On 8/16/21 2:36 PM, Jose R. Ziviani wrote:
>> If users try to add an isa-vga device that was already registered,
>> still in command line, qemu will crash:
>>
>> $ qemu-system-mips64el -M pica61 -device isa-vga
>> RAMBlock "vga.vram" already registered, abort!
>> Aborted (core dumped)
>>
>> That particular board registers the device automaticaly, so it's
>> not obvious that a VGA device already exists. This patch changes
>> this behavior by displaying a message and exiting without crashing.
>>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/44
>> Signed-off-by: Jose R. Ziviani <jziviani@suse.de>
>> ---
>>   hw/display/vga-isa.c | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/hw/display/vga-isa.c b/hw/display/vga-isa.c
>> index 90851e730b..1fba33b22b 100644
>> --- a/hw/display/vga-isa.c
>> +++ b/hw/display/vga-isa.c
>> @@ -33,6 +33,7 @@
>>   #include "hw/loader.h"
>>   #include "hw/qdev-properties.h"
>>   #include "qom/object.h"
>> +#include "qapi/error.h"
>>   
>>   #define TYPE_ISA_VGA "isa-vga"
>>   OBJECT_DECLARE_SIMPLE_TYPE(ISAVGAState, ISA_VGA)
>> @@ -61,6 +62,15 @@ static void vga_isa_realizefn(DeviceState *dev, Error **errp)
>>       MemoryRegion *vga_io_memory;
>>       const MemoryRegionPortio *vga_ports, *vbe_ports;
>>   
>> +    /*
>> +     * make sure this device is not being added twice, if so
>> +     * exit without crashing qemu
>> +     */
>> +    if (qemu_ram_block_by_name("vga.vram")) {
>> +        error_setg(errp, "vga.vram is already registered");
> Maybe "'isa-vga' device already registered" is easier to understand?
> (vga.vram is about the device model internal).

Much better message, sending a v3 with this improvement.

Thank you!


>
> Otherwise:
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>
>> +        return;
>> +    }
>> +
>>       s->global_vmstate = true;
>>       vga_common_init(s, OBJECT(dev));
>>       s->legacy_address_space = isa_address_space(isadev);
>>

