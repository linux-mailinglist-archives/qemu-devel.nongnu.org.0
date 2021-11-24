Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A206D45B915
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 12:30:52 +0100 (CET)
Received: from localhost ([::1]:50728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpqUF-0001rh-7X
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 06:30:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mpqSQ-00004w-Rv
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 06:28:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mpqSM-0006xv-V6
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 06:28:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637753333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7GRmx4nupIKPAYCkA0oxmI7Tk+j6KfMMOooBizz6FQU=;
 b=gX7Ab9I/yDNmcwOcn61HJpV9gCK1NL5dLz8UXPpnnJDC+kCtvB1RjLjbSfxYjAv3dB+sSw
 8X8WvnozPOgiICpfAa6gZy5FuDe7mOpUzAIb19GiAJEtJolQi/rH86IBWCkKImpGwqjhJs
 F4wVwq72c40wGL6p4h2Md14GGBiXJa8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-403-1JcYxlTZNeauwGVlP3ua1Q-1; Wed, 24 Nov 2021 06:28:52 -0500
X-MC-Unique: 1JcYxlTZNeauwGVlP3ua1Q-1
Received: by mail-wr1-f69.google.com with SMTP id
 y4-20020adfd084000000b00186b16950f3so418224wrh.14
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 03:28:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7GRmx4nupIKPAYCkA0oxmI7Tk+j6KfMMOooBizz6FQU=;
 b=lAeZnEwH7XUg+HZzAYTnYnXLnufXb9TSPYqRri4daRTRuUMIe7Ae7afkqWmRWRPNXy
 nYxdy4Lm3yOaOARvc1fMmZMiyCuv3DMiO1l0ASiWZ7KqKmOfHZzPf+/MJKAcko3qEISw
 tVt7c1Favj9A9eYy3Xkgb0gKmAgDuJU9hdi1nS3OjyFaC82pYFrqb7w0eODoW16hua3o
 Zo82Bon9IHExHjeGOBlkGMMwMuC7h39BYlKy5xMVEjzT+0PQzEm45vFqucLbh11ChQ9R
 uOaCvimUPfXX2sQI5CwOt2bP5lYOSOni3Da92n6mXlvfOaD2GSoe+rXdtJx7RyLSyvGv
 0kug==
X-Gm-Message-State: AOAM531VCEbQ/fe+wBu4YesEdPQGsRWU5sYB3kXybK0EC6Vrmwni3cgS
 PlvX/bVVZXGj3mIBsk2DKFzZ4HXPaa0XY0NWBwuUGXKLYuqxjTwa2HMmduxJsJdKTlUFDzwUG4H
 Za8Ruax7rMRsMY+g=
X-Received: by 2002:adf:ce8b:: with SMTP id r11mr18006063wrn.294.1637753331434; 
 Wed, 24 Nov 2021 03:28:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzUjdIiitx3R3Ql4bbKFGvLmLEunJjj6P5H5CmlrX69wB1uj45oi/v2BL0O/mWNekFAxApLpA==
X-Received: by 2002:adf:ce8b:: with SMTP id r11mr18006011wrn.294.1637753331116; 
 Wed, 24 Nov 2021 03:28:51 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id l4sm14771549wrv.94.2021.11.24.03.28.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 03:28:50 -0800 (PST)
Message-ID: <7d312ca5-82d1-ba63-535d-8024f2033215@redhat.com>
Date: Wed, 24 Nov 2021 12:28:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH for-7.0 v2 1/2] ivshmem.c: change endianness to
 LITTLE_ENDIAN
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
References: <20211124092948.335389-1-danielhb413@gmail.com>
 <20211124092948.335389-2-danielhb413@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211124092948.335389-2-danielhb413@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: thuth@redhat.com, qemu-ppc@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 david@gibson.dropbear.id.au, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/24/21 10:29, Daniel Henrique Barboza wrote:
> The ivshmem device, as with most PCI devices, uses little endian byte
> order. However, the endianness of its mmio_ops is marked as
> DEVICE_NATIVE_ENDIAN. This presents not only the usual problems with big
> endian hosts but also with PowerPC little endian hosts as well, since
> the Power architecture in QEMU uses big endian hardware (XIVE controller,
> PCI Host Bridges, etc) even if the host is in little endian byte order.

Maybe mention commit f7a199b2b44 ("ivshmem: use little-endian
int64_t for the protocol")?

> As it is today, the IVPosition of the device will be byte swapped when
> running in Power BE and LE. This can be seen by changing the existing
> qtest 'ivshmem-test' to run in ppc64 hosts and printing the IVPOSITION
> regs in test_ivshmem_server() right after the VM ids assert. For x86_64
> the VM id values read are '0' and '1', for ppc64 (tested in a Power8
> RHEL 7.9 BE server) and ppc64le (tested in a Power9 RHEL 8.6 LE server)
> the ids will be '0' and '0x1000000'.
> 
> Change this device to LITTLE_ENDIAN fixes the issue for Power hosts of
> both endianness, and every other big-endian architecture that might use
> this device, without impacting x86 users.
> 
> Fixes: cb06608e17f8 ("ivshmem: convert to memory API")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/168
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  hw/misc/ivshmem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
> index 1ba4a98377..299837e5c1 100644
> --- a/hw/misc/ivshmem.c
> +++ b/hw/misc/ivshmem.c
> @@ -243,7 +243,7 @@ static uint64_t ivshmem_io_read(void *opaque, hwaddr addr,
>  static const MemoryRegionOps ivshmem_mmio_ops = {
>      .read = ivshmem_io_read,
>      .write = ivshmem_io_write,
> -    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
>      .impl = {
>          .min_access_size = 4,
>          .max_access_size = 4,
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


