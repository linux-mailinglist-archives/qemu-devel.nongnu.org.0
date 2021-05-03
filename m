Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EE83712FC
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 11:28:41 +0200 (CEST)
Received: from localhost ([::1]:45148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldUsa-0002zx-5C
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 05:28:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldUrJ-0002Bi-0S
 for qemu-devel@nongnu.org; Mon, 03 May 2021 05:27:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldUrH-0005Ch-BK
 for qemu-devel@nongnu.org; Mon, 03 May 2021 05:27:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620034038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gbtlsBz4RfkWrY968Y39vkOsGYubAvTenC4l1JflJ4A=;
 b=CkycusMnG9lt4JI6q5HqM2ic/+eYSIEA9fRwNu61iZknCaycDiXzVHXBkmOeN+eZ3OE5ZZ
 2Ur5ghnOSMxrmYhCvXXTwV8qfXLNEEb5Y1+sCyrKnD6IQxkGZpuVzopw7ua+9VV/j1tQIG
 60LJOGZqy5jlcujGk1PUXR6mY5GVpgw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-gmJh9BRSNQCxpRa_69HYOg-1; Mon, 03 May 2021 05:27:16 -0400
X-MC-Unique: gmJh9BRSNQCxpRa_69HYOg-1
Received: by mail-wr1-f71.google.com with SMTP id
 q18-20020adfc5120000b029010c2bdd72adso3578736wrf.16
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 02:27:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gbtlsBz4RfkWrY968Y39vkOsGYubAvTenC4l1JflJ4A=;
 b=YWujaXcFFUUPiY7UP/pWdE6Sy/6+x7s9X1rinEKqK+deTO7UzChw6mdQoTTbSnDF6B
 kncSlEKI6/HuRy/xCtxhHWGRi6or+CK7s4TzEgzW7vPaOPHT48PqwNRs+u3Jcl/QpkfE
 qhrAIpaZw1M4eN+UqirmTb79mSwbOEP5+nHYlt4dTz72AhVjLw0I47C3UbfLzbZadHuh
 /LmsWma6Rs33na91bg53OH8ZxTGcSxAziG01CpOZ9FVaMlNEGLCVJOYmUBEyr5S13HvN
 MLq6bqibPhjipQTS3rf5HzZFhmzb8Zl3IsLTYDFmcE7Nj78zefycHpQ/sGvwDY/roasu
 qrpA==
X-Gm-Message-State: AOAM530Q6WyRDWgRGGVjNjzIZgGUQ792Q7/6OApPNUEreOU+5vzCEjp4
 ADQ2cbU8j4n1G6ZM3LEA7E7kenxEpOjmvpZmBpJ+kGUX/hrkIEjVOutnyFlO8zmN0eFyx/0U0QZ
 gSCwK4UkBecvHagU=
X-Received: by 2002:adf:e845:: with SMTP id d5mr23234539wrn.96.1620034035471; 
 Mon, 03 May 2021 02:27:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqqwMrqes3QKXQpJfWyPOIbMB/lVq7IqcbHiwGUa9+l6qfoyW9pOepC6u8YceU+j/fLhtqVg==
X-Received: by 2002:adf:e845:: with SMTP id d5mr23234527wrn.96.1620034035337; 
 Mon, 03 May 2021 02:27:15 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id b7sm3666999wri.83.2021.05.03.02.27.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 02:27:14 -0700 (PDT)
Subject: Re: [PATCH 2/5] usb/redir: avoid dynamic stack allocation
 (CVE-2021-3527)
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20210503091446.2137206-1-kraxel@redhat.com>
 <20210503091446.2137206-3-kraxel@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a65a7b1b-5dff-dd0c-2e00-4eafc1639bab@redhat.com>
Date: Mon, 3 May 2021 11:27:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210503091446.2137206-3-kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: mcascell@redhat.com, remy.noel@blade-group.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/3/21 11:14 AM, Gerd Hoffmann wrote:
> Use autofree heap allocation instead.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Fixes: 4f4321c11ff ("usb: use iovecs in USBPacket")
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  hw/usb/redirect.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
> index 17f06f34179a..db1a89a7cc92 100644
> --- a/hw/usb/redirect.c
> +++ b/hw/usb/redirect.c
> @@ -818,7 +818,7 @@ static void usbredir_handle_bulk_data(USBRedirDevice *dev, USBPacket *p,
>          usbredirparser_send_bulk_packet(dev->parser, p->id,
>                                          &bulk_packet, NULL, 0);
>      } else {
> -        uint8_t buf[size];
> +        g_autofree uint8_t *buf = g_malloc(size);
>          usb_packet_copy(p, buf, size);
>          usbredir_log_data(dev, "bulk data out:", buf, size);
>          usbredirparser_send_bulk_packet(dev->parser, p->id,
> @@ -923,7 +923,7 @@ static void usbredir_handle_interrupt_out_data(USBRedirDevice *dev,
>                                                 USBPacket *p, uint8_t ep)
>  {
>      struct usb_redir_interrupt_packet_header interrupt_packet;
> -    uint8_t buf[p->iov.size];
> +    g_autofree uint8_t *buf = g_malloc(p->iov.size);
>  
>      DPRINTF("interrupt-out ep %02X len %zd id %"PRIu64"\n", ep,
>              p->iov.size, p->id);
> 


