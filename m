Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A453A6E99A7
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 18:37:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppXFu-0007hq-SY; Thu, 20 Apr 2023 12:35:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppXFr-0007hR-Mj
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 12:35:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppXFq-0007L9-30
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 12:35:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682008528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nEsNKwlwSHdUZ/qP+SSXCbrgbLDingaruo7T+lbBiNI=;
 b=H/r64adAtBNr8KCkxPfa+tjngGhDVJ0M8d1Aw4XTJ8QHjAhNi7dIATSBM+ghn1r+hsryP7
 zKRI/60urK65t+6hQXHHusrK4Z+1upnWJdwYSzgfxPwg8kW7u/W/iVW0vHtRpV4F/nBUPH
 +YbLAdNmp8zU+2YVYSR3fpv9UvuviGs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-271-O7lYZx4TNqmE4uCh69cu2A-1; Thu, 20 Apr 2023 12:35:27 -0400
X-MC-Unique: O7lYZx4TNqmE4uCh69cu2A-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-2f43679bcf5so462700f8f.1
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 09:35:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682008526; x=1684600526;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nEsNKwlwSHdUZ/qP+SSXCbrgbLDingaruo7T+lbBiNI=;
 b=knS0l/Ko7ItG2SGmnKDIfShcmRbzJEV59nHAT8ck+EjTdcP3cWyYPmwPgNCi//198n
 NHzX96kDjAshvTU02sqjDrN3jdiHB6RSBBZHZgMzf5hRdK2BxLkgkdsO+5GcPBfauSSZ
 AE0tNp1XZdzcLIxkHpvp8V5gD+27/wPV3+iWVDE9IRaejAzvyI/0mP9DCzSrW0uJo04B
 X7CYrClPvl55BSsXc6WIoY5QLRO8GsojHLQ236ZeEaKeaKbrv6LWkQdsxD7lo4sn8ngr
 +YbeTiLj83Ed2LFWgTvEtwbNFLa1XFTPrRZopOJJo+EtFv3DMSLyLPTWezkvZn96cSD1
 j8Sw==
X-Gm-Message-State: AAQBX9e8uvEIhyQEnSE1MC9d3DmB5gnPLZvRgjxZcpQ7R1KEbZFKOneD
 3UX6zKEeWwVYmKjAv+O31Q9kZOO3Itf1j1J2Mog2H/eLo/gUmkQEYhMjRAMo0H4NiPOb1r48hCC
 BUB99bwdHhjRdKCw=
X-Received: by 2002:a5d:508c:0:b0:2fb:600e:55bd with SMTP id
 a12-20020a5d508c000000b002fb600e55bdmr1823160wrt.39.1682008526227; 
 Thu, 20 Apr 2023 09:35:26 -0700 (PDT)
X-Google-Smtp-Source: AKy350ax8lFIA/+mW/apphrdCwmGGra6VpJ4JjJWHKSNIidrjixlY46OoD1yE7ARkyrFQE1NpmWu7g==
X-Received: by 2002:a5d:508c:0:b0:2fb:600e:55bd with SMTP id
 a12-20020a5d508c000000b002fb600e55bdmr1823141wrt.39.1682008525892; 
 Thu, 20 Apr 2023 09:35:25 -0700 (PDT)
Received: from [192.168.8.105] (tmo-127-44.customers.d1-online.com.
 [80.187.127.44]) by smtp.gmail.com with ESMTPSA id
 p6-20020adfe606000000b002ff1751ec79sm2341066wrm.65.2023.04.20.09.35.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 09:35:25 -0700 (PDT)
Message-ID: <f280d33a-1d43-e710-2fc6-916fb5ef0ea2@redhat.com>
Date: Thu, 20 Apr 2023 18:35:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 6/9] docs/system: remove excessive punctuation from
 guest-loader docs
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 peter.maydell@linaro.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, Juan Quintela
 <quintela@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
References: <20230420155723.1711048-1-alex.bennee@linaro.org>
 <20230420155723.1711048-7-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230420155723.1711048-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.669, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 20/04/2023 17.57, Alex Bennée wrote:
> A possessive its needs no ' whereas the contraction of it is does.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   docs/system/guest-loader.rst | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/system/guest-loader.rst b/docs/system/guest-loader.rst
> index 9ef9776bf0..304ee5d531 100644
> --- a/docs/system/guest-loader.rst
> +++ b/docs/system/guest-loader.rst
> @@ -14,7 +14,7 @@ The guest loader does two things:
>     - load blobs (kernels and initial ram disks) into memory
>     - sets platform FDT data so hypervisors can find and boot them
>   
> -This is what is typically done by a boot-loader like grub using it's
> +This is what is typically done by a boot-loader like grub using its
>   multi-boot capability. A typical example would look like:
>   
>   .. parsed-literal::
> @@ -25,9 +25,9 @@ multi-boot capability. A typical example would look like:
>       -device guest-loader,addr=0x47000000,initrd=rootfs.cpio
>   
>   In the above example the Xen hypervisor is loaded by the -kernel
> -parameter and passed it's boot arguments via -append. The Dom0 guest
> +parameter and passed its boot arguments via -append. The Dom0 guest
>   is loaded into the areas of memory. Each blob will get
> -``/chosen/module@<addr>`` entry in the FDT to indicate it's location and
> +``/chosen/module@<addr>`` entry in the FDT to indicate its location and
>   size. Additional information can be passed with by using additional
>   arguments.
>   

Reviewed-by: Thomas Huth <thuth@redhat.com>


