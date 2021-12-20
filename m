Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B5047B0C2
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 16:56:53 +0100 (CET)
Received: from localhost ([::1]:60056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzL1w-0006Bo-IR
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 10:56:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mzKQQ-0001xc-Kn
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:18:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mzKQG-0006IG-8N
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:18:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640013456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3hRTbhNzufD8eQhb3S/Nd5pLOJ4QdfFTYE+XFXD6xZQ=;
 b=i3KOlEvNzDXEBtnEYBBULU40oPAyZAkRXj2ZIygwaW4YDIpfTtjVXfvA+KwH68vlIRioK9
 D4MFxm+xurBRXPFuLJ0hAor243Id3BnXX1K0K0ZDMdINmbe6u8HpljEi+fpQyKC1meX+TL
 PUa/RcCMc3llaSQOwkWkvLVfKoGrrc0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-302-2qF1ZOfnNZmci496muV2EQ-1; Mon, 20 Dec 2021 03:55:07 -0500
X-MC-Unique: 2qF1ZOfnNZmci496muV2EQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 69-20020a1c0148000000b0033214e5b021so1691480wmb.3
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 00:55:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=3hRTbhNzufD8eQhb3S/Nd5pLOJ4QdfFTYE+XFXD6xZQ=;
 b=AgYqNtPq1VtMQRiLQeYzkSe18zpVHKxTOKygt55ztisbrC47ou7WGsdyZ1O+/x8yqD
 /b4hepUvBLlY5kQypVTnng/QtVIswUNdrznAGZtnZcIpuBHX9gez7OiDf3memYCkpcgn
 4yKbS4wHdcZw6mHdPlRLsoNvRT31/poIwrdIK0gudWO1QAUq1jFFKt2U6NOk4tqekrRT
 UxiTFZKvZFgVZa48ULc1AX887ThSi0SIOPDZE58pcoyDc5J93nmfLiuhciI2fMLPWbQI
 Bw4pUH2caNdFc/DNwnN46L6/3tw9cP+xh8k2aF6bBYc5XT7ziJTxChCvqRAbA1aNvu10
 GedA==
X-Gm-Message-State: AOAM5331POQHssVU9Ek59Vqb9gurUF/Z9JRPTew46SvZJplwdxe87+OC
 xQmOi/pubereL5rE2KZD8h9NML+fZ3q7cX1NMWANtbMTe161OUShZt6zewMVQsw58WGX/fAiFbX
 eDGxDY9xkM3U5OpI=
X-Received: by 2002:a5d:61cf:: with SMTP id q15mr11709174wrv.623.1639990506343; 
 Mon, 20 Dec 2021 00:55:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxMMQq5WeBYpnRvU3oGALXzATNJM1gnKtpE5TG5d5XlrFoDgyF+0qFR4WCF5pNjJSTtn9vEmw==
X-Received: by 2002:a5d:61cf:: with SMTP id q15mr11709168wrv.623.1639990506190; 
 Mon, 20 Dec 2021 00:55:06 -0800 (PST)
Received: from [192.168.50.34] (static-180-27-86-188.ipcom.comunitel.net.
 [188.86.27.180])
 by smtp.gmail.com with ESMTPSA id k6sm13913992wmj.16.2021.12.20.00.55.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 00:55:05 -0800 (PST)
Message-ID: <aedfa17d-6d31-6d5d-b367-cf84e77d27ed@redhat.com>
Date: Mon, 20 Dec 2021 09:55:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: Virtio-GPU Xres and Yres seettings
To: Pratik Parvati <pratikp@vayavyalabs.com>, qemu-devel@nongnu.org
References: <CA+aXn+EZQ=S+P=8fyfCxYikEMLLdqAEeQgi580Tqtsuot-r2dw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <CA+aXn+EZQ=S+P=8fyfCxYikEMLLdqAEeQgi580Tqtsuot-r2dw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) DKIMWL_WL_HIGH=-0.209, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.608,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing Gerd & Marc-André.

On 12/20/21 05:26, Pratik Parvati wrote:
> Hi Team,
> 
> I am working on a Virtio-GPU device (backend) for one of our customer
> projects - we are using the Virtio-GPU driver (frontend) to drive our
> device. Our device code has been written using Qemu virtio-gpu device
> code as a reference. Our device is setting the resolution to 1024x768 as
> a response to the command received from the driver (i.e,
> VIRTIO_GPU_CMD_GET_DISPLAY_INFO) - I also verified that driver is
> receiving the response bytes properly, but the next
> command (i.e, VIRTIO_GPU_CMD_RESOURCE_CREATE_2D) that device receive has
> a width and height as 4096 and 2160 respectively. The driver is assuming
> a 4k display for some reason and I need your help to understand why this
> is happening.
> 
> Our display is corrupted for the same Xres and Yres misunderstanding
> between the device and the driver - Please guide me to understand the
> problem. Let me know if you have any questions or need more information.
> 
> Thanks & Regards,
> Pratik


