Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 306962BA7DE
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 12:03:04 +0100 (CET)
Received: from localhost ([::1]:40774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg4By-0005SF-Vl
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 06:03:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kg4AC-0004vm-Sg
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 06:01:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kg4A6-0006A7-2K
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 06:01:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605870064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K21qJgYoC4iMlo5sApdZ0Yo9vAZnKwGsHo0cWn6WP9U=;
 b=Keku7O7XKggVIOd1Lg+iaiXFh7wo1HquLFdLeO7fGCmC28Z5wz3v65PSkarn4J+PXTSgRl
 IfSR1i4wBiX9m3154cnZ6O4WlcTBaiSe3l6OtFSdJ3JaQfVgSqXijlt171mjFw+ncRup29
 yDuFDjtLW3jheZGU62qTht5X7n5rKN4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-Ai3vAzUaPDaOk1CiMiCd0A-1; Fri, 20 Nov 2020 06:01:00 -0500
X-MC-Unique: Ai3vAzUaPDaOk1CiMiCd0A-1
Received: by mail-wm1-f70.google.com with SMTP id a130so5143417wmf.0
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 03:01:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=K21qJgYoC4iMlo5sApdZ0Yo9vAZnKwGsHo0cWn6WP9U=;
 b=sGJCWZrQwZVjS/vaMYbOxrGOMmm8lx5yMFmfhSLrfKwnkYNsV9jXlB3XghnsCmgFHj
 emg57jiQRCxvS2JAOjv3Xi0p78VF6vpe4UwcsbaJofsiQ/a+0vpxSDuNNoAhYG0rShsE
 hBRdlyMZbw4gIVKoVAX5QyQ8zUF1fgPbbW6EKn5gPXvC/9AseVWT1eNu1pPZ2kTRT1Cn
 Z7ixbDfIXWOERCj5i9lPlbts8sFpRW12WaVQPC6EbR9fOyskoK5q1n1/Sgm/eSddFy/4
 RNgofBGcrfaD7pKMTHxzBS24Oo31O5nDw/mWW7MQVz4c7iQtLOT+asonRFKJ2aVeWbCs
 l6gA==
X-Gm-Message-State: AOAM533Wis/2+CZb84/8F4AEUodTPL6Ekk8XRDUcNBL689nB8jH5NUeV
 M7QNiLDSQbS7hZ+nD7X3q+jVXYFHG6v7Wo+3vZSw00xKuurcKaIzp+bL4Usaf1hKdN7bSSSd8Ej
 NiEmoMBQXNuuWoew=
X-Received: by 2002:a5d:66c3:: with SMTP id k3mr15008656wrw.123.1605870059253; 
 Fri, 20 Nov 2020 03:00:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwYW1Kmnl70HzUxgv3G8rYrfEMubsQFsUt9vEHiyhMU9BlX8IuACxEcy6tgeuB9CjsQkNSMaQ==
X-Received: by 2002:a5d:66c3:: with SMTP id k3mr15008621wrw.123.1605870059024; 
 Fri, 20 Nov 2020 03:00:59 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id i6sm3969054wma.42.2020.11.20.03.00.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2020 03:00:58 -0800 (PST)
Subject: Re: [PATCH-for-5.2 v2] hw/core/qdev-properties-system: Rewrite
 set_pci_host_devaddr using GLib
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Igor Mammedov <imammedo@redhat.com>
References: <20201013102252.3562860-1-philmd@redhat.com>
 <60f5af9c-4153-7702-cd99-b317a6de89c0@redhat.com>
 <ccf65075-c0e9-7358-f483-2c7fbbd3fb81@redhat.com>
 <fa5ed32a-1553-2490-b266-375a000f0cef@redhat.com>
Message-ID: <7a130a3e-3ebf-220f-9115-dd121d8782fb@redhat.com>
Date: Fri, 20 Nov 2020 12:00:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <fa5ed32a-1553-2490-b266-375a000f0cef@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Geoffrey McRae <geoff@hostfission.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Klaus Herman <kherman@inbox.lv>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/17/20 12:16 PM, Philippe Mathieu-Daudé wrote:
> ping???
> 
> On 11/9/20 3:16 PM, Philippe Mathieu-Daudé wrote:
>> Cc'ing PCI developers (rc2 is scheduled for tomorrow).
>>
>> On 11/7/20 9:59 AM, Philippe Mathieu-Daudé wrote:
>>> Ping for 5.2 as this is a bugfix.
>>>
>>> On 10/13/20 12:22 PM, Philippe Mathieu-Daudé wrote:
>>>> set_pci_host_devaddr() is hard to follow, thus bug-prone.
>>>> We indeed introduced a bug in commit bccb20c49df, as the
>>>> same line might be used to parse a bus (up to 0xff) or a
>>>> slot (up to 0x1f). Instead of making things worst, rewrite
>>>> using g_strsplit().

As there is few interest in fixing the issue with this patch,
let me remind the 2 other approaches:

Klaus Herman:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg750101.html
Geoffrey McRae:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg758182.html

That said, I'm done with this issue for 5.2.

Regards,

Phil.

>>>> Fixes: bccb20c49df ("Use qemu_strtoul() in set_pci_host_devaddr()")
>>>> Reported-by: Klaus Herman <kherman@inbox.lv>
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>> ---
>>>> v2: Free g_strsplit() with g_auto(GStrv) (Daniel)
>>>> ---
>>>>  hw/core/qdev-properties-system.c | 61 ++++++++++++++------------------
>>>>  1 file changed, 27 insertions(+), 34 deletions(-)
>>>>
>>>> diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
>>>> index 49bdd125814..36d4fd8b22a 100644
>>>> --- a/hw/core/qdev-properties-system.c
>>>> +++ b/hw/core/qdev-properties-system.c
>>>> @@ -878,11 +878,11 @@ static void set_pci_host_devaddr(Object *obj, Visitor *v, const char *name,
>>>>      DeviceState *dev = DEVICE(obj);
>>>>      Property *prop = opaque;
>>>>      PCIHostDeviceAddress *addr = qdev_get_prop_ptr(dev, prop);
>>>> -    char *str, *p;
>>>> -    const char *e;
>>>> +    g_autofree char *str = NULL;
>>>> +    g_auto(GStrv) col_s0 = NULL;
>>>> +    g_auto(GStrv) dot_s = NULL;
>>>> +    char **col_s;
>>>>      unsigned long val;
>>>> -    unsigned long dom = 0, bus = 0;
>>>> -    unsigned int slot = 0, func = 0;
>>>>  
>>>>      if (dev->realized) {
>>>>          qdev_prop_set_after_realize(dev, name, errp);
>>>> @@ -893,57 +893,50 @@ static void set_pci_host_devaddr(Object *obj, Visitor *v, const char *name,
>>>>          return;
>>>>      }
>>>>  
>>>> -    p = str;
>>>> -    if (qemu_strtoul(p, &e, 16, &val) < 0 || val > 0xffff || e == p) {
>>>> +    col_s = col_s0 = g_strsplit(str, ":", 3);
>>>> +    if (!col_s || !col_s[0] || !col_s[1]) {
>>>>          goto inval;
>>>>      }
>>>> -    if (*e != ':') {
>>>> -        goto inval;
>>>> -    }
>>>> -    bus = val;
>>>>  
>>>> -    p = (char *)e + 1;
>>>> -    if (qemu_strtoul(p, &e, 16, &val) < 0 || val > 0x1f || e == p) {
>>>> -        goto inval;
>>>> -    }
>>>> -    if (*e == ':') {
>>>> -        dom = bus;
>>>> -        bus = val;
>>>> -        p = (char *)e + 1;
>>>> -        if (qemu_strtoul(p, &e, 16, &val) < 0 || val > 0x1f || e == p) {
>>>> +    /* domain */
>>>> +    if (col_s[2]) {
>>>> +        if (qemu_strtoul(col_s[0], NULL, 16, &val) < 0 || val > 0xffff) {
>>>>              goto inval;
>>>>          }
>>>> +        addr->domain = val;
>>>> +        col_s++;
>>>> +    } else {
>>>> +        addr->domain = 0;
>>>>      }
>>>> -    slot = val;
>>>>  
>>>> -    if (*e != '.') {
>>>> +    /* bus */
>>>> +    if (qemu_strtoul(col_s[0], NULL, 16, &val) < 0 || val > 0xff) {
>>>>          goto inval;
>>>>      }
>>>> -    p = (char *)e + 1;
>>>> -    if (qemu_strtoul(p, &e, 10, &val) < 0 || val > 7 || e == p) {
>>>> -        goto inval;
>>>> -    }
>>>> -    func = val;
>>>> +    addr->bus = val;
>>>>  
>>>> -    if (bus > 0xff) {
>>>> +    /* <slot>.<func> */
>>>> +    dot_s = g_strsplit(col_s[1], ".", 2);
>>>> +    if (!dot_s || !dot_s[0] || !dot_s[1]) {
>>>>          goto inval;
>>>>      }
>>>>  
>>>> -    if (*e) {
>>>> +    /* slot */
>>>> +    if (qemu_strtoul(dot_s[0], NULL, 16, &val) < 0 || val > 0x1f) {
>>>>          goto inval;
>>>>      }
>>>> +    addr->slot = val;
>>>>  
>>>> -    addr->domain = dom;
>>>> -    addr->bus = bus;
>>>> -    addr->slot = slot;
>>>> -    addr->function = func;
>>>> +    /* func */
>>>> +    if (qemu_strtoul(dot_s[1], NULL, 10, &val) < 0 || val > 7) {
>>>> +        goto inval;
>>>> +    }
>>>> +    addr->function = val;
>>>>  
>>>> -    g_free(str);
>>>>      return;
>>>>  
>>>>  inval:
>>>>      error_set_from_qdev_prop_error(errp, EINVAL, dev, prop, str);
>>>> -    g_free(str);
>>>>  }
>>>>  
>>>>  const PropertyInfo qdev_prop_pci_host_devaddr = {
>>>>
>>>
>>
> 


