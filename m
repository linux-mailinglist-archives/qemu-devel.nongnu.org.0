Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5882B5E1C
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 12:18:02 +0100 (CET)
Received: from localhost ([::1]:38720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keyzp-0002Dw-Pl
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 06:18:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1keyyX-0001j3-Iz
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 06:16:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1keyyV-0005p9-Oh
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 06:16:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605611798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3cfGsKt9HD4Xi3BcN9IItcpglxjDLhHHCagA5AacvXo=;
 b=Ov/mLW5tScpx/aPiCgKaGIP23TT46ZFVpxtPJiBGS1xTsNp8GxIq2/+2NFAbLZQPve1BN8
 wBGKzbVH7BBVxuzFRTXmLZxMDSMnUTHal7o/ZU33JBRXVzQrlzd2WTQfNXS/DbV1lYKAuP
 477yZSnZH2ePpZl485WGsLo8a4cacj0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-09bKxGDQMs--qMbdXdaAag-1; Tue, 17 Nov 2020 06:16:36 -0500
X-MC-Unique: 09bKxGDQMs--qMbdXdaAag-1
Received: by mail-wr1-f69.google.com with SMTP id x16so8156363wrn.9
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 03:16:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3cfGsKt9HD4Xi3BcN9IItcpglxjDLhHHCagA5AacvXo=;
 b=JsE0h9FjS4NTHiok1Qd0QGpHwQzIIRiQQIWejv+f11HUKwZuwpjHfMwk47PxxJMuZE
 DGeXQBBpBEQgIQ9i1HPB7pnWaT7t3rxQLpgZqe6V3g/dfqytvPKryYnXh8OWZRYBxtLC
 DWUY4MEYkyvmz6+2O+J2Zc7wh17hNbHlTkfzp5blkaCDq2sKqPUebF/zYVt0O/TqWsNq
 b/rF9bT/9VbPY+jYH+KPqlVNnMTeqrXwkaTfmddTdRM4/04OcUrTMcmgUm9Z6dAvl9QD
 4wNcQ/+plyPGsIMo0Y2Rhc1DQVGjSTQYH4eaSGhr5mRkDmODnrlg6w7Pg42sxF2ZdVJA
 0UFw==
X-Gm-Message-State: AOAM530Y6yfqeaNp2f+j9q7y3Hnh4A1Jd4xZzHWWbQGxg8+jwLptdD7/
 10XodnrutuwJK6NaGiQ1gL735xzmTj3TkFcmiQRfkmb+yAN+B5MfZ8GewU48kczwhc2IDF9IrRu
 sKTUk0YK9q6cHHJE=
X-Received: by 2002:a5d:6406:: with SMTP id z6mr24959922wru.241.1605611795505; 
 Tue, 17 Nov 2020 03:16:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyhIU769XUf3/vhYNTugIWgm3/cbLczbZ+1V0bcw5HroIvP0r5vMf3Vx71+IhmQJzHzygEubA==
X-Received: by 2002:a5d:6406:: with SMTP id z6mr24959892wru.241.1605611795261; 
 Tue, 17 Nov 2020 03:16:35 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id p4sm27467008wrm.51.2020.11.17.03.16.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 03:16:34 -0800 (PST)
Subject: Re: [PATCH-for-5.2 v2] hw/core/qdev-properties-system: Rewrite
 set_pci_host_devaddr using GLib
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Igor Mammedov <imammedo@redhat.com>
References: <20201013102252.3562860-1-philmd@redhat.com>
 <60f5af9c-4153-7702-cd99-b317a6de89c0@redhat.com>
 <ccf65075-c0e9-7358-f483-2c7fbbd3fb81@redhat.com>
Message-ID: <fa5ed32a-1553-2490-b266-375a000f0cef@redhat.com>
Date: Tue, 17 Nov 2020 12:16:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <ccf65075-c0e9-7358-f483-2c7fbbd3fb81@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 01:18:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Klaus Herman <kherman@inbox.lv>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping???

On 11/9/20 3:16 PM, Philippe Mathieu-Daudé wrote:
> Cc'ing PCI developers (rc2 is scheduled for tomorrow).
> 
> On 11/7/20 9:59 AM, Philippe Mathieu-Daudé wrote:
>> Ping for 5.2 as this is a bugfix.
>>
>> On 10/13/20 12:22 PM, Philippe Mathieu-Daudé wrote:
>>> set_pci_host_devaddr() is hard to follow, thus bug-prone.
>>> We indeed introduced a bug in commit bccb20c49df, as the
>>> same line might be used to parse a bus (up to 0xff) or a
>>> slot (up to 0x1f). Instead of making things worst, rewrite
>>> using g_strsplit().
>>>
>>> Fixes: bccb20c49df ("Use qemu_strtoul() in set_pci_host_devaddr()")
>>> Reported-by: Klaus Herman <kherman@inbox.lv>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> ---
>>> v2: Free g_strsplit() with g_auto(GStrv) (Daniel)
>>> ---
>>>  hw/core/qdev-properties-system.c | 61 ++++++++++++++------------------
>>>  1 file changed, 27 insertions(+), 34 deletions(-)
>>>
>>> diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
>>> index 49bdd125814..36d4fd8b22a 100644
>>> --- a/hw/core/qdev-properties-system.c
>>> +++ b/hw/core/qdev-properties-system.c
>>> @@ -878,11 +878,11 @@ static void set_pci_host_devaddr(Object *obj, Visitor *v, const char *name,
>>>      DeviceState *dev = DEVICE(obj);
>>>      Property *prop = opaque;
>>>      PCIHostDeviceAddress *addr = qdev_get_prop_ptr(dev, prop);
>>> -    char *str, *p;
>>> -    const char *e;
>>> +    g_autofree char *str = NULL;
>>> +    g_auto(GStrv) col_s0 = NULL;
>>> +    g_auto(GStrv) dot_s = NULL;
>>> +    char **col_s;
>>>      unsigned long val;
>>> -    unsigned long dom = 0, bus = 0;
>>> -    unsigned int slot = 0, func = 0;
>>>  
>>>      if (dev->realized) {
>>>          qdev_prop_set_after_realize(dev, name, errp);
>>> @@ -893,57 +893,50 @@ static void set_pci_host_devaddr(Object *obj, Visitor *v, const char *name,
>>>          return;
>>>      }
>>>  
>>> -    p = str;
>>> -    if (qemu_strtoul(p, &e, 16, &val) < 0 || val > 0xffff || e == p) {
>>> +    col_s = col_s0 = g_strsplit(str, ":", 3);
>>> +    if (!col_s || !col_s[0] || !col_s[1]) {
>>>          goto inval;
>>>      }
>>> -    if (*e != ':') {
>>> -        goto inval;
>>> -    }
>>> -    bus = val;
>>>  
>>> -    p = (char *)e + 1;
>>> -    if (qemu_strtoul(p, &e, 16, &val) < 0 || val > 0x1f || e == p) {
>>> -        goto inval;
>>> -    }
>>> -    if (*e == ':') {
>>> -        dom = bus;
>>> -        bus = val;
>>> -        p = (char *)e + 1;
>>> -        if (qemu_strtoul(p, &e, 16, &val) < 0 || val > 0x1f || e == p) {
>>> +    /* domain */
>>> +    if (col_s[2]) {
>>> +        if (qemu_strtoul(col_s[0], NULL, 16, &val) < 0 || val > 0xffff) {
>>>              goto inval;
>>>          }
>>> +        addr->domain = val;
>>> +        col_s++;
>>> +    } else {
>>> +        addr->domain = 0;
>>>      }
>>> -    slot = val;
>>>  
>>> -    if (*e != '.') {
>>> +    /* bus */
>>> +    if (qemu_strtoul(col_s[0], NULL, 16, &val) < 0 || val > 0xff) {
>>>          goto inval;
>>>      }
>>> -    p = (char *)e + 1;
>>> -    if (qemu_strtoul(p, &e, 10, &val) < 0 || val > 7 || e == p) {
>>> -        goto inval;
>>> -    }
>>> -    func = val;
>>> +    addr->bus = val;
>>>  
>>> -    if (bus > 0xff) {
>>> +    /* <slot>.<func> */
>>> +    dot_s = g_strsplit(col_s[1], ".", 2);
>>> +    if (!dot_s || !dot_s[0] || !dot_s[1]) {
>>>          goto inval;
>>>      }
>>>  
>>> -    if (*e) {
>>> +    /* slot */
>>> +    if (qemu_strtoul(dot_s[0], NULL, 16, &val) < 0 || val > 0x1f) {
>>>          goto inval;
>>>      }
>>> +    addr->slot = val;
>>>  
>>> -    addr->domain = dom;
>>> -    addr->bus = bus;
>>> -    addr->slot = slot;
>>> -    addr->function = func;
>>> +    /* func */
>>> +    if (qemu_strtoul(dot_s[1], NULL, 10, &val) < 0 || val > 7) {
>>> +        goto inval;
>>> +    }
>>> +    addr->function = val;
>>>  
>>> -    g_free(str);
>>>      return;
>>>  
>>>  inval:
>>>      error_set_from_qdev_prop_error(errp, EINVAL, dev, prop, str);
>>> -    g_free(str);
>>>  }
>>>  
>>>  const PropertyInfo qdev_prop_pci_host_devaddr = {
>>>
>>
> 


