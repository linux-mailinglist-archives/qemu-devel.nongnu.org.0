Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C24742BAA9D
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 13:56:36 +0100 (CET)
Received: from localhost ([::1]:55724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg5xr-0003Uu-BX
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 07:56:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kg5wt-00032S-5X
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 07:55:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kg5wq-0004ki-01
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 07:55:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605876930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I9DoyZL4yniY+vkJjX7BXBEde8yOfd2GcGwj/ZXh26w=;
 b=UkCqyw/TIwCb0/+HCgfcRlb7VkrhnxNOXHz+9FqANPjo1F2hV/Z/seMEI/kpAfVImPTR88
 qSiJSV6qznoh9c10TSdVoIrEOqNoDeseEtM6OLNuScj3u3vAtmvg9/1f1boJZnPNalsbKT
 6QF4ZXfoeULQSehBOYXNd9WXmFlMrRI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-xxEE3cbfOLWH2XB_ClbROw-1; Fri, 20 Nov 2020 07:55:26 -0500
X-MC-Unique: xxEE3cbfOLWH2XB_ClbROw-1
Received: by mail-wm1-f70.google.com with SMTP id y187so4014454wmy.3
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 04:55:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=VamLAccdLZEG8Az+1h/sJyYkXKQWOFYspxZVxn3IyIg=;
 b=oYG9Mx/hv5wVSuEoU/t82L7UgBF5RRMFw0Q/JhOy5m1VusNDh/XPzeHo7x7+XadojU
 nw/rZJGLuS1hpMKCZPNJ6XxtrN31KKE/4d/JPXZM2O4NoeKrjx0AoS1xUWlEQuIMffL1
 xu5XoVk9+AhuoCktS9G68RqEcvmrO0U9dWa3xnyUNwegtwKaNU1sdaaNiSBTmZileSAX
 IDo/8rDzcj0xCX4d8GpxMFLVn+y4Gu28JTgjZHOWRH3jSuqD3wd6zt38M9EWMvfn6gMW
 grFvHrM/VqWjFNaPZgzitGasp75RZomzg4uIQXoLS62TKDGMIHvyd2O+1BxMLVrq4JKn
 qL3w==
X-Gm-Message-State: AOAM532QJ1E0py+i12TCOXMbF5mJpU8C7wNNuGZBpSwmvZWM0QllYqMD
 +VnNyn+jEwWUf9rD9CJPmJmGQ9AmUl+85oJj3nSvsGZaIVjo82cqqC8e9nTckcDbboSX6rsTQGY
 QR8v4R4ofaw3SW/U=
X-Received: by 2002:a1c:790c:: with SMTP id l12mr9243828wme.47.1605876924604; 
 Fri, 20 Nov 2020 04:55:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwzIS3km7Fvr4WXbxPXN0DmFOKHFc8A6p80thNWL5oI2UVIfMQDQ3OIg8H4WydbvscCYP2e5A==
X-Received: by 2002:a1c:790c:: with SMTP id l12mr9243801wme.47.1605876924313; 
 Fri, 20 Nov 2020 04:55:24 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id e6sm4476341wme.27.2020.11.20.04.55.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 04:55:23 -0800 (PST)
Date: Fri, 20 Nov 2020 07:55:20 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-5.2 v2] hw/core/qdev-properties-system: Rewrite
 set_pci_host_devaddr using GLib
Message-ID: <20201120075445-mutt-send-email-mst@kernel.org>
References: <20201013102252.3562860-1-philmd@redhat.com>
 <60f5af9c-4153-7702-cd99-b317a6de89c0@redhat.com>
 <ccf65075-c0e9-7358-f483-2c7fbbd3fb81@redhat.com>
 <fa5ed32a-1553-2490-b266-375a000f0cef@redhat.com>
 <7a130a3e-3ebf-220f-9115-dd121d8782fb@redhat.com>
MIME-Version: 1.0
In-Reply-To: <7a130a3e-3ebf-220f-9115-dd121d8782fb@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Klaus Herman <kherman@inbox.lv>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 20, 2020 at 12:00:56PM +0100, Philippe Mathieu-Daudé wrote:
> On 11/17/20 12:16 PM, Philippe Mathieu-Daudé wrote:
> > ping???
> > 
> > On 11/9/20 3:16 PM, Philippe Mathieu-Daudé wrote:
> >> Cc'ing PCI developers (rc2 is scheduled for tomorrow).
> >>
> >> On 11/7/20 9:59 AM, Philippe Mathieu-Daudé wrote:
> >>> Ping for 5.2 as this is a bugfix.
> >>>
> >>> On 10/13/20 12:22 PM, Philippe Mathieu-Daudé wrote:
> >>>> set_pci_host_devaddr() is hard to follow, thus bug-prone.
> >>>> We indeed introduced a bug in commit bccb20c49df, as the
> >>>> same line might be used to parse a bus (up to 0xff) or a
> >>>> slot (up to 0x1f). Instead of making things worst, rewrite
> >>>> using g_strsplit().
> 
> As there is few interest in fixing the issue with this patch,
> let me remind the 2 other approaches:
> 
> Klaus Herman:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg750101.html
> Geoffrey McRae:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg758182.html
> 
> That said, I'm done with this issue for 5.2.
> 
> Regards,
> 
> Phil.

What happens if we just revert bccb20c49df1bd683248a366021973901c11982f?

