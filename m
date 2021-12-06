Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 760CB469754
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 14:42:12 +0100 (CET)
Received: from localhost ([::1]:42376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muEFv-00024J-4S
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 08:42:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1muEEQ-0008Nj-85
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 08:40:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1muEEE-0002VO-Be
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 08:40:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638798025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RN5/vTiGpC9pjGgz/arvroACZln61CB3ww04DUymd/8=;
 b=JZa42hGp0NySZCO3gHr4/ztTLRsB4qxrkl7Y73GudqV7aBQW5ofj0C8z130LKUpYWT+sHD
 5UcYMhj6ZKjMyydPuwhGE0FQ6qhxS5UFBIFiPCzAkcunPmS7uhMYK3iUPtDhVm74YAop5j
 6Kvt6nN1dJ+tzJotZjMQv00QTboqS4c=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-381-7wuU0VfJPoCvJwDA5shUYA-1; Mon, 06 Dec 2021 08:40:22 -0500
X-MC-Unique: 7wuU0VfJPoCvJwDA5shUYA-1
Received: by mail-wm1-f72.google.com with SMTP id
 l6-20020a05600c4f0600b0033321934a39so4425723wmq.9
 for <qemu-devel@nongnu.org>; Mon, 06 Dec 2021 05:40:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RN5/vTiGpC9pjGgz/arvroACZln61CB3ww04DUymd/8=;
 b=EiKVAZ2XwWVnugmbwU9QZBw9Jwxz9KWj1rY5AUxa7tdA+icpcqSs98pzQneHKwpBQE
 D/RXqNrbD6AG0YSe+ADLjcJREFUKaKDm7DaiZRefU8n/qVt+VHfHFVP53PR6uSkF0zo9
 tvwAFNha8aXP+YXQrz+CqO8HU1L8MfA1PBMPT0FYtdcVPhnwbdKvhQ9jYrO6rTIrTUIz
 Z6XBBHEmoq5u6dXWbV3MoULyJnt1A79fxcTpbjxEEIQezWVTGF3n4Zj6wWYt9wLaBEud
 oT/2IZP9tesEc7cxeaybEkRLEJPwrwSHdT3w2R7TzmpyKyT33UB+48J+0qE1eg7iewvU
 r00Q==
X-Gm-Message-State: AOAM533f6K4oUrm3cFvreZ1nYHo+lmmSONORrAwvOeAv5o5z/220VpXI
 mL8SEuI1cdJk2DDD6bzyeI1p0cv8sEWVJ7YonOYroNLWQWbV2zXfcxmZZfN1papm5Pgli3vtXeT
 6GMV0RlMKzrQXq8M=
X-Received: by 2002:a7b:c85a:: with SMTP id c26mr39445259wml.23.1638798021565; 
 Mon, 06 Dec 2021 05:40:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyQpuP/qCDLqz3FRDRsw2vu+3884dyXgXsFJScqECLGYS0Tvq8KcdNGV5rBlhItvWT52FW4rw==
X-Received: by 2002:a7b:c85a:: with SMTP id c26mr39445226wml.23.1638798021331; 
 Mon, 06 Dec 2021 05:40:21 -0800 (PST)
Received: from [192.168.8.100] (tmo-097-143.customers.d1-online.com.
 [80.187.97.143])
 by smtp.gmail.com with ESMTPSA id h18sm12451911wre.46.2021.12.06.05.40.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Dec 2021 05:40:20 -0800 (PST)
Message-ID: <bd87c534-7b64-ff37-f795-bdfd04fceed5@redhat.com>
Date: Mon, 6 Dec 2021 14:40:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 15/15] ppc/ppc405: Update U-Boot board information for
 hotfoot
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org
References: <20211206103712.1866296-1-clg@kaod.org>
 <20211206103712.1866296-16-clg@kaod.org>
 <370b0897-b87f-bcb8-ccaf-8212dbf8d23c@amsat.org>
 <656054f1-5ec0-bf37-7da3-4fb7a6565282@kaod.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <656054f1-5ec0-bf37-7da3-4fb7a6565282@kaod.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.076, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/12/2021 14.37, Cédric Le Goater wrote:
