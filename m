Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E48CE689B38
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 15:13:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNwnB-0006Jw-VB; Fri, 03 Feb 2023 09:11:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNwn8-0006IZ-MO
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:11:50 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNwn6-000128-Vp
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:11:50 -0500
Received: by mail-wm1-x32d.google.com with SMTP id k16so3970429wms.2
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 06:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MGTuyaL3Srri9dYaCvD4PHJ8XHymtwxMYrYDAsSLUN0=;
 b=mkS4H0Ga/Q10UpyP/kiF6pTm8fb0F/UmALBGfwBUloXz2l8WwgBYF9gEKPmhFyaBHB
 K0d+uXJQpn8vYBokgPvaTThi8uuaYmurBJqhtaZSNOJI/9s1TGPaPeE18ma8MKREe6bb
 tTE0TXuUbW8sSVRYLeuMCa24k+da0Q+1uoVx0silTJ2JEvbrMOnN+MOYrm64ZdaWrEN+
 x2xM4g0qzQXwH8HqvgjwmW5fukS1mS2AmzspTRSxt1v470TGZZlxCVSMjG/zjYphQvET
 +YB7qA9/c3mbQIW2BcV1RCQna7EvdY2boJ5LjujNAayzKUyiedWUIPuvbD/0SwbuLXps
 xvKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MGTuyaL3Srri9dYaCvD4PHJ8XHymtwxMYrYDAsSLUN0=;
 b=0eesl7159uQuALVePRVPb2kZ2arOJj0xs8nuBq58q4IkURcDNn1cxCBjZxu2IskxHW
 7jyTvJeSdN2PQHNOfrqee4bHKYHP+cLjRbCMrrP2UUO8bOhRZ/02LCgbEtH3Y8s42ZDu
 oAXtZkGvj5kPDYLGQC7iulBFojj1PJkSquBywgrB3Ve+wTrNooMWrm06QKr7BtATalnT
 zSjUjPgmCC1gZi3LF/mD8u7y0+sg+3GrXVLefapO2Fiq7eVyLQV01Ov+XF0Z2XXE2wwc
 +ptVBfQwsadGHJTbFBtuZhMhPuBDLQEG4z98Yq9Yar9ULZIXuqBZoXO8NhNQpvBeYvoO
 Ogyw==
X-Gm-Message-State: AO0yUKVi54qIX5kFMM8rciO9QfLqi99dg5KXr3DsmXOXSrDk+H3ErGWS
 /zNGh3PFeUbqJsvsT2yDcKGLag==
X-Google-Smtp-Source: AK7set+pi5OmQWpOQ2u8fENYGGX7Fy8ucMKgmWMGdhZ08iO1gsneLy1mxjkYGBAgb42gWlc9hA3yRQ==
X-Received: by 2002:a05:600c:1d13:b0:3dc:5abb:2f50 with SMTP id
 l19-20020a05600c1d1300b003dc5abb2f50mr9374456wms.19.1675433507220; 
 Fri, 03 Feb 2023 06:11:47 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m4-20020a05600c4f4400b003dc36981727sm9009377wmq.14.2023.02.03.06.11.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 06:11:46 -0800 (PST)
Message-ID: <91463ac0-f2ea-d225-30da-90efed93ac28@linaro.org>
Date: Fri, 3 Feb 2023 15:11:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 6/9] hw/display/sm501: QOM-alias 'dma-offset' property in
 chipset object
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>
References: <20230203113650.78146-1-philmd@linaro.org>
 <20230203113650.78146-7-philmd@linaro.org>
 <136f25e8-686a-1529-b114-08dd54e6b819@eik.bme.hu>
 <075577d7-d5c4-393b-9d0d-2aab32abe957@linaro.org>
 <27fc6a3d-78b4-91f7-6f05-8c0cbd1ef125@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <27fc6a3d-78b4-91f7-6f05-8c0cbd1ef125@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/2/23 14:50, BALATON Zoltan wrote:
> On Fri, 3 Feb 2023, Philippe Mathieu-Daudé wrote:
>> On 3/2/23 14:05, BALATON Zoltan wrote:
>>> On Fri, 3 Feb 2023, Philippe Mathieu-Daudé wrote:
>>>> No need to use an intermediate 'dma-offset' property in the
>>>> chipset object. Alias the property, so when the machine (here
>>>> r2d-plus) sets the value on the chipset, it is propagated to
>>>> the OHCI object.
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>> ---
>>>> hw/display/sm501.c | 22 +++++++++++-----------
>>>> hw/sh4/r2d.c       |  2 +-
>>>> 2 files changed, 12 insertions(+), 12 deletions(-)
>>>
>>> It does not seem to be any simpler by the number of lines but maybe a 
>>> bit cleaner.
>>
>> Well it also moves to the "Embed QOM objects" pattern which Peter 
>> prefers.
>> Note this device doesn't implement unrealize().
> 
> True. Maybe worth mentioning in the commit message to make this more 
> explicit. I saw it in the patch but did not think about that.
> 
>>> I wonder if it would worth renaming the property to dma-offset to 
>>> match that of ohci so it's less confusing what it refers to. It's 
>>> only used by r2d and this patch already changing that so would be an 
>>> easy change.
>>
>> We can't because TYPE_PCI_SM501 is user-creatable, so we need to
>> go thru the whole deprecation process and we don't have any API to
>> deprecate QOM properties yet.
> 
> But the sm501 PCI device only creates the display part hence it has no 
> base option only vram-size (see sm501_pci_properties) so only the sysbus 
> version has this property. Is this still a problem in that case?

Oh you are right, I misread the PCI/sysbus functions. Lucky me, thanks!

