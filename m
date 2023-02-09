Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BC768FFD3
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 06:20:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPzLa-00030Q-9V; Thu, 09 Feb 2023 00:19:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPzLY-0002zy-3V
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 00:19:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPzLW-0004hd-8A
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 00:19:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675919978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YrdTI5Kck3bXnnjgv4UgkZDZCU+w/hxsvErH1FdgMo0=;
 b=UA61L0eQVXMK91zfgSFpb4AL6qhg1DO2j1oaHq4RprXLLUjYnrUk9Up5XfjUQAcPq938YD
 O4vYELzhvyFxC0K3u8ge/618Af6cEj294hGjeAqDMxm34JMJW9oI9kg7VtfXeCFI2YLRN+
 DRLOHGYIEQeggNr+1xApFDwd5LET0qg=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-583-KfnZjKQ-PWOz8n4tsGtdNA-1; Thu, 09 Feb 2023 00:19:37 -0500
X-MC-Unique: KfnZjKQ-PWOz8n4tsGtdNA-1
Received: by mail-qk1-f197.google.com with SMTP id
 w17-20020a05620a425100b00706bf3b459eso582825qko.11
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 21:19:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YrdTI5Kck3bXnnjgv4UgkZDZCU+w/hxsvErH1FdgMo0=;
 b=00cmJnV2qO6CABdoHXgBzAhSLUvYJA/EK1yF6XIu1/lB4Ih2A0QuGXEBzXy0t1VCeT
 PMppKFOILtWnpMRATBoL7bClEYgAR7qzsPSyQa6LvROClHFqLJiCPlMkNLLa8D2DKskt
 JHgDjbvLb3QPQZw/I1MjY5tJuEXpubVBdBUWg96QGX+VT3LoBKDuI2xGydWzDyfQ3edP
 WdW9iTqpR2OOBPkbSb70u+XvPhiCA1Sh2ixr3EzbUbic68glq3PmlkKCyScsBW27P/ZH
 8DkLVkoj1WsQmT58ZBXtQsoe8k5n8c+S1wAos8+WXBcFI3pd9Kg7GZ3usRVtls3xa0lt
 Fcng==
X-Gm-Message-State: AO0yUKU9nYx1lrQ4S29P3ebnaDiVSxjw9wiELl5cIrHRObEmWnMha0TA
 zoSQc5x11rdG+VYuhXZNQyLz8hV3y8YSvi0ABygJOfGlnDxZegOPtaSB1YtV3qQki1vTWS3LdbK
 Vu18GalEAxwHNBJc=
X-Received: by 2002:ac8:5f92:0:b0:3ba:13d8:67b5 with SMTP id
 j18-20020ac85f92000000b003ba13d867b5mr15431626qta.36.1675919976709; 
 Wed, 08 Feb 2023 21:19:36 -0800 (PST)
X-Google-Smtp-Source: AK7set8veuFfXigKAeHPMnogK1JvwWNJzwIdeHK2LyneTjZNwtgSmAqQLrp7QmNV8LnQDaw+YJOW/Q==
X-Received: by 2002:ac8:5f92:0:b0:3ba:13d8:67b5 with SMTP id
 j18-20020ac85f92000000b003ba13d867b5mr15431615qta.36.1675919976482; 
 Wed, 08 Feb 2023 21:19:36 -0800 (PST)
Received: from [192.168.8.105] (tmo-099-228.customers.d1-online.com.
 [80.187.99.228]) by smtp.gmail.com with ESMTPSA id
 b124-20020a379982000000b0071bfeaf5688sm645729qke.72.2023.02.08.21.19.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 21:19:35 -0800 (PST)
Message-ID: <95cab180-a34b-858d-e360-5083a7d7ecf8@redhat.com>
Date: Thu, 9 Feb 2023 06:19:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PULL 00/11] Misc patches for 2022-02-08
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20230208171922.95048-1-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230208171922.95048-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.146, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 08/02/2023 18.19, Paolo Bonzini wrote:
> The following changes since commit ae2b5d8381a73b27f35f19c988d45c78bb4d5768:
> 
>    Merge tag 'pull-include-2023-02-06-v2' of https://repo.or.cz/qemu/armbru into staging (2023-02-08 10:40:06 +0000)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/bonzini/qemu.git tags/for-upstream
> 
> for you to fetch changes up to e0de04cf9bd7cf03db16f33276679caf1724b75c:
> 
>    target/i386: fix ADOX followed by ADCX (2023-02-08 18:16:55 +0100)
> 
> ----------------------------------------------------------------
> * block/iscsi: fix double-free on BUSY or similar statuses
> * catch [accel] entry without accelerator
> * target/i386: various fixes for BMI and ADX instructions
> * make the contents of meson-buildoptions.sh stable
> 
> ----------------------------------------------------------------
> Paolo Bonzini (8):
>        build: make meson-buildoptions.sh stable
>        remove unnecessary extern "C" blocks
>        block/iscsi: fix double-free on BUSY or similar statuses
>        vl: catch [accel] entry without accelerator

You missed Philippe's review comment for that patch:

https://lore.kernel.org/qemu-devel/8ec3abf5-f4aa-db40-cb7e-2f5733d93de3@linaro.org/

  Thomas