> On 12/6/21 14:27, Philippe Mathieu-Daudé wrote:
>> On 12/6/21 11:37, Cédric Le Goater wrote:
>>> When support for the ESTeem 195E (PPC405EP) SBC (hotfoot) board was
>>> added to Linux, a different layout of U-Boot board information was
>>> introduced because the FW of these boards was an ancient U-Boot
>>> without dual ethernet support [1].
>>>
>>> Change the QEMU PPC405 board information to match the hotfoot board
>>> and let the ref405ep machine boot from Linux directly. Only the CPU
>>> frequency is required.
>>>
>>> This is brutal force. We could possibly add a machine option or a
>>> ref405ep machine class to update the board information accordingly.
>>>
>>> A similar change would be required in U-Boot. The alternative is to
>>> change Linux.
>>>
>>> [1] https://lists.ozlabs.org/pipermail/linuxppc-dev/2009-July/074487.html
>>>
>>> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>> ---
>>>   hw/ppc/ppc405_uc.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
>>>   1 file changed, 45 insertions(+)
>>>
>>> diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
>>> index ec97b22bd019..649bb2b0daf5 100644
>>> --- a/hw/ppc/ppc405_uc.c
>>> +++ b/hw/ppc/ppc405_uc.c
>>> @@ -41,6 +41,49 @@
>>>   #include "qapi/error.h"
>>>   #include "trace.h"
>>> +/*
>>> + * Linux hotfoot board information based on a production bootloader
>>> + * (u-boot 1.2.0.x) plus changes not upstream.
>>> + *
>>> + * https://lists.ozlabs.org/pipermail/linuxppc-dev/2009-July/074487.html
>>> + */
>>> +struct linux_hotfoot_bd_info {
>>> +    long unsigned int          bi_memstart;          /*     0     4 */
>>> +    long unsigned int          bi_memsize;           /*     4     4 */
>>> +    long unsigned int          bi_flashstart;        /*     8     4 */
>>> +    long unsigned int          bi_flashsize;         /*    12     4 */
>>> +    long unsigned int          bi_flashoffset;       /*    16     4 */
>>> +    long unsigned int          bi_sramstart;         /*    20     4 */
>>> +    long unsigned int          bi_sramsize;          /*    24     4 */
>>> +    long unsigned int          bi_bootflags;         /*    28     4 */
>>> +    long unsigned int          bi_ip_addr;           /*    32     4 */
>>> +    unsigned char              bi_enetaddr[6];       /*    36     6 */
>>> +    unsigned char              bi_enet1addr[6];      /*    42     6 */
>>> +    short unsigned int         bi_ethspeed;          /*    48     2 */
>>> +    long unsigned int          bi_intfreq;           /*    52     4 */
>>> +    long unsigned int          bi_busfreq;           /*    56     4 */
>>> +    long unsigned int          bi_baudrate;          /*    60     4 */
>>> +    unsigned char              bi_s_version[4];      /*    64     4 */
>>> +    unsigned char              bi_r_version[32];     /*    68    32 */
>>> +    unsigned int               bi_procfreq;          /*   100     4 */
>>> +    unsigned int               bi_plb_busfreq;       /*   104     4 */
>>> +    unsigned int               bi_pci_busfreq;       /*   108     4 */
>>> +    unsigned char              bi_pci_enetaddr[6];   /*   112     6 */
>>> +    unsigned int               bi_pllouta_freq;      /*   120     4 */
>>> +    int                        bi_phynum[2];         /*   124     8 */
>>> +    int                        bi_phymode[2];        /*   132     8 */
>>> +    unsigned int               bi_opbfreq;           /*   140     4 */
>>> +    int                        bi_iic_fast[2];       /*   144     8 */
>>> +};
>>
>> Why not use <stdint.h> types?
> 
> sure.
> 
> I am waiting for some feedback on this hack updating the in-memory
> board information. I have the feeling that a new 405 machine
> is required for this kernel :/

Yeah, it feels rather wrong to bend the ref405ep machine to match the 
hotfoot expectations of the kernel this way ... maybe it would be better to 
add an abstract qemu405 machine to the kernel?

  Thomas