This is what I'm inclined to do for 5.2 ...


> >>>> Fixes: bccb20c49df ("Use qemu_strtoul() in set_pci_host_devaddr()")
> >>>> Reported-by: Klaus Herman <kherman@inbox.lv>
> >>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> >>>> ---
> >>>> v2: Free g_strsplit() with g_auto(GStrv) (Daniel)
> >>>> ---
> >>>>  hw/core/qdev-properties-system.c | 61 ++++++++++++++------------------
> >>>>  1 file changed, 27 insertions(+), 34 deletions(-)
> >>>>
> >>>> diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
> >>>> index 49bdd125814..36d4fd8b22a 100644
> >>>> --- a/hw/core/qdev-properties-system.c
> >>>> +++ b/hw/core/qdev-properties-system.c
> >>>> @@ -878,11 +878,11 @@ static void set_pci_host_devaddr(Object *obj, Visitor *v, const char *name,
> >>>>      DeviceState *dev = DEVICE(obj);
> >>>>      Property *prop = opaque;
> >>>>      PCIHostDeviceAddress *addr = qdev_get_prop_ptr(dev, prop);
> >>>> -    char *str, *p;
> >>>> -    const char *e;
> >>>> +    g_autofree char *str = NULL;
> >>>> +    g_auto(GStrv) col_s0 = NULL;
> >>>> +    g_auto(GStrv) dot_s = NULL;
> >>>> +    char **col_s;
> >>>>      unsigned long val;
> >>>> -    unsigned long dom = 0, bus = 0;
> >>>> -    unsigned int slot = 0, func = 0;
> >>>>  
> >>>>      if (dev->realized) {
> >>>>          qdev_prop_set_after_realize(dev, name, errp);
> >>>> @@ -893,57 +893,50 @@ static void set_pci_host_devaddr(Object *obj, Visitor *v, const char *name,
> >>>>          return;
> >>>>      }
> >>>>  
> >>>> -    p = str;
> >>>> -    if (qemu_strtoul(p, &e, 16, &val) < 0 || val > 0xffff || e == p) {
> >>>> +    col_s = col_s0 = g_strsplit(str, ":", 3);
> >>>> +    if (!col_s || !col_s[0] || !col_s[1]) {
> >>>>          goto inval;
> >>>>      }
> >>>> -    if (*e != ':') {
> >>>> -        goto inval;
> >>>> -    }
> >>>> -    bus = val;
> >>>>  
> >>>> -    p = (char *)e + 1;
> >>>> -    if (qemu_strtoul(p, &e, 16, &val) < 0 || val > 0x1f || e == p) {
> >>>> -        goto inval;
> >>>> -    }
> >>>> -    if (*e == ':') {
> >>>> -        dom = bus;
> >>>> -        bus = val;
> >>>> -        p = (char *)e + 1;
> >>>> -        if (qemu_strtoul(p, &e, 16, &val) < 0 || val > 0x1f || e == p) {
> >>>> +    /* domain */
> >>>> +    if (col_s[2]) {
> >>>> +        if (qemu_strtoul(col_s[0], NULL, 16, &val) < 0 || val > 0xffff) {
> >>>>              goto inval;
> >>>>          }
> >>>> +        addr->domain = val;
> >>>> +        col_s++;
> >>>> +    } else {
> >>>> +        addr->domain = 0;
> >>>>      }
> >>>> -    slot = val;
> >>>>  
> >>>> -    if (*e != '.') {
> >>>> +    /* bus */
> >>>> +    if (qemu_strtoul(col_s[0], NULL, 16, &val) < 0 || val > 0xff) {
> >>>>          goto inval;
> >>>>      }
> >>>> -    p = (char *)e + 1;
> >>>> -    if (qemu_strtoul(p, &e, 10, &val) < 0 || val > 7 || e == p) {
> >>>> -        goto inval;
> >>>> -    }
> >>>> -    func = val;
> >>>> +    addr->bus = val;
> >>>>  
> >>>> -    if (bus > 0xff) {
> >>>> +    /* <slot>.<func> */
> >>>> +    dot_s = g_strsplit(col_s[1], ".", 2);
> >>>> +    if (!dot_s || !dot_s[0] || !dot_s[1]) {
> >>>>          goto inval;
> >>>>      }
> >>>>  
> >>>> -    if (*e) {
> >>>> +    /* slot */
> >>>> +    if (qemu_strtoul(dot_s[0], NULL, 16, &val) < 0 || val > 0x1f) {
> >>>>          goto inval;
> >>>>      }
> >>>> +    addr->slot = val;
> >>>>  
> >>>> -    addr->domain = dom;
> >>>> -    addr->bus = bus;
> >>>> -    addr->slot = slot;
> >>>> -    addr->function = func;
> >>>> +    /* func */
> >>>> +    if (qemu_strtoul(dot_s[1], NULL, 10, &val) < 0 || val > 7) {
> >>>> +        goto inval;
> >>>> +    }
> >>>> +    addr->function = val;
> >>>>  
> >>>> -    g_free(str);
> >>>>      return;
> >>>>  
> >>>>  inval:
> >>>>      error_set_from_qdev_prop_error(errp, EINVAL, dev, prop, str);
> >>>> -    g_free(str);
> >>>>  }
> >>>>  
> >>>>  const PropertyInfo qdev_prop_pci_host_devaddr = {
> >>>>
> >>>
> >>
> > 


