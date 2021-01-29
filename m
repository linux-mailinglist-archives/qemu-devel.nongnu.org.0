Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E02B1308DF4
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 21:03:01 +0100 (CET)
Received: from localhost ([::1]:54214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Zyv-0001Gj-04
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 15:03:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l5Zwi-0008Gl-4q
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:00:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l5ZwZ-0003l3-JD
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:00:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611950433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mVEYpakw4HHdDoqcExVcZsz86uTSmkCvfjjA6rSOslg=;
 b=Ef3pB/LLBsKXnnJsLRjewQhze9w5jksaV7kBbxC41tbkpiAXfb9KwxVAurgj3BVp0AZ0Vp
 JatH/xrZg3qVdhMrMVcCy9K+YCJONoq0F1acZX9Ajyl1kKyLsuIPYtIS6nrVkrcT8yIDkW
 9qUAti6sgYsX48DcVTxVNTpvSb9i54s=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-g4OnxgRkOSWgha_JmzApCQ-1; Fri, 29 Jan 2021 15:00:31 -0500
X-MC-Unique: g4OnxgRkOSWgha_JmzApCQ-1
Received: by mail-ed1-f72.google.com with SMTP id j11so5441107edy.20
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 12:00:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mVEYpakw4HHdDoqcExVcZsz86uTSmkCvfjjA6rSOslg=;
 b=McEqFlxwsznuWpxlJiIZcfBkFwerml2q2eV3vpGdHLxYuQjaQtGH/w1GbeXhND3NgP
 5tbLpeg7Ua8Z830v8XGk2F1hjSSeDwOsHB2SZ2XzsNTMBwzWJuy2IF/kPbJTIFqSqVyY
 uSL81e19E3rrXvWE3g+yaE3fLPARzRdmdtg5MKM/eSodPuwchhklTicVeWKfnNR/dzU1
 pp3IdRwE09/kYzfTIPHMgWVl17JiHJ/SSLmFStfSAL7fFpLLrBZWKrTc70Bj0edeKaCo
 a7YjBFWa9tHCBwaDv6eeywOsntXFJqw0SE3YlFstrPxzCUhejGVFFoeO+q4JOBA0bEqY
 3usA==
X-Gm-Message-State: AOAM532LI9p2ZNh9dCB9YdYP884UJR1mV9ZvX6SZzJoZejLFecF7uquG
 0ujwm0sAb2kiMkBtN/YLr7Tm3JnNDHDuFF0u/JOpXpc0QrvlW+uSVfpYJmFEO/Dna8r7zS3ZneL
 N36XjI8ggyMQ7cNw=
X-Received: by 2002:a17:906:4bc1:: with SMTP id
 x1mr6312742ejv.509.1611950430408; 
 Fri, 29 Jan 2021 12:00:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw/38ux/JEv1LTOPMmgAikXz5wTlQUmfOHkmwIKEZv/MSW6nj4msZSVvIv3ybx1JEYLjGZ03w==
X-Received: by 2002:a17:906:4bc1:: with SMTP id
 x1mr6312695ejv.509.1611950430180; 
 Fri, 29 Jan 2021 12:00:30 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id pj11sm4191062ejb.58.2021.01.29.12.00.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jan 2021 12:00:29 -0800 (PST)
Subject: Re: [RFC PATCH 2/4] hw/ide/Kconfig: IDE_PIIX requires IDE_ISA
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210129194415.3925153-1-f4bug@amsat.org>
 <20210129194415.3925153-3-f4bug@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <353b0024-605e-d764-e1ab-7e50caa88e6a@redhat.com>
Date: Fri, 29 Jan 2021 21:00:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210129194415.3925153-3-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, Paul Durrant <paul@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/01/21 20:44, Philippe Mathieu-Daudé wrote:
> hw/ide/piix.c has a strong dependency on hw/isa/isa-bus.c:
> 
>    /usr/bin/ld: libcommon.fa.p/hw_ide_piix.c.o: in function `pci_piix_init_ports':
>    /usr/bin/ld: hw/ide/piix.c:141: undefined reference to `isa_get_irq'
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/ide/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/ide/Kconfig b/hw/ide/Kconfig
> index 41cdd9cbe03..0f5d316558b 100644
> --- a/hw/ide/Kconfig
> +++ b/hw/ide/Kconfig
> @@ -17,6 +17,7 @@ config IDE_ISA
>   
>   config IDE_PIIX
>       bool
> +    select IDE_ISA
>       select IDE_PCI
>       select IDE_QDEV
>   
> 

This is also incorrect, it should be "depends on ISA_BUS".

Paolo


