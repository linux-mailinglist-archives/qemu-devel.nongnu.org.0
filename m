Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C523233C09E
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 16:57:45 +0100 (CET)
Received: from localhost ([::1]:58114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLpbE-0003m8-QM
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 11:57:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLpYm-0001VL-2s
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 11:55:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLpYj-00030I-GY
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 11:55:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615823708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k2WghvtsAYP3Z1zLLmZCORkTuV1Lv0P81Ng8xhlN6ME=;
 b=FEYGcufmAcSSZhNaW3ctNB5BA+H2elSA0H1iAAoLdmfztqktViEt41kqY93fAlr1S+UfsF
 F16R8zI+aUBXznZ45KllMZFWZjWiHmQ1GGKgtfnWLrTNwPTn6T0r0wIzqRKkQnVw5CbdGu
 SMmxF63j7EEEBYBMRd8l+KqPpbWiGGM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-jpT2P_-JP6usyZ5DyP2jzw-1; Mon, 15 Mar 2021 11:55:06 -0400
X-MC-Unique: jpT2P_-JP6usyZ5DyP2jzw-1
Received: by mail-wr1-f72.google.com with SMTP id g5so15213268wrd.22
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 08:55:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=k2WghvtsAYP3Z1zLLmZCORkTuV1Lv0P81Ng8xhlN6ME=;
 b=gH7QgpRDCw5CpxOAwf4dyjttcz7M+ghYdkzD0EDhMdynf72bgb9ucx8jmnOJ7PiuA/
 57/bYSB0T+NQA+qABBICM7mPQRsJYmczId1iiulzyqIRFi9VKVz9wRUZmTMToO1jrOc9
 Ne451gCkoubmZqLQXTr/knsBS8iSMt+tlLSnXNwlYk7rtF87fMraYMkPMok9yD39dHaj
 8gUk27hE1ZqjQtXVV6vLv2k/mmgY+NPoZZ1F1HIm+nvBgBAogSEw8qqoFw7MWdVq13Vy
 p6nYZKnVGOeMxTrHyVN7OTIAQ/KMbvwVOLwxWH/CYSJdbCf35nGO7JL6oxIKnSxZRL3w
 msQg==
X-Gm-Message-State: AOAM530eTDd4Dx5p3ygwvUCrZj/LryoHwe8I3QUEVbn8Od6owcwD+9qa
 1I8PiF+2Y8ChQxplr1+B1ICu9ZkbbggsKD43wR+6fx9FX8cqG+EHmwP3rDK6SuIwrV6R3hHzRD4
 Eythq1w338/9Rqnw=
X-Received: by 2002:adf:e60e:: with SMTP id p14mr313612wrm.221.1615823704921; 
 Mon, 15 Mar 2021 08:55:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJcxCZeHdXD7prd/cBy0JMnwgr9T8Wf2vzcJT1oRbH7SWzIkY41+IO+eouCC+CiDIAEFspSg==
X-Received: by 2002:adf:e60e:: with SMTP id p14mr313592wrm.221.1615823704689; 
 Mon, 15 Mar 2021 08:55:04 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id c18sm29657970wmk.0.2021.03.15.08.55.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 08:55:04 -0700 (PDT)
Subject: Re: compile warning in i8259.c
To: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-devel@nongnu.org,
 qemu-s390x <qemu-s390x@nongnu.org>
References: <cc283705-a0ee-5ee4-4f9a-b69afce65d8c@de.ibm.com>
 <21da022d-7349-ceca-ca88-b7987ac2eb0d@de.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a137ee82-9ef6-dcd9-0b39-6a0257514e78@redhat.com>
Date: Mon, 15 Mar 2021 16:55:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <21da022d-7349-ceca-ca88-b7987ac2eb0d@de.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/21 4:44 PM, Christian Borntraeger wrote:
> On 15.03.21 16:14, Christian Borntraeger wrote:
>> For some time now I do see the following, when I compile x86-softmmu
>> on s390:
>>
>> FAILED: libcommon.fa.p/hw_intc_i8259.c.o
>> cc -Ilibcommon.fa.p -I. -I.. -Iqapi -Itrace -Iui -Iui/shader
>> -I/usr/include/capstone -I/usr/include/glib-2.0
>> -I/usr/lib64/glib-2.0/include -I/usr/include/libmount
>> -I/usr/include/blkid -I/usr/include/gio-unix-2.0
>> -I/usr/include/libusb-1.0 -I/usr/include/vte-2.91
>> -I/usr/include/pango-1.0 -I/usr/include/harfbuzz
>> -I/usr/include/freetype2 -I/usr/include/libpng16
>> -I/usr/include/fribidi -I/usr/include/libxml2 -I/usr/include/cairo
>> -I/usr/include/pixman-1 -I/usr/include/gtk-3.0
>> -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/atk-1.0
>> -I/usr/include/at-spi2-atk/2.0 -I/usr/include/dbus-1.0
>> -I/usr/lib64/dbus-1.0/include -I/usr/include/at-spi-2.0
>> -I/usr/include/virgl -I/usr/include/p11-kit-1 -I/usr/include/SDL2
>> -I/usr/include/cacard -I/usr/include/nss3 -I/usr/include/nspr4
>> -I/usr/include/slirp -fdiagnostics-color=auto -pipe -Wall
>> -Winvalid-pch -Werror -std=gnu99 -O2 -g -isystem
>> /home/cborntra/REPOS/qemu/linux-headers -isystem linux-headers -iquote
>> . -iquote /home/cborntra/REPOS/qemu -iquote
>> /home/cborntra/REPOS/qemu/include -iquote
>> /home/cborntra/REPOS/qemu/disas/libvixl -iquote
>> /home/cborntra/REPOS/qemu/tcg/s390 -iquote
>> /home/cborntra/REPOS/qemu/accel/tcg -pthread -U_FORTIFY_SOURCE
>> -D_FORTIFY_SOURCE=2 -m64 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64
>> -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef
>> -Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common
>> -fwrapv -Wold-style-declaration -Wold-style-definition -Wtype-limits
>> -Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers
>> -Wempty-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined
>> -Wimplicit-fallthrough=2 -Wno-missing-include-dirs
>> -Wno-shift-negative-value -Wno-psabi -fstack-protector-strong -fPIC
>> -DSTRUCT_IOVEC_DEFINED -D_REENTRANT -Wno-undef -D_DEFAULT_SOURCE
>> -D_XOPEN_SOURCE=600 -DNCURSES_WIDECHAR -MD -MQ
>> libcommon.fa.p/hw_intc_i8259.c.o -MF
>> libcommon.fa.p/hw_intc_i8259.c.o.d -o libcommon.fa.p/hw_intc_i8259.c.o
>> -c ../hw/intc/i8259.c
>> ../hw/intc/i8259.c: In function ‘pic_read_irq’:
>> ../hw/intc/i8259.c:203:13: error: ‘irq2’ may be used uninitialized in
>> this function [-Werror=maybe-uninitialized]
>>    203 |         irq = irq2 + 8;
>>        |         ~~~~^~~~~~~~~~
>> cc1: all warnings being treated as errors
>>
>>
>> Due to other compile warnings I find this hard to bisect. Has anyone
>> seen this as well?
> 
> cc Michael, Paolo,
> 
> Something like
> 
> diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c
> index 344fd04db14d..7335b7a06a67 100644
> --- a/hw/intc/i8259.c
> +++ b/hw/intc/i8259.c
> @@ -176,7 +176,7 @@ static void pic_intack(PICCommonState *s, int irq)
>  int pic_read_irq(DeviceState *d)
>  {
>      PICCommonState *s = PIC_COMMON(d);
> -    int irq, irq2, intno;
> +    int irq, irq2 = 0, intno;
>  
>      irq = pic_get_irq(s);
>      if (irq >= 0) {
> 
> 
> would do the trick. Let me know if I should do a proper patch or if you
> want to have things solved differently.

Since you ask, I'd love to have things solved differently...
One PIC has 8 IRQs, so we should model 2 cascaded PICs as 2 cascaded
QOM PICs. But this code is so old and heavily used that my desire
is unlikely to be realized. And your patch is simpler :>


