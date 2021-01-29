Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD875308DF3
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 21:02:50 +0100 (CET)
Received: from localhost ([::1]:53746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Zyj-000150-Fr
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 15:02:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l5Zw2-000890-Id
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:00:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l5Zw0-0003SJ-4N
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 15:00:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611950399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LVJAKwgL2J/Sbi3aE8IaYzY6ykS/WBovm/x50m/MFYc=;
 b=drwyhP5xGMPxn5SnM9DcSFuDHjlKTWkEwR22GsFYUqKeX324CZrm6IxU5h6Q3n/+F7SHM+
 734mzP3vlbdc5C79jLM8txIq4aw6c4VqPcncOzjoAzXFrnhJJELmG4BdtC8J1cmDtwMAJ9
 mriRohCum6Hu8nk9lUK6yXBvZ7AgPd0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-QNhDoZILMmuv4S75fOrP0w-1; Fri, 29 Jan 2021 14:59:57 -0500
X-MC-Unique: QNhDoZILMmuv4S75fOrP0w-1
Received: by mail-ed1-f72.google.com with SMTP id f12so5450264edq.15
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 11:59:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LVJAKwgL2J/Sbi3aE8IaYzY6ykS/WBovm/x50m/MFYc=;
 b=e7XXQKeX/q0fGoBTr3DtL3zmiedabgmfR0M91lufy4V8KGhdiI5ZikVxtV9xpp7wj3
 M01noZfn7hSG2ZMx3P1hV5EfFKzaeC7oi3bzN4OSDtRtNLVY1/CbU7fMEVERyxQt9ZIn
 IiEMaTRvI/9OFgbZ/DyzjrR0eCsos2K2gj3pfDxujKq6GPXu/NNW4tt/DOPtaSZL2/Vm
 8ed2rejo1XbhWQgkY2nQYnIdzDqEMY+CPtSd8dMZES2rnVxOmPhxIvCcgUSzNXmWa+3b
 xF8FljlhEsAd5eCJyhuT+FeKUr5EspnwgxvtX5yFtTzpnF8B7268642syy06YKMliadH
 Tzfg==
X-Gm-Message-State: AOAM530IwV6t4Zvdz3SsBAmlmA+JGCyOukMxIVGMW0oSSI1g/ri69/F0
 NKyAPpiBzV1YP4j60+U6p8IJtefJNpbOyipyH1l40suFnJBMxPLmkcE6Li11d632hTEMkdeI/N1
 DAzLnbDoFbuFXz2U=
X-Received: by 2002:a17:906:f1cc:: with SMTP id
 gx12mr6139161ejb.489.1611950396068; 
 Fri, 29 Jan 2021 11:59:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyDPq5nhLEY39tW3G8HpSzSL3Us2oCkLLaS2ClB9iSF+zBPK0A3cBkMtI7wVPn/pJGa6W8Drg==
X-Received: by 2002:a17:906:f1cc:: with SMTP id
 gx12mr6139144ejb.489.1611950395912; 
 Fri, 29 Jan 2021 11:59:55 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id v20sm5046031edt.3.2021.01.29.11.59.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jan 2021 11:59:55 -0800 (PST)
Subject: Re: [RFC PATCH 1/4] hw/ide/Kconfig: IDE_ISA requires ISA_BUS
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210129194415.3925153-1-f4bug@amsat.org>
 <20210129194415.3925153-2-f4bug@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <39ac2417-c4ee-49ca-0bc0-347981ec6fb3@redhat.com>
Date: Fri, 29 Jan 2021 20:59:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210129194415.3925153-2-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
> hw/ide/ioport.c has a strong dependency on hw/isa/isa-bus.c:
> 
>    /usr/bin/ld: libcommon.fa.p/hw_ide_ioport.c.o: in function `ide_init_ioport':
>    /usr/bin/ld: hw/ide/ioport.c:61: undefined reference to `isa_register_portio_list'
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/ide/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/ide/Kconfig b/hw/ide/Kconfig
> index 5d9106b1ac2..41cdd9cbe03 100644
> --- a/hw/ide/Kconfig
> +++ b/hw/ide/Kconfig
> @@ -12,7 +12,7 @@ config IDE_PCI
>   
>   config IDE_ISA
>       bool
> -    depends on ISA_BUS
> +    select ISA_BUS
>       select IDE_QDEV
>   
>   config IDE_PIIX

This is incorrect.  Buses are "depended on", not selected, and this is 
documented in docs/devel/kconfig.rst.

Paolo


