Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B91982F9C5C
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 11:34:18 +0100 (CET)
Received: from localhost ([::1]:37584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1RrV-0000dZ-Qh
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 05:34:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1RpW-00007I-Rx
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 05:32:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1RpV-0005UU-5b
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 05:32:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610965932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D/YmMQKR/VnisXwu7CI/z05wx/mMzhmtmYuZ85P44xs=;
 b=UlZIdN2kjDkPox4OJaqKxqA1z6roOTsSLPOp1GllS1cOkVOYPs0ktbb088ZoKWyYkwFpHc
 wyUiwV82aRrhfvtCvhOvVwfkAT43Giol9rb8QOvH4wS327eBwGLv6tcsCvW00o4tSGh8pZ
 csAvxtWH0DvCkY9jdvq6L3dUw6F25fU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-Ir_8Blk2NAyO8dFT9qUcOQ-1; Mon, 18 Jan 2021 05:32:10 -0500
X-MC-Unique: Ir_8Blk2NAyO8dFT9qUcOQ-1
Received: by mail-wm1-f72.google.com with SMTP id 184so915313wmb.4
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 02:32:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D/YmMQKR/VnisXwu7CI/z05wx/mMzhmtmYuZ85P44xs=;
 b=UBQklG7k2ejAZ5/5O7dzIGF6SOg2XhaxZuHxQEN/FoAzAbw8HHZbNU/2NEtHUNAURL
 4covtaJHhxpFjHkqQPgna9laShCZDh9elleIUanoch+H4ZwAnwzM5MrVOR/12ju+F8ca
 NQHuuui98TMbKC3Z9NnnlHe0xk7RwAZtNQBjTWN9tIEQ5Txgm/9DJDfuBA5r+gPtDPMc
 pQu2rArVaaPrXsVZKgmRe1NNpjE/jW/oOUQVQR8rQVzk77bl24f0bXXPv63U0hYD7rKs
 vUjkHITjIACjB2ZxZVgmaRBEuGO9r7ROhSMg6daUtoI0RKjcCXP1vTf/A46yUyrs7I7l
 JoLg==
X-Gm-Message-State: AOAM533Q6t/ffK6VqBR6zcqFjpUxZcnCUypdYACByZgslI+ArBTlGM48
 QV0l0pKatMTNReN+IR0Pb6Pgfc6S+KVLc/pjqkzi9InvETJ39PGiV9OGkuYzzFQwvAPexB5sScU
 WG60yUuLvBprJevY=
X-Received: by 2002:a7b:cb9a:: with SMTP id m26mr20067347wmi.130.1610965929293; 
 Mon, 18 Jan 2021 02:32:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz/7l15eeBES5oDt8svTfdwz3eueeP6uASjVK5wWr3enMv7iybRFnECbXg8QSwmdIlklA5Ogg==
X-Received: by 2002:a7b:cb9a:: with SMTP id m26mr20067287wmi.130.1610965928436; 
 Mon, 18 Jan 2021 02:32:08 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id z184sm20953763wmg.7.2021.01.18.02.32.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jan 2021 02:32:07 -0800 (PST)
Subject: Re: [PATCH 3/4] pvpanic : update pvpanic spec document
To: Mihai Carabas <mihai.carabas@oracle.com>, qemu-devel@nongnu.org
References: <1610735646-13313-1-git-send-email-mihai.carabas@oracle.com>
 <1610735646-13313-4-git-send-email-mihai.carabas@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <605edf10-933f-db84-714b-b1a7ec9336a3@redhat.com>
Date: Mon, 18 Jan 2021 11:32:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1610735646-13313-4-git-send-email-mihai.carabas@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.189,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.252, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
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
Cc: peter.maydell@linaro.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/15/21 7:34 PM, Mihai Carabas wrote:
> Add pvpanic PCI device support details in docs/specs/pvpanic.txt.
> 
> Signed-off-by: Mihai Carabas <mihai.carabas@oracle.com>
> ---
>  docs/specs/pvpanic.txt | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/specs/pvpanic.txt b/docs/specs/pvpanic.txt
> index a90fbca..974aafd 100644
> --- a/docs/specs/pvpanic.txt
> +++ b/docs/specs/pvpanic.txt
> @@ -1,7 +1,7 @@
>  PVPANIC DEVICE
>  ==============
>  
> -pvpanic device is a simulated ISA device, through which a guest panic
> +pvpanic device is a simulated device, through which a guest panic
>  event is sent to qemu, and a QMP event is generated. This allows
>  management apps (e.g. libvirt) to be notified and respond to the event.
>  
> @@ -9,6 +9,9 @@ The management app has the option of waiting for GUEST_PANICKED events,
>  and/or polling for guest-panicked RunState, to learn when the pvpanic
>  device has fired a panic event.
>  
> +The pvpanic device can be implemented as an ISA device (using IOPORT) or as a
> +PCI device.
> +
>  ISA Interface
>  -------------
>  
> @@ -24,6 +27,14 @@ bit 1: a guest panic has happened and will be handled by the guest;
>         the host should record it or report it, but should not affect
>         the execution of the guest.
>  
> +PCI Interface
> +-------------
> +
> +The PCI interface is similar to the ISA interface except that it uses an MMIO
> +address space provided by its BAR0, 1 byte long. Any machine with a PCI device

"device" -> "bus"?

> +can enable a pvpanic device by adding '-device pvpanic-pci' to the command
> +line.
> +
>  ACPI Interface
>  --------------
>  
> 


