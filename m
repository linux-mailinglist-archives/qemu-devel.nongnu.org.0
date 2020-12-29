Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 662762E6FC0
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Dec 2020 11:53:52 +0100 (CET)
Received: from localhost ([::1]:34756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuCdT-0003IZ-F8
	for lists+qemu-devel@lfdr.de; Tue, 29 Dec 2020 05:53:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kuCcM-0002rk-9e
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 05:52:42 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:52037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kuCcI-0006qu-M5
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 05:52:41 -0500
Received: by mail-wm1-x336.google.com with SMTP id v14so2302299wml.1
 for <qemu-devel@nongnu.org>; Tue, 29 Dec 2020 02:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Y4TZztekjXxHdYhczZepGnee6FqUDlKjOAp3ofXf2pU=;
 b=CIRC6adz9Il8vR0iQ0lOlj8gH4S53EsBKY+4Jq7ukmqbQ495xnaPmnuIuI9GIHRT9z
 Ivtk5W5uGWkJPo1jlpAaPg7YtlLORU8lbU7pxPcwPN/TdCP3YMw4gck37skeKZ/rrOs2
 lrjnlNoPf9X587UUifs3zp0euMjJwXLNXvDR80lmVN/juTOrtkK6QAs79RBMq1ErnPKd
 9FkWrxdYH+y+fAGXa0QOpBdEEKe9l4CkX00cyk76SwymGvUeQUhVr/2n3YTCrUzZ1OUG
 dpjSkTHtpYzphMj21vJk3YZAQu1/prp8kWX0y+g7HY337eeZDvkb2/F6qv4/ROhsTbwS
 9/hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Y4TZztekjXxHdYhczZepGnee6FqUDlKjOAp3ofXf2pU=;
 b=qPZiZ6pM5D/rgI804SuGlcfDD80qSGxTs/norFmcrBWETGcqycvd3vvjFXyqoGieTA
 Hs/dlcUfD1NzDBBqcpOCKvCM0+mys5vJpVpnkS2d+ChQ1js+4t4uTG9hDVCoFUCnILnh
 CIgg0Vwcx2jYJZOHcKGWEpyCdZ7ci+c1/1mumYdaqLN0SmEM+Mx50LtrHUVC11qo+K76
 2XjzZAbPPcGzDWoNxD8oQVaHoUNpXcFcmtwtjrORsyMyDCYvlqfN6rvOIXBbWYMm230+
 Sxs91fkhLPY5mW0s+YmlIoYH8H6Bjn9wjKnEkKM5Cs8dARpeHbt+YNKlDlaia5u0fVmq
 zRXQ==
X-Gm-Message-State: AOAM531jRuIvfc8i4/PVUstzMkV2dPkHLRi74isLRGnbmpeGvhTRvSL5
 WzyqHcY5OFpknm6m8ECKp70=
X-Google-Smtp-Source: ABdhPJzENZUzX+ciYffvofqbR1IFCbIdO9hVD7yaZIiCS5slXPTIte9OG5/s7NbbMDBDkMzbMyLe3A==
X-Received: by 2002:a1c:4604:: with SMTP id t4mr2852830wma.17.1609239156606;
 Tue, 29 Dec 2020 02:52:36 -0800 (PST)
Received: from ?IPv6:2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b?
 ([2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b])
 by smtp.gmail.com with ESMTPSA id f7sm4060680wmc.1.2020.12.29.02.52.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Dec 2020 02:52:35 -0800 (PST)
Subject: Re: [PATCH v2 1/2] ide: Make room for flags in PCIIDEState and add
 one for legacy mode
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1609107222.git.balaton@eik.bme.hu>
 <19d68b4da7fc8dbffe3308c661143584ac830f29.1609107222.git.balaton@eik.bme.hu>
 <080a04e0-e162-e80a-db6a-53bf4b43c9cb@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <09dfce33-caed-1940-c849-8f1d8516a133@amsat.org>
Date: Tue, 29 Dec 2020 11:52:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <080a04e0-e162-e80a-db6a-53bf4b43c9cb@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.698,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Huacai Chen <chenhuacai@kernel.org>, John Snow <jsnow@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/28/20 8:30 PM, Mark Cave-Ayland wrote:
> On 27/12/2020 22:13, BALATON Zoltan wrote:
> 
>> We'll need a flag for implementing some device specific behaviour in
>> via-ide but we already have a currently CMD646 specific field that can
>> be repurposed for this and leave room for further flags if needed in
>> the future. This patch changes the "secondary" field to "flags" and
>> change CMD646 and its users accordingly and define a new flag for
>> forcing legacy mode that will be used by via-ide for now.
>>
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>> Tested-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>> v2: Fixed typo in commit message
>>
>>   hw/ide/cmd646.c      | 4 ++--
>>   hw/sparc64/sun4u.c   | 2 +-
>>   include/hw/ide/pci.h | 7 ++++++-
>>   3 files changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/ide/cmd646.c b/hw/ide/cmd646.c
>> index c254631485..7a96016116 100644
>> --- a/hw/ide/cmd646.c
>> +++ b/hw/ide/cmd646.c
>> @@ -256,7 +256,7 @@ static void pci_cmd646_ide_realize(PCIDevice *dev,
>> Error **errp)
>>       pci_conf[PCI_CLASS_PROG] = 0x8f;
>>         pci_conf[CNTRL] = CNTRL_EN_CH0; // enable IDE0
> 
> Doesn't the existing comment above cause checkpatch to fail?

The comment is old and Balaton didn't modified it. Usually I'd prefer
to address style change in a separate commit, ...

> 
>> -    if (d->secondary) {
>> +    if (d->flags & BIT(PCI_IDE_SECONDARY)) {
>>           /* XXX: if not enabled, really disable the seconday IDE
>> controller */
>>           pci_conf[CNTRL] |= CNTRL_EN_CH1; /* enable IDE1 */

... but since a similar comment is added here, it might be acceptable
to fix the style of the former one here too. I noted Balaton already
addressed your comment in a v3.

>>       }
>> @@ -314,7 +314,7 @@ static void pci_cmd646_ide_exitfn(PCIDevice *dev)
>>   }
>>     static Property cmd646_ide_properties[] = {
>> -    DEFINE_PROP_UINT32("secondary", PCIIDEState, secondary, 0),
>> +    DEFINE_PROP_BIT("secondary", PCIIDEState, flags,
>> PCI_IDE_SECONDARY, false),
>>       DEFINE_PROP_END_OF_LIST(),
>>   };

