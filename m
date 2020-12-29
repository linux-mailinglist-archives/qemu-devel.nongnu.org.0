Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D09312E6FB5
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Dec 2020 11:49:40 +0100 (CET)
Received: from localhost ([::1]:60404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuCZP-00021E-Lf
	for lists+qemu-devel@lfdr.de; Tue, 29 Dec 2020 05:49:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kuCXt-0001Ok-PB
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 05:48:05 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:40837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kuCXr-0004lC-TF
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 05:48:05 -0500
Received: by mail-wm1-x330.google.com with SMTP id r4so1976284wmh.5
 for <qemu-devel@nongnu.org>; Tue, 29 Dec 2020 02:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5TH5bxxKnd7DH0To/SINsZbn9kIsb7NxqBc+u0C1i5Y=;
 b=jbaOc+edM4yE2Ue9naSTmXIwh3ZRc3Y3GqLQNzJqIW29jU84JrFmZoe6F6upijL6eG
 IbErTI9Yr0cChLRCemNjKxer9Fybem/uI2mn2DcfJPB97nPVI05mW8h8dgR/PYXbYDFE
 khYyu16PpFerXNshQE+EDe386wXuaVCwiqfzRstjDwMLjAoeTflb5xs90b1JzQyeOXU/
 99TI247H8SslMGo9mRGnufADBwG6C81/WDCvsO689K+OUzXhmNrCtygj+z78uCe0mPCS
 v1TavqJtGbQoyHdEPqitoQwI2cvC2TehHENm7MLDFUtJog3JRQ5b+X8f3XaDs/CW8ZAk
 jMJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5TH5bxxKnd7DH0To/SINsZbn9kIsb7NxqBc+u0C1i5Y=;
 b=tc0MQkAmCyQog+qwcyeTmhPSlfgtjGKy4YjbEo61aI1OQ2cIXkUAUaN3YyE+KywJ5v
 p0cWSvRNtF4fA5CjbIHRgjGMUPJbC73NlbiDnIcfPj9ZsDmlX7HWJUD5L6ubDzEt//sz
 rP6rJIvNLvISAbNxd32wo9KCB9ZP33Rn+BFzaLXxbXJvFoPfwkUXuS/hGsIWG0Vq8oHw
 E5InPfrdRDBrw3wj/bIPG9Pf0PxuFYi871PZ+dxO51BOK0Gwx7eJ72weGaYWgDol1fT7
 CBYfTMkES7UdILyBe/xmBJO1S7JLUSPRMf74FVB7WePq0lfVm6alWqVL020uEB1naory
 xBoA==
X-Gm-Message-State: AOAM532sY1gNeWUMcY8PypAqDu63Qcfap8qr78GBUkd4FcA6PsR82JDn
 v1jM9jhlj70hxQ2lB06uwXA=
X-Google-Smtp-Source: ABdhPJwcsYlHlTKTSUCWlGder/89aIWBBS+/rTqdgSuf0DT7aObTldD1u4b/SAEos4aeR2j7REM8bQ==
X-Received: by 2002:a1c:6056:: with SMTP id u83mr2914545wmb.90.1609238880798; 
 Tue, 29 Dec 2020 02:48:00 -0800 (PST)
Received: from ?IPv6:2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b?
 ([2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b])
 by smtp.gmail.com with ESMTPSA id n189sm2983006wmf.20.2020.12.29.02.47.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Dec 2020 02:47:59 -0800 (PST)
Subject: Re: Bug in Bonito? (mips/fuloong2e)
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, BALATON Zoltan
 <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <771a6cd4-90a7-662e-5a5b-e8a9395a875@eik.bme.hu>
 <c655a692-991e-b633-456a-6fb149520a37@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <511225e2-f074-4318-4fb0-f695ca6befe0@amsat.org>
Date: Tue, 29 Dec 2020 11:47:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <c655a692-991e-b633-456a-6fb149520a37@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
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
Cc: Huacai Chen <chenhuacai@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/29/20 6:26 AM, Jiaxun Yang wrote:
> 在 2020/12/29 上午11:26, BALATON Zoltan 写道:
>> Hello,
>>
>> While continuing with part two of my vt82c686b clean ups I've tried to
>> implement SMBus IO base configuration in the vt82c686b-pm part that
>> I've already done for vt8231 for pegasos2 and it should be the same
>> for 686B. (In short, writing address to pm config 0x90 sets base
>> address of smbus regs and bit 0 of 0xd2 enables/disables it.) This is
>> what the firmware does first and it would allow removing hard coded
>> 0xeee1 value and the property to set it and then I could reuse the
>> same PM part in VT8231.
>>
> [...]
>>
>> Any idea what this is trying to do and how to fix it?
> 
> It's trying to translate Bonito style PCI config space r/w to standard PCI
> config space R/W.
> 
> A quick galance told me change BONITO_PCICONF_REG_MASK to 0xff
> may help.

Per the datasheet section "5.7.5. Accessing PCI configuration space"
0xfc is the correct value, but the register number starts at the 2nd
bit. So this is not a write access to register 0xd2 but 0x34?

If you can test, this is the snippet I plan to send later:

-- >8 --
diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index a99eced0657..65953766dd0 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -189,3 +189,3 @@ FIELD(BONGENCFG, PCIQUEUE,      12, 1)
 #define BONITO_PCICONF_REG_MASK        0xFC
-#define BONITO_PCICONF_REG_OFFSET      0
+#define BONITO_PCICONF_REG_OFFSET      2
---

> 
> Thanks.
> 
> - Jiaxun
> 
>>
>> Regards,
>> BALATON Zoltan
> 
> 

