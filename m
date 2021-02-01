Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 770BC30A442
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 10:20:59 +0100 (CET)
Received: from localhost ([::1]:33602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6VOE-00069o-Gw
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 04:20:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6VMB-0005Fu-Oe
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 04:18:51 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:33077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6VMA-00009N-2Z
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 04:18:51 -0500
Received: by mail-wm1-x32f.google.com with SMTP id a16so782455wmm.0
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 01:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zwJvXpxzD86IAB50OcEa1h9dCfmRan0v54n4k0R9nDk=;
 b=knZRjue7XA5Kbq0aQZ+f07ZV+LMkatnkgFgqf4pIl5o+gF6rmJWc+DIIkwVkmTFWT+
 8xYuw6VaixRCi3wiMJeBsiPqMY1pbZU85mLtKu3Rv+s36GTJ/X+saX5IHZj6KJdMkl7Z
 8tdsLEG3T+fvN6P/0dz0DIWpXyuA7SelLR3Mf2ocBxE05OT8ro4VD7Ekm2BvSrK0hhf7
 4RZR+OWZR+d9XwWxybSx0ipb0sn3a90f7BW5d5EkjXHw6DXnQbC3Fuv6QFoxp3Jc1d2R
 w/7CB3j3sWZX9hMvovVcnBxG6Hv/ZRCl0gRpUOUh1knPdNT9yO6oaXtTgsIsANhTwPEJ
 OMcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zwJvXpxzD86IAB50OcEa1h9dCfmRan0v54n4k0R9nDk=;
 b=FgjgoGDaEOx9VmaykVcA8QCaWcFG9233nqQjvzwK1tpEsSMjskj5a5eXiMBmrVlToM
 Rzhu3u8ewhPp4jOIaMEi774LQZDe/hzanTIoXWgSc6bP4uXMQiII0QY2w7ceRNXswz7k
 4vy4F+TQjxz7OqYAIyKHeHPBYHdDOhLUNFsuQhHTj+lD1iqXPc6wxoPcQQaAuS+2/Q58
 +Uk05F7HiT6LX4+bv/UBxvkhYN5Iv+5KQp2vpUatAymxHoL0okoVwa9gHzRhbudSVtDU
 fjPLduqUURtHwbAY2Oot3JVlsoESEshQY7ZRGdixOYXVvEr0lT0rJA0Pw8bZ+b/Aqa4z
 Q+JA==
X-Gm-Message-State: AOAM530kItJZ2clyZvKX6Lt7inmWaFsjMmVN3QIivQ+ASznJ3xLVV/y4
 lqJdgeULiwev2cE2WsW6J0U=
X-Google-Smtp-Source: ABdhPJwXmLsSklCtG+dQ9zYlkzFgHSP0m68NDId7xXtpz/vVqTTQ8m6tLaZPeP9G1mutPM0o8rwOwA==
X-Received: by 2002:a1c:8181:: with SMTP id c123mr14636704wmd.23.1612171128109; 
 Mon, 01 Feb 2021 01:18:48 -0800 (PST)
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id l1sm25560510wrp.40.2021.02.01.01.18.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Feb 2021 01:18:47 -0800 (PST)
Subject: Re: [PATCH v2 4/4] hw/xen: Have Xen machines select 9pfs
To: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>
References: <20210131141810.293186-1-f4bug@amsat.org>
 <20210131141810.293186-5-f4bug@amsat.org>
 <565bf0dd-a5de-352e-eec7-68b862ed09e4@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f6e1917a-f9cf-9ae3-50b1-9dc0ee4f65f3@amsat.org>
Date: Mon, 1 Feb 2021 10:18:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <565bf0dd-a5de-352e-eec7-68b862ed09e4@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.079,
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paul Durrant <paul@xen.org>, Richard Henderson <richard.henderson@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/1/21 9:34 AM, Paolo Bonzini wrote:
> On 31/01/21 15:18, Philippe Mathieu-Daudé wrote:
>> 9pfs is not an accelerator feature but a machine one,
>> move the selection on the machine Kconfig (in hw/).
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   accel/Kconfig       | 1 -
>>   hw/i386/xen/Kconfig | 1 +
>>   hw/xen/Kconfig      | 1 +
>>   3 files changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/accel/Kconfig b/accel/Kconfig
>> index 461104c7715..b9e9a2d35b0 100644
>> --- a/accel/Kconfig
>> +++ b/accel/Kconfig
>> @@ -15,4 +15,3 @@ config KVM
>>     config XEN
>>       bool
>> -    select FSDEV_9P if VIRTFS
>> diff --git a/hw/i386/xen/Kconfig b/hw/i386/xen/Kconfig
>> index ad9d774b9ea..4affd842f28 100644
>> --- a/hw/i386/xen/Kconfig
>> +++ b/hw/i386/xen/Kconfig
>> @@ -3,3 +3,4 @@ config XEN_FV
>>       default y if XEN
>>       depends on XEN
>>       select I440FX
>> +    select FSDEV_9P if VIRTFS
>> diff --git a/hw/xen/Kconfig b/hw/xen/Kconfig
>> index 0b8427d6bd1..825277969fa 100644
>> --- a/hw/xen/Kconfig
>> +++ b/hw/xen/Kconfig
>> @@ -5,3 +5,4 @@ config XEN_PV
>>       select PCI
>>       select USB
>>       select IDE_PIIX
>> +    select FSDEV_9P if VIRTFS
>>
> 
> I think you can compile without FSDEV_9P selected?  If so, this should
> be "imply".
> 
> If on the other hand you cannot, and that is because of some other file
> brought in by CONFIG_XEN, this patch shouldn't be there.

FYI using 'imply FSDEV_9P' instead I get:

/usr/bin/ld: libcommon.fa.p/hw_xen_xen-legacy-backend.c.o: in function
`xen_be_register_common':
hw/xen/xen-legacy-backend.c:754: undefined reference to `xen_9pfs_ops'

The function is:

  void xen_be_register_common(void)
  {
      xen_set_dynamic_sysbus();

      xen_be_register("console", &xen_console_ops);
      xen_be_register("vkbd", &xen_kbdmouse_ops);
  #ifdef CONFIG_VIRTFS
      xen_be_register("9pfs", &xen_9pfs_ops);
  #endif
  #ifdef CONFIG_USB_LIBUSB
      xen_be_register("qusb", &xen_usb_ops);
  #endif
  }

The object is compiled using:

-- >8 --
-#ifdef CONFIG_VIRTFS
+#ifdef CONFIG_FSDEV_9P
     xen_be_register("9pfs", &xen_9pfs_ops);
 #endif
---

Respin planned.

Thanks,

Phil.

