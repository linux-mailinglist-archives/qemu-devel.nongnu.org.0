Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8816A48F785
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Jan 2022 16:32:48 +0100 (CET)
Received: from localhost ([::1]:50264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8l2t-0006YE-6a
	for lists+qemu-devel@lfdr.de; Sat, 15 Jan 2022 10:32:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangruien@bytedance.com>)
 id 1n8l1r-0005kC-8S
 for qemu-devel@nongnu.org; Sat, 15 Jan 2022 10:31:43 -0500
Received: from [2607:f8b0:4864:20::62f] (port=34391
 helo=mail-pl1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhangruien@bytedance.com>)
 id 1n8l1m-0001o8-Iv
 for qemu-devel@nongnu.org; Sat, 15 Jan 2022 10:31:40 -0500
Received: by mail-pl1-x62f.google.com with SMTP id a7so12984210plh.1
 for <qemu-devel@nongnu.org>; Sat, 15 Jan 2022 07:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=HMSeQ/InymHks3yPWBAUr58wXJX0tqs4ibqDMkvhXAM=;
 b=45f32UBCq6t+Mj06OMliyzIF8gq/iu3LTKMRlzWk2I7XYQJUpqMrxjlJJw26XFD0nG
 c8JsiLs93Z7RL1ABmGxKSEl1mi6qdSpQJOFqmHxqI3MJM7EDM9DV9SPMquRzI3M8ktl5
 VI4Ng84vRtmWZ5obKwam2gsyCBPo24QHixVGgdtfq02qLWDxU4TyjHwHNdj73NqNqtQQ
 +zKJ6It7KQhoL7aukGK8JegnYbh/Q7U9I6BYgX7KEP95mPHExHV2rkXl5+EAHUwoEQGc
 MpmHXgcfyRMBAo1kwsLKQ4pShgKM7LJF4SH0Xfss0S97WqpvStrzoAVMAyxLoccUnTEb
 Rp5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HMSeQ/InymHks3yPWBAUr58wXJX0tqs4ibqDMkvhXAM=;
 b=E+MofS0KNEIjqn11H7+T11dMNvF4d2Vlf934mtCmOSEJFlM7Et6xfazp7Lo2RHQ6Pd
 UslAnsywJTQ+7cHSSNUpBWw1SNPmjA5gP3quZssh17EYS1QN9sONeyRYbnC7FMzpiYvB
 SD7OZ//7H4ht1objFCbWlnbJMYPvhz7cCkNiKjFdMOp2J9wTKZND0EpGZKRntkhOsx0j
 PQCMeEsp5hdf2XPjAc3s4xB7rSxoVGys21N7GErogbv9kZN/sQLqqXDavHJCmsbxNSCK
 dARvTNFv3bUqnvTeGqs64KW7HI/+WHuBxJEsvASOwGzPeoN3av6dIKfufbB7oED1cyt9
 h67w==
X-Gm-Message-State: AOAM531ccRmimYZoErLnYGaIukFcwFSLoi1jjDe/FW4GTjrkJTh2aHkn
 jWJboGvIznzo9PsJlWh2GMaQQQ==
X-Google-Smtp-Source: ABdhPJxW9tY5WHrnxso2UNq1hM9ecH/vaW474ptf8+zlrQmEKhf19WOjCmoneBe4fsHRtIJrqHkFiw==
X-Received: by 2002:a17:903:187:b0:14a:6ee7:682c with SMTP id
 z7-20020a170903018700b0014a6ee7682cmr14342575plg.105.1642260695753; 
 Sat, 15 Jan 2022 07:31:35 -0800 (PST)
Received: from [10.254.142.240] ([139.177.225.253])
 by smtp.gmail.com with ESMTPSA id p50sm8376370pfw.51.2022.01.15.07.31.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 Jan 2022 07:31:35 -0800 (PST)
Message-ID: <f336f49a-4053-537f-0601-9cb3d0d59cfc@bytedance.com>
Date: Sat, 15 Jan 2022 23:31:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH 0/2] Introduce printer subsystem and USB printer device
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20220113115659.72788-1-zhangruien@bytedance.com>
 <20220114093216.aqrh6h3ukzavtasq@sirius.home.kraxel.org>
From: Ruien Zhang <zhangruien@bytedance.com>
In-Reply-To: <20220114093216.aqrh6h3ukzavtasq@sirius.home.kraxel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=zhangruien@bytedance.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, berrange@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/14/22 5:32 PM, Gerd Hoffmann wrote:
>    Hi,
> 
>> This patchset introduces:
>>
>> 1) Skeleton of QEMU printer subsystem with a dummy builtin driver.
>>
>> 2) USB printer device emulation, with definitions in the extension of IPP-over-
>>     USB [3].
>>
>> WIP:
>>
>> 1) QEMU printer subsystem interfaces, which will be finalized with a concrete
>>     backend driver.
>>
>> 2) IPP-over-USB implementation.
> 
> Hmm, I'm wondering what uses cases you have in mind and whenever
> it makes sense to introduce a printer subsystem?

I'm having an idea about the use case, let's discuss a bit more about it 
here.

If I want to expose some Virtual Device Interfaces (VDI) on USB-IPP 
printer device to remote desktop service like spice-server, is it 
rational to register these interfaces to the printer subsystem which 
will play as a middle layer? A concrete example is QXL virtual GPU with 
VDI between QEMU and spice-server. What if other QEMU-emulated devices 
also want to take part in the spice service routine? This can be 
achieved naturally by the registered handlers in the subsystems, which 
further exchange data with the underlying devices (USB-IPP printer here, 
for example). Nevertheless, I totally agree that it is straightforward 
to make devices like USB-IPP printer to be passed-through in local 
environments, which prompts me to add the uri-option. But I want it to 
be compatible with other use cases, like this one.

I'll give this idea a try.

> 
> Having an ipp-over-usb device looks useful, but the only use case I can
> see is to allow guests access a network printer.  I can't see the
> benefits of a printer subsystem, especially in a world where non-ipp
> printers are going extinct.  We would most likely have just a single
> kind of printer backend, where the only job qemu will have is to
> forwarding requests and replies, maybe with some http header rewriting.
> 
> Likewise usb would be the one and only device (parallel ports are long
> gone in printers).  So the indirection added by a printer subsystem
> doesn't buy us anything because we just don't need that flexibility.
> I'd suggest to pass the url directly to the device instead:
> 
> qemu -device usb-ipp-printer,url=ipp://hostname/ipp/printer
> 
> take care,
>    Gerd
> 
Regards,
Ruien


