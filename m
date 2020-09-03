Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDE125C155
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 14:51:06 +0200 (CEST)
Received: from localhost ([::1]:32930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDohl-0004PO-U8
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 08:51:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kDofM-0001w8-Ub
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 08:48:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kDofK-0001xm-JA
 for qemu-devel@nongnu.org; Thu, 03 Sep 2020 08:48:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599137313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=0OkkX+HsaMnkRqACeqnDZ3zA7FdUFu1CWUeg73Qzm6Y=;
 b=DAN6GLyX0gTWXVM4cks7Ji8XDWt1jHLVuWhSIToFKbVcpHRqNeJok1tLveCFkpvWv7AsMm
 evzYApOH83QtUifkz8UjgnNmI2KyycdGvZ+vowXhPtD5434Ln5oo8HicBBI+VEKbMj+30/
 4VK60VJe770K+7K9R3xf8FqoDX+EjNw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-kbIu033fPJ2cY8_Jn3m59A-1; Thu, 03 Sep 2020 08:48:30 -0400
X-MC-Unique: kbIu033fPJ2cY8_Jn3m59A-1
Received: by mail-wr1-f71.google.com with SMTP id a12so1042478wrg.13
 for <qemu-devel@nongnu.org>; Thu, 03 Sep 2020 05:48:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=0OkkX+HsaMnkRqACeqnDZ3zA7FdUFu1CWUeg73Qzm6Y=;
 b=nigAcrQyQ3Sb3P5x7mai/+7R1VdCY6DcxqvdKRwTj2XElF/DsETO1XpEtShfEqFldl
 rJnexYZRDfYBe9/Pejjkpx6wSllaIOD2gfWzD9Fb2QfJ9fvVR6A6pnMTGu7X/Z88iMrD
 +CeJtf0sSCCVHeqb22NqD2QdYfTXYPC855Jw4K6282O+rarGgZGiTx3TcphsIwh8jBMB
 /QzezDprm7nkATNIRr0TesuadnSMrHaMzP5v+ftsoPKvqnGG8gZWwPs/MUQfRhA6QFzj
 2sts0dGHrxE5dIK0wLFO1aZbm98U38l0xefiu2ROUUS0jSWTvR612941Pu7sO2naQmNw
 jTaw==
X-Gm-Message-State: AOAM531bArQZqYgmuNQigLHCSMd63eNQluaBO1W5xMvDYbr5XrVS790r
 i3gSa203982P2NKZrch0sLgRafYFOaa8alCCj6EUyD8t1mqMaMSbwifLtP8ZFkNwqzeZcm85ICw
 ev9jxVLG7g1NMJWQ=
X-Received: by 2002:adf:fc92:: with SMTP id g18mr2442792wrr.201.1599137309246; 
 Thu, 03 Sep 2020 05:48:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMnsBN1qzB3RIw/Yz/rBVFGSoyrupILiial70Lxhuq0Um9uyIM00WOksGNz0ephKIRp8Ay0g==
X-Received: by 2002:adf:fc92:: with SMTP id g18mr2442770wrr.201.1599137309064; 
 Thu, 03 Sep 2020 05:48:29 -0700 (PDT)
Received: from [192.168.1.36] (50.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.50])
 by smtp.gmail.com with ESMTPSA id h5sm6007547wrc.45.2020.09.03.05.48.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2020 05:48:28 -0700 (PDT)
Subject: Re: [PATCH 01/63] gpex: Fix type checking function name
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
References: <20200902224311.1321159-1-ehabkost@redhat.com>
 <20200902224311.1321159-2-ehabkost@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <290fd4a7-0d89-194a-104c-e2f12d52286d@redhat.com>
Date: Thu, 3 Sep 2020 14:48:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200902224311.1321159-2-ehabkost@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 01:47:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.403, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/3/20 12:42 AM, Eduardo Habkost wrote:
> This looks like a copy/paste mistake: the instance type checking
> macro for TYPE_GPEX_ROOT_DEVICE was named MCH_PCI_DEVICE.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Cc: qemu-devel@nongnu.org
> ---
>  include/hw/pci-host/gpex.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/hw/pci-host/gpex.h b/include/hw/pci-host/gpex.h
> index e8432eced8..2f4e852eee 100644
> --- a/include/hw/pci-host/gpex.h
> +++ b/include/hw/pci-host/gpex.h
> @@ -32,7 +32,7 @@ DECLARE_INSTANCE_CHECKER(GPEXHost, GPEX_HOST,
>  
>  #define TYPE_GPEX_ROOT_DEVICE "gpex-root"
>  typedef struct GPEXRootState GPEXRootState;
> -DECLARE_INSTANCE_CHECKER(GPEXRootState, MCH_PCI_DEVICE,
> +DECLARE_INSTANCE_CHECKER(GPEXRootState, GPEX_ROOT_DEVICE,
>                           TYPE_GPEX_ROOT_DEVICE)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

>  
>  #define GPEX_NUM_IRQS 4
> 


