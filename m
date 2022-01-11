Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F9748ADA6
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 13:34:05 +0100 (CET)
Received: from localhost ([::1]:46882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7GLk-0006yP-2J
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 07:34:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1n7GIB-0005cw-PY
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 07:30:24 -0500
Received: from [2607:f8b0:4864:20::1030] (port=56244
 helo=mail-pj1-x1030.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1n7GI7-0008CS-Gl
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 07:30:21 -0500
Received: by mail-pj1-x1030.google.com with SMTP id hv15so10958205pjb.5
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 04:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nrdILassnP9aovhBmXPwczsLBUgRiQYigx43SXjsSeM=;
 b=RaJRT1iRvC5sUNCdUtMBPKruMDVc5Ua8tZN7qucL+OMkU4V1jVGtebIPK8lBhfOwNu
 WUoilGPpjaZYB4cT/CrXAOHeqBeTH3rBTLr7Lf9SkUGt36/7I8DkS6BPqo8RrxDFHvdQ
 /RZITDU3Ajw/yJ1YzXmRdgZguZCRsis0nFw/rzYXu1o565mlIsEBUk+XCIL5hPKHTMzW
 BwOXMiiKb/8KbPTHiezUURaOGEJvBZBxAZyT3VwNyM1iSeDbh9JAKvuWNNMNqKVMf2zj
 J8yinn5cW8lK5DiBSaayqnwBquau2hVW7LL6ALo+pkkrbnK1ty0FWaUcPQaf5ejFvU/u
 mU5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nrdILassnP9aovhBmXPwczsLBUgRiQYigx43SXjsSeM=;
 b=o51OLHKc28bTJIovIPqavpn7gnr0gC8OKrd4fqNkqOV2TEbzccjfUsUtBG74pr5AjD
 jsdJ2vc0X9WO8Q0dYTZUjxP8+nchCx4TNUgICknrKo3SzkFcuvu8+u9Z8rFxDqde3OcC
 UtZ4j57aJPUb1GfaM+rYA+rmVlRYcJqlC6JLtBE5Tbt0OVLsT0kndWiiN38C+bcgDWB7
 u/RC2ID+eprBCTGtF1/zy8iAE8L8jOdmFX2dWpVslI/QN3cL7B36nsBI4LR2jD3qyvBz
 miRiLVTiKHMOnlpLAGoyDK+yCUb7Yp73zPgDqa+99VEU4c/VbdXOf8tGu5iv3FCl0YV+
 8FrQ==
X-Gm-Message-State: AOAM531y3+evenp/Oc3wAlWDsjoaY+8cpdQBMJInewXFPofbyVAItpEs
 KAUnOvBLnjYKc2nkEY2lvzylUw==
X-Google-Smtp-Source: ABdhPJylLh69sWzWfD25Y8JKFkC6VhLWDZwKfgsGGfgHv3uBUUlLWvQmavTQcaYVPddFPoyD6mIu3Q==
X-Received: by 2002:a17:90b:4f4a:: with SMTP id
 pj10mr2877670pjb.112.1641904216213; 
 Tue, 11 Jan 2022 04:30:16 -0800 (PST)
Received: from [10.76.15.169] ([153.254.110.109])
 by smtp.gmail.com with ESMTPSA id kb1sm2508589pjb.56.2022.01.11.04.30.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jan 2022 04:30:15 -0800 (PST)
Subject: Re: Re: [PATCH] usb: allow max 8192 bytes for desc
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20220111104918.896841-1-pizhenwei@bytedance.com>
 <CAFEAcA9d4X+pobnz2vA_hTwDBuGRBTjjnD_CgKmsKuCAjH-ZNQ@mail.gmail.com>
 <Yd13NAsHpuRCMJRy@redhat.com>
From: zhenwei pi <pizhenwei@bytedance.com>
Message-ID: <b093dca4-f961-9f5b-32ba-0d4a55e71dba@bytedance.com>
Date: Tue, 11 Jan 2022 20:27:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <Yd13NAsHpuRCMJRy@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1030
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: f4bug@amsat.org, qemu-devel@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/11/22 8:25 PM, Daniel P. Berrangé wrote:
> On Tue, Jan 11, 2022 at 12:21:42PM +0000, Peter Maydell wrote:
>> On Tue, 11 Jan 2022 at 10:54, zhenwei pi <pizhenwei@bytedance.com> wrote:
>>>
>>> A device of USB video class usually uses larger desc structure, so
>>> use larger buffer to avoid failure. (dev-video.c is ready)
>>>
>>> Allocating memory dynamically by g_malloc of the orignal version of
>>> this change, Philippe suggested just using the stack. Test the two
>>> versions of qemu binary, the size of stack gets no change.
>>>
>>> CC: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
>>> ---
>>>   hw/usb/desc.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/hw/usb/desc.c b/hw/usb/desc.c
>>> index 8b6eaea407..57d2aedba1 100644
>>> --- a/hw/usb/desc.c
>>> +++ b/hw/usb/desc.c
>>> @@ -632,7 +632,7 @@ int usb_desc_get_descriptor(USBDevice *dev, USBPacket *p,
>>>       bool msos = (dev->flags & (1 << USB_DEV_FLAG_MSOS_DESC_IN_USE));
>>>       const USBDesc *desc = usb_device_get_usb_desc(dev);
>>>       const USBDescDevice *other_dev;
>>> -    uint8_t buf[256];
>>> +    uint8_t buf[8192];
>>>       uint8_t type = value >> 8;
>>>       uint8_t index = value & 0xff;
>>>       int flags, ret = -1;
>>
>> I think 8K is too large to be allocating as an array on
>> the stack, so if we need this buffer to be larger we should
>> switch to some other allocation strategy for it.
> 
> IIUC, querying USB device descriptors is not a hot path, so using
> heap allocation feels sufficient.
> 
Yes, I tested this a lot, and found that it's an unlikely code path:
1, during guest startup, guest tries to probe device.
2, run 'lsusb' command in guest(or other similar commands).

The original patch and context link:
https://patchwork.kernel.org/project/qemu-devel/patch/20211227142734.691900-5-pizhenwei@bytedance.com/
> 
> Regards,
> Daniel
> 

-- 
zhenwei pi

