Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D35416A182C
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 09:45:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVThK-0000JX-SD; Fri, 24 Feb 2023 03:44:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pVThJ-0000If-AR
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 03:44:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pVThG-0005la-Qv
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 03:44:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677228294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uE//GpfhWLiNgoUcd1a+iFvy0CgpsEX5cR+se6QSJHQ=;
 b=eb4OSD7i8/OyWYQ6wfgJ30iF+VDXqbAplTnvVOFJnHExKZ8C38ZI7DKXBEt1Utm6g8qtkS
 s1hTZuQlKOHsF0l4ewC9uZGz/QQzBLEoF7YaRJ2aTKepT0PHAcGbL4nsktvmVWWW5ox44g
 kgUnhNAOs9KOMrZS9Cr5cF2xzOW0YPU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-554-Mkq4_RTKNhmcEhnHbAYlvg-1; Fri, 24 Feb 2023 03:44:52 -0500
X-MC-Unique: Mkq4_RTKNhmcEhnHbAYlvg-1
Received: by mail-wm1-f69.google.com with SMTP id
 l23-20020a7bc457000000b003e206cbce8dso6196779wmi.7
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 00:44:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uE//GpfhWLiNgoUcd1a+iFvy0CgpsEX5cR+se6QSJHQ=;
 b=XEjWmi/ThrBKQwOq9JMhDh+DeJKbTXCIxIYkCmQeocPjj+1gONXFvpUa/fWjxmz7ud
 Nu0T/Fw5Q0h4d3CqEux+kyTj2srBMNCX+R7gSYQzIDFehBZYh9qFqlD8zVrjNQiIwuET
 m61UcPdkxAIHCW6HGPeknREas2pOK7wSrlADgTeqIKWcJF1t6MaQcrgSkG73DxTt7+4s
 xm58BPKj823TSWiZVycv4DChD8gYiqc53J87TXR3A6ZkFo7MvG03UVmmPOG44qgkg2Kw
 h+FqY5HJ0csg2FBMy2tB+aTcdmJH/u+FTE1+rg9cXL8HzegIxdhXmnfU4rRn0bX6StkQ
 p64A==
X-Gm-Message-State: AO0yUKXhOShw+PW7BDBJlf6irAfrfVfpR8bIVhDMzBhRi2wSYY6RY+hW
 g9vV+wHVfQsIqrY2ueDaHZj3H9pQ7e60FV+KTjM/pNGj0GMqNBswkLajMOnysfKTBr0ir1Wc/0i
 Jz1BD3wGeZccnGtA=
X-Received: by 2002:a05:600c:491c:b0:3eb:2b79:a3d with SMTP id
 f28-20020a05600c491c00b003eb2b790a3dmr56724wmp.24.1677228290948; 
 Fri, 24 Feb 2023 00:44:50 -0800 (PST)
X-Google-Smtp-Source: AK7set+zB53X9ki2FTqQb8NkmeZBVkr4phgyfZFHJjE7ezGy+LxgBgwXj5XDhT+sA1h9w5wh/FVJsg==
X-Received: by 2002:a05:600c:491c:b0:3eb:2b79:a3d with SMTP id
 f28-20020a05600c491c00b003eb2b790a3dmr56706wmp.24.1677228290656; 
 Fri, 24 Feb 2023 00:44:50 -0800 (PST)
Received: from [192.168.8.100] (tmo-115-119.customers.d1-online.com.
 [80.187.115.119]) by smtp.gmail.com with ESMTPSA id
 p15-20020a05600c1d8f00b003e20970175dsm2105571wms.32.2023.02.24.00.44.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 00:44:50 -0800 (PST)
Message-ID: <9c7b27fe-fdd8-8ff6-e6a0-710165ba6032@redhat.com>
Date: Fri, 24 Feb 2023 09:44:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 02/18] hw/isa: Factor isa_bus_get_irq() out of
 isa_get_irq()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-ppc@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20230215161641.32663-1-philmd@linaro.org>
 <20230215161641.32663-3-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230215161641.32663-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 15/02/2023 17.16, Philippe Mathieu-Daudé wrote:
> isa_get_irq() was added in commit 3a38d437ca
> ("Add isa_reserve_irq()" Fri Aug 14 11:36:15 2009) as:
> 
>      a temporary interface to be used to allocate ISA IRQs for
>      devices which have not yet been converted to qdev, and for
>      special cases which are not suited for qdev conversions,
>      such as the 'ferr'.
> 
> We still use it 14 years later, using the global 'isabus'
> singleton. In order to get rid of such *temporary* interface,
> extract isa_bus_get_irq() which can take any ISABus* object.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---

Reviewed-by: Thomas Huth <thuth@redhat.com>


