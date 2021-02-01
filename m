Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B7530A622
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 12:06:49 +0100 (CET)
Received: from localhost ([::1]:45006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6X2e-0006Qi-4j
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 06:06:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6Wzs-0004sW-JS
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 06:03:56 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:45705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6Wzq-0005Eq-Ve
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 06:03:56 -0500
Received: by mail-wr1-x430.google.com with SMTP id m13so16089427wro.12
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 03:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QXz33jfF5o0HFplOhpdqHclk9wrcsV6HW630elwNatQ=;
 b=uHaXw4TeOEO12kl+fnN0tUpC/LRsruyO4yk0HDjYL4Yv9dETsyq6wxTzk0WgoGZNj1
 CtiTU3CxtCl5kqqOpCGgCP91x76CwFj1xYR2CgeaTSgpMI4GCcaisRg3eQHEH5jRTc8J
 PrqVpIOzZWusI1BWVlvpAZ2t2OSlb632AsiI/rZM/XjY0N1XrACtobf8HH9iB/kf49Uf
 L8MCkTGa2waSCkbgEYybsg91FFiSdouJFNXmZ1ZgIu4JQRBNRTpaYmav5I6QczuPJzyQ
 txdg9t1drhSVcGzHsd5uy92C+zWleQvFXI/rCca5Oid+8jLWA2yOlWp2fJzTB2k/t9q5
 CpUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QXz33jfF5o0HFplOhpdqHclk9wrcsV6HW630elwNatQ=;
 b=Y6OlpRq3RDbxBDyIQ3bbrDur1oDE901fpY2bO8tA5EBwYecjcdilzMBr52TPCRzrYa
 UJCXfrNmxbomyuqWUVp9W9hp5OMmCSUr5IjYTe4R4eOI4swq+t0sxQZIsrvPMjMufF3e
 0J4tChXiIx1et8Fs7YlvQSwP4aV8gkZoAq8vNxhovBQJmKENzjKUsiJ33OiB6BZwOwFq
 lvl8vkzP5tUghV4kAiVhpQk22g6FMOwJgH85OaftXDLApwcdONO/VUolboLKuF0Onw/P
 jxU981m9P+1+S4oEjMLACzTtPDuIfuQrZ+YZHron+VK+Imp22EU8plXCw7HAI2X5+m/b
 GH6g==
X-Gm-Message-State: AOAM531hZ4+ZJw2jMUOZRhF5WLgAoS+qJYogzoLUpZ+rQZreZLViPlN1
 bADzBRfpA8Yc1GGSoDCmkdk=
X-Google-Smtp-Source: ABdhPJzITrIsCsiDN2VerxM6locxuBFFl/nz7JvgM8MlpL6o8XoP6uVy6xOEqzLJkVu4SwmLgPLOEA==
X-Received: by 2002:adf:80c8:: with SMTP id 66mr2705174wrl.344.1612177433516; 
 Mon, 01 Feb 2021 03:03:53 -0800 (PST)
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id y24sm20162170wmi.47.2021.02.01.03.03.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Feb 2021 03:03:52 -0800 (PST)
Subject: Re: [PATCH v2 4/4] hw/xen: Have Xen machines select 9pfs
To: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>
References: <20210131141810.293186-1-f4bug@amsat.org>
 <20210131141810.293186-5-f4bug@amsat.org>
 <565bf0dd-a5de-352e-eec7-68b862ed09e4@redhat.com>
 <f6e1917a-f9cf-9ae3-50b1-9dc0ee4f65f3@amsat.org>
 <50306fbf-c6f0-e281-248f-de1bc984b113@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <83a785a5-6050-a24b-c796-d427c3873a07@amsat.org>
Date: Mon, 1 Feb 2021 12:03:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <50306fbf-c6f0-e281-248f-de1bc984b113@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
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
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/1/21 11:23 AM, Paolo Bonzini wrote:
> On 01/02/21 10:18, Philippe Mathieu-Daudé wrote:
>> FYI using 'imply FSDEV_9P' instead I get:
>>
>> /usr/bin/ld: libcommon.fa.p/hw_xen_xen-legacy-backend.c.o: in function
>> `xen_be_register_common':
>> hw/xen/xen-legacy-backend.c:754: undefined reference to `xen_9pfs_ops'
> 
> Ok, so then we have the case of a file (hw/xen/xen-legacy-backend.c)
> brought in by CONFIG_XEN.  In that case this patch is incorrect...
> 
>> The function is:
>>
>>    void xen_be_register_common(void)
>>    {
>>        xen_set_dynamic_sysbus();
>>
>>        xen_be_register("console", &xen_console_ops);
>>        xen_be_register("vkbd", &xen_kbdmouse_ops);
>>    #ifdef CONFIG_VIRTFS
>>        xen_be_register("9pfs", &xen_9pfs_ops);
>>    #endif
>>    #ifdef CONFIG_USB_LIBUSB
>>        xen_be_register("qusb", &xen_usb_ops);
>>    #endif
>>    }
>>
>> The object is compiled using:
>>
>> -- >8 --
>> -#ifdef CONFIG_VIRTFS
>> +#ifdef CONFIG_FSDEV_9P
>>       xen_be_register("9pfs", &xen_9pfs_ops);
>>   #endif
>> ---
> 
> ... and this is the best fix, together with:
> 
> - a "#include CONFIG_DEVICES" at the top (to get CONFIG_FSDEV_9P)
> 
> - moving xen-legacy-backend.c from softmmu_ss to specific_ss (to get
> CONFIG_DEVICES)
> 
> - changing "select" to "imply" in accel/Kconfig (otherwise the patch has
> no effect)

OK.

> 
> But really, doing nothing and just dropping this patch is perfectly fine.

Yes, I'll respin what I have so far and continue when I find the
time and motivation another week-end.

