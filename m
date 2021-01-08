Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FED2EF570
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 17:06:39 +0100 (CET)
Received: from localhost ([::1]:34764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxuHe-0008Qo-Gq
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 11:06:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kxuEF-0006ck-Mj
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 11:03:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kxuEB-0003rR-W7
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 11:03:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610121781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jg72vHFewYho7ms71c6oUMQJzH/aAvcVKXlz9sjwFgQ=;
 b=CLYm6NKr1J3xXaDbETEUOFyZeZgFRIkkVWQShf5pi8QuFJ6+mRO2nozj1ruHW5ntML3Um4
 fhADFtHxNzbVILcdZdgZCv/Zq/BmELZWjAD2/1WEp9S9+HiVD+ahQIvzTsXqyQDaaGKvHY
 fP6vV+1UgMpwUzlZAuv5h1FaEbyZgNU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-yFfUwr0bOcWFNkgrM29k4Q-1; Fri, 08 Jan 2021 11:03:00 -0500
X-MC-Unique: yFfUwr0bOcWFNkgrM29k4Q-1
Received: by mail-wr1-f72.google.com with SMTP id g17so4326802wrr.11
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 08:02:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Jg72vHFewYho7ms71c6oUMQJzH/aAvcVKXlz9sjwFgQ=;
 b=YsoAV2iEpT14qK2TXGX/kx6JiAV90y8zS0py3cFPFTfosRwRAgPDKJWFU/UgoWAnpX
 H5SFHmJovOwPqH3PJPaRngQRrFu+RUN6M74ODZUVX0r+auI5hPyfADhgjC+UzvDckV06
 kY027P65mE4jsmR+/JaPAPYCpJZpn7xzMPp6dQUx172i4JwwQPT/t2n1uLXwnxKXcUrm
 t/eWIpk43vuFSpwtVIVIYlEypQ4Mo0ZWu3PJOKC1WhT7amZ84IZlqyoSFZYuYp1SFQ+2
 JPlekdctxpbYNZAHD6J73o2q2GRBchzwnLoThqhGjItAzQYFIoqrvB8YB1+CClxuOpL8
 BVfQ==
X-Gm-Message-State: AOAM532PILvyj/t4PwXPsx5Q25JEiF/SGobNdQ8Q2n+RY9WR9fHH+QaM
 cCsfSFUDr/AlaCztTp8pFp55JRa0of/RP8EQaQSXI7CNVZGq30Yd9eAiGJU2SNH+B9Ej5YfMjLo
 4O+wisSptpcaMQEc=
X-Received: by 2002:adf:aa83:: with SMTP id h3mr4438624wrc.108.1610121778787; 
 Fri, 08 Jan 2021 08:02:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzgYFK6cPnQvEuRVjmZpNkJNEbt55Z4OvadvTDna7aQsp4H+kJYsbN9rJYG4BvtyuR97CsQZg==
X-Received: by 2002:adf:aa83:: with SMTP id h3mr4438595wrc.108.1610121778594; 
 Fri, 08 Jan 2021 08:02:58 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id j7sm12539807wmb.40.2021.01.08.08.02.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jan 2021 08:02:57 -0800 (PST)
Subject: Re: [PATCH v3] hw/core/qdev-properties-system: Rewrite
 set_pci_host_devaddr using GLib
To: qemu-devel@nongnu.org
References: <20201125083300.861206-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ad4cf02d-e5d3-b97a-6254-6d495fb39c04@redhat.com>
Date: Fri, 8 Jan 2021 17:02:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201125083300.861206-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.247,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.241, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping?

On 11/25/20 9:33 AM, Philippe Mathieu-Daudé wrote:
> set_pci_host_devaddr() is hard to follow, thus bug-prone.
> 
> For example, a bug was introduced in commit bccb20c49df, as
> the same line might be used to parse a bus (up to 0xff) or
> a slot (up to 0x1f).
> 
> Instead of making things worst, rewrite using g_strsplit().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> v3: Rebased
> v2: Free g_strsplit() with g_auto(GStrv) (Daniel)
> ---
>  hw/core/qdev-properties-system.c | 62 ++++++++++++++------------------
>  1 file changed, 27 insertions(+), 35 deletions(-)
> 
> diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
> index 9d80a07d26f..79408e32289 100644
> --- a/hw/core/qdev-properties-system.c
> +++ b/hw/core/qdev-properties-system.c
> @@ -857,11 +857,11 @@ static void set_pci_host_devaddr(Object *obj, Visitor *v, const char *name,
>      DeviceState *dev = DEVICE(obj);
>      Property *prop = opaque;
>      PCIHostDeviceAddress *addr = qdev_get_prop_ptr(dev, prop);
> -    char *str, *p;
> -    char *e;
> +    g_autofree char *str = NULL;
> +    g_auto(GStrv) col_s0 = NULL;
> +    g_auto(GStrv) dot_s = NULL;
> +    char **col_s;
>      unsigned long val;
> -    unsigned long dom = 0, bus = 0;
> -    unsigned int slot = 0, func = 0;
>  
>      if (dev->realized) {
>          qdev_prop_set_after_realize(dev, name, errp);
> @@ -872,58 +872,50 @@ static void set_pci_host_devaddr(Object *obj, Visitor *v, const char *name,
>          return;
>      }
>  
> -    p = str;
> -    val = strtoul(p, &e, 16);
> -    if (e == p || *e != ':') {
> +    col_s = col_s0 = g_strsplit(str, ":", 3);
> +    if (!col_s || !col_s[0] || !col_s[1]) {
>          goto inval;
>      }
> -    bus = val;
>  
> -    p = e + 1;
> -    val = strtoul(p, &e, 16);
> -    if (e == p) {
> -        goto inval;
> -    }
> -    if (*e == ':') {
> -        dom = bus;
> -        bus = val;
> -        p = e + 1;
> -        val = strtoul(p, &e, 16);
> -        if (e == p) {
> +    /* domain */
> +    if (col_s[2]) {
> +        if (qemu_strtoul(col_s[0], NULL, 16, &val) < 0 || val > 0xffff) {
>              goto inval;
>          }
> +        addr->domain = val;
> +        col_s++;
> +    } else {
> +        addr->domain = 0;
>      }
> -    slot = val;
>  
> -    if (*e != '.') {
> +    /* bus */
> +    if (qemu_strtoul(col_s[0], NULL, 16, &val) < 0 || val > 0xff) {
>          goto inval;
>      }
> -    p = e + 1;
> -    val = strtoul(p, &e, 10);
> -    if (e == p) {
> -        goto inval;
> -    }
> -    func = val;
> +    addr->bus = val;
>  
> -    if (dom > 0xffff || bus > 0xff || slot > 0x1f || func > 7) {
> +    /* <slot>.<func> */
> +    dot_s = g_strsplit(col_s[1], ".", 2);
> +    if (!dot_s || !dot_s[0] || !dot_s[1]) {
>          goto inval;
>      }
>  
> -    if (*e) {
> +    /* slot */
> +    if (qemu_strtoul(dot_s[0], NULL, 16, &val) < 0 || val > 0x1f) {
>          goto inval;
>      }
> +    addr->slot = val;
>  
> -    addr->domain = dom;
> -    addr->bus = bus;
> -    addr->slot = slot;
> -    addr->function = func;
> +    /* func */
> +    if (qemu_strtoul(dot_s[1], NULL, 10, &val) < 0 || val > 7) {
> +        goto inval;
> +    }
> +    addr->function = val;
>  
> -    g_free(str);
>      return;
>  
>  inval:
>      error_set_from_qdev_prop_error(errp, EINVAL, dev, prop, str);
> -    g_free(str);
>  }
>  
>  const PropertyInfo qdev_prop_pci_host_devaddr = {
> 


