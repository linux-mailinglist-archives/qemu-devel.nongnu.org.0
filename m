Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FED34827A
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 21:03:06 +0100 (CET)
Received: from localhost ([::1]:41486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP9ib-0005FK-KG
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 16:03:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lP9gE-0004S4-NY
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 16:00:38 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:36373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lP9gC-0003Je-Te
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 16:00:38 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 j20-20020a05600c1914b029010f31e15a7fso1898369wmq.1
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 13:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3IugeQZkL5pM5+x8zwZd2PyRDexCOyKtktbSzH8B/Ac=;
 b=idALkEk+EinRpKbvQdjgLhFxG7MsSRXdiwWdX/7eiInUQPFTdtbGOBEV/k0KsYYGUO
 gWgyUiodKmRygyzIBQL5Ad94U3ADABtyLYF6T5GQ2oUZ7Id8XOHF6TVN9bo1gTEr+AJc
 kU8m/DnqZq0EbBJJ+Tw8K2W3DHD84M61k91oWcusjEOKJVIhsj3YBu4emRqWYOVbkYDt
 9xelKudH9gFVzf6/MliqYQ7AKRt4Gg+Hp8lPI7zO8IKMrccS0n/epNbYuA0J/uYw1H74
 C+GRGowltum1U7VyrTjP9XOBfGNP9kLXgth52YDBmhJIbUN/Vz9lHnUo6U6FTF4xm0WB
 PJjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3IugeQZkL5pM5+x8zwZd2PyRDexCOyKtktbSzH8B/Ac=;
 b=bKs9TjdfD4asWamyZWWPXb9OuSsAbGGLl3bqcXGmcRHrODVqiSqAozsb2k/8up2VTt
 oTT0c1u3PNcP5y+rp6n7tBv9OALgckIqpR4wy8ufwuTkGjf9eqkC1kGQjjuATRjXWw4F
 I+Myl67XyRkaSxodz4sjq8B5bXeXS377bmC5BFj9GtrtCPXvp+Q3f4aK3SLTQC9xVAwN
 +HG6oEDQWM2UYBhWtDNet8T+4vufivjsN7nDSaQFS1yxR9rUbdxXCv9tY4ZGmdSuvyTt
 57y3Ir8MNWxfDl21tcm4rE22HJjii5peuCIt8RTSBQzbYPywMtbCCc9QWHfAiL74XtKy
 Fptw==
X-Gm-Message-State: AOAM531TpSs0laSY+PAu/s8hVK+QIf080jYOqTgReLQy87EtuaAKcx1N
 +aG1CnbeCvKTrGFGDsxHRPs=
X-Google-Smtp-Source: ABdhPJyjuOEiyEXfSf1sk0cA0Hj8CIMXuc2UxwF5JcgtgyaX4a2eUKIqAgIGZqwKF8B77WWAvj7giw==
X-Received: by 2002:a05:600c:35c8:: with SMTP id
 r8mr4288148wmq.130.1616616035488; 
 Wed, 24 Mar 2021 13:00:35 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id n7sm245822wrv.71.2021.03.24.13.00.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 13:00:34 -0700 (PDT)
Subject: Re: [PATCH v2] hw/isa/piix4: Migrate Reset Control Register
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20210324192731.717142-1-f4bug@amsat.org>
 <YFuVmTJcsdXj1UrG@work-vm>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <496821ce-dc75-34b1-020a-846409073ddc@amsat.org>
Date: Wed, 24 Mar 2021 21:00:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YFuVmTJcsdXj1UrG@work-vm>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/24/21 8:40 PM, Dr. David Alan Gilbert wrote:
> * Philippe Mathieu-Daudé (f4bug@amsat.org) wrote:
>> When adding the Reset register in commit 5790b757cfb we
>> forgot to migrate it.
>>
>> While it is possible a VM using the PIIX4 is migrated just
>> after requesting a system shutdown, it is very unlikely.
>> However when restoring a migrated VM, we might have the
>> RCR bit #4 set on the stack and when the VM resume it
>> directly shutdowns.
>>
>> Add a post_load() migration handler and set the default
>> RCR value to 0 for earlier versions, assuming the VM was
>> not going to shutdown before migration.
>>
>> Fixes: 5790b757cfb ("piix4: Add the Reset Control Register")
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> v2: Add piix4_ide_post_load() and describe
>> ---
>>  hw/isa/piix4.c | 15 ++++++++++++++-
>>  1 file changed, 14 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
>> index a50d97834c7..e7bce0e590c 100644
>> --- a/hw/isa/piix4.c
>> +++ b/hw/isa/piix4.c
>> @@ -93,12 +93,25 @@ static void piix4_isa_reset(DeviceState *dev)
>>      pci_conf[0xae] = 0x00;
>>  }
>>  
>> +static int piix4_ide_post_load(void *opaque, int version_id)
>> +{
>> +    PIIX4State *s = opaque;
>> +
>> +    if (version_id == 2) {
>> +        s->rcr = 0;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>  static const VMStateDescription vmstate_piix4 = {
>>      .name = "PIIX4",
>> -    .version_id = 2,
>> +    .version_id = 3,
>>      .minimum_version_id = 2,
>> +    .post_load = piix4_ide_post_load,
>>      .fields = (VMStateField[]) {
>>          VMSTATE_PCI_DEVICE(dev, PIIX4State),
>> +        VMSTATE_UINT8(rcr, PIIX4State),
> 
> I don't think that looks right any more; you'd need to make that a 
>    VMSTATE_UINT8_V(rcr, PIIX4State, 3),
> 
> I think, otherwise when you loaded a v2 it would still try
> and read the rcr byte.

Ah now I guess I understood.

Thanks!

