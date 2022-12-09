Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65220648676
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 17:23:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3g8V-0002T1-C1; Fri, 09 Dec 2022 11:22:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3g8T-0002Sr-0b
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 11:22:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3g8Q-0006Vw-HO
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 11:22:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670602921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wtiuVMaQsL5XLzhUgddpYTGpFhePT34A4wQFNAPkw7o=;
 b=LgmbgQUvjjpU+coX5G4spB1QVdl0kumurt2zRA6RwAtCl8dOGMivRDYksTTiFmxbuWFGxw
 7d02jWswzVfSSy2bOkFkC4hvOvbAm9VvAfvHG0AC9BpSu5d64k/M9CwEouTMrXaLpMn/Ib
 q8nx0zrOpuV8+e07NnbPH9Y7uyNfMxI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-512-Vawatsj4NHCLBL42cgdX-g-1; Fri, 09 Dec 2022 11:21:59 -0500
X-MC-Unique: Vawatsj4NHCLBL42cgdX-g-1
Received: by mail-ej1-f69.google.com with SMTP id
 oz34-20020a1709077da200b007adc8d68e90so3370561ejc.11
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 08:21:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wtiuVMaQsL5XLzhUgddpYTGpFhePT34A4wQFNAPkw7o=;
 b=mZ3DLZqR0bsa9W362459KWKVwY6SkmQEYuroD+nsuDSYKf9Q1gwY9qh9oUGmu+DweJ
 xeudpiFaqdDRCR5e6z5aFeT3DDlYyYSLpWjCh07vwpFC/qQ4cTjxqQaiOiOyMGAIzD2u
 ig6IKSDenfssr5aoD4kj1DFefPdu3CZGUHOPYFFrRiYuD6AZiqGdojubevJoZ1PyXdd5
 nIE4WSfhJb4TXTMKs6e1w/f9/RLHdghtC6hoHTSRqasbtTf7WVEQ4cwuoT0CagC7BLCi
 a8pbkICj+gtQ6OKWxalP9Ucequ7F8/Xlrz7zKNDezXXZlahgtmM6GnOXyzLkyBUTGxnP
 LK3Q==
X-Gm-Message-State: ANoB5plxoLlmBXkTDlau4nmUvzqIqh+EN/vu4/6/z1Hk1qDu8qoI42DG
 DBMFQVtrbP2+fpX2ytNvPn0QM7rKD/YoVHwFdokZebf9HQ7+npGvEBRwinxNXWTnpiCCD05aF0a
 qUG+Qm5Wsskn/FE8=
X-Received: by 2002:a17:906:5e07:b0:7c1:22a6:818e with SMTP id
 n7-20020a1709065e0700b007c122a6818emr5035962eju.24.1670602918798; 
 Fri, 09 Dec 2022 08:21:58 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4fLvDsj/pCyYdjzaAbROlAk/YBX3Vvnxiu83q+t1NhNUC+MUaST3wUAEAbM1aj+lkQ+yr59g==
X-Received: by 2002:a17:906:5e07:b0:7c1:22a6:818e with SMTP id
 n7-20020a1709065e0700b007c122a6818emr5035953eju.24.1670602918596; 
 Fri, 09 Dec 2022 08:21:58 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 z20-20020a1709060ad400b0077077c62cadsm98242ejf.31.2022.12.09.08.21.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Dec 2022 08:21:57 -0800 (PST)
Message-ID: <41aa6bfb-4490-e217-dd61-c2cecf510221@redhat.com>
Date: Fri, 9 Dec 2022 17:21:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 19/30] configure, meson: move --enable-debug-info to Meson
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
References: <20221209112409.184703-1-pbonzini@redhat.com>
 <20221209112409.184703-20-pbonzini@redhat.com>
 <bc114971-ee1f-b48b-cee7-ebcdae4d572c@linaro.org>
 <be63447e-ba8e-6876-78a8-0cdb875b98c3@redhat.com>
 <6275f9b9-a878-bec9-d5c6-54d1c4bf192a@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <6275f9b9-a878-bec9-d5c6-54d1c4bf192a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.288, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 12/9/22 15:21, Philippe Mathieu-Daudé wrote:
> On 9/12/22 14:54, Paolo Bonzini wrote:
>> On 12/9/22 13:55, Philippe Mathieu-Daudé wrote:
>>>>
>>>> +  printf "%s\n" '  --disable-debug-info     Enable debug symbols 
>>>> and other information'
>>>
>>> We should get '--enable-debug-info' here, ...
>>>
>>>>     printf "%s\n" '  --disable-install-blobs  install provided 
>>>> firmware blobs'
>>>
>>> ... and here. Do we have a bug in meson-buildoptions.py?
>>
>> No, for boolean options it only includes the non-default setting.  
>> This behavior was copied from the prior handcrafted help output:
>>
>>    --with-devices-ARCH=NAME override default configs/devices
>>    --enable-debug           enable common debug build options
>>    --enable-sanitizers      enable default sanitizers
>>    --enable-tsan            enable thread sanitizer
>>    --disable-strip          disable stripping binaries
>>    --disable-werror         disable compilation abort on warning
>>    --disable-stack-protector disable compiler-provided stack protection
> 
> These are correct... For debug-info I'd expect that (change on top of
> your patch):
> 
> -  printf "%s\n" '  --disable-debug-info     Enable debug symbols and 
> other information'
> +  printf "%s\n" '  --disable-debug-info     Disable debug symbols and 
> other information'

Ahh, I see now.  Yeah, it is inconsistent, I'll just drop this patch.

Paolo


